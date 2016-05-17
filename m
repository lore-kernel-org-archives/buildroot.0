From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 15:12:17 +0200
Subject: [Buildroot] New pre-built Buildroot toolchains in the autobuilder
Message-ID: <20160517151217.045c17c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have just rebuilt and deployed all the pre-built Buildroot external
toolchains used on the autobuilders with Buildroot 2016.05-rc1. Most
notably, this should fix numerous build failures of the 'mpv' package,
which are due to missing support for XSI math in uClibc (it has been
enabled in the uClibc configuration recently).

The other changes are:

 - br-arm-basic, br-arm-cortex-a9-glibc, br-arm-cortex-a9-musl,
   br-arm-full-nothread, br-mips32r6-el-hf-glibc, br-mips64-n64-full,
   br-mips64r6-el-hf-glibc, br-mipsel-o32-full, br-nios2-glibc,
   br-powerpc-603e-basic-cpp, br-powerpc-e500mc-full, br-sh4-full,
   br-x86-64-musl, br-xtensa-full now use 4.5 kernel headers instead
   of 4.4 kernel headers

 - br-arm-full now uses gcc 4.8 instead of gcc 4.7

 - br-sparc-glibc has been removed, in favor of br-sparc-uclibc. The
   reasoning is that uClibc is now the default C library chosen for
   the Sparc architecture in Buildroot. br-sparc-uclibc uses uClibc,
   3.14 kernel headers (i.e intentionally not the latest), gcc 4.9.

I have not yet added configurations for ARM noMMU and m68k, as I'm
waiting for 2016.05 to be released to start getting build failures for
those architectures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
