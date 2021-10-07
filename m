Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1F6C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:35:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E9A761037
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E9A761037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B654F4098E;
	Thu,  7 Oct 2021 09:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUO5CETSLbcz; Thu,  7 Oct 2021 09:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A22D4098F;
	Thu,  7 Oct 2021 09:35:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D37C31BF873
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0FBC40143
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9NtWYkXKveb for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 09:35:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30FC24037B
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 09:35:38 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E18D7C0005;
 Thu,  7 Oct 2021 09:35:35 +0000 (UTC)
Date: Thu, 7 Oct 2021 11:35:34 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YV6/ZvZq3BlO0yYe@kb-xps>
References: <20210928223754.3398867-1-kamel.bouhara@bootlin.com>
 <20211001161354.0bc8c1f1@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001161354.0bc8c1f1@windsurf>
Subject: Re: [Buildroot] [PATCH v2 1/7] package/opengl/libgbm: new virtual
 package
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Oct 01, 2021 at 04:13:54PM +0200, Thomas Petazzoni wrote:
> Hello,
>

Hello Thomas,

> On Wed, 29 Sep 2021 00:37:48 +0200
> Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:
>
> > From: Bernd Kuhls <bernd.kuhls@t-online.de>
> >
> > Kodi 18.0-Leia will implement stand-alone gbm support alongside x11 &
> > wayland.  To enable building libgbm in mesa3d without x11 & wayland we
> > need to create a virtual package for libgbm.
> >
> > Also other packages besides mesa3d may provide libgbm.so, see
> > http://patchwork.ozlabs.org/patch/647235/
> > http://patchwork.ozlabs.org/patch/939703/
> >
> > We also introduce two feature that shall help user choosing the version
> > implemented by a libgbm provider. This foresightly avoid building package
> > without having the required libgbm version (e.g. kmscube, qt5, sdl2
> > etc.)
>
> I would rephrase this as such:
>
> """
> It turns out that libgbm has seen several additions in its API over
> time, and therefore not all libgbm implementations provide support for
> all features. In order to account for this, this commit adds two hidden
> boolean options that allow libgbm providers to indicate which optional
> features they support:
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT and
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF. These booleans must be selected
> by the packages providing libgbm implementations, and depended on by
> packages using libgbm.
> """
>

OK.

> Question: do we have in the tree some libgbm implementation that
> support neither
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT nor
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF ?

So far, the dma buf feature (mesa gbm v10) is provided by every
implementation I compared (gcnano, ti, sunxi, imx-gpu).

Thanks for the review, sending a v3 soon.

Kamel

>
> > diff --git a/package/opengl/libgbm/Config.in b/package/opengl/libgbm/Config.in
> > new file mode 100644
> > index 0000000000..7aa3efb97a
> > --- /dev/null
> > +++ b/package/opengl/libgbm/Config.in
> > @@ -0,0 +1,24 @@
> > +config BR2_PACKAGE_HAS_LIBGBM
> > +	bool
> > +
> > +config BR2_PACKAGE_PROVIDES_LIBGBM
> > +	string
> > +	depends on BR2_PACKAGE_HAS_LIBGBM
> > +
> > +config BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
> > +	bool
> > +	depends on BR2_PACKAGE_HAS_LIBGBM
> > +
> > +# gbm implementations should select this option if they provide the
> > +# format modifier plane count feature. This API was initially introduced
> > +# in mesa3d version 17. A gbm implementation provides this feature if it
> > +# is implement function gbm_device_get_format_modifier_plane_count.
>
> The comment should be before the option.
>
> > +config BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> > +	bool
> > +	depends on BR2_PACKAGE_HAS_LIBGBM
> > +
> > +# gbm implementations should select this option if they provide the
> > +# dma buffer feature. This API was initially introduced in mesa3d
> > +# version 10. A gbm implementation provides this feature if it
> > +# is implement function gbm_bo_get_fd.
>
> Ditto.
>
> Note: no need to resend to address those comments, they can be fixed up
> when applying.
>
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
