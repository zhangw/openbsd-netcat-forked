#	openbsd src/usr.bin/nc portable and built on Darwin 14.2 (23C64)

PROG=	nc
SRCS=	netcat.c atomicio.c socks.c

CC = gcc
CFLAGS_DEBUG = -O0 -g
CFLAGS_RELEASE = -O3 -DNDEBUG

LIBPATH = -L/opt/homebrew/opt/libressl/lib
INC = -I/opt/homebrew/opt/libressl/include
LIBS = -lssl -ltls -lcrypto -lresolv

debug: clean
	$(CC) $(CFLAGS_DEBUG) $(INC) $(LIBPATH) $(LIBS) -o nc-debug *.c

release: clean
	$(CC) $(CFLAGS_RELEASE) $(INC) $(LIBPATH) $(LIBS) -o nc *.c

clean:
	rm -r -f *.o *.s *.dSYM nc nc-debug