Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76E3C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82BF24161A;
	Fri,  2 May 2025 11:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmPJ7GTmZjyc; Fri,  2 May 2025 11:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD444159D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD444159D;
	Fri,  2 May 2025 11:08:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58910229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E5CC81826
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3H9STz18Bpys for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:08:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EC7881778
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EC7881778
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EC7881778
 for <buildroot@busybox.net>; Fri,  2 May 2025 11:08:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4DC0A1C0D8C; Fri,  2 May 2025 13:08:52 +0200 (CEST)
Message-ID: <c0268a12-da82-4a87-9826-288035235ba5@rnout.be>
Date: Fri, 2 May 2025 13:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20250423082506.1879122-1-francois.perrad@gadz.org>
 <20250423082506.1879122-2-francois.perrad@gadz.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250423082506.1879122-2-francois.perrad@gadz.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746184132; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SmkblDK80ZX38VQ2VdFl0QuMiJeJ4wu27kZLn2QcAOU=;
 b=n3L4l9VHA6AOrT6DzU05YIX2fONY57oXGfMDw10qsdW1ptU5MNBBSeUggPnEht2ZX8zv1f
 clj+0jV9EYVo8Ip+rXi96hVT9l8kIoxxA/Af1VdUAxwCNIjubqNaqba6gwyFYWo65wmjUC
 ruvMOTVwm/+AaKpgncy+0YtqR7GvgeeezXwon6AOxWqEi+gVmVcSk0rDN+tyAfJGmzThMK
 G+fInU85LRAHzeGP3pBAd1v5C25AlOUdKabmfMpJ6pZwkNZm++21jylnbKi6daXtB/1EtP
 hNxYvVBfTzPT3qnk2J7gvQGnQ5AMiTOHNVKczXBIZU5E1c0P8NSxbPYGPiVbyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=n3L4l9VH
Subject: Re: [Buildroot] [PATCH 2/2] configs/olimex_a20_olinuxino_lime*:
 bump Linux and U-Boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/04/2025 10:25, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to 2025.02.x (Linux bump only), thanks.

  Regards,
  Arnout

> ---
>   board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
>   board/olimex/a20_olinuxino/patches/uboot/uboot.hash | 2 +-
>   configs/olimex_a20_olinuxino_lime2_defconfig        | 4 ++--
>   configs/olimex_a20_olinuxino_lime_defconfig         | 4 ++--
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
> index 0bc60586f..023d24499 100644
> --- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
> +++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally computed
> -sha256  9c6305567b75d99514cde6eb9de39973f3d5c857a75bd9dcdfca57041f8d4f34  linux-6.6.69.tar.xz
> +sha256  49e3ad7423e40735faada0cd39665c071d47efd84ec3548acf119c9704f13e68  linux-6.6.86.tar.xz
> diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
> index 2f55c44ba..ef267a2cb 100644
> --- a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
> +++ b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally computed
> -sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
> +sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
> diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
> index 0d54e6ca9..9d22683ab 100644
> --- a/configs/olimex_a20_olinuxino_lime2_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime2_defconfig
> @@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.69"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.86"
>   BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
> index 05d311ad4..b3a5fdf4e 100644
> --- a/configs/olimex_a20_olinuxino_lime_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime_defconfig
> @@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.69"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.86"
>   BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
