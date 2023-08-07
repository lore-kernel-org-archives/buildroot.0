Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8812BC001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B1C409A5;
	Mon,  7 Aug 2023 21:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B1C409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-M4wimBgrv3; Mon,  7 Aug 2023 21:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208F140993;
	Mon,  7 Aug 2023 21:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 208F140993
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 099EF1BF5F8
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABA6D410A2
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABA6D410A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdlVyFU0x-G4 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:35:19 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A24B410D1
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A24B410D1
Received: by mail.gandi.net (Postfix) with ESMTPSA id D74381BF203;
 Mon,  7 Aug 2023 21:35:15 +0000 (UTC)
Date: Mon, 7 Aug 2023 23:35:14 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230807233514.23a6f538@windsurf>
In-Reply-To: <20230806215127.283714-2-giulio.benetti@benettiengineering.com>
References: <20230806215127.283714-1-giulio.benetti@benettiengineering.com>
 <20230806215127.283714-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691444116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKWesVW++o+Pat2uGYa52sB9oue6mGf0HD+YCWxpN5k=;
 b=m9j6XBBk4j7jl5uX3ryVv2e3Mx/3Tm/OjiwYjhZOFjHuX/BZUBDF1gWA48jBZIG0I17x8f
 IlD10O6Q/KYk3uxzq3pNLqEyKA3byVur4fJL9JDYIJdcJYnknn7wtaPEnhHL/mK7t7dL+h
 QakdVmxtp7OS+uBX84pY4HFI5G3CaxTErN4omYjMt65r3qbw0qQBXg12rDTmCtgU/2syJC
 l6bT1Z9AOQ1OHwn4unj4X50c6a7I1+0c5oKbdBxwfnELO+lw/+ZOQziNzLNxqykBm84vyh
 uvdp8Dlrj+ZeDBXsSHjCDLfeQZLugRR2NAdeVlPY1B+HEKesM4ggdZFuWQbZhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m9j6XBBk
Subject: Re: [Buildroot] [PATCH 2/2] package/libheif: let's use
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Aug 2023 23:51:27 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Let's use binutils bug define instead of architecture checking in packages.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/kodi-imagedecoder-heif/Config.in | 4 ++--
>  package/libheif/Config.in                | 4 +---
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/kodi-imagedecoder-heif/Config.in b/package/kodi-imagedecoder-heif/Config.in
> index 7cf2d1ef6e..d0950385a0 100644
> --- a/package/kodi-imagedecoder-heif/Config.in
> +++ b/package/kodi-imagedecoder-heif/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
>  	bool "kodi-imagedecoder-heif"
>  	depends on BR2_INSTALL_LIBSTDCPP # libde265, libheif, tinyxml2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libde265
> -	depends on !BR2_m68k_cf # libheif
> +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libheif
>  	select BR2_PACKAGE_LIBDE265
>  	select BR2_PACKAGE_LIBHEIF
> @@ -13,6 +13,6 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
>  	  https://github.com/xbmc/imagedecoder.heif
>  
>  comment "kodi-imagedecoder-heif needs a toolchain w/ C++, threads, gcc >= 4.8"
> -	depends on !BR2_m68k_cf # libheif
> +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> diff --git a/package/libheif/Config.in b/package/libheif/Config.in
> index d0ea72430e..1310205c41 100644
> --- a/package/libheif/Config.in
> +++ b/package/libheif/Config.in
> @@ -1,8 +1,6 @@
>  config BR2_PACKAGE_LIBHEIF
>  	bool "libheif"
> -	# avoid build error
> -	# Internal error in emit_expr_encoded at dw2gencfi.c:215
> -	depends on !BR2_m68k_cf
> +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>  	help

You forgot to update the Config.in comment dependency in
libheif/Config.in. Fixed that and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
