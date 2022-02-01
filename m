Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BC4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32EFE60F36;
	Tue,  1 Feb 2022 18:06:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3knDCoadPKB; Tue,  1 Feb 2022 18:06:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 731C060EE9;
	Tue,  1 Feb 2022 18:06:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1411BF5D7
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AF61415A3
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4o3U1b_7fM_x for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:06:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp4.osuosl.org (Postfix) with ESMTP id 451774159D
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:06:04 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ExXWng7H1QUuPExXWnjUyy; Tue, 01 Feb 2022 19:06:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643738763; bh=UoqZp1cG9w9YCUcsrq9Q5bSuS3cmf0GqhTreKhP1x8c=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Xk3i2tNhi6RhY0NaQUcekhWec+k0lTfBl8jRFUtV4FKDcruS9SHz6Q8BfCByfqfUL
 nDB+0O5yOKjqa5RAeJzS3suNBVvRbJAvpBnTATL6AyqDzemt68ZTu6fyXuhQBmo2g3
 q+iDHPl6NtpBe2kbHWfZQuK2HijgmvOyWAqR/XPMBGKYnQpnWbrFPIyj2jI3ICDjFQ
 lTVErh40uDYVywsUEASqKKUo+9nnE0nZr7C0PA5BXlYHz6Re9fNjMnLkv9nikQKFbF
 PPXhQnhmAMMcuKMgLyS0m3b6OYItC4N80r9Tqz+l98luoDbHNuQLjfR5tPdUg5sWOf
 QHZuajb80fCGw==
Message-ID: <df918065-86d0-baf1-959b-1ff91163de1c@benettiengineering.com>
Date: Tue, 1 Feb 2022 19:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220131212456.3176156-1-geomatsi@gmail.com>
 <20220131212456.3176156-2-geomatsi@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220131212456.3176156-2-geomatsi@gmail.com>
X-CMAE-Envelope: MS4wfA4Gzkb+H2Eful+9gQxch3M5jGwT2MMwHj5KlP5qedj8g5N974fRlGWB8BOLEfOQfwcnJLR69DVdcToMlEUcXVXwQaxg+iRpOdUvf1q4wf1y0kFVdPqu
 XzmgR2Ds6lcXvqMrpZGCEUmyIVYUXE+N7M0kT6eHd96pk3nc29B7lB5kostF1oGD8CPwlYnMKnDbk0kIP/xAEN6kGG8Zd1P+r6a/djeZ9QnyfjPxqH6Ci3x5
 grJ8tpZ4Sv6Xj3QHmd9A54M72WvVUM+NmvIaZeRl1Ng=
Subject: Re: [Buildroot] [PATCH 2/2] configs/orangepi_zero_plus2: BSP update
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

On 31/01/22 22:24, Sergey Matyukevich wrote:
> Bump Linux kernel to 5.16.1 and U-Boot to 2022.01. Select option
> BR2_TARGET_UBOOT_NEEDS_OPENSSL since U-Boot requires openssl.
> Root filesystem does not fit into default 60M anymore,
> so increase its size.

Same as previous patch we need a:
Fixes:
url where you point the failure

There is the latest gitlab pipeline here, especially this board build 
failure:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478371
But this was for previous patch, sorry, so please point this ^^^ URL there.
And here probably you've found the bug by yourself, correct?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>   configs/orangepi_zero_plus2_defconfig | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
> index da2d3b4178..9d88b37ac9 100644
> --- a/configs/orangepi_zero_plus2_defconfig
> +++ b/configs/orangepi_zero_plus2_defconfig
> @@ -2,7 +2,7 @@ BR2_aarch64=y
>   BR2_cortex_a53=y
>   BR2_ARM_FPU_VFPV4=y
>   
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>   BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
>   
> @@ -17,9 +17,10 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> @@ -33,7 +34,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-pl
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.10"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
> @@ -56,6 +57,7 @@ BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
>   BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus2"
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
