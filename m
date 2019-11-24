From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 09:44:33 +0100
Subject: [Buildroot] [PATCH v2 1/3] board: add Beelink GS1 support
In-Reply-To: <20191027192131.6813-1-peron.clem@gmail.com> (=?utf-8?Q?=22Cl?=
 =?utf-8?Q?=C3=A9ment_P=C3=A9ron=22's?=
 message of "Sun, 27 Oct 2019 20:21:29 +0100")
References: <20191027192131.6813-1-peron.clem@gmail.com>
Message-ID: <87y2w5vf2m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cl?ment" == Cl?ment P?ron <peron.clem@gmail.com> writes:

 > Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
 > ---

 > Changes since v1:
 >  - Add myself to DEVELOPPERS file
 >  - Add U-boot and Linux version

 > ATF patch is merged in v2.2 but tag is not pushed on github

I do see it now:

https://github.com/ARM-software/arm-trusted-firmware/tree/v2.2

So it would be good to send an update to move it to 2.2 after you have
tested.

 > U-Boot patch is accepted upstream will be available in 2020.01

 >  DEVELOPERS                                    |   4 +
 >  board/beelink/gs1/extlinux.conf               |   4 +
 >  board/beelink/gs1/genimage.cfg                |  33 +++
 >  ...er-common-use-r_wdog-instead-of-wdog.patch |  39 +++
 >  ...01-arm-dts-sync-dts-for-Allwinner-H6.patch | 279 ++++++++++++++++++
 >  board/beelink/gs1/post-build.sh               |   4 +
 >  configs/beelink_gs1_defconfig                 |  39 +++

A board/beelink/gs1/readme.txt with some basic information about how to
use this would be nice. Care to send a followup patch with that?

 > +++ b/configs/beelink_gs1_defconfig
 > @@ -0,0 +1,39 @@
 > +# Architecture
 > +BR2_aarch64=y
 > +BR2_ARM_FPU_VFPV4=y
 > +BR2_TARGET_GENERIC_ISSUE="Welcome to Beelink GS1"
 > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/beelink/gs1/post-build.sh"
 > +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 > +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beelink/gs1/genimage.cfg"
 > +BR2_GLOBAL_PATCH_DIR="board/beelink/gs1/patches/"
 > +
 > +# Kernel Linux headers same as kernel, a 5.3 series
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y

This still uses the default kernel version which will change over
time. I added:

BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.12"

To explicitly use 5.3.12 and committed to next, thanks!

-- 
Bye, Peter Korsgaard
