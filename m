Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A12BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 10:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5988404A;
	Sat, 26 Feb 2022 10:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-vd0NW_HLNq; Sat, 26 Feb 2022 10:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F160784008;
	Sat, 26 Feb 2022 10:52:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B5D61BF484
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9FB460A81
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6lLQkyuE-j_p for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 10:52:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35E38600C6
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:52:28 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.7.124])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NugcnT7vqroAhNugdnImNl; Sat, 26 Feb 2022 11:52:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645872747; bh=y+8VVLdaZKctu+wDwIOny+MbshAk0+2rgVU9PlHVuKc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=clgIWoTvzMo3IxHzfE6uxfkOkKx5/P4xJfYyszcoWVBRiCz/c85Q1h9NQydg4NW67
 GluOzr2ict5NKdAd9ikA+htXbaNKj6/SDTmwIVSHU2uOWK4lRapAUz47xXIgnlcDej
 OSIbGGI7D1m7I8lnEc19j7z2tQzECAbX3AdCMrI7idL4AJ0liMWHS0lyY9YBJf/yT3
 iFzOZ/LGxETmElLLoTMbE5cPaCyUK37YPjQ2swTxcEuP0P9LB2dOlg3hrk1LolNjSg
 nvyY9SXAZ8VJG6CAe6dmyaebE5Uumm4xd/nADukAIDeuhyjFFqscpBBi9wuN7ery6i
 Sk26hOppkUnag==
Message-ID: <b0e7b78e-4c69-8a90-8157-d9a7e3da6882@benettiengineering.com>
Date: Sat, 26 Feb 2022 11:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220225072622.3584480-1-geomatsi@gmail.com>
 <20220225072622.3584480-2-geomatsi@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220225072622.3584480-2-geomatsi@gmail.com>
X-CMAE-Envelope: MS4wfAXeCQCYy+u5VNgvtB6pUun/mcNnA+V6duXdtIW+9N9Z45HBGmMelBQDYoKjHBOOfZ5/RvUmhNB817rm57ZOXY2YlSFrt2qKBjnxvtKDerCZyeWNnw2M
 12oBcN1EG0jc5aRnvXS3pAQ4qzdWg5trXST/RC1kc94UxfYP39hbNsyFGx9j/S4PX73O3Nkich9dcQ26v8MuHyLyr5ydlWI51KptsBgl05AOjeWbIh59F34R
 SlyWIrTjC7mwC7XF8PWDuTCLgnC5/qrzleo2XLGdKjc=
Subject: Re: [Buildroot] [PATCH v2 1/6] board/orangepi/orangepi-zero-plus2:
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

On 25/02/22 08:26, Sergey Matyukevich wrote:
> Switch to extlinux instead of U-Boot boot script. Drop custom boot
> script and genimage config. Instead use common orangepi files from
> board/orangepi/common. To help extlinux to find DTB without U-Boot
> environment changes, do not strip arm64 board specific directory
> from DTB name when installing it in /boot directory. For this
> purpose use BR2_KERNEL_DTB_KEEP_DIRNAME config option. Finally,
> tidy up configuration file adding section names.
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
>   
>   # wireless firmware
>   BR2_PACKAGE_LINUX_FIRMWARE=y
> @@ -58,8 +57,11 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus2"
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +
> +# host tools
>   BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> +
> +# image scripts
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero-plus2/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
