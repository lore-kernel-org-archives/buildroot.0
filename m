Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A58EE4996
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 10:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09C3381E03;
	Tue, 22 Aug 2023 10:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C3381E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iXWR5Zqqq3o; Tue, 22 Aug 2023 10:16:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 312AA81DF2;
	Tue, 22 Aug 2023 10:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 312AA81DF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B1021BF354
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 413DD40530
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 413DD40530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gB1wFt__lJn6 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 10:16:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEDD8402E8
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 10:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEDD8402E8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E51A60004;
 Tue, 22 Aug 2023 10:16:47 +0000 (UTC)
Date: Tue, 22 Aug 2023 12:16:46 +0200
To: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Message-ID: <20230822121646.260fa98f@windsurf>
In-Reply-To: <20230616002359.4139814-2-dannenberg@ti.com>
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-2-dannenberg@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692699408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n1CyTvcJJs5aM1det7GEpV38Hc9NxNKHTakfJsXEWf0=;
 b=kR5iuqa0a8Z2nyK28TIL5fsE2/zI7bN92/IchZ0u5yLERplhpcw/4sEa4ZabAPj7OfbvHz
 /YPqSrJ2VUPHj9DlCvyWreHjNGRdezp3pq/KkxAhHlfIlMaVfCxfM80sS0TMOV71u0wPoW
 Yre64uW/PiX0rUdU07d9GOkMcrO5jQap00S9qgMnzFW7FRHPpOCu4NzHdNL9MeNJP/da91
 nDTm3Pg+cJ3zfnp+32AlC0w4HapD9dLQAmeNQp9jagvCl1Ewt/ilccd5tA+GoQopQKkXdl
 zcR0/REvVTO0gP9D5iMWK0rGRfMUEWXUr8/olPb1UZojfWjNEMzsp090Uss6OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kR5iuqa0
Subject: Re: [Buildroot] [PATCH v8 01/10] boot/ti-k3-r5-loader: allow for
 full build source customization
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
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Thu, 15 Jun 2023 19:23:50 -0500
Andreas Dannenberg via buildroot <buildroot@buildroot.org> wrote:

> The TI K3 R5 loader package essentially is a wrapper to build a special
> version of U-boot SPL used as part of a multi-stage boot flow on TI K3
> devices, and as such needs full flexibility as to specifying the U-Boot
> sources used for the build. To accomodate this, add the same options as
> already available in the regular U-Boot package. For most use cases, the
> same source settings (repo URL, versions, etc.) should be used for both
> ti-k3-r5-loader and uboot packages.
> 
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>

I have applied this patch to our next branch, with some changes. See
below.

> diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
> index 10602c8df3..2419babe70 100644
> --- a/boot/ti-k3-r5-loader/Config.in
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -1,14 +1,73 @@
>  config BR2_TARGET_TI_K3_R5_LOADER
> -	bool "ti-k3-r5-loader"
> +	bool "TI K3 R5 Loader"

Change reverted, as we want to keep it as it is.


> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> index afa309aa98..fe403a5c44 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -2,11 +2,37 @@
>  #
>  # ti-k3-r5-loader
>  #
> +# The ti-k3-r5 loader package should really be built from the same U-Boot
> +# sources as the uboot package itself, so for most users so all LOADER_SITE /
> +# LOADER_SOURCE type definitions should be set the same for both packages.
> +# However it still makes sense to keep the ti-k3-r5-loader package somewhat
> +# separated and independent from the uboot package to allow for special use
> +# cases such as Falcon boot (which would skip the uboot package completely).

Dropped all those changes, we don't want to have additional comments in
the top header of the .mk file.

> +#
>  ################################################################################
>  
> -TI_K3_R5_LOADER_VERSION = 2022.10
> +TI_K3_R5_LOADER_VERSION = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_VERSION))
> +
> +ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL),y)
> +# Handle custom U-Boot tarballs as specified by the configuration
> +TI_K3_R5_LOADER_TARBALL = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL_LOCATION))
> +TI_K3_R5_LOADER_SITE = $(patsubst %/,%,$(dir $(TI_K3_R5_LOADER_TARBALL)))
> +TI_K3_R5_LOADER_SOURCE = $(notdir $(TI_K3_R5_LOADER_TARBALL))
> +else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT),y)
> +TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
> +TI_K3_R5_LOADER_SITE_METHOD = git
> +else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG),y)
> +TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
> +TI_K3_R5_LOADER_SITE_METHOD = hg
> +else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN),y)
> +TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
> +TI_K3_R5_LOADER_SITE_METHOD = svn
> +else
> +# Handle stable official U-Boot versions
>  TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
>  TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
> +endif

Here I've added some proper logic to ignore the hash when it cannot be
verified:

+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER)$(BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(TI_K3_R5_LOADER_SOURCE)
+endif

As was requested, I think an option "same version as U-Boot" would be
useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
