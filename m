From: Steve Morris <morris@buinea.com>
Date: Wed, 16 Feb 2011 10:38:35 -0800
Subject: [Buildroot] problems linking when using -lSDL
Message-ID: <20110216183835.GA16325@buinea.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I've recently tried to use SDL with buildroot-2010.11 and crosstools-ng
1.82. I've also tried the latest buildroot snapshot wit a fresh
crosstools. I've managed to have everything working prior to trying to
use SDL.`

've been circling around this for days with no luck. Perhaps someone
can point me in the right direction.

ct.c is a simple hello world which doesn't call in anything

#include <stdlib.h>
#include <stdio.h>
int main () {
	printf
		("hello world\n");
	exit(0);
}

my makefile, though perhaps adding too many directories to searc in
compiles the program properly.


CC = /lfs/x-tools/i586-unknown-linux-gnu/bin/i586-unknown-linux-gnu-gcc
CFLAGS = -Wl,--verbose
LDFLAGS =
LDFLAGS += -L/lfs/x-tools/i586-unknown-linux-gnu/i586-unknown-linux-gnu/sys-root/lib
LDFLAGS += -L/lfs/x-tools/i586-unknown-linux-gnu/i586-unknown-linux-gnu/sys-root/usr/lib
LDFLAGS += -L/lfs/x-tools/i586-unknown-linux-gnu/i586-unknown-linux-gnu/sysroot/lib
LDFLAGS += -L/lfs/x-tools/i586-unknown-linux-gnu/i586-unknown-linux-gnu/sysroot/usr/lib
LDFLAGS += -L/lfs/buildroot/output/host/usr/i586-unknown-linux-gnu/sysroot/lib
LDFLAGS += -L/lfs/buildroot/output/host/usr/i586-unknown-linux-gnu/sysroot/usr/lib
LDFLAGS += -lpthread 

ct:
	$(CC) $(CFLAGS) $(LDFLAGS) -o ct ct.c


When I add -lSDL to the mix I get a bunch of errors such as:

tools/i586-unknown-linux-gnu/lib/gcc/i586-unknown-linux-gnu/4.4.3/../../../../i586-unknown-linux-gnu/bin/ld: warning: libdirectfb-1.4.so.5, needed by /lfs/buildroot/output/host/usr/i586-unknown-linux-gnu/sysroot/usr/lib/libSDL.so, not found (try using -rpath or -rpath-link)
/lfs/x-tools/i586-unknown-linux-gnu/lib/gcc/i586-unknown-linux-gnu/4.4.3/../../../../i586-unknown-linux-gnu/bin/ld: warning: libfusion-1.4.so.5, needed by /lfs/buildroot/output/host/usr/i586-unknown-linux-gnu/sysroot/usr/lib/libSDL.so, not found (try using -rpath or -rpath-link)
/lfs/x-tools/i586-unknown-linux-gnu/lib/gcc/i586-unknown-linux-gnu/4.4.3/../../../../i586-unknown-linux-gnu/bin/ld: warning: libdirect-1.4.so.5, needed by /lfs/buildroot/output/host/usr/i586-unknown-linux-gnu/sysroot/usr/lib/libSDL.so, not found (try using -rpath or -rpath-link)

Any pointers would be appreciated,

Steve
