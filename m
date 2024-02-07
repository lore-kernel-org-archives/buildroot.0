Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0333C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9225A82919;
	Wed,  7 Feb 2024 11:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y3vnQLILpjLF; Wed,  7 Feb 2024 11:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C516826C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C516826C7;
	Wed,  7 Feb 2024 11:07:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28D5B1BF599
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 201F540447
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQzPC6dUmmsL for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.162;
 helo=smtpcmd14162.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25C4940025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25C4940025
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25C4940025
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:06:55 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XflUrmpZGWf5XXflVrk9Wv; Wed, 07 Feb 2024 12:06:53 +0100
Message-ID: <0e623797-b573-4604-b89e-737c7c503350@benettiengineering.com>
Date: Wed, 7 Feb 2024 12:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Nigel Wang <asd617140123@gmail.com>, buildroot@buildroot.org
References: <20240207030339.3910-1-asd617140123@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240207030339.3910-1-asd617140123@gmail.com>
X-CMAE-Envelope: MS4xfJ0ayVcqe/Rx6aafZlWVveDm3ezOqU3+RMuz+GLxXPjm73kw87OxBsE9ZuNluLOI8mzbpKXPqrdaDeq4Ca3BPzzKcwaFZlVjTLTnSXPJh/P/2CCca8xk
 HXZGRn+Bt+T/1oOdphpwICzXT9sKCwrbIUeFcOWzSxyOn7NOcYLvJfko66pbu+BEtmocx93Ba/mKhDVk953/CdT1ykMu3N80vue0OveSi0Yrw2Ys3MzQ2ymF
 rM/yVI2s2Mw5Ssp7eKBIxUd7kxBV9hVLYwljpwjNMNBLDI5odftm4G4RzbHng7w7pAo8kRwxlENRdqqETraOJGeQeiJYumASTMiTXQchWEs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707304013; bh=dO6O1Poj+Qs53ltK00/yQdIKJFozAuFDto6bCvz+1zY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=dxqFpK5BqrvWYzobOB7ygN/4lEVaJb36Es4LYmbZBXYguGHtnIm3LY8aKROZC+czb
 Lwa9FEv1P70f1NgffJtgJAyz/pM9tq1MWiG3CC0v6yDNl6lPZd2C7IEPvIlevsFISd
 iYvHlUdzyWUZqOGzNTYFS09UM6GMf8IO8VzAca1rKaByeZ6ti1OLoTJspgG1Z2ZD8z
 ocW182Pi581Rr8eEuOHXAhmhCNV+LUOV2b8Ls2T9skpN0WIKBUCqOtDX6SlEu4l6Jz
 v92+WAkRYwh71nzkTYrXN20I4icMk4gAjhZafzOiHc8pDH+fpA6ck8DjCOOWWnmGww
 /xS51q1n+Ynjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=dxqFpK5B
Subject: Re: [Buildroot] [PATCH v2] board/cubietech/cubieboard4 : Add config
 file for cubieboard4.
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
Cc: thomas.petazzoni@free-electrons.com, Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nigel,

On 07/02/24 04:03, Nigel Wang wrote:
> From: nigel_wang <asd617140123@gmail.com>
> 
> add Cubieboard4 board support.
> 
> - SOC: Allwinner A80.
> - DRAM: 2GiB DDR3 @ 672MHZ.
> - NAND: 8GBeMMC
> - Power: DC 5V.
> - Wifi: 80211 b/g/n. (module is AP6330)
> Reference: https://hirokun.jp/AP6330.pdf
> - Ethernet: RTL8211E
> 
> The detail of board: https://linux-sunxi.org/Cubietech_Cubieboard4
> 
> Board support package includes the following components:
> - mainline Linux Kernel 6.6.8
> - mainline U-boot 2021.10.
> 
> Signed-off-by: Nigel Wang <asd617140123@gmail.com>

Here you have to keep the previous tags when sending new version of patches:

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Build Tested]
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

> ---
> v1 -> v2
> * Add BR2_cortex_a15_a7=y in buildroot defconfig.
> * Bump linux version to 6.6.8
> * Using sunxi_defconfig in kernel.
> * Using "make savedefconfig" to save defconfig.
> * Remove boot.cmd.

this patch had to be V3, but don't mind at this point.
I ask you when you send newer patches to set as superseded
the previous patch in patchwork:
https://patchwork.ozlabs.org/project/buildroot/list/

> ---
>   DEVELOPERS                                |  4 +++
>   board/cubietech/cubieboard4/extlinux.conf |  5 +++
>   board/cubietech/cubieboard4/genimage.cfg  | 38 ++++++++++++++++++++++
>   board/cubietech/cubieboard4/post-image.sh | 18 +++++++++++
>   configs/cubieboard4_defconfig             | 39 +++++++++++++++++++++++
>   5 files changed, 104 insertions(+)
>   create mode 100644 board/cubietech/cubieboard4/extlinux.conf
>   create mode 100644 board/cubietech/cubieboard4/genimage.cfg
>   create mode 100755 board/cubietech/cubieboard4/post-image.sh
>   create mode 100644 configs/cubieboard4_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a03018ab2b..bffb8f2069 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3297,3 +3297,7 @@ F:	package/quazip/
>   F:	package/shapelib/
>   F:	package/simple-mail/
>   F:	package/tinc/
> +
> +N:	Nigel Wang <asd617140123@gmail.com>
> +F:	board/cubietech/cubieboard4/
> +F:	configs/cubieboard4_defconfig
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

Here the option below is missing and it's needed otherwise the newest
Linux version will be picked and build will fail.
Now we don't see the problem because the latest version is exactly 6.6,
so need this:

# Linux headers same as kernel, a 6.6 series
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y

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
> --
> 2.34.1
> 

This patch looks to me, except missing Linux header version.

I've added that option and re-built successfully so I confirm my:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Build Tested]
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Maybe a Maintainer can edit while committing, of if you can please send
a V3 with that missing line.

Thank you!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
