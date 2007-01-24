From: =?ISO-8859-1?Q?St=E9phane_Champeau?= <schampeau@ifotec.com>
Date: Wed, 24 Jan 2007 15:56:58 +0100
Subject: [Buildroot] problem with gcc and arch/tune/cpu option
Message-ID: <45B773BA.2060904@ifotec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a problem with :
buildroot rev 17495
ARM920T / EABI / gcc 4.2 20070117
kernel 2.6.19.2 / binutils 2.17.50.0.9
uclibc snapshot / busybox snapshot
soft-float / LFS

I have this error :
Unknown CPU used in --with-cpu=arm
make[1]: *** [configure-gcc] Erreur 1
make[1]: quittant le r?pertoire 
?/buildroot/toolchain_build_arm_nofpu/gcc-4.2-initial ?
make: *** 
[buildroot/toolchain_build_arm_nofpu/gcc-4.2-initial/.compiled] Erreur 2

In fact gcc is configured with :
--with-cpu=arm --with-arch=arm --with-tune=arm
This is an error 
(http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html#ARM-Options)

I think a part of patch 17473 break the toolchain :
In the file buildroot/toolchain/gcc/gcc-uclibc-3.x.mk line 384
if I put this :
GCC_WITH_ARCH=--with-arch=armv4t
GCC_WITH_TUNE=--with-tune=arm920t
GCC_WITH_CPU=--with-cpu=arm920t
instead of :
GCC_WITH_ARCH=--with-arch=$(BR2_ARCH)
GCC_WITH_TUNE=--with-tune=$(BR2_ARCH)
GCC_WITH_CPU=--with-cpu=$(BR2_ARCH)
I can build the toolchain

Sorry, but I can't make a patch, I hope this can help you.

St?phane
