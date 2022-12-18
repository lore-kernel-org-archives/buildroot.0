Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A0BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 01:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31E0F40002;
	Sun, 18 Dec 2022 01:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31E0F40002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwlNSGxu5Q7V; Sun, 18 Dec 2022 01:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19F6540003;
	Sun, 18 Dec 2022 01:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19F6540003
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA0401BF40B
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 01:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E77B60594
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 01:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E77B60594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u85zyp6iJ1-3 for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 01:29:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88E2260586
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88E2260586
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 01:29:17 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6iUMp7EfFpFO96iUNpxQUS; Sun, 18 Dec 2022 02:29:15 +0100
Message-ID: <fc737909-d14b-70f3-2bf0-5f45c57888b0@benettiengineering.com>
Date: Sun, 18 Dec 2022 02:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
References: <20221214233649.3928722-1-Mr.Bossman075@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221214233649.3928722-1-Mr.Bossman075@gmail.com>
X-CMAE-Envelope: MS4xfODFbNWYKIv0cvQHQOwwsrgkVTxgtlUNqJjz1YZ/GwHlLL+pPU3TsDkujfy7BU6oIIYTwuNh2ACBIoJLfpe/4fOfy2ufK1MvOQiaJ0gpvTg/D1scyKSf
 GaZnt382N7iIKDvSKqjI+p8S3ZG60brn7gGOMFtBg9HM+fmDXfH9sjU3xG5OuDfkQlfZqz+E70DYD8Zs+n17NeiEmFY90U7CMsp3DOuTlnDFtE/TvJjQur5C
 4FbgBAqPZWlSoZZlrJvKI1GbBsnSDkwbcDGl6iN4eDQzFlWOVUr9itLB1q95Tv/yEkaRVO3XwsjHcGArpK6W5BeWQ3N0ICx6TAdEYsPDGvdNB21DikjdS3vu
 i2iNnjoxbxIiwRQRuYWLSWT0bg0+OYcunHpn/nfdhgYGvVEwvrY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1671326955; bh=RIi9nM86dibNF2gLTiHB+ND6q0LIIoUj4+2Pk9EB9j0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=CU34A/CI8+A6SNKORSFpLfu9Xqgx4FwwFp0uSJKzw8xLv2gLAjGP07m+vj1Yzgvta
 H6ogVQShYjElf/uwogVr1uVEtcn3Wbjo3lRe0bzrBKKd3PDx29dkA2+PHsNophpwbV
 A332TbSgqEW5LuBOIlCwHAWNlyDz/OwudfmEvxByCr+7MW8e1UPcCC1hK94EpKB0gI
 fomyzL8zmoHAEC0uWnBQz7YSyMwt3+dWA/+UDj1KGfo2Z91/QTjZ4tNm2hSnKFVT9Y
 P2juHpKQrXGAAuyqyIKTPJqQnUgKHNGyKoi2DSsjHDz9qB7R99BzRSOup/MMUfcEHE
 fqe7w5VKNbaSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CU34A/CI
Subject: Re: [Buildroot] [PATCH v4] configs/imxrt1050-evk: New defconfig
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
Cc: maeva.manuel@oss.nxp.com, James Autry <jautry@tekvox.com>,
 festevam@gmail.com, stephane.viau@oss.nxp.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jesse,

On 15/12/22 00:36, Jesse Taube wrote:
> Add defconfig for imxrt1050-evk is a development board from NXP.
> 
> Giulio and I worked on Linux and U-boot for this board. And now I'm
> adding support for the new board in Buildroot.
> 
> The i.MXRTxxxx family spreads from i.MXRT1020 to i.MXRT1170 with the
> first one supporting 1 USB OTG & 100M ethernet with a cortex-M7@500Mhz
> up to the latter with i.MXRT1170 with cortex-M7@1Ghz and
> cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU, 2x 1Gb and
> 1x 100Mb ENET. The i.MXRT family is NXP's answer to STM32F7xx, as it
> uses only simple SDRAM, it gives the chance of a 4 or less layer PCBs.
> Seeing that these chips are comparable to the STM32F7xxs which have
> buildroot ported to them it seems reasonable to add support for them.
> 
> https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   DEVELOPERS                                  |  6 +++
>   board/freescale/imxrt1050evk/genimage.cfg   | 40 +++++++++++++++++++
>   board/freescale/imxrt1050evk/post-build.sh  |  3 ++
>   board/freescale/imxrt1050evk/readme.txt     | 30 ++++++++++++++
>   board/freescale/imxrt1050evk/uboot.fragment |  2 +
>   configs/imxrt1050-evk_defconfig             | 43 +++++++++++++++++++++
>   6 files changed, 124 insertions(+)
>   create mode 100644 board/freescale/imxrt1050evk/genimage.cfg
>   create mode 100755 board/freescale/imxrt1050evk/post-build.sh
>   create mode 100644 board/freescale/imxrt1050evk/readme.txt
>   create mode 100644 board/freescale/imxrt1050evk/uboot.fragment
>   create mode 100644 configs/imxrt1050-evk_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 59121c6a54..ee33c65fd4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1132,9 +1132,11 @@ F:	package/webp/
>   F:	package/xapian/
>   
>   N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
> +F:	board/freescale/imxrt1050evk/*
>   F:	board/olimex/a*
>   F:	configs/amarula_vyasa_rk3288_defconfig
>   F:	configs/asus_tinker_rk3288_defconfig
> +F:	configs/imxrt1050-evk_defconfig
>   F:	configs/olimex_a*
>   F:	package/at/
>   F:	package/binutils/
> @@ -1477,6 +1479,10 @@ F:	package/wmctrl/
>   F:	package/x11r7/xdriver_xf86-video-imx/
>   F:	package/x11r7/xdriver_xf86-video-imx-viv/
>   
> +N:	Jesse Taube <Mr.Bossman075@gmail.com>
> +F:	board/freescale/imxrt1050evk/*
> +F:	configs/imxrt1050-evk_defconfig
> +
>   N:	Jesse Van Gavere <jesseevg@gmail.com>
>   F:	package/qt6/qt6serialport/
>   
> diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
> new file mode 100644
> index 0000000000..7e1e932d37
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/genimage.cfg
> @@ -0,0 +1,40 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"uImage",
> +			"imxrt1050-evk.dtb",
> +		}
> +	}
> +
> +	size = 6M

Please round it up to 8M, 6M is pretty odd and we have an sd-card here
to use, so plenty of space. If someone wants to shrink it down it can do
it later.

> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition SPL {
> +		in-partition-table = "no"
> +		image = "SPL"
> +		offset = 1K
> +		size = 127K
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "u-boot.img"
> +		offset = 128K
> +		size = 512K
> +	}
> +
> +	partition boot {
> +		partition-type = 0xc
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +	}
> +}
> diff --git a/board/freescale/imxrt1050evk/post-build.sh b/board/freescale/imxrt1050evk/post-build.sh
> new file mode 100755
> index 0000000000..a13789f231
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/post-build.sh
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +MKIMAGE=$HOST_DIR/bin/mkimage
> +$MKIMAGE -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux kernel" -d $BINARIES_DIR/Image $BINARIES_DIR/uImage

You can drop post-build.sh file because you can already produce uImage,
see below

> diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
> new file mode 100644
> index 0000000000..1fc4edd88b
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/readme.txt
> @@ -0,0 +1,30 @@
> +NXP i.MXRT1050 EVK board
> +------------------------
> +
> +i.MX RT1050 are NXP's crossover MCUs. They combine the high performance and high
> +level of integration of an applications processors with the ease-of-use and
> +real-time functionality of a microcontroller. The i.MX RT1050 MCU runs on the Arm
> +Cortex-M7 core at 600 MHz.
> +https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
> +
> +To build a minimal support for this board:
> +
> +$ make imxrt1050-evk_defconfig
> +$ make
> +
> +Buildroot prepares a bootable "sdcard.img" image in the output/images/
> +directory, ready to be flashed into the SD card:
> +
> +$ dd if=output/images/sdcard.img of=/dev/sdX
> +Where 'sdX' is the device node of the uSD.
> +
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
> index 0000000000..c9022649be
> --- /dev/null
> +++ b/configs/imxrt1050-evk_defconfig
> @@ -0,0 +1,43 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_m7=y
> +
> +# Image
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imxrt1050evk/post-build.sh"

Please drop this ^^^

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
> +BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y

Drop this ^^^

> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"

and this ^^^

> +BR2_LINUX_KERNEL_IMAGE_NAME="Image"

and this ^^^

in favor of:
BR2_LINUX_KERNEL_UIMAGE=y
it works even without specifying the address since the default is used
that is exactly 0x80008000, the same used by post-build.sh that becomes
useless.

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="3M"

Please expand the rootfs size to 16M at least, 3M is odd and this is the
result of 'df -h':
Filesystem                Size      Used Available Use% Mounted on 

/dev/root                 1.8M    537.0K      1.1M  33% /

I would like to have more than 1.1M to do tests.

> +
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="imxrt1050-evk"

While make savedefconfig this ^^^ becomes useless.
BR2_TARGET_UBOOT_BOARD_DEFCONFIG is enough. So please drop it

> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.11"

As you've already pointed here you need 2022.10

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +
> +# Required tools to create the SD card image
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MKPASSWD=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Please drop this ^^^ too since now uImage is generated by Linux package.

I've tested this on the imxrt1050-evk but there is a problem that has a
simple solution:
busybox without MMU can only have HUSH as SH, so if you keep using the
default BR2_PACKAGE_BUSYBOX_CONFIG that is 
"package/busybox/busybox-minimal.config" it will automatically choose 
HUSH but with very few
utilities, so we won't have umask, unset and other useful utility
written for MMU processors. You can try to check which busybox utilities
are enabled at the moment by issuing:
$ make busybox-menuconfig

To solve the problem you only need to specify:
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minmal.config"
That enables all the HUSH utilites we need to have a working NOMMU
rootfs. So please add:
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minmal.config"
right after:
# Filesystem

I wait for V5 to test.

Thank you!
Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
