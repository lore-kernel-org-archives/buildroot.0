Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C859C77B78
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 18:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B41A84407;
	Fri, 14 Apr 2023 18:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B41A84407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-X-e_HzHOq6; Fri, 14 Apr 2023 18:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27EC8441B;
	Fri, 14 Apr 2023 18:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C27EC8441B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E33B21C3E9E
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 18:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA3C58441B
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 18:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA3C58441B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CD5TTBYcl5Na for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 18:29:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206618430D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 206618430D
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 18:29:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3710A5FF96;
 Fri, 14 Apr 2023 20:29:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Apr 2023 20:29:33 +0200
Date: Fri, 14 Apr 2023 20:29:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230414182933.GW2819@scaer>
References: <20230413170435.18131-1-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230413170435.18131-1-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681496976;
 bh=3HA0TaF/hrH2cqmKW3DJxlJNumsCd+j+dn1fH5u+U9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YBDCfRp5+CyYZ972tZKlh6XFOH0lq2WmpgmIEW0zH6DVI8NiYiXzAq6u4T9jeW0lr
 NJmpMR6CQHfLRRJuZ/wAMIB2dvpOnJHbxjRDGczkGNgergGMwgBoU735ZnX+qsigkr
 vqOtna4kT2m7QmOLSOF08/kqga66pwnfbHuiPB8KHAj9CXAEXQj+mnnOUsPIbwEkYV
 mYzcEOBCwBg8I+fePQVnt36h/QKUPcz6QDj+MjT3VLPO+SRichSKEwYdjvyb5ZQR/l
 w1XRNTFwK5Hc7A0sNLdGj+3i1wcj26/gEaV6lCduUX/X3dQ7Z7/GcmBa0buByUMno7
 pYSrypeTmpgLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YBDCfRp5
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

On 2023-04-13 10:04 -0700, Adam Duskett spake thusly:
> Let's use a more modern kernel with a broader range of hardware support
> for PCs.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

I've added a little blurb about why we use 6.1 and not 6.2, and applied
to master, thanks.

Regards,
Yann E. MORIN.

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
