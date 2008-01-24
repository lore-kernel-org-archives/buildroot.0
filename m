From: Kai Moritz <kai@ich-geh-kaputt.de>
Date: Thu, 24 Jan 2008 18:24:44 +0100
Subject: [Buildroot] Error/Problems building mips toolchain
Message-ID: <200801241824.44617.kai@ich-geh-kaputt.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks!

I am trying to build a mips toolchain but ending up with a strange error, that 
I cannot resolve.

I am using a fresh buildroot checkout from svn (revision 20841). I have set 
target architecture to mips, target architecture variant to "mips I generic" 
and left "target ABI" at EABI:
-------------------
BR2_VERSION="0.10.0-svn"
BR2_mips=y
BR2_mips_1=y
BR2_MIPS_EABI=y
BR2_ARCH="mips"
BR2_ENDIAN="BIG"
BR2_GCC_TARGET_TUNE="mips1"
BR2_GCC_TARGET_ABI="eabi"
----------------------
I have not changed anything else, expect the download directory and 
the "toolchain and header file location".

Building the toolchain always stops with the following error:
-----------------------
/opt/buildroot/toolchain_build_mips/gcc-4.2.1-initial/./gcc/xgcc -B/opt/buildroot/toolchain_build_mips/gcc-4.2.1-initial/./gcc/ -B/usr/local/horstbox/usr/mips-linux-uclibc/bin/ -B/usr/local/horstbox/usr/mips-linux-uclibc/lib/ -isystem /usr/local/horstbox/usr/mips-linux-uclibc/include -isystem /usr/local/horstbox/usr/mips-linux-uclibc/sys-include -O2 -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem ./include  -I. -I. -I/opt/buildroot/toolchain_build_mips/gcc-4.2.1/gcc -I/opt/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/. -I/opt/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/../include -I/opt/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/../libcpp/include -I/opt/buildroot/toolchain_build_mips/gmp/include -I/opt/buildroot/toolchain_build_mips/mpfr/include -I/opt/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/../libdecnumber -I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions -fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder   
\
          -c /opt/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/crtstuff.c -DCRT_BEGIN 
\
          -o crtbegin.o
/opt/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/crtstuff.c:1: error: 
unsupported combination: -mabicalls -mabi=eabi
make[2]: *** [crtbegin.o] Fehler 1
make[2]: Verlasse 
Verzeichnis '/opt/buildroot/toolchain_build_mips/gcc-4.2.1-initial/gcc'
-------------------------

I have tried combinations of "mips 32" and "OABI" with the same result.
I also tried to remove the "-mabicalls" switch from and rebuild the toolchain 
after a "make distclean" and a manual remove of "toolchain_build_mips", but 
the error remains.

Any suggestions?

Greetings Kai Moritz
