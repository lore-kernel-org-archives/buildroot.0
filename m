Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEC3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 14:13:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5707D61159
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 14:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5707D61159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0179B83B42;
	Tue, 21 Sep 2021 14:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7CJbzPkYmHa; Tue, 21 Sep 2021 14:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD9183720;
	Tue, 21 Sep 2021 14:13:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 673161BF2B6
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 14:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 567E440657
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 14:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEg5aaxf5yAN for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 14:13:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5445C4063E
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 14:13:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9808E24001B;
 Tue, 21 Sep 2021 14:13:22 +0000 (UTC)
Date: Tue, 21 Sep 2021 16:13:21 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Message-ID: <20210921161321.68cdf5c8@windsurf>
In-Reply-To: <20210921130326.3462783-7-kamel.bouhara@bootlin.com>
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
 <20210921130326.3462783-7-kamel.bouhara@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 6/8] package/sunxi-mali-mainline: provides
 libgbm
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Tue, 21 Sep 2021 15:03:23 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
> index 31a9152407..dfcca89e46 100644
> --- a/package/sunxi-mali-mainline/Config.in
> +++ b/package/sunxi-mali-mainline/Config.in
> @@ -3,6 +3,8 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE
>  	depends on BR2_aarch64 || (BR2_ARM_EABIHF && BR2_arm)
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_HAS_LIBGBM
> +	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF

So here, you specify that sunxi-mali-mainline always provides libgbm.

>  	select BR2_PACKAGE_HAS_LIBGLES
>  	help
>  	  Install userspace Allwinner OpenGL libraries.
> @@ -14,6 +16,9 @@ if BR2_PACKAGE_SUNXI_MALI_MAINLINE
>  config BR2_PACKAGE_PROVIDES_LIBEGL
>  	default "sunxi-mali-mainline"
>  
> +config BR2_PACKAGE_PROVIDES_LIBGBM
> +	default "sunxi-mali-mainline" if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND

But here only if the wayland output is selected.

> +
>  config BR2_PACKAGE_PROVIDES_LIBGLES
>  	default "sunxi-mali-mainline"
>  
> @@ -26,6 +31,7 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
>  config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
>  	bool "wayland"
>  	depends on BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_HAS_LIBGBM

If only the wayland variant provides a gbm implementation, then only
this select should stay there, along with the select of
BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF.

> diff --git a/package/sunxi-mali-mainline/gbm.pc b/package/sunxi-mali-mainline/gbm.pc
> new file mode 100644
> index 0000000000..e2f6c04a82
> --- /dev/null
> +++ b/package/sunxi-mali-mainline/gbm.pc
> @@ -0,0 +1,12 @@
> +prefix=/usr
> +exec_prefix=/usr
> +libdir=${exec_prefix}/lib
> +includedir=${prefix}/include
> +
> +Name: gbm
> +Description: ARM Mali implementation of gbm
> +Requires.private: 
> +Version: 1.0
> +Libs: -L${libdir} -lgbm
> +Libs.private: 
> +Cflags: -I${includedir}

Is it a requirement for GBM providers to provide a gbm.pc? If so, I
think it would be great to mention it in the libgbm.mk, as a comment.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
