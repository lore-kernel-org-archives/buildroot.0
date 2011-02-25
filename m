From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Fri, 25 Feb 2011 14:47:48 -0600
Subject: [Buildroot] Strange:  MIPS, librt, malloc
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F657546@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Given the following code:

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
        void *mem;

        mem = malloc(1);
        printf("Hello world\n");
        return 0;
}

and the build command:

../../../buildroot/output/host/usr/bin/mips-unknown-linux-uclibc-gcc -o
test -g -Wall test.c

Everything works as you would expect.  However, if I use the following
build command:

../../../buildroot/output/host/usr/bin/mips-unknown-linux-uclibc-gcc -o
test -g -Wall test.c -lrt


malloc never returns and I sit in the _pthread_cleanup_push_defer()
while (1) loop.


If I remove the malloc(), I get Hello World but never return.


Where do I start tracking this problem down?  Anyone else have this
issue?

Thanks,
Andy
