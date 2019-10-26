From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 26 Oct 2019 10:56:02 +0200
Subject: [Buildroot] [PATCH 1/3] board: add Beelink GS1 support
In-Reply-To: <20191026100733.075a89ab@windsurf.home>
References: <20190920190813.21516-1-peron.clem@gmail.com>
 <20190920190813.21516-2-peron.clem@gmail.com>
 <20191026100733.075a89ab@windsurf.home>
Message-ID: <CAJiuCcdXSOBqc5ngfTCg4=uo8YGgWKQwwawm3iEOQWPbj1B7Gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 26 Oct 2019 at 10:07, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Cl?ment,
>
> Sorry for the slow feedback.
>
> On Fri, 20 Sep 2019 21:08:11 +0200
> Cl?ment P?ron <peron.clem@gmail.com> wrote:
>
> >  board/beelink/gs1/extlinux.conf               |   4 +
> >  board/beelink/gs1/genimage.cfg                |  33 +++
> >  ...er-common-use-r_wdog-instead-of-wdog.patch |  39 +++
> >  ...01-arm-dts-sync-dts-for-Allwinner-H6.patch | 279 ++++++++++++++++++
>
> Perhaps these patches have been merged upstream now ?

One has been merged in A-TF v2.2 which is one week old.
I didn't have time to test it right now

The second is still not merged in U-boot 2019.10

>
> > diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
> > new file mode 100644
> > index 0000000000..d1a21a4a6d
> > --- /dev/null
> > +++ b/configs/beelink_gs1_defconfig
> > @@ -0,0 +1,35 @@
> > +# Architecture
> > +BR2_aarch64=y
> > +BR2_ARM_FPU_VFPV4=y
> > +BR2_TARGET_GENERIC_ISSUE="Welcome to Beelink GS1"
> > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/beelink/gs1/post-build.sh"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> > +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beelink/gs1/genimage.cfg"
> > +BR2_GLOBAL_PATCH_DIR="board/beelink/gs1/patches/"
> > +
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
>
> Please define an explicit kernel version, so that it is using a known
> working version.

OK

>
> > +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h6-beelink-gs1"
> > +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_4=y
> > +
> > +# Firmware
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.1"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h6"
> > +
> > +# Bootloader
> > +BR2_TARGET_UBOOT=y
>
> Please define an explicit U-Boot version, for the same reason as above.

OK

>
> Also, please add yourself in the DEVELOPERS file, for both the
> defconfig and the board folder you're adding.
>
> Could you send a v2 fixing those details ?

Yes,

Do you think the other patches can be merged too or are they to
"user-specific" ?

>
> Thanks a lot!
Thanks for the review,

>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
