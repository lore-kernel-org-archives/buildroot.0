Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80754C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 09:29:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2AB861178
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 09:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2AB861178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF52F404FB;
	Wed, 22 Sep 2021 09:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBO6XAYh_r7i; Wed, 22 Sep 2021 09:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D001A404C5;
	Wed, 22 Sep 2021 09:29:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8CB1BF3E8
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 09:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C1F560ABE
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 09:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cBKwKQ8CsoSe for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 09:29:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43470605AA
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 09:29:29 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6106B1BF216;
 Wed, 22 Sep 2021 09:29:26 +0000 (UTC)
Date: Wed, 22 Sep 2021 11:29:24 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YUr3dHAem9Y/0TMM@kb-xps>
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
 <20210921130326.3462783-7-kamel.bouhara@bootlin.com>
 <20210921161321.68cdf5c8@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210921161321.68cdf5c8@windsurf>
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

On Tue, Sep 21, 2021 at 04:13:21PM +0200, Thomas Petazzoni wrote:
> On Tue, 21 Sep 2021 15:03:23 +0200
> Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:
>
> > diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
> > index 31a9152407..dfcca89e46 100644
> > --- a/package/sunxi-mali-mainline/Config.in
> > +++ b/package/sunxi-mali-mainline/Config.in
> > @@ -3,6 +3,8 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE
> >  	depends on BR2_aarch64 || (BR2_ARM_EABIHF && BR2_arm)
> >  	depends on BR2_TOOLCHAIN_USES_GLIBC
> >  	select BR2_PACKAGE_HAS_LIBEGL
> > +	select BR2_PACKAGE_HAS_LIBGBM
> > +	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
>
> So here, you specify that sunxi-mali-mainline always provides libgbm.
>
> >  	select BR2_PACKAGE_HAS_LIBGLES
> >  	help
> >  	  Install userspace Allwinner OpenGL libraries.
> > @@ -14,6 +16,9 @@ if BR2_PACKAGE_SUNXI_MALI_MAINLINE
> >  config BR2_PACKAGE_PROVIDES_LIBEGL
> >  	default "sunxi-mali-mainline"
> >
> > +config BR2_PACKAGE_PROVIDES_LIBGBM
> > +	default "sunxi-mali-mainline" if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
>
> But here only if the wayland output is selected.
>
> > +
> >  config BR2_PACKAGE_PROVIDES_LIBGLES
> >  	default "sunxi-mali-mainline"
> >
> > @@ -26,6 +31,7 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
> >  config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
> >  	bool "wayland"
> >  	depends on BR2_PACKAGE_WAYLAND
> > +	select BR2_PACKAGE_HAS_LIBGBM
>
> If only the wayland variant provides a gbm implementation, then only
> this select should stay there, along with the select of
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF.
>

Yes that makes more sens, thanks.

> > diff --git a/package/sunxi-mali-mainline/gbm.pc b/package/sunxi-mali-mainline/gbm.pc
> > new file mode 100644
> > index 0000000000..e2f6c04a82
> > --- /dev/null
> > +++ b/package/sunxi-mali-mainline/gbm.pc
> > @@ -0,0 +1,12 @@
> > +prefix=/usr
> > +exec_prefix=/usr
> > +libdir=${exec_prefix}/lib
> > +includedir=${prefix}/include
> > +
> > +Name: gbm
> > +Description: ARM Mali implementation of gbm
> > +Requires.private:
> > +Version: 1.0
> > +Libs: -L${libdir} -lgbm
> > +Libs.private:
> > +Cflags: -I${includedir}
>
> Is it a requirement for GBM providers to provide a gbm.pc? If so, I
> think it would be great to mention it in the libgbm.mk, as a comment.
>

I need to check that unless someone know the answer.

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
