From: Hebbar <gururajakr@sanyo.co.in>
Date: Thu, 27 Sep 2007 03:59:38 -0700 (PDT)
Subject: [Buildroot] unable to build arm926ejs toolchain with latest
 snapshot cp error during kernel unpack
Message-ID: <12918929.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

 i am trying to build arm926ejs toolchain with latest snapshot and after the
make unpack and patches the linux kernel source it comes up with below
error.
kindly help me solve the same.

My config --> 

BR2_VERSION="0.10.0-svn"
BR2_arm=y
BR2_arm926t=y
BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm9tdmi"
BR2_PACKAGE_LINUX=y
BR2_TOOLCHAIN_BUILDROOT=y
BR2_TOOLCHAIN_SOURCE=y
BR2_KERNEL_HEADERS_2_6_21_5=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.21.5"
BR2_UCLIBC_VERSION_0_9_29=y
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
BR2_ENABLE_LOCALE=y


<snip>
s-3.2.2/depmod /home/guru/project/toolchain/uclibc/bin/arm-linux-depmod26
rm -rf
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/linux-2.6.21.5
*** Unpacking kernel source
bzcat /home/guru/project/original/bldrt/buildroot/dl/linux-2.6.21.5.tar.bz2
| tar -C
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc   -xf -
touch
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/linux-2.6.21.5/.unpacked
toolchain/patch-kernel.sh
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/linux-2.6.21.5
toolchain/kernel-headers \
                linux-2.6.21.5-\*.patch{,.gz,.bz2}

Applying linux-2.6.21.5-006-wait-for-async-scanned-block-devices.patch using
plaintext: 
patching file init/do_mounts.c
Hunk #1 succeeded at 23 (offset -2 lines).
Hunk #2 succeeded at 215 (offset -2 lines).
Hunk #3 succeeded at 441 (offset -6 lines).
touch
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/linux-2.6.21.5/.patched
cp -dpf 
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/linux-2.6.21.5/.config
cp: missing destination file operand after
`/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/linux-2.6.21.5/.config'
Try `cp --help' for more information.
make: ***
[/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/linux-2.6.21.5/.configured]
Error 1


Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/unable-to-build-arm926ejs-toolchain-with-latest-snapshot-cp-error-during-kernel-unpack-tf4527671.html#a12918929
Sent from the BuildRoot mailing list archive at Nabble.com.
