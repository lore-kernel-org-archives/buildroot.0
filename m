From: Sasha Sirotkin <buildroot@browserseal.com>
Date: Tue, 30 Mar 2010 23:03:55 +0300
Subject: [Buildroot] init segfaults when compiled with glibc
Message-ID: <4BB2592B.4080502@browserseal.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net





On Tue, Mar 30, 2010 at 7:58 PM, Yann E. MORIN 
<yann.morin.1998@anciens.enib.fr> wrote:

    Sasha, All,

    On Tuesday 30 March 2010 16:26:14 Sasha Sirotkin wrote:
     > On Tue, Mar 30, 2010 at 4:20 PM, Yann E. MORIN
     > <yann.morin.1998 at anciens.enib.fr
    <mailto:yann.morin.1998@anciens.enib.fr>> wrote:
     >     On Tuesday 30 March 2010 142701 Sasha Sirotkin wrote:
     >      > I compiled an external toolchain with glibc support using
     >     crosstools-ng
     >      > as recommended. I managed to compile buildroot without any
    issues.
     >      > However, when I try to use the resulting image /sbin/init
    segfaults.

    Standard init, or busybox' ?

     >      > With uclibc there are no such issues. I'm using the latest
     >     versions of
     >      > everything on ARM with EABI.

    In crosstool-NG, there's a sample that is quite up-to-date and that
    builds
    an arm-unknown-linux-gnueabi:
    # ct-ng show-arm-unknown-linux-gnueabi
    arm-unknown-linux-gnueabi  [l  ]
       OS             : linux-2.6.31.12
       Companion libs : gmp-4.3.1 mpfr-2.4.2 libelf-0.8.12
       binutils       : binutils-2.19.1
       C compiler     : gcc-4.3.2 (C,C++,Fortran,Java)
       C library      : glibc-2.9
       Tools          : sstrip dmalloc-5.5.2 duma-2_5_15 gdb-6.8
    ltrace-0.5.3 strace-4.5.19

     >     By default, gcc will emit armv5t instructions. What's your
    target CPU?
     >     init segfaulting can be a symptom of using a bad instruction
    set, so if
     >     your CPU is armv4, and you did not tell gcc to default to
    armv4, then
     >     you will hit this segfault issue.
     > As I already mentioned, it works fine with uClibc, so it is
    definitely
     > not a CPU instructions issue. At any rate, my CPU is AT91, i.e.
    armvte
     > instruction set.

    Ahem. Right, sorry.

    I'll read you back on crossgcc... :-)



It happens with both busybox and standard init.

Compilation of crossgcc with EABI work OK, but than I got this 
segmentation fault issue...

It looks like glibc does not work at all with buildroot right now. 
Should I open a bug ticket or something?
