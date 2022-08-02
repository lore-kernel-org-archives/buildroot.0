Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DEAC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 21:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD6C160E35;
	Tue,  2 Aug 2022 21:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD6C160E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbRGOPJmqicz; Tue,  2 Aug 2022 21:22:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 731D960E1D;
	Tue,  2 Aug 2022 21:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 731D960E1D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 271A41BF28F
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01480402F3
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01480402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tz29puUzidQ5 for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 21:22:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53B06400AF
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53B06400AF
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 21:22:38 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IzLYoajM634GkIzLYon9oK; Tue, 02 Aug 2022 23:22:37 +0200
Message-ID: <282c7bf6-7996-a85f-9750-f6da808c6a47@benettiengineering.com>
Date: Tue, 2 Aug 2022 23:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Francois Perrad <francois.perrad@gadz.org>
References: <20220731094808.1347975-1-francois.perrad@gadz.org>
 <20220731094808.1347975-4-francois.perrad@gadz.org>
Content-Language: en-US
In-Reply-To: <20220731094808.1347975-4-francois.perrad@gadz.org>
X-CMAE-Envelope: MS4xfK3BDVGNnBFDNNcC+p3RmPOodczIXJHQkG0N+/bkuPrSdA362bQ2zOtUcjbUlg7u/gTYhL+R4GIrZfaOw9MSlsdeVN9UffuZjdxKCDmnXw79bPMY5SxX
 2nTRh1VDSQ4Pob/X85GAmaZery9Ky+TMMAItrapDlaqiJ7LklaysgX8HO7gIVDv2A8ib+Pr6QgDNRgDjxifDcwPJxULXBnvaMdm30hyFbwigMOy7584MehaJ
 xgp4eS7/BLDvO4o2sOAW3Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659475357; bh=JBK4cVZ/Q05D3taBq7PwIpYntHx9oZv52dGkkR4scok=;
 h=Date:MIME-Version:From:Subject:To:Content-Type;
 b=WUh8UGOzFbcFjiniXREbCqvmqAcOddM5xYJAgYYfgpyNWjrLwHdeu7NjRQ0Dw8mu3
 cp2ZIwHbx6rLl93C70gbE07/pX+O5V+tpWZc1BqJbbvX90CXDk+eiFBHoRk6Hh3dEj
 Akt/XVs2abuR3KK6bpSW36QNNCtt0kSEMPM10CXS4tkyPLqUc8m3Y7cDv6oL6Yi2J/
 wXiKoUqWC2jKaRW5eyDk9wa0BsZ1J/0v99YfoDIq/+qrkRbscIOUES986BSMM57pLD
 ca3bWconYBc10WEHd2jgG+qwnpES0jhQGWQIudNzGW9KCjth/HFVKDsSiLiBxcjjvL
 1D/Auin7nk5fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WUh8UGOz
Subject: Re: [Buildroot] [PATCH 3/3] board/freescale/ls1028ardb: new board
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

thanks for the patch,

On 31/07/22 11:48, fperrad at gmail.com (Francois Perrad) wrote:

Can you please provide a brief introduction of the board and a URL
to its website? The URLs can be the ones in readme.txt file

> Signed-off-by: Francois Perrad <francois.perrad at gadz.org>
> ---
>   DEVELOPERS                                    |  2 +
>   board/freescale/ls1028ardb/genimage.cfg       | 23 +++++++
>   board/freescale/ls1028ardb/readme.txt         | 60 +++++++++++++++++++
>   .../boot/extlinux/extlinux.conf               |  4 ++
>   configs/ls1028ardb_defconfig                  | 60 +++++++++++++++++++
>   5 files changed, 149 insertions(+)
>   create mode 100644 board/freescale/ls1028ardb/genimage.cfg
>   create mode 100644 board/freescale/ls1028ardb/readme.txt
>   create mode 100644 board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
>   create mode 100644 configs/ls1028ardb_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 780ec2041..7bca42074 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -980,9 +980,11 @@ N:	Francisco Gonzalez <gzmorell at gmail.com>
>   F:	package/ser2net/
>   
>   N:	Francois Perrad <francois.perrad at gadz.org>
> +F:	board/freescale/ls1028ardb/
>   F:	board/olimex/a20_olinuxino
>   F:	board/olimex/imx233_olinuxino/
>   F:	board/olimex/stmp1_olinuxino/
> +F:	configs/ls1028ardb_defconfig
>   F:	configs/olimex_a20_olinuxino_*
>   F:	configs/olimex_imx233_olinuxino_defconfig
>   F:	configs/olimex_stmp157_olinuxino_lime_defconfig
> diff --git a/board/freescale/ls1028ardb/genimage.cfg b/board/freescale/ls1028ardb/genimage.cfg
> new file mode 100644
> index 000000000..3efef0bff
> --- /dev/null
> +++ b/board/freescale/ls1028ardb/genimage.cfg
> @@ -0,0 +1,23 @@
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition fsbl {
> +		offset = 4K
> +		in-partition-table = "no"
> +		image = "bl2_sd.pbl"
> +	}
> +
> +	partition ssbl {
> +		offset = 1M
> +		in-partition-table = "no"
> +		image = "fip.bin"
> +	}
> +
> +	partition rootfs {
> +		offset = 8M
> +		partition-type = 0x83
> +		bootable = "true"
> +		image = "rootfs.ext4"
> +	}
> +}
> diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
> new file mode 100644
> index 000000000..9fc8e989c
> --- /dev/null
> +++ b/board/freescale/ls1028ardb/readme.txt
> @@ -0,0 +1,60 @@
> +**************
> +NXP LS1028ARDB
> +**************
> +
> +This file documents the Buildroot support for the LS1028A Reference Design Board.
> +
> +for more details about the board and the QorIQ Layerscape SoC, see the following pages:
> +  - https://www.nxp.com/design/qoriq-developer-resources/layerscape-ls1028a-reference-design-board:LS1028ARDB
> +  - https://www.nxp.com/LS1028A
> +
> +Build
> +=====
> +
> +First, configure Buildroot for the LS1028ARDB board:
> +
> +  make ls1028ardb_defconfig
> +
> +Build all components:
> +
> +  make
> +
> +You will find in output/images/ the following files:
> +  - bl2_sd.pbl
> +  - fip.bin
> +  - fsl-ls1028a-rdb.dtb
> +  - Image
> +  - PBL.bin
> +  - rootfs.ext2
> +  - rootfs.ext4 -> rootfs.ext2
> +  - sdcard.img
> +  - u-boot.bin
> +
> +Create a bootable SD card
> +=========================
> +
> +To determine the device associated to the SD card have a look in the
> +/proc/partitions file:
> +
> +  cat /proc/partitions
> +
> +Buildroot prepares a bootable "sdcard.img" image in the output/images/
> +directory, ready to be dumped on a SD card. Launch the following
> +command as root:
> +
> +  dd if=output/images/sdcard.img of=/dev/<your-sd-device>

Here we usually use of=/dev/sdX so please let's keep it consistent

> +
> +*** WARNING! This will destroy all the card content. Use with care! ***
> +
> +For details about the medium image layout, see the definition in
> +board/freescale/ls1028ardb/genimage.cfg.
> +
> +Boot the LS1028ARDB board
> +=========================
> +
> +To boot your newly created system:
> +- insert the SD card in the SD slot of the board;
> +- Configure the switches SW2[1:4] = 1000 (select SD Card boot option)
> +- put a DB9F cable into the UART1 Port and connect using a terminal
> +  emulator at 115200 bps, 8n1;
> +- power on the board.
> diff --git a/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
> new file mode 100644
> index 000000000..c08ddde10
> --- /dev/null
> +++ b/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
> @@ -0,0 +1,4 @@
> +label ls1028ardb-buildroot
> +  kernel /boot/Image
> +  devicetree /boot/fsl-ls1028a-rdb.dtb
> +  append root=/dev/mmcblk0p1 rootwait
> diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
> new file mode 100644
> index 000000000..e3e4760cd
> --- /dev/null
> +++ b/configs/ls1028ardb_defconfig
> @@ -0,0 +1,60 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +
> +# Toolchain
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

Is this ^^^ mandatory? If yes can you explain it in commit log?
If it's not then please remove it and let the user decide

> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="ls1028a"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y

Same here ^^^

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_OVERLAY="board/freescale/ls1028ardb/rootfs_overlay"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/linux"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="LSDK-21.08"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +
> +# Target package
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y

Same here ^^^

> +BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Bootloaders
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/atf"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="LSDK-21.08"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/u-boot"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="LSDK-21.08"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1028ardb_tfa"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +
> +# Host utilities
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.bin"

I've built it successfully both keeping and removing the 3 options above
with utils/docker-run

So with the changes requested above:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I wait for the V2 patch that should be committed if everything is ok
for everybody.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
