From: William Hegardt <whegardt@gmail.com>
Date: Sat, 6 Feb 2010 16:49:36 -0800
Subject: [Buildroot] ARM EABI toolchain compile error
Message-ID: <484527251002061649u51741626w68c7d55d253a6717@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using a recent snapshot of buildroot and trying to build an ARM9
C/C++ toolchain and root fs that uses EABI for a Linux 2.6.27 uClibc
0.9.30.2 NPTL based target.

It all builds and seems to work fine if I select OABI, but with EABI, I get:

/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4-initial/./gcc/xgcc
-B/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4-initial/./gcc/
-B/opt/tools/usr/arm-linux-uclibc/bin/
-B/opt/tools/usr/arm-linux-uclibc/lib/ -isystem
/opt/tools/usr/arm-linux-uclibc/include -isystem
/opt/tools/usr/arm-linux-uclibc/sys-include -g -Os -O2 -g -Os -DIN_GCC
-DCROSS_DIRECTORY_STRUCTURE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -I. -I.
-I/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/gcc
-I/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/gcc/.
-I/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/gcc/../include
-I/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/gcc/../libcpp/include
-I/home/bill/buildroot-20100204/output/toolchain/gmp/include
-I/home/bill/buildroot-20100204/output/toolchain/mpfr/include
-I/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/gcc/../libdecnumber
-I/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/gcc/../libdecnumber/dpd
-I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions
-fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder
-fno-tree-vectorize  -I. -I. -I../.././gcc
-I/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/libgcc
-I/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/libgcc/.
-I/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/libgcc/../gcc
-I/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/libgcc/../include
 -o crtbegin.o -MT crtbegin.o -MD -MP -MF crtbegin.dep  \
          -c /home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c
-DCRT_BEGIN
/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:
In function '__do_global_dtors_aux':
/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306:
error: '__DTOR_LIST__' undeclared (first use in this function)
/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306:
error: (Each undeclared identifier is reported only once
/home/bill/buildroot-20100204/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306:
error: for each function it appears in.)
------

This seems possibly related to this gcc bug report, but it is
considered resolved:
     http://gcc.gnu.org/bugzilla/show_bug.cgi?id=21751

I have tried gcc 4.4.3 and br 2009.11 with similar results.

Any ideas?  I can post my br config file if it would help.  Should I
file a bug report for buildroot?
Thanks
