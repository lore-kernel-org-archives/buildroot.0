Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6DBEB64DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 08:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00880606EB;
	Mon,  3 Jul 2023 08:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00880606EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gT03329LUV3Z; Mon,  3 Jul 2023 08:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FED560B2C;
	Mon,  3 Jul 2023 08:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FED560B2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF51F1BF5E0
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 08:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7ACC415EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 08:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7ACC415EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HyHbz2Nz_t0M for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 08:16:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C099E409A2
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C099E409A2
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 08:16:07 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 8DA2FBDE1F4C;
 Mon,  3 Jul 2023 10:16:04 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 03 Jul 2023 08:16:02 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
In-Reply-To: <mailman.711.1688359552.139798.buildroot@buildroot.org>
References: <mailman.711.1688359552.139798.buildroot@buildroot.org>
Message-ID: <c30c93e29177a1dc15446eff427c7ca8@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1688372164; bh=wa1lWZ68vMf1yAKFFl5hLlk/ix3byyoszpY0kPIYsbU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=cdbkGo/gWnORp26+CAFjXwUvX5T8gRLfQ0Pt/sKnd4DDLKV1toFJQgEmgK6NdSQDN
 ceK0NLfWFP8WOX2Ir32rfoTbeMvlxILJwxvVJ0Bj9LWy1PyAvjUcca/NvPu2C7zGTc
 +/vCuvNFKJrgD5Zv9vA1unvqJb4TrWDG9rGpJUso=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=cdbkGo/g
Subject: Re: [Buildroot] [PATCH v2 3/3] board/radxa/rock5b: Add sdcard image
 scripts
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

On 2023-07-03 04:45, Kilian Zinnecker wrote:
> 
> This patch adds post image scripts, generating an sdcard.img file,
> which can be flashed on an SD card to boot the Radxa Rock 5B.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>  board/radxa/rock5b/genimage.cfg   | 36 ++++++++++++++++++++++++
>  board/radxa/rock5b/post-image.sh  | 24 ++++++++++++++++
>  board/radxa/rock5b/rock5b.its     | 46 +++++++++++++++++++++++++++++++
>  board/radxa/rock5b/uboot.fragment |  3 ++
>  configs/rock5b_defconfig          |  4 +++
>  5 files changed, 113 insertions(+)
>  create mode 100644 board/radxa/rock5b/genimage.cfg
>  create mode 100755 board/radxa/rock5b/post-image.sh
>  create mode 100644 board/radxa/rock5b/rock5b.its
>  create mode 100644 board/radxa/rock5b/uboot.fragment
> 
> diff --git a/board/radxa/rock5b/genimage.cfg 
> b/board/radxa/rock5b/genimage.cfg
> new file mode 100644
> index 0000000000..88a4f1ee9e
> --- /dev/null
> +++ b/board/radxa/rock5b/genimage.cfg
> @@ -0,0 +1,36 @@
> +# SD card image for Radxa Rock 5b
> +
> +image boot.vfat {
> +	vfat {
> +		file image.itb {
> +			image = "image.itb"
> +		}
> +	}
> +	size = 16M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +		partition-table-type = "hybrid"
> +	}
> +
> +	partition uboot {
> +		in-partition-table = "false"
> +		image = "u-boot-rockchip.bin"
> +		offset = 32K
> +		size = 12M
> +	}
> +
> +	partition boot {
> +		partition-type = "0xC"
> +		bootable = "true"
> +		image = "boot.vfat"
> +		offset = 64M
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext2"
> +		offset = 96M
> +	}
> +}
> diff --git a/board/radxa/rock5b/post-image.sh 
> b/board/radxa/rock5b/post-image.sh
> new file mode 100755
> index 0000000000..891f52201d
> --- /dev/null
> +++ b/board/radxa/rock5b/post-image.sh
> @@ -0,0 +1,24 @@
> +#!/usr/bin/env bash
> +
> +GENIMAGE_CFG="$(dirname $0)/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +# genimage needs u-boot-rockchip.bin
> +
> +cp output/build/uboot-2023.07-rc4/u-boot-rockchip.bin ${BINARIES_DIR}/

       ^^^^^^^^^^^^
This should be $BUILD_DIR, otherwise the build fails in a BR2_EXTERNAL 
environment.

> +
> +gzip -fk ${BINARIES_DIR}/Image
> +cp board/radxa/rock5b/rock5b.its ${BINARIES_DIR}
> +(cd $BINARIES_DIR && mkimage -f rock5b.its image.itb)
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage \
> +  --rootpath "${TARGET_DIR}" \
> +  --tmppath "${GENIMAGE_TMP}" \
> +  --inputpath "${BINARIES_DIR}" \
> +  --outputpath "${BINARIES_DIR}" \
> +  --config "${GENIMAGE_CFG}"
> +
> +RET=${?}
> +exit ${RET}
> diff --git a/board/radxa/rock5b/rock5b.its 
> b/board/radxa/rock5b/rock5b.its
> new file mode 100644
> index 0000000000..d73659a56e
> --- /dev/null
> +++ b/board/radxa/rock5b/rock5b.its
> @@ -0,0 +1,46 @@
> +/dts-v1/;
> +
> +/ {
> +	description = "Rock 5B FIT Image";
> +	#address-cells = <1>;
> +
> +	images {
> +		kernel {
> +			description = "Kernel";
> +			data = /incbin/("Image.gz");
> +			type = "kernel";
> +			arch = "arm64";
> +			os = "linux";
> +			compression = "gzip";
> +			load = <0x0a200000>;
> +			entry = <0x0a200000>;
> +			hash {
> +				algo = "sha256";
> +			};
> +		};
> +		fdt {
> +			description = "Device Tree";
> +			data = /incbin/("rk3588-rock-5b.dtb");
> +			type = "flat_dt";
> +			arch = "arm64";
> +			compression = "none";
> +			load = <0x0e000000>;
> +			entry = <0x0e000000>;
> +			hash {
> +				algo = "sha256";
> +			};
> +		};
> +	};
> +
> +	configurations {
> +		default = "standard";
> +		standard {
> +			description = "Standard Boot";
> +			kernel = "kernel";
> +			fdt = "fdt";
> +			hash {
> +				algo = "sha256";
> +			};
> +		};
> +	};
> +};
> diff --git a/board/radxa/rock5b/uboot.fragment 
> b/board/radxa/rock5b/uboot.fragment
> new file mode 100644
> index 0000000000..0613e0b772
> --- /dev/null
> +++ b/board/radxa/rock5b/uboot.fragment
> @@ -0,0 +1,3 @@
> +CONFIG_USE_BOOTARGS=y
> +CONFIG_BOOTARGS="root=/dev/mmcblk0p2 rw rootfstype=ext4 
> clkin_hz=(25000000) earlycon clk_ignore_unused earlyprintk 
> console=ttyS2,1500000n8 rootwait"
> +CONFIG_BOOTCOMMAND="fatload mmc 1:1 ${loadaddr} image.itb && bootm 
> ${loadaddr}"
> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> index f300e5d080..fb8ecf07e2 100644
> --- a/configs/rock5b_defconfig
> +++ b/configs/rock5b_defconfig
> @@ -1,6 +1,8 @@
>  BR2_aarch64=y
>  BR2_cortex_a76_a55=y
>  BR2_KERNEL_HEADERS_5_10=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/radxa/rock5b/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS=""
>  BR2_TARGET_GENERIC_HOSTNAME="rock5b"
>  BR2_TARGET_GENERIC_ISSUE="Rock 5b"
>  BR2_SYSTEM_DHCP="eth0"
> @@ -32,7 +34,9 @@ BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
>  BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="BL31=bl31.bin ROCKCHIP_TPL=ddr.bin"
>  
> BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/uboot.fragment"
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_DTC=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> --
> 2.34.1

You should also add yourself to DEVELOPERS for rock5b_defconfig and 
rockchip-rkbin.

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
