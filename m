Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62321C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02AEF400F3;
	Mon,  5 Feb 2024 14:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02AEF400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYUHkfwdxEvM; Mon,  5 Feb 2024 14:20:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC4C441551;
	Mon,  5 Feb 2024 14:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC4C441551
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87AC81BF2B1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A50260F0B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A50260F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOXZzDNCj6Yq for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:20:24 +0000 (UTC)
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36A6260B50
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36A6260B50
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id WzpdrzCcol81fWzpdrU0bz; Mon, 05 Feb 2024 15:20:22 +0100
Message-ID: <d640b689-d78b-477e-b13f-b55174ab2d96@benettiengineering.com>
Date: Mon, 5 Feb 2024 15:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Nigel Wang <asd617140123@gmail.com>, buildroot@buildroot.org
References: <20240205135831.34656-1-asd617140123@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240205135831.34656-1-asd617140123@gmail.com>
X-CMAE-Envelope: MS4xfMn8kqIBzFDdTLVDRHWlijD0isFsWiKWaqv7J/mRsRSa2e38t7USnTSKRS3a6qLie/EW+xal4DvyHJNGgqk7bUfDs47+lPnYxL0f65xOiyL0MCuT+NaH
 UFu/3P13czz3DlYSL39CZr1bnG4ErAoLsd7ZV813zF3lakUvD5xyH4ASbsL6Ekmn9xt58M9KHDbxfiYnDifJjnhYY31dNAoyh1ZrCOG5nCdDq+6exbNXjR3H
 hfrhbQ13KwW41eBbJmWnEYywmHsAUQJIS6xfKY6eDjeb3EDJQ/+y/QudU1EovcQjQFX1MQqJkndxUtCDfFj4tg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707142822; bh=aZqsOyQyXnNeZX1d+jp8/tGB0Mb5/O2pOzjDwOHmHFs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=gA7nelOIeISvQFtvXicuRHN5AzBP1aciTJ+YC/cUVV9cEOn0n4Xp51bL0XAnfGuMb
 bwHSB3cBLcUZtwGcI8yrOXxzAQd46Khu48lTHgr/utmc/Dyd5Sq8DlMkh2qyfYSZBY
 R+CAY/8zXetUOGw/CbOEG02aRPuTXeKc7V9Wi/UlHPqptvyR/I7Bhy8m5XcKn7gq3i
 I9mvAhfWifsNp7oerHQNHXUBKWpjuXZxlmQ/LtHZaqnjJmtH1j8VPnlUTMV5Jinwec
 MgkpM0piqCsBhynCZO5IqX+1SN9NvT2PA8by2EnP9JlK3TBClEkIzxJMQIFdw1Btwm
 HtTp0QBZtuePg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gA7nelOI
Subject: Re: [Buildroot] [PATCH 1/1] board/cubietech/cubieboard4 : Add
 config file for cubieboard4.
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
Cc: thomas.petazzoni@free-electrons.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nigel,

On 05/02/24 14:58, Nigel Wang wrote:
> From: nigel_wang <asd617140123@gmail.com>
> 
> This is a new defconfig for cubieboard4. The following is board's
> detail.
> - SOC: sunxiA80.
> - DRAM: 2GiB DDR3 @ 672MHZ.
> - NAND: 8GBeMMC
> - Power: DC 5V.
> - Network: Wifi 80211 b/g/n.
> - Ethernet: RTL8211E
> reference:
> https://linux-sunxi.org/Cubietech_Cubieboard4
> 
> Board support package includes the following components:
> - mainline Linux Kernel 6.6.8
> - mainline U-boot 2021.10.
> 
> Signed-off-by: Nigel Wang <asd617140123@gmail.com>
> ---
> v3 -> v4
> * squash all commit, make the commit log is clear.
> 
> v2 -> v3
> * Add BR2_cortex_a15_a7=y in buildroot defconfig.
> * Bump linux version to 6.6.8
> * Using sunxi_defconfig in kernel.
> * Using "make savedefconfig" to save defconfig, it can only save the
> changed config in buildroot.
> * Change kernel's path in extlinux. Make it can boot up successfully.
> 
> ---
>   board/cubietech/cubieboard4/boot.cmd      |  5 +++
>   board/cubietech/cubieboard4/extlinux.conf |  5 +++
>   board/cubietech/cubieboard4/genimage.cfg  | 38 ++++++++++++++++++++++
>   board/cubietech/cubieboard4/post-image.sh | 18 +++++++++++
>   configs/cubieboard4_defconfig             | 39 +++++++++++++++++++++++
>   5 files changed, 105 insertions(+)
>   create mode 100644 board/cubietech/cubieboard4/boot.cmd
>   create mode 100644 board/cubietech/cubieboard4/extlinux.conf
>   create mode 100644 board/cubietech/cubieboard4/genimage.cfg
>   create mode 100755 board/cubietech/cubieboard4/post-image.sh
>   create mode 100644 configs/cubieboard4_defconfig
> 
> diff --git a/board/cubietech/cubieboard4/boot.cmd b/board/cubietech/cubieboard4/boot.cmd
> new file mode 100644
> index 0000000000..6521243696
> --- /dev/null
> +++ b/board/cubietech/cubieboard4/boot.cmd
> @@ -0,0 +1,5 @@
> +setenv fdt_high ffffffff
> +setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> +fatload mmc 0 $kernel_addr_r zImage
> +fatload mmc 0 $fdt_addr_r sun9i-a80-cubieboard4.dtb
> +bootz $kernel_addr_r - $fdt_addr_r

since now you've added extlinux.conf you can drop boot.cmd file above ^^^

> diff --git a/board/cubietech/cubieboard4/extlinux.conf b/board/cubietech/cubieboard4/extlinux.conf
> new file mode 100644
> index 0000000000..5084e2237b
> --- /dev/null
> +++ b/board/cubietech/cubieboard4/extlinux.conf
> @@ -0,0 +1,5 @@
> +label linux
> +    kernel /boot/zImage
> +    devicetree /sun9i-a80-cubieboard4.dtb
> +    append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> +
> diff --git a/board/cubietech/cubieboard4/genimage.cfg b/board/cubietech/cubieboard4/genimage.cfg
> new file mode 100644
> index 0000000000..f1dee13923
> --- /dev/null
> +++ b/board/cubietech/cubieboard4/genimage.cfg
> @@ -0,0 +1,38 @@
> +# Minimal SD card image for the Cubieboard2
> +# Based in the Orange Pi genimage.cfg
> +
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"zImage",
> +			"sun9i-a80-cubieboard4.dtb",
> +			"extlinux"
> +		}
> +	}
> +
> +	size = 8M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "u-boot-sunxi-with-spl.bin"
> +		offset = 8K
> +		size = 1016K # 1MB - 8KB
> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +		size = 512M
> +	}
> +}
> diff --git a/board/cubietech/cubieboard4/post-image.sh b/board/cubietech/cubieboard4/post-image.sh
> new file mode 100755
> index 0000000000..e37b960a4d
> --- /dev/null
> +++ b/board/cubietech/cubieboard4/post-image.sh
> @@ -0,0 +1,18 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname "$0")"
> +install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
> +
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage                           \
> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> +
> +exit $?
> diff --git a/configs/cubieboard4_defconfig b/configs/cubieboard4_defconfig
> new file mode 100644
> index 0000000000..0592fe4a2d
> --- /dev/null
> +++ b/configs/cubieboard4_defconfig
> @@ -0,0 +1,39 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a15_a7=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +
> +# System
> +BR2_TARGET_GENERIC_HOSTNAME="Cubieboard4"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard4!"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard4/post-image.sh"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.8"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun9i-a80-cubieboard4"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard4"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

You need to add your entry in DEVELOPERS file as this board maintainer.
When sending next patch please tag it as V2 with:
$ git format-patch -s -M -o . -1 -v2

Thank you
Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
