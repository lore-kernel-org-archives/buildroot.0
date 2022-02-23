Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DE3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 19:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2328782C5E;
	Wed, 23 Feb 2022 19:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h60OoUHqypFP; Wed, 23 Feb 2022 19:48:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4190F82B2F;
	Wed, 23 Feb 2022 19:48:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1638D1BF5EA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1292582B2F
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jd0NMcjaFxa4 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 19:48:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id 128B2826B0
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 19:48:12 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MxcQnwTZJo6PDMxcQn6xZq; Wed, 23 Feb 2022 20:48:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645645690; bh=mppKcLYek/TG+9Z79NLZyICjuRyYJHoO41P/mYU5oV0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ObZZYtPezHELoHztfyb4sT1cOmOR+0/GenjToPMedqWEmW+fQvefSEYZyz4kQu3u/
 iGAsHFlQY6Mdv6MVseTXK/4lKe6WccTnX3gQ7DJGJm46AmIrqV6EhfzoUNH1mX82FK
 HQQL8mLZBNKSDKnbDliBVzRevreUYxm/pp0iPjGEXL6ykE1ba3HiGmDggf8lfCkRMN
 tl1NQwnpG2VXsHXRNe2DWIUQUcgVXgATgBuamwN67kPdP+gD9NtBqijUvXHVUqdk4m
 L03Xn6aOZbtxTG+5DiB5RDdpUL9bW/ONBLQZ7/0BhFjrvbpw63/h71GMG/yGh26Ibr
 wwtaMP/yqewgQ==
Message-ID: <02e3f0e4-8ca3-a8f4-f281-0c419e4db62b@benettiengineering.com>
Date: Wed, 23 Feb 2022 20:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220223191436.3045255-1-geomatsi@gmail.com>
 <20220223191436.3045255-2-geomatsi@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220223191436.3045255-2-geomatsi@gmail.com>
X-CMAE-Envelope: MS4wfJ+SezCRR4t8CTFWY/fZY6FPtJytBSpe5jhhySrHFAxYVJ8IE9Awqjtfns21LLTwDB9HaHCk7kYmTs79sJauf+SFCfnIDR63kKEs125Cp6eTaZXmfcu7
 fJba+3isgbEkuGP73ibRyzFw/Ous4CJYy5HggBbPnWYetqquJmXhMEtutGjelWTPlW2P9JmmkNKB/v9XXJmBhGNlQuj/moKNDj3Iyv8fnij4NQm67viygcSA
 N4C1+wnkT6bIIzBq+24jau9HKCrmDcrqsPPihe8wRiE=
Subject: Re: [Buildroot] [PATCH 1/4] board/orangepi/orangepi-zero-plus2:
 switch to extlinux
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

On 23/02/22 20:14, Sergey Matyukevich wrote:
> Switch to extlinux instead of U-Boot boot script. Drop custom
> boot script and genimage config. Instead use common orangepi
> files from board/orangepi/common.

Commit log in this patch must be improved since you do more things than 
in patches 2-3/4, check below

> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>   board/orangepi/orangepi-zero-plus2/boot.cmd   |  6 ---
>   .../orangepi/orangepi-zero-plus2/genimage.cfg | 41 -------------------
>   configs/orangepi_zero_plus2_defconfig         | 14 ++++---
>   3 files changed, 8 insertions(+), 53 deletions(-)
>   delete mode 100644 board/orangepi/orangepi-zero-plus2/boot.cmd
>   delete mode 100644 board/orangepi/orangepi-zero-plus2/genimage.cfg
> 
> diff --git a/board/orangepi/orangepi-zero-plus2/boot.cmd b/board/orangepi/orangepi-zero-plus2/boot.cmd
> deleted file mode 100644
> index aa5162004b..0000000000
> --- a/board/orangepi/orangepi-zero-plus2/boot.cmd
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -setenv bootargs console=ttyS0,115200 earlyprintk root=PARTLABEL=rootfs rootwait
> -
> -fatload mmc 0 $kernel_addr_r Image
> -fatload mmc 0 $fdt_addr_r sun50i-h5-orangepi-zero-plus2.dtb
> -
> -booti $kernel_addr_r - $fdt_addr_r
> diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
> deleted file mode 100644
> index 5a7ee7707a..0000000000
> --- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"Image",
> -			"sun50i-h5-orangepi-zero-plus2.dtb",
> -			"boot.scr"
> -		}
> -	}
> -
> -	size = 64M
> -}
> -
> -image sdcard.img {
> -	hdimage {
> -		# for root=PARTLABEL support
> -		partition-table-type = "gpt"
> -		# default GPT location conflicts with bootloaders, move it after
> -		gpt-location = 1M
> -	}
> -
> -	partition spl {
> -		in-partition-table = "no"
> -		image = "u-boot-sunxi-with-spl.bin"
> -		offset = 8K
> -		size = 1016K # 1MB - 8KB
> -	}
> -
> -	partition boot {
> -		partition-type-uuid = "F"
> -		bootable = "true"
> -		image = "boot.vfat"
> -	}
> -
> -	# 'rootfs' will be used as the partition label, used
> -	# with root=PARTLABEL=rootfs kernel command line
> -	partition rootfs {
> -		partition-type-uuid = "L"
> -		image = "rootfs.ext4"
> -		size = 256M
> -	}
> -}
> diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
> index 9d88b37ac9..ef171c3ad3 100644
> --- a/configs/orangepi_zero_plus2_defconfig
> +++ b/configs/orangepi_zero_plus2_defconfig
> @@ -27,9 +27,6 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>   BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus2/boot.cmd"
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
> @@ -40,6 +37,8 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero-plus2/linux-extras.config"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y

Is this ^^^ needed only for this board? Because on the others there is not

>   # wireless firmware
>   BR2_PACKAGE_LINUX_FIRMWARE=y
> @@ -58,8 +57,11 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus2"
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +
> +# host tools

Here you beautify

>   BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> +
> +# image scripts

Ditto, so worth mention it in commit log

> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero-plus2/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
