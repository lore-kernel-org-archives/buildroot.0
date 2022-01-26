Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65511C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 16:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C727741645;
	Wed, 26 Jan 2022 16:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frIwr1dJ-BC4; Wed, 26 Jan 2022 16:55:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB76741616;
	Wed, 26 Jan 2022 16:55:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7E71BF3AF
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 16:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68EF1404D0
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 16:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87NOxgZ3aXLP for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 16:55:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id B606B400C8
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 16:55:14 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ClZgn2ubgNVvLClZgnEFOZ; Wed, 26 Jan 2022 17:55:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643216113; bh=E+6YyInrsOEgT/jUr1j5juA7gFC2J4H5jwZOkFK6jg0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=hjqrLsKuTK33h07BSZCQiw9CtdxY5VaorulvGzpJSyhfLoTYJfPD3vih8UFpUYRRv
 /b0HiGKdLI+dMU9+8EQsdL5wHWSBeUwsYU2WMaSsfySqE0GZFlRs/YP6cpk6RJvavu
 ybnbc/LFkXYI/RBpDF+gtdkQXmlm9yiyirtKdrntcuPbL+KEwfTj/Hqq/s0KEZU70X
 7uX1KhEwb84qbKCwjAdvp1nbn3C61Tsp/Oij4lG+WxvArsaCExWUj0r+b4Qybsl4tC
 lciEiY/NRhKGkr8goQ3lwsGbpQ85xdIwLxzQEQAq/2rmHMtY5tOMNe1UJTIoegwpXu
 UrU2sKojTdkVg==
Message-ID: <392822cd-0b96-fa58-39bb-9834fb0f6be5@benettiengineering.com>
Date: Wed, 26 Jan 2022 17:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
References: <20220126051808.26581-1-kuzminov.sergey81@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220126051808.26581-1-kuzminov.sergey81@gmail.com>
X-CMAE-Envelope: MS4wfFb5DWYYbOa9sMhT+IHVaoReOO3u505scg6l4BXmcn8jqgvzKJEq2RnQknTJhelaMM3ACja+VpomaLrZFti7SFAKwgT4aqYEpkmnMq7NLwBC0pVirdds
 gbCJl5FTuERrTGIXs0DresmV7zCS1Hcy+H9RLrmsq9eDkplA9pE5vi4D65gjh4MR9JcA09Vdm1wsWLRx5FR7CIVU/7r+8ER0TdUMFz63mrKS/lZcZQiY+SkS
 BO23CG5fb0DctqmaxVLrRA==
Subject: Re: [Buildroot] [PATCH] configs/orangepi_zero_defconfig:
 refactoring, bump Linux and U-Boot versions
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

Hi Sergey, All,

On 26/01/22 06:18, Sergey Kuzminov wrote:
> Changelog:
> - Refactoring configs/orangepi_zero_defconfig.
> - Linux: bump to version 5.15.16 (from 5.12.2).
> - U-Boot: bump to version 2022.01 (from 2021.04).
> 
> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by:  Giulio Benetti <giulio.benetti@benettiengineering.com>
[Only built successfully]

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   ...ux-extras.config => linux-extras.fragment} |  0
>   configs/orangepi_zero_defconfig               | 32 +++++++++++++------
>   2 files changed, 22 insertions(+), 10 deletions(-)
>   rename board/orangepi/orangepi-zero/{linux-extras.config => linux-extras.fragment} (100%)
> 
> diff --git a/board/orangepi/orangepi-zero/linux-extras.config b/board/orangepi/orangepi-zero/linux-extras.fragment
> similarity index 100%
> rename from board/orangepi/orangepi-zero/linux-extras.config
> rename to board/orangepi/orangepi-zero/linux-extras.fragment
> diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
> index 1c107b10e6..5aaa1566c5 100644
> --- a/configs/orangepi_zero_defconfig
> +++ b/configs/orangepi_zero_defconfig
> @@ -1,49 +1,61 @@
> +# Architecture
>   BR2_arm=y
>   BR2_cortex_a7=y
>   BR2_ARM_FPU_VFPV4=y
> -BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
> -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
> +
> +# System
>   BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
>   BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
> +BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   BR2_SYSTEM_DHCP="eth0"
> +
> +# Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.16"
>   BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.config"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# Filesystem
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Bootloader
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +
> +# Required tools to create the SD image
>   BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>   BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
>   BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +
> +# Image
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
>   
> -# wireless driver and firmware
> +# Wireless driver and firmware
>   BR2_PACKAGE_XR819_XRADIO=y
>   BR2_PACKAGE_ARMBIAN_FIRMWARE=y
>   BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819=y
>   
> -# wireless support
> +# Wireless support
>   BR2_PACKAGE_IW=y
>   BR2_PACKAGE_WIRELESS_TOOLS=y
>   BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
> @@ -51,5 +63,5 @@ BR2_PACKAGE_WPA_SUPPLICANT=y
>   BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
>   BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
>   
> -# spi flash support
> +# Spi flash support
>   BR2_PACKAGE_MTD=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
