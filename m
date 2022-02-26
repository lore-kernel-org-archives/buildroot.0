Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DA6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 10:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FEE084010;
	Sat, 26 Feb 2022 10:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KAR14RIGmA2; Sat, 26 Feb 2022 10:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8F5284008;
	Sat, 26 Feb 2022 10:53:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3ED8C1BF484
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D49A60B04
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b9z6tZdoHS4L for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 10:53:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2658B60A81
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:53:12 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.7.124])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NuhMnT8OCroAhNuhMnImbR; Sat, 26 Feb 2022 11:53:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645872792; bh=55k0ndEiZhj11VmpYZACLZhP0DnulHbrjYj+NH3verU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=H5k+bo7NBUIx4QbftNFfFcgo7AH6JZq9i7+U2Y3GccEc7SY53nXBj7LBMxBejXrdh
 4CSB/RbPcHdXWHCRqRZfMiyH5QsSF8F0e0x+cEtZREBrjGOQ5Cepiq7DsSVH4YHlYZ
 fsWzjZem1OTXpR74FxZgmoXcHMxh3k/f0Hy0Bnns0XvYYHcXov0LzrXty0sLJJLbRf
 KC3WP4mpz5ENygYu3Oq2Oqd3sqJC9zkikXgjIXWlNcDLQGd98RNrq3NIRK1iUbpLQv
 vCPtOhIsI1etmw2lCh5G+Ebyv4Kw+lsN+MxaVwinAyEZa315QqTwo2/2UlRmeVBvzO
 BO2smkBHmR90w==
Message-ID: <740a0d74-bbfd-d8a6-bd60-b92cc5005c6d@benettiengineering.com>
Date: Sat, 26 Feb 2022 11:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220225072622.3584480-1-geomatsi@gmail.com>
 <20220225072622.3584480-5-geomatsi@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220225072622.3584480-5-geomatsi@gmail.com>
X-CMAE-Envelope: MS4wfEYf9PFbotkwMHOaObPr8JmNOm+ZKbz5sp5uPfubIuksPxxSbhDnx68t3yo0Ex7sQXOqenwwvJrUxsahVVxJ73wBBj3VLUV5CPtaXazcnvbnoVT5dOc7
 7a5PIECX1Qf97bO9hY3ippIeS89+8uPgPl9WDTDKTLDOMr97gF1X5pPyx7OuOJ12Ab4qMAPl/UlNQK/EHpBmeOGTzX+yV1kfhPzlGqa0koqaQYUeGKgjr/fG
 GV7iklVg5iUy3ucSZcJr4o5fiJkPD+2YJnGnnshSrCI=
Subject: Re: [Buildroot] [PATCH v2 4/6] board/linksprite/pcduino: switch to
 extlinux
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

On 25/02/22 08:26, Sergey Matyukevich wrote:
> Switch to extlinux instead of U-Boot boot script. Drop custom
> boot script and genimage config. Instead use common orangepi
> files from board/orangepi/common.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: build tested only]

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   board/linksprite/pcduino/boot.cmd      |  8 -----
>   board/linksprite/pcduino/genimage.cfg  | 43 --------------------------
>   board/linksprite/pcduino/post-build.sh | 11 -------
>   board/linksprite/pcduino/post-image.sh | 16 ----------
>   configs/linksprite_pcduino_defconfig   |  9 +++---
>   5 files changed, 4 insertions(+), 83 deletions(-)
>   delete mode 100644 board/linksprite/pcduino/boot.cmd
>   delete mode 100644 board/linksprite/pcduino/genimage.cfg
>   delete mode 100755 board/linksprite/pcduino/post-build.sh
>   delete mode 100755 board/linksprite/pcduino/post-image.sh
> 
> diff --git a/board/linksprite/pcduino/boot.cmd b/board/linksprite/pcduino/boot.cmd
> deleted file mode 100644
> index 0db8363599..0000000000
> --- a/board/linksprite/pcduino/boot.cmd
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -setenv fdt_high ffffffff
> -
> -setenv bootargs console=ttyS0,115200 console=tty1 earlyprintk root=/dev/mmcblk0p2 rootwait panic=10 ${extra}
> -
> -fatload mmc 0 $kernel_addr_r zImage
> -fatload mmc 0 $fdt_addr_r sun4i-a10-pcduino.dtb
> -
> -bootz $kernel_addr_r - $fdt_addr_r
> diff --git a/board/linksprite/pcduino/genimage.cfg b/board/linksprite/pcduino/genimage.cfg
> deleted file mode 100644
> index db33322118..0000000000
> --- a/board/linksprite/pcduino/genimage.cfg
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -#
> -# Minimal SD card image for the pcDuino
> -#
> -
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"zImage",
> -			"sun4i-a10-pcduino.dtb",
> -			"boot.scr"
> -		}
> -	}
> -
> -	size = 16M
> -}
> -
> -#
> -# Note: u-boot environment is stored between u-boot and boot partitions
> -#
> -
> -image sdcard.img {
> -	hdimage {
> -	}
> -
> -	partition u-boot {
> -		in-partition-table = "no"
> -		image = "u-boot-sunxi-with-spl.bin"
> -		offset = 8K
> -		size = 1016K # 1MB - 8KB
> -	}
> -
> -	partition boot {
> -		partition-type = 0xC
> -		bootable = "true"
> -		image = "boot.vfat"
> -		offset = 1M
> -	}
> -
> -	partition rootfs {
> -		partition-type = 0x83
> -		image = "rootfs.ext4"
> -	}
> -}
> diff --git a/board/linksprite/pcduino/post-build.sh b/board/linksprite/pcduino/post-build.sh
> deleted file mode 100755
> index e1e1877671..0000000000
> --- a/board/linksprite/pcduino/post-build.sh
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#!/bin/sh
> -# post-build.sh for pcDuino taken from OrangePi post-build.sh
> -# 2013, Carlo Caione <carlo.caione@gmail.com>
> -
> -BOARD_DIR="$(dirname $0)"
> -MKIMAGE=$HOST_DIR/bin/mkimage
> -BOOT_CMD=$BOARD_DIR/boot.cmd
> -BOOT_CMD_H=$BINARIES_DIR/boot.scr
> -
> -# U-Boot script
> -$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
> diff --git a/board/linksprite/pcduino/post-image.sh b/board/linksprite/pcduino/post-image.sh
> deleted file mode 100755
> index c82b189f9c..0000000000
> --- a/board/linksprite/pcduino/post-image.sh
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -#!/bin/sh
> -
> -BOARD_DIR="$(dirname $0)"
> -GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> -GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> -
> -rm -rf "${GENIMAGE_TMP}"
> -
> -genimage                               \
> -	--rootpath "${TARGET_DIR}"     \
> -	--tmppath "${GENIMAGE_TMP}"    \
> -	--inputpath "${BINARIES_DIR}"  \
> -	--outputpath "${BINARIES_DIR}" \
> -	--config "${GENIMAGE_CFG}"
> -
> -exit $?
> diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
> index b58f970493..05b25aede4 100644
> --- a/configs/linksprite_pcduino_defconfig
> +++ b/configs/linksprite_pcduino_defconfig
> @@ -11,8 +11,9 @@ BR2_TARGET_GENERIC_GETTY=y
>   BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>   
>   # SD image scripts
> -BR2_ROOTFS_POST_BUILD_SCRIPT="board/linksprite/pcduino/post-build.sh"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/linksprite/pcduino/post-image.sh"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>   
>   # For kernel modules autoloading
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> @@ -29,6 +30,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-pcduino"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/linksprite/pcduino/linux-extras.config"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   
>   # Filesystem
>   BR2_TARGET_ROOTFS_EXT2=y
> @@ -49,10 +51,7 @@ BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>   
>   # Host packages
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>   
>   # Target packages: wireless support for pcduino-lite-wifi
>   BR2_PACKAGE_IW=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
