Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFF2C77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 20:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA1C740910;
	Sun, 21 May 2023 20:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA1C740910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1feVv7-7A1fa; Sun, 21 May 2023 20:14:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ECA1408A7;
	Sun, 21 May 2023 20:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ECA1408A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5798D1BF3CB
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3139B404D8
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3139B404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANfd-ypeh6Ta for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 20:14:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3186240148
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3186240148
 for <buildroot@buildroot.org>; Sun, 21 May 2023 20:14:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a137:d754:ea62:50f7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 81BF05FF3F;
 Sun, 21 May 2023 22:14:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 22:14:41 +0200
Date: Sun, 21 May 2023 22:14:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230521201441.GE621937@scaer>
References: <20230413170435.18131-1-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230413170435.18131-1-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684700083;
 bh=VX0K0Bc3ZoRB1TydGM2CEiMoWlswIW2g5xMqn3vOXmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcUfBdQSolmLYXzmsMGD58E2wxmLIs7/ymYjOlHeWoDR063c6Sx6ToBOHZMYeHq0W
 +7KnTJaeEtU3M5AleAWp6wT0WwNRxhILXHzotndtwk/2O78Mk/IrkrdTN9itt2vFrr
 cRtb6eJDm5eGWSaBRucjHE2BSoiNhhUhbiuI44QdVq4AZK7oIfoNW+kYOxCqMvQSdH
 KacDSvdZdaMvwj0m16DevGz/uE0Ychs+Qr/fJF5ylLGmhfLtfj9vdAzdWad8fcW/rH
 5P1Y1TuvLpDkURFtXzJ42m+vhVmXH4JOibUjZ5RGWC1rMIl39vVoZJngS9ny92EYoS
 9fqPgwMATMGKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PcUfBdQS
Subject: Re: [Buildroot] [PATCH 1/2] configs/pc_x86_64_{bios,
 efi}_defconfig: Switch to kernel 6.1.24 LTS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

+Jan-Benedict for BZ #15586

On 2023-04-13 10:04 -0700, Adam Duskett spake thusly:
> Let's use a more modern kernel with a broader range of hardware support
> for PCs.

This also probably needs BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF.

See:
    https://bugs.busybox.net/show_bug.cgi?id=15586

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  configs/pc_x86_64_bios_defconfig | 6 +++---
>  configs/pc_x86_64_efi_defconfig  | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
> index ec34a41667..a057ddd259 100644
> --- a/configs/pc_x86_64_bios_defconfig
> +++ b/configs/pc_x86_64_bios_defconfig
> @@ -21,13 +21,13 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
>  
> -# Linux headers same as kernel, a 4.19 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> +# Linux headers same as kernel, a 6.1 LTS series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.24"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
> index da05471e28..efa603f0c0 100644
> --- a/configs/pc_x86_64_efi_defconfig
> +++ b/configs/pc_x86_64_efi_defconfig
> @@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
>  
> -# Linux headers same as kernel, a 4.19 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> +# Linux headers same as kernel, a 6.1 LTS series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.24"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> -- 
> 2.40.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
