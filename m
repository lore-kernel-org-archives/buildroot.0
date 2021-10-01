Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2D2C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 14:16:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A23261361
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 14:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A23261361
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D364F41969;
	Fri,  1 Oct 2021 14:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5g1KEX915ZO; Fri,  1 Oct 2021 14:16:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3727440517;
	Fri,  1 Oct 2021 14:16:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAC3F1BF424
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 14:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C938884437
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 14:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BdPXkShLtdAz for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 14:16:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFF3684436
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 14:16:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 92493240006;
 Fri,  1 Oct 2021 14:16:37 +0000 (UTC)
Date: Fri, 1 Oct 2021 16:16:36 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Message-ID: <20211001161636.4b0e6c65@windsurf>
In-Reply-To: <20210928223754.3398867-5-kamel.bouhara@bootlin.com>
References: <20210928223754.3398867-1-kamel.bouhara@bootlin.com>
 <20210928223754.3398867-5-kamel.bouhara@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 5/7] package/sunxi-mali-mainline:
 provides libgbm
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Sep 2021 00:37:52 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> Registers the package as a libgbm provider.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
> Changes v1 -> v2:
>  - Fixed gbm features are provided only when wayland is set
> 
>  package/sunxi-mali-mainline/Config.in              |  6 ++++++
>  package/sunxi-mali-mainline/gbm.pc                 | 12 ++++++++++++
>  package/sunxi-mali-mainline/sunxi-mali-mainline.mk |  1 +
>  3 files changed, 19 insertions(+)
>  create mode 100644 package/sunxi-mali-mainline/gbm.pc
> 
> diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
> index 31a9152407..0a32cb456c 100644
> --- a/package/sunxi-mali-mainline/Config.in
> +++ b/package/sunxi-mali-mainline/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE
>  	depends on BR2_aarch64 || (BR2_ARM_EABIHF && BR2_arm)
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_HAS_LIBGBM
>  	select BR2_PACKAGE_HAS_LIBGLES
>  	help
>  	  Install userspace Allwinner OpenGL libraries.
> @@ -14,6 +15,9 @@ if BR2_PACKAGE_SUNXI_MALI_MAINLINE
>  config BR2_PACKAGE_PROVIDES_LIBEGL
>  	default "sunxi-mali-mainline"
>  
> +config BR2_PACKAGE_PROVIDES_LIBGBM
> +	default "sunxi-mali-mainline" if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
> +
>  config BR2_PACKAGE_PROVIDES_LIBGLES
>  	default "sunxi-mali-mainline"
>  
> @@ -26,6 +30,8 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
>  config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
>  	bool "wayland"
>  	depends on BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> +	select BR2_PACKAGE_HAS_LIBGBM

It still doesn't make sense: you're selecting BR2_PACKAGE_HAS_LIBGBM
both in the main package option and here.

So either libgbm is only provided by the wayland-variant of the
sunxi-mali-mainline OpenGL implementation, or it's provided by all. But
having the "select BR2_PACKAGE_HAS_LIBGBM" in two places doesn't make
sense.

>  ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND),y)
>  SUNXI_MALI_MAINLINE_DEPENDENCIES += wayland
> +SUNXI_MALI_MAINLINE_PROVIDES += libgbm
>  endif

According to this, it's only the wayland-variant that supports libgbm.
So the "select BR2_PACKAGE_HAS_LIBGBM" in
BR2_PACKAGE_SUNXI_MALI_MAINLINE is wrong. I think this was already
pointed out in the review of v1.

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
