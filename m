Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D04C43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 11:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99C3541761;
	Mon, 11 Jul 2022 11:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99C3541761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r87PPqNo_LxE; Mon, 11 Jul 2022 11:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D53C41739;
	Mon, 11 Jul 2022 11:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D53C41739
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA3BE1BF301
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 11:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D14C8832E7
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 11:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D14C8832E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LFNyP-tL4RFi for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 11:31:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 236D683DF2
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 236D683DF2
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 11:31:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB6D4326;
 Mon, 11 Jul 2022 13:31:44 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <20220707093734.34465-1-foss+buildroot@0leil.net>
References: <20220707093734.34465-1-foss+buildroot@0leil.net>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Date: Mon, 11 Jul 2022 12:31:42 +0100
Message-ID: <165753910251.2228597.7921387821550472716@Monstersaurus>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1657539105;
 bh=HJMfZdJDRNERcY/3QbzGv/ksvPxME513uCmmLUpRjFw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=nsdLF2dKAr0gvVg1dWJ8wyy8RZGrE+3Cg4lorPLmXxjJnGsLViR8gHWlJaNHADy2y
 vfgrtSaCfZHIxeVtAtm0n0nZFSI26+UrEljboelqbP8dCa7fEkk9FMXiZ8zd2ebg36
 CY4sT59ECllxdc/Xa9w6e6x/mE8nqrGavCzbsY34=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=nsdLF2dK
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
 Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Quentin Schulz (2022-07-07 10:37:34)
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

Thanks, nicely summarised.

> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

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
>         depends on !BR2_STATIC_LIBS # gnutls
>         depends on BR2_USE_WCHAR # gnutls
>         select BR2_PACKAGE_GNUTLS
> +       select BR2_PACKAGE_LIBYAML
>         select BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO if !BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
>         help
>           libcamera provides a software stack to support
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
>         host-openssl \
> @@ -13,6 +13,7 @@ LIBCAMERA_DEPENDENCIES = \
>         host-python-jinja2 \
>         host-python-ply \
>         host-python-pyyaml \
> +       libyaml \
>         gnutls
>  LIBCAMERA_CONF_OPTS = \
>         -Dandroid=disabled \
> -- 
> 2.36.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
