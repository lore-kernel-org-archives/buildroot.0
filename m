Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3237C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:09:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16BF06103A
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16BF06103A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE17E40432;
	Fri, 12 Nov 2021 18:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnula23svsZr; Fri, 12 Nov 2021 18:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EECFA403EB;
	Fri, 12 Nov 2021 18:09:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 232BC1BF289
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11240404B4
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FfFgOBJs4YL for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 18:09:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7239400EB
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 18:09:23 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lazJm7ja4xZ2XlazJmVt2J; Fri, 12 Nov 2021 19:09:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636740561; bh=SJd9+VovcJVbjFzdvDmqoHn1FBm2cQRHeFPqS3OQ7L4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=dK/yTXilPIKVoPR5fxOP76F+uldwYWJzImDwSUTPy5fUCHySpaOEsqIXMJGXTGKPa
 VYwSMrBIZdJLhtUZGKlaQiA3FIBvdheyiG2ZsFuO7ZRyiGFi4aQfN1t63C3ZZlbAYz
 saYfGaw+Dcije4Gjo8GGsw6ELRAiapaVAeOU6OuT7pe2yun+7Cs0nOQ8Z44AL2s+pd
 ui0gny7GqySopbW33evk95s4kZxPFkLNWlV+AVQsQTJigj11zMbaA8gGiwP0MqEU4g
 MpmuYiQX8VAmc8nQK2cxDI5f3YO7IqSNJh1j7o+jO1E9fZ8NufJswksQi50XwxpTkA
 uXyqaN6vYSGqw==
To: buildroot@buildroot.org
References: <20211111121458.2336802-1-giulio.benetti@benettiengineering.com>
 <20211111121458.2336802-2-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <52bdec1a-a862-88b7-5427-2bb41e84147a@benettiengineering.com>
Date: Fri, 12 Nov 2021 19:09:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211111121458.2336802-2-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfM77YKAld6SvIqApxYLegofkHkjxAI0xJE2V95ktS6g4FuBUgsCevHdb0maj34yZ0jZnVEG+bhdMbD3F6hL9LcqTvtrAmUM+X++ci2q9WHWRZrYRQ5wM
 +uSmMdbkQ3UhZvyB6V0O1nBFvOaEHpdP0SpsPgzOF4iUK03q3w3OLxlnVmHGuKud9RxLGSYQTiYBn+pcnsHvU3mvpj7OinU0XLITV5WMiHZSinmRaDaqf56l
 XwTgmdQ/KfM4RnzbjGP8Mg==
Subject: Re: [Buildroot] [PATCH 1/1] configs/olimex_a64_olinuxino: bump to
 Linux kernel 5.15.1, u-boot 2021.10 and ATF v2.5
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

Please reject this patch since I've sent one to fix gitlab pipeline with 
actual u-boot and linux[1]. Unfortunately my a64 olinuxino is broken and 
I'm waiting for it to be available again. So please accept[1] and I 
marked this as rejected because it needs rebasing and testing.
I will re-send it again once this patch will be accepted.

[1]: 
https://patchwork.ozlabs.org/project/buildroot/patch/20211112180556.2124148-1-giulio.benetti@benettiengineering.com/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 11/11/21 1:14 PM, Giulio Benetti wrote:
> Bump to Linux kernel 5.15.1, u-boot 2021.10 and ATF v2.5
> Note:
> 1) now u-boot needs SCP environment variable specified that can point to
> the or1k coprocessor firmware while if coprocessor is not used it must
> be passed /dev/null as we do in this case.
> 2) we now use the u-boot-sunxi-with-spl.bin instead of u-boot.itb since
> it's produced by u-boot anymore.
> 3) u-boot 2021.10 requires python 3 and opensll so let's enable them.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966188
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   board/olimex/a64-olinuxino/genimage.cfg | 10 ++--------
>   configs/olimex_a64_olinuxino_defconfig  | 22 +++++++++++-----------
>   2 files changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/board/olimex/a64-olinuxino/genimage.cfg b/board/olimex/a64-olinuxino/genimage.cfg
> index 44fcb3cb59..9606d26c02 100644
> --- a/board/olimex/a64-olinuxino/genimage.cfg
> +++ b/board/olimex/a64-olinuxino/genimage.cfg
> @@ -16,15 +16,9 @@ image sdcard.img {
>   
>   	partition spl {
>   		in-partition-table = "no"
> -		image = "sunxi-spl.bin"
> +		image = "u-boot-sunxi-with-spl.bin"
>   		offset = 8K
> -	}
> -
> -	partition u-boot {
> -		in-partition-table = "no"
> -		image = "u-boot.itb"
> -		offset = 40K
> -		size = 1M # 1MB - 40K
> +		size = 1032K # 1MB - 8KB + 16KB(GPT)
>   	}
>   
>   	partition boot {
> diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
> index e35c6014bd..df2fddfbb2 100644
> --- a/configs/olimex_a64_olinuxino_defconfig
> +++ b/configs/olimex_a64_olinuxino_defconfig
> @@ -2,30 +2,30 @@ BR2_aarch64=y
>   BR2_cortex_a53=y
>   BR2_ARM_FPU_VFPV4=y
>   
> -# Linux headers same as kernel, a 5.0 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
> +# Linux headers same as kernel, a 5.15 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   
>   # Firmware
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>   
>   # Bootloader
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="a64-olinuxino"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
>   BR2_TARGET_UBOOT_SPL=y
> -BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
>   BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>   BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
>   BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot.cmd"
> @@ -33,7 +33,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-olinuxino"
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
