Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A139C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 22:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A9CE83E35;
	Fri, 29 Jul 2022 22:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A9CE83E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04BttLq0nkgw; Fri, 29 Jul 2022 22:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44AE782E22;
	Fri, 29 Jul 2022 22:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44AE782E22
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91ED31BF45A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CF0460B16
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CF0460B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0AvOAznOnXXA for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 22:05:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E0C260A6F
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E0C260A6F
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 22:05:52 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HY7CofqGirvmbHY7CoI08c; Sat, 30 Jul 2022 00:05:51 +0200
Message-ID: <c8857f2a-8344-e215-2d3b-f492ed9662fc@benettiengineering.com>
Date: Sat, 30 Jul 2022 00:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
References: <20220723160901.272373-1-Mr.Bossman075@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220723160901.272373-1-Mr.Bossman075@gmail.com>
X-CMAE-Envelope: MS4xfKG4Rk2YkCQfrBdz/SxSAK6sdxs5jKzDqUZpWrFo83krP6LsnvbTh0/epkPPO3ZPPHBYWkBGfEYZYoCVPTQ071u4GUK6yMQLNKPwg9LI9LlwQJY6nc/F
 VLGWmS1LHNLNu1EY2jlFefe/DgacGAAdJvEBXO7bfjvuQrF7FokjU8yQlQUziKqWXosEykj44f+bTQskA82ACwYtucBGpPXzYyug7NIF14PvzpYaHBkF3GXf
 FXtXn04XMpq6+wJvfjhvCJfuK6jgDECS0ycfUUIIwz05AoPNlK7P5LjQNriMXHfxrXf3fANYpjFSJ1J8mWpUhAUaDmUIKXfi90Teu5zFY26Yt30eXEWOi0kE
 Cc0Nncrl
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659132351; bh=5+mwOhdNpJ9OwVC8aIm8FzYxsPUdSrmJ/GvvKnza12Q=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=dwYV9ngeFv1kRupMMo+60uNgxOxwvyG4JF1d3su9aN8gbjNGh3kynpn4L/edzk7jJ
 RmKTe2FDxEFySTi1CErC0iqjW/Vbp3/cad5WM+bLNqHufoOvSNKs+PmJqMi18P83u6
 3Ta/U2Zx2GeFuncnLK/eUtde8syAaEib6E/1yVmd+OAQa6azi2jqjXgIKJwksF3Nml
 QOhw57w35ZrgZYTegLCkrAA1nSq8Cssc1rYDShMWvYnvDpQPGKvuuFgUGnMdxW7cIz
 B/n7K8bxJBQlDiE27fh3lECXube8bRnfq1FYbt3dkVYLpd9DbgkasyYyPnxBx9FsVg
 3ATkg3u/C2lqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dwYV9nge
Subject: Re: [Buildroot] [PATCH v1] configs/imxrt1050-evk: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: festevam@gmail.com, maeva.manuel@oss.nxp.com, stephane.viau@oss.nxp.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jesse!

On 23/07/22 18:09, Jesse Taube wrote:
> The imxrt1050-evk is a development board from NXP.

Please here provide a brief description of the board and
an URL pointing to the board page.

> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   DEVELOPERS                                  |  6 ++++
>   board/freescale/imxrt1050evk/genimage.cfg   | 34 ++++++++++++++++++
>   board/freescale/imxrt1050evk/post-build.sh  |  4 +++
>   board/freescale/imxrt1050evk/readme.txt     | 23 ++++++++++++
>   board/freescale/imxrt1050evk/uboot.fragment |  2 ++
>   configs/imxrt1050-evk_defconfig             | 40 +++++++++++++++++++++
>   6 files changed, 109 insertions(+)
>   create mode 100644 board/freescale/imxrt1050evk/genimage.cfg
>   create mode 100755 board/freescale/imxrt1050evk/post-build.sh
>   create mode 100644 board/freescale/imxrt1050evk/readme.txt
>   create mode 100644 board/freescale/imxrt1050evk/uboot.fragment
>   create mode 100644 configs/imxrt1050-evk_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0afd697b6c..206bac99e0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1096,9 +1096,11 @@ F:	package/webp/
>   F:	package/xapian/
>   
>   N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
> +F:	board/freescale/imxrt1050evk/*
>   F:	board/olimex/a*
>   F:	configs/amarula_vyasa_rk3288_defconfig
>   F:	configs/asus_tinker_rk3288_defconfig
> +F:	configs/imxrt1050-evk_defconfig

Thank you for adding me :-)

>   F:	configs/olimex_a*
>   F:	package/at/
>   F:	package/binutils/
> @@ -1421,6 +1423,10 @@ F:	package/wmctrl/
>   F:	package/x11r7/xdriver_xf86-video-imx/
>   F:	package/x11r7/xdriver_xf86-video-imx-viv/
>   
> +N:	Jesse Taube <Mr.Bossman075@gmail.com>
> +F:	board/freescale/imxrt1050evk/*
> +F:	configs/imxrt1050-evk_defconfig
> +
>   N:	Jianhui Zhao <zhaojh329@gmail.com>
>   F:	package/libuhttpd/
>   F:	package/libuwsc/
> diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
> new file mode 100644
> index 0000000000..e9f224516f
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/genimage.cfg
> @@ -0,0 +1,34 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"uImage",
> +			"imxrt1050-evk.dtb",
> +		}
> +	}
> +	size = 6M
> +}
> +
> +image sdcard.img {
> +	hdimage {}
> +	partition SPL {
> +		in-partition-table = "no"
> +		image = "SPL"
> +		offset = 1K
> +		size = 127K
> +	}
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "u-boot.img"
> +		offset = 128K
> +		size = 512K
> +	}
> +	partition boot {
> +		partition-type = 0xc
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +	}
> +}

genimage.cfg has a standard format to follow that you can find in
Buildroot's manual:
https://buildroot.org/downloads/manual/manual.html#writing-genimage-cfg

You're missing most all newlines after every closing curly parenthesis.

> diff --git a/board/freescale/imxrt1050evk/post-build.sh b/board/freescale/imxrt1050evk/post-build.sh
> new file mode 100755
> index 0000000000..47557566f9
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/post-build.sh
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +rm output/images/uImage
> +mkimage -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux kernel" -d output/images/Image output/images/uImage

This ^^^ can be achieved by using BR2_LINUX_KERNEL_UIMAGE=y instead of
the default selected BR2_LINUX_KERNEL_ZIMAGE.

> +./support/scripts/genimage.sh $2 $3

This ^^^ can be achieved with:
BR2_ROOTFS_POST_IMAGE_SCRIPT
and
BR2_ROOTFS_POST_SCRIPT_ARGS

you can take as reference:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/olimex_a33_olinuxino_defconfig#L46-47 


> diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
> new file mode 100644
> index 0000000000..d9c183a38f
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/readme.txt
> @@ -0,0 +1,23 @@
> +NXP i.MXRT1050 EVK board
> +---------------------
> +
> +To build a minimal support for this board:
> +
> +$ make imxrt1050-evk_defconfig
> +$ make
> +
> +Buildroot prepares a bootable "sdcard.img" image in the output/images/
> +directory, ready to be flashed into the SD card:
> +
> +$ sudo dd status=progress oflag=sync bs=4k if=output/images/sdcard.img of=/dev/<sd-card-device>; sync

This:
```
     # dd if=output/images/sdcard.img of=/dev/sdX

Where 'sdX' is the device node of the uSD.
```
is sufficient.

> +Jumper settings:
> +
> +   SW7: 1 0 1 0
> +
> +Where 0 means bottom position and 1 means top position (from the
> +switch label numbers reference).
> +
> +Connect the USB cable between the EVK and the PC for the console.
> +
> +Insert the micro SD card in the board, power it up and U-Boot messages should come up.
> diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
> new file mode 100644
> index 0000000000..1c5bb6af35
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/uboot.fragment
> @@ -0,0 +1,2 @@
> +CONFIG_USE_BOOTCOMMAND=y
> +CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 uImage;bootm 0x80000000 - 0x80800000"
> diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
> new file mode 100644
> index 0000000000..03a47c1fd6
> --- /dev/null
> +++ b/configs/imxrt1050-evk_defconfig
> @@ -0,0 +1,40 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_m7=y
> +
> +# Image
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imxrt1050evk/post-build.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"

After modified like above for post-build.sh you have to modify these 2 
lines ^^^ and drop post-build.sh script.

> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19-rc5"

Here it would be better using a stable version. 5 days ago Linux
5.19-rc8 has been released so I expect the final release to land
on Sunday or in the beginning of the next week. So please, use version
5.19.

> +BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
> +BR2_LINUX_KERNEL_IMAGE_NAME="Image"

As pointed above here ^^^ use uImage.

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_LABEL="root"
> +BR2_TARGET_ROOTFS_EXT2_SIZE="3M"
> +
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
> +
> +# Required tools to create the SD card image
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MKPASSWD=y
> +
> +# Misc
> +BR2_BINUTILS_VERSION_2_36_X=y

I remember there is a reason to force using binutils 2.36, maybe the
thumb2 ADR bug in u-boot? If yes, please briefly explain why this is
here.

I've given a build using Buildroot's utils/docker-run but it fails due
to missing BR2_TARGET_UBOOT_NEEDS_OPENSSL=y. So please next time build
with utils/docker-run to catch any possible missing host dependency.

Waiting for V2 then.

Thanks for contributing!
Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
