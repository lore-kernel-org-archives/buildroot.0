Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D6DC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEA4C41845;
	Sat, 23 Jul 2022 13:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEA4C41845
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tMy6WWxUbsP5; Sat, 23 Jul 2022 13:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F83641846;
	Sat, 23 Jul 2022 13:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F83641846
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 490C31BF859
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 238BF403A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 238BF403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zz-oUDtCYIli for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:59:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7101340143
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7101340143
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:59:09 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FFetoo1BpbMeiFFetoJ930; Sat, 23 Jul 2022 15:59:07 +0200
Message-ID: <6b001b9a-7afd-2760-ef9e-1d2f16ae643a@benettiengineering.com>
Date: Sat, 23 Jul 2022 15:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
References: <20220723133313.236907-1-Mr.Bossman075@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220723133313.236907-1-Mr.Bossman075@gmail.com>
X-CMAE-Envelope: MS4xfMXECCxsawm/m6Fj0zXJets65FMmLJk0E8kqXuONsOI9eqZwMEtJxZxhGmmrJ2a9K6ZyaZdDjae2MNbnK/9b0UMSeLUvh9NfICs4EORAzuve4UsyqUwM
 MxQQOU4beyGqvBgS+nEDZFlzOBPmC1/HcLmkrDFqVdaKnDroEFrXz+50ufiBgil6O8gD39V0dOgDWjv1iS71YYjFfbMy0kaPlUjdWTetez+hB2+UdJPJcyn8
 Lq1+2XIbgj0GPahTc4vBrZGOgaHxpVd4+5rxj2ZyceGroZ4+YGzI7DyhgAIljM2Xarv6DlqIFnU2O28JBoOqj1ejdT08RDxjpQtm0ePq2ue8HCSAuZY4u8Li
 V2PPTqw5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1658584747; bh=cVwK24kD4+w5lGsISYI8MMZZTpxk29l6fql2gAAHZmM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=NRPrmfd8TYcMQPIxVMLL5La9UozHk6OcocSs2HlIKsdymrEFu4402IxK2yaeC5hVW
 BdEOrykLS6IaARqxSY2VmeNhRWROe/ls78YeKAs6cY7M/R08ChrzpaulsBBH22KxNP
 DWWbsySa5npmVjxQ6+C37MJpv5dcqw0avE+13u/snB5mrICXtdK4TQoQnSN08oDz5O
 TZRDa6uIdRBZQu1L3LN/us9w5A+OeuTV9ve12y3tJP7Y0PGB6i9fhkt/wp937pkhxJ
 XMhAaXnrnVKI9FsEwMXjh9Ih052APkzfGjR7G7kNEjDMLwh5yzbPwEj3n6jZW3X/l2
 R7pcUJyddDNew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=NRPrmfd8
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
Cc: maeva.manuel@oss.nxp.com, festevam@gmail.com, stephane.viau@oss.nxp.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jesse,

you have to subscribe to Buildroot ML before sending patches for
Buildroot.

I don't review until it's in ML, otherwise informations get lost.

Kind regards!
-- 
Giulio Benetti
Benetti Engineering sas

On 23/07/22 15:33, Jesse Taube wrote:
> The imxrt1050-evk is a development board from NXP.
> 
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
> diff --git a/board/freescale/imxrt1050evk/post-build.sh b/board/freescale/imxrt1050evk/post-build.sh
> new file mode 100755
> index 0000000000..47557566f9
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/post-build.sh
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +rm output/images/uImage
> +mkimage -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux kernel" -d output/images/Image output/images/uImage
> +./support/scripts/genimage.sh $2 $3
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
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19-rc5"
> +BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
> +BR2_LINUX_KERNEL_IMAGE_NAME="Image"
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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
