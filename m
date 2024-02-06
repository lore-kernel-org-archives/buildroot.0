Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1AFC4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2BFB41E73;
	Tue,  6 Feb 2024 10:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2BFB41E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-VS7EoD1DfR; Tue,  6 Feb 2024 10:26:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA60C41E68;
	Tue,  6 Feb 2024 10:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA60C41E68
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD15B1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2B1441E68
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2B1441E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXtMCaSEdt0w for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:26:43 +0000 (UTC)
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E261941E67
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E261941E67
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XIf2rRx0zZ3lVXIf2rIRoG; Tue, 06 Feb 2024 11:26:40 +0100
Message-ID: <07295f28-5618-4e8d-b330-d035f4c053c1@benettiengineering.com>
Date: Tue, 6 Feb 2024 11:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Nigel Wang <asd617140123@gmail.com>, buildroot@buildroot.org
References: <20240206033436.38436-1-asd617140123@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240206033436.38436-1-asd617140123@gmail.com>
X-CMAE-Envelope: MS4xfL3W29y+cGIDae5o4ZR6oW0cnWPhbl8MP5ulTyzAUx/+73B28n63kztFWmWv3pf0sMI4YEG3un1td7djXJBg5bzR3ukKyRJ6o+bE6sZDzg5U0LmUj4KP
 9IkYYCz+chyblV8urUB94yULhlXCiouOOpzCF4YkhIvwTg3LD1bu7iHqglYGe3Dqjf6P/OXsRcpYCvstWzUJCWRiwVrETyGvHS9Dveddz754qiFNamP8NHon
 2jySsB3ydqyoOoW9LiJkQp9WvGCEcAUk5yJbwkQuc0KRj6yE5wUzaXs8h+WDC01HHrNss1DDpKydYDe3cdZXVw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707215200; bh=YmfFpmC2ADExfdaLN8WP1mIVEaAFKbn0YXa8d+C73R0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=m7QCZcSfFekWb5wF523o6Ds2lX9Jqfe1Tfu7KJuoTi8iD3XcL2HjQZO1uqK8bezs2
 R/zW4gVcUkaQJldGzlKoIf4bkPwcI5Iy25DgMk9hItXLfPySuJBFaZ8jkRFnx8MKRc
 j1/CexjmZVn+KboOpppiZDhpZxbu+BRlmYHEsiC/GRiagsjm8/AD1AWxKnURAjp+y1
 0AApwycyxT9v+NOMkcAU0vRxzFCdwi3l2lOeJHWfGe63eSPoDTQeCR6lArLmy4w1CR
 4thEuxu8qkuYQtsjuCRuGrTUUyb8hRpndkFDOEy/0OYE6sJbJKkQuyof4erbRtoI8v
 eFyVElM/ylv0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=m7QCZcSf
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
Cc: thomas.petazzoni@free-electrons.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nigel,

please don't resend too many times the same patch slightly changed.
If you need to please add RESEND tag in Subject prefix.

On 06/02/24 04:34, Nigel Wang wrote:
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
> 
> ---

under these ^^^ 3 dashes you should report the changes between patch 
versions like:

V1->V2:
* changed this
* changed that

In this case:
* dropped boot.cmd as suggested by Giulio

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
> --
> 2.34.1
> 

I've built successfully the defconfig using buildroot/utils/docker-run so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Build Tested]
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
