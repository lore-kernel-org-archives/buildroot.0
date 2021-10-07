Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B978C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 10:00:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8D6611C1
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 10:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B8D6611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41BAB6071A;
	Thu,  7 Oct 2021 10:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMIJDrKK-WTV; Thu,  7 Oct 2021 10:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B1E960BE8;
	Thu,  7 Oct 2021 10:00:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E94A1BF873
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 10:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C21160754
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 10:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xPZek5nDHn7 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 10:00:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BC616071A
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 10:00:46 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4994E1C001A;
 Thu,  7 Oct 2021 10:00:43 +0000 (UTC)
Date: Thu, 7 Oct 2021 12:00:41 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <YV7FSbB+Z6fvjrkN@kb-xps>
References: <20210928223754.3398867-1-kamel.bouhara@bootlin.com>
 <20211003210517.GA1504958@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211003210517.GA1504958@scaer>
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
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 03, 2021 at 11:05:17PM +0200, Yann E. MORIN wrote:
> Kamel, All,
>

Hello,

> Your series has had a few comments. Most are minor, but one or two need
> a bit more insights and can't be fixed while applying. As such, I've
> marked it as Changes Requested in Patchwork.
>
> Also, could you write a cover-letter that exlpains the goal behind that
> series and how it is organised? A cover letter usually helps reviewers
> udnerstand the bigger picture of a series, while the individual patches
> describe more localised changes.
>

Of course, I actually sent the cover-letter in the first version and
I tough it was not nececessary to re-sent it again.

"This series introduce a virtual/package for the libgbm.

We also introduce two gbm features so that packages depending on it
can select which version of the api is required.

Note that we only added sunxi, gcnano and mesa3d api but other
implementations can be added later based on this series."

Regards,
Kamel

> Regards,
> Yann E. MORIN.
>
> On 2021-09-29 00:37 +0200, Kamel Bouhara spake thusly:
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
> >
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > [ Kamel : introduce gbm api features ]
> > ---
> > Changes v1 -> v2:
> >  - Squashed patch 1/2
> >  - Added more relevant comment for each features added
> >
> >  package/opengl/Config.in        |  1 +
> >  package/opengl/libgbm/Config.in | 24 ++++++++++++++++++++++++
> >  package/opengl/libgbm/libgbm.mk |  9 +++++++++
> >  3 files changed, 34 insertions(+)
> >  create mode 100644 package/opengl/libgbm/Config.in
> >  create mode 100644 package/opengl/libgbm/libgbm.mk
> >
> > diff --git a/package/opengl/Config.in b/package/opengl/Config.in
> > index cbc001427d..cfa51def45 100644
> > --- a/package/opengl/Config.in
> > +++ b/package/opengl/Config.in
> > @@ -1,5 +1,6 @@
> >  source "package/opengl/libgl/Config.in"
> >  source "package/opengl/libegl/Config.in"
> > +source "package/opengl/libgbm/Config.in"
> >  source "package/opengl/libgles/Config.in"
> >  source "package/opengl/libopencl/Config.in"
> >  source "package/opengl/libopenvg/Config.in"
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
> > +
> > +config BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> > +	bool
> > +	depends on BR2_PACKAGE_HAS_LIBGBM
> > +
> > +# gbm implementations should select this option if they provide the
> > +# dma buffer feature. This API was initially introduced in mesa3d
> > +# version 10. A gbm implementation provides this feature if it
> > +# is implement function gbm_bo_get_fd.
> > diff --git a/package/opengl/libgbm/libgbm.mk b/package/opengl/libgbm/libgbm.mk
> > new file mode 100644
> > index 0000000000..ecab234720
> > --- /dev/null
> > +++ b/package/opengl/libgbm/libgbm.mk
> > @@ -0,0 +1,9 @@
> > +################################################################################
> > +#
> > +# libgbm
> > +#
> > +################################################################################
> > +
> > +# This package requires to install a gbm.pc which needs
> > +# to be provided by GBM providers.
> > +$(eval $(virtual-package))
> > --
> > 2.30.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
