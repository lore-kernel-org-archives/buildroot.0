Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12601C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 07:32:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D33860FDC
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 07:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D33860FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B44C74012C;
	Mon, 18 Oct 2021 07:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NF-ON_GmpC5O; Mon, 18 Oct 2021 07:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA894402BB;
	Mon, 18 Oct 2021 07:32:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D70C1BF337
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 07:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B35582EA2
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 07:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lAmAgD_EeFO2 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 07:32:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A987981BD9
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 07:32:14 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C294E6000A;
 Mon, 18 Oct 2021 07:32:10 +0000 (UTC)
Date: Mon, 18 Oct 2021 09:32:09 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YW0i+TR+1jGOoS4X@kb-xps>
References: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
 <20211007095147.688449-5-kamel.bouhara@bootlin.com>
 <04333d8b-411c-97a4-8872-e2200e2833ab@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04333d8b-411c-97a4-8872-e2200e2833ab@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v3 5/7] package/sunxi-mali-mainline:
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 07, 2021 at 10:23:24PM +0200, Giulio Benetti wrote:
> Hi Kamel,
>

Hi Giulio,

> On 10/7/21 11:51 AM, Kamel Bouhara wrote:
> > Registers the package as a libgbm provider.
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > ---
> > Changes v1 -> v2:
> >   - Fixed gbm features are provided only when wayland is set
> > Changes v1 -> v2:
> >   - Fixed gbm features selected only when wayland is set
> >
> >   package/sunxi-mali-mainline/Config.in              |  5 +++++
> >   package/sunxi-mali-mainline/gbm.pc                 | 12 ++++++++++++
> >   package/sunxi-mali-mainline/sunxi-mali-mainline.mk |  3 +++
> >   3 files changed, 20 insertions(+)
> >   create mode 100644 package/sunxi-mali-mainline/gbm.pc
> >
> > diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
> > index 31a9152407..10534f263b 100644
> > --- a/package/sunxi-mali-mainline/Config.in
> > +++ b/package/sunxi-mali-mainline/Config.in
> > @@ -14,6 +14,9 @@ if BR2_PACKAGE_SUNXI_MALI_MAINLINE
> >   config BR2_PACKAGE_PROVIDES_LIBEGL
> >   	default "sunxi-mali-mainline"
> > +config BR2_PACKAGE_PROVIDES_LIBGBM
> > +	default "sunxi-mali-mainline" if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
> > +
> >   config BR2_PACKAGE_PROVIDES_LIBGLES
> >   	default "sunxi-mali-mainline"
> > @@ -26,6 +29,8 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
> >   config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
> >   	bool "wayland"
> >   	depends on BR2_PACKAGE_WAYLAND
> > +	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> > +	select BR2_PACKAGE_HAS_LIBGBM
> >   config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_DMABUF
> >   	bool "x11 dma-buf"
> > diff --git a/package/sunxi-mali-mainline/gbm.pc b/package/sunxi-mali-mainline/gbm.pc
> > new file mode 100644
> > index 0000000000..593cfa0aba
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
> > diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> > index e058b5c3cd..8a76b46aba 100644
> > --- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> > +++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> > @@ -38,6 +38,7 @@ endif
> >   ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND),y)
> >   SUNXI_MALI_MAINLINE_DEPENDENCIES += wayland
> > +SUNXI_MALI_MAINLINE_PROVIDES += libgbm
> >   endif
> >   # FIXME: install gbm.pc conditionally
> > @@ -53,6 +54,8 @@ define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
> >   		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
> >   	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
> >   		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
> > +	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/gbm.pc \
> > +		$(STAGING_DIR)/usr/lib/pkgconfig/gbm.pc
>
> As pointed by # FIXME above you need to make the install of gbm.pc
> conditional to BR2_PACKAGE_HAS_LIBGBM, something like:
>
> ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
> define SUNXI_MALI_MAINLINE_INSTALL_GBM_PC
> 	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/gbm.pc \
> 		$(STAGING_DIR)/usr/lib/pkgconfig/gbm.pc
> endef
> endif
>
> and then call $(SUNXI_MALI_MAINLINE_INSTALL_GBM_PC) in place of the actual
> install, like $(SUNXI_MALI_MAINLINE_FIXUP_EGL_PC).
>

Ack, thanks !

Regards,

Kamel

> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
