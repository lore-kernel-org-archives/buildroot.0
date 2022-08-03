Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23A9C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 492B7610C0;
	Wed,  3 Aug 2022 16:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 492B7610C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mF-5ZuKINluE; Wed,  3 Aug 2022 16:11:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CFFC610BC;
	Wed,  3 Aug 2022 16:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CFFC610BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4DCE1BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B444827AF
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B444827AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMjONgimrJmb for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:11:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10D85827AA
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10D85827AA
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 16:11:52 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JGyMotr8qcdGJJGyMoPvZc; Wed, 03 Aug 2022 18:11:50 +0200
Message-ID: <b58dce4c-16ac-ad4f-9f7e-e7d93f48d0ee@benettiengineering.com>
Date: Wed, 3 Aug 2022 18:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220803074349.7590-1-francois.perrad@gadz.org>
 <20220803074349.7590-4-francois.perrad@gadz.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220803074349.7590-4-francois.perrad@gadz.org>
X-CMAE-Envelope: MS4xfIL2p7+PcYE10lH6UST3wUz7vfM5tki3/1Gk6j9vvuWn9tERyWh5toU8MY1AvoG1db21RtpdyR4dGH2XrXOh2myo5pVUvWX8vo5O7ml50yNEmVyij1WV
 6abNclC0pgC7y72djvO0Fe5B0cQP3jLgwfbaYyJ5uHT/5aicQMjbiMXh6fQlSTTTdu/H540oT12bb4yrYsgNZ5mH01LGXFL9SXX9PVx2tTGjEXYTLsMzknbu
 5RjyUYLOtqz+Rt/rJyh/nA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659543110; bh=80ZG2zS/x7xix3WSijcQbYKK41EghQ435qBu5MqlNnA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=LakF0lzpUnR8E4ScF67t30rY4rJ2BgQJchldHiUXZEhSUjVokxrSTMfHwD6txk5hX
 lgxN9tguke91MuZIxe2n4Y2sDSesBD5P6+65g72X2wCOQFk/0GSppGPGLjZFu6URXz
 IAYaKp3AOS8gjynS68Qr9dv/qrZGdrrAFj5/EtVj2jEu9amc2ENMWbEmJdHK0YhuPP
 WLI/wiQ42+K30YO/GcENDs4VZIYzJJFt++64kffX1oOnw/JeZCAeXlywitPHxN6qRe
 VMxZrc+WbcLR70uYUkV/qefjQyHbrQ3xiZ7wPp00aMZpJxIi6t/F8K+98DcrXkwzdg
 j0N/CgOxfLS0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LakF0lzp
Subject: Re: [Buildroot] [PATCH v2 3/3] board/freescale/ls1028ardb: new board
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On 03/08/22 09:43, Francois Perrad wrote:
> This is the reference design board for the NXP LS1028a SoC.
> 
> see https://www.nxp.com/design/qoriq-developer-resources/layerscape-ls1028a-reference-design-board:LS1028ARDB

You've forgotten your SoB

> ---
>   DEVELOPERS                                    |  2 +
>   board/freescale/ls1028ardb/genimage.cfg       | 23 +++++++
>   board/freescale/ls1028ardb/readme.txt         | 60 +++++++++++++++++++
>   .../boot/extlinux/extlinux.conf               |  4 ++
>   .../rules.d/73-fsl-enetc-networking.rules     | 16 +++++
>   configs/ls1028ardb_defconfig                  | 60 +++++++++++++++++++
>   6 files changed, 165 insertions(+)
>   create mode 100644 board/freescale/ls1028ardb/genimage.cfg
>   create mode 100644 board/freescale/ls1028ardb/readme.txt
>   create mode 100644 board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
>   create mode 100644 board/freescale/ls1028ardb/rootfs_overlay/etc/udev/rules.d/73-fsl-enetc-networking.rules
>   create mode 100644 configs/ls1028ardb_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 780ec2041..7bca42074 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -980,9 +980,11 @@ N:	Francisco Gonzalez <gzmorell@gmail.com>
>   F:	package/ser2net/
>   
>   N:	Francois Perrad <francois.perrad@gadz.org>
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
> index 000000000..93396a419
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
> +  dd if=output/images/sdcard.img of=/dev/sdX
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
> diff --git a/board/freescale/ls1028ardb/rootfs_overlay/etc/udev/rules.d/73-fsl-enetc-networking.rules b/board/freescale/ls1028ardb/rootfs_overlay/etc/udev/rules.d/73-fsl-enetc-networking.rules
> new file mode 100644
> index 000000000..19f41634b
> --- /dev/null
> +++ b/board/freescale/ls1028ardb/rootfs_overlay/etc/udev/rules.d/73-fsl-enetc-networking.rules
> @@ -0,0 +1,16 @@
> +# ENETC rules
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.0", DRIVERS=="fsl_enetc", NAME:="eno0"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.1", DRIVERS=="fsl_enetc", NAME:="eno1"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.2", DRIVERS=="fsl_enetc", NAME:="eno2"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.6", DRIVERS=="fsl_enetc", NAME:="eno3"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.0", DRIVERS=="fsl_enetc_vf", NAME:="eno0vf0"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.1", DRIVERS=="fsl_enetc_vf", NAME:="eno0vf1"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.2", DRIVERS=="fsl_enetc_vf", NAME:="eno1vf0"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.3", DRIVERS=="fsl_enetc_vf", NAME:="eno1vf1"
> +# LS1028 switch rules
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p0", NAME="swp0"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p1", NAME="swp1"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p2", NAME="swp2"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p3", NAME="swp3"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p4", NAME="swp4"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p5", NAME="swp5"

This ^^^ explains me the reason of enabling EUDEV

> diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
> new file mode 100644
> index 000000000..cc325485c
> --- /dev/null
> +++ b/configs/ls1028ardb_defconfig
> @@ -0,0 +1,60 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +
> +# Toolchain
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# wchar required for eudev
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="ls1028a"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
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

It builds correctly using buildroot/utils/docker-run and everything
looks good to me, so:

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Please re-send the entire patchset with your SoB and my Reviewed-by for
every patch.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
