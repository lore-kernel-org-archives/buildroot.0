Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D90C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5D3483F11;
	Sun, 17 Jul 2022 13:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5D3483F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZ3m0R_9TD7U; Sun, 17 Jul 2022 13:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2CF783F0F;
	Sun, 17 Jul 2022 13:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2CF783F0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7861BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25749416EC
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25749416EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqcpRAvwyVkP for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:00:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6207409AC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6207409AC
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:00:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id EF09478050B;
 Sun, 17 Jul 2022 15:00:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:00:05 +0200
Date: Sun, 17 Jul 2022 15:00:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20220717130005.GF2107091@scaer>
References: <20220707093734.34465-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220707093734.34465-1-foss+buildroot@0leil.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658062810;
 bh=H7nrTaNAr89C6EakbU6PcZUnVLynpZ0an+6YRmPUMdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jLjS8m3UAhR/6gmpr09YTzX4q0PR7ZpW5WyOK+BXulQzzCn9IeyOEqgnUCC7k2HzZ
 OkBG+kesBqrB/fGVeu4igK2m/cGWu+inQ5P74tsj9JoILd5qACxo8jzF/xziiYMmdr
 262fF90aWAdz/jktiAvwcpVJlnJ+O0SIzkPNwoHh80gOca7xyo5i9Omx7O2nQoH0ls
 DjeOwqfZC0u2KxeeZgMRUzd7JWYp07Lre9B0GFDJhoBrOiX2HX9rfqiHp6PMWcvIVp
 xkdM5HtGA52UvtxRnPwHHdG8Fcr+1W9MpUevyzQaza/g5QUdBZY90MXcLmF6D6TuHN
 V3+ba5G+RSZ2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jLjS8m3U
Subject: Re: [Buildroot] [PATCH] package/libcamera: bump to latest master
 commit ba6435930f08e802cffc688d90f156a8959a0f86
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2022-07-07 11:37 +0200, Quentin Schulz spake thusly:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> This brings in support for OV5675 and IMX477 camera sensors, exposes
> autofocus controls through the libcamera API, adds support for more
> pixel and media bus formats, fixes AWB on IPU3, improves gstreamer
> support and numerous other improvements and fixes.
> 
> Since commit fcb0ea001a2d "libcamera: Introduce YamlParser as a helper
> to parse yaml files", libyaml is a required dependency since YAML is
> used for configuration/tuning files.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcamera/Config.in      | 1 +
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 3 ++-
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index fd7b3c92c4..0febfef4bc 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -14,6 +14,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
>  	depends on !BR2_STATIC_LIBS # gnutls
>  	depends on BR2_USE_WCHAR # gnutls
>  	select BR2_PACKAGE_GNUTLS
> +	select BR2_PACKAGE_LIBYAML
>  	select BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO if !BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
>  	help
>  	  libcamera provides a software stack to support
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 181bb1349a..68c9c1f005 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  9aa62d41470238ac8c3bb847601d1a803ac7a270d3b5e87f722e9c93c867d18d  libcamera-8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98-br1.tar.gz
> +sha256  59318208a9c1b183cacaf5a7175568d8a9fa094f2dd8c9794269bb6e9636986e  libcamera-ba6435930f08e802cffc688d90f156a8959a0f86-br1.tar.gz
>  
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 41d6a5abef..58f7307a23 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = 8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98
> +LIBCAMERA_VERSION = ba6435930f08e802cffc688d90f156a8959a0f86
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>  	host-openssl \
> @@ -13,6 +13,7 @@ LIBCAMERA_DEPENDENCIES = \
>  	host-python-jinja2 \
>  	host-python-ply \
>  	host-python-pyyaml \
> +	libyaml \
>  	gnutls
>  LIBCAMERA_CONF_OPTS = \
>  	-Dandroid=disabled \
> -- 
> 2.36.1
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
