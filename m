Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B161C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA0534179B;
	Tue,  7 Feb 2023 21:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA0534179B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F78OGuvX2pL4; Tue,  7 Feb 2023 21:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB3A3416ED;
	Tue,  7 Feb 2023 21:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB3A3416ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EB661BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B21281EBC
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B21281EBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jafXUmgnKVFs for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:51:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C42681E2F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C42681E2F
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:51:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 953CFC0003;
 Tue,  7 Feb 2023 21:51:45 +0000 (UTC)
Date: Tue, 7 Feb 2023 22:51:44 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230207225144.16424f58@windsurf>
In-Reply-To: <20230207210934.3132539-1-angelo@amarulasolutions.com>
References: <20230207210934.3132539-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675806706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TFCGY06xB+aup3/QGDl0v5oc3mRtaknVFJe6HguqY4=;
 b=SFnny/wzvgwH7XwiijKML8Y6XFseb4S9JbWpNfqCERBGasrnBqrplwOd5buQpnkoSgD4WN
 ZtN2RDFxQ1hKEG/qVdsAL07Tjk6/NIEwGgojkxxdwGWJefa0zbszIugXFzB9zKPDEnb286
 ndI91t8eF6mZ4MFluq7yM6i3R8n4TXTeUJyhqwnBFTWOROGMZo0WBnmtpkjGtiquMVfcZO
 Fh64/ehx87z2rmOfHl7KFExR49i1cHO4CyyIZePSaiwMdtt0057IpeA8SUO5Lk3XCLlE08
 GhG9ZWAHY3WCDKKY9YqVquRmj9jOhk7ObdV4B/8pMp3gxzKMaDGGnQz1eBXodw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SFnny/wz
Subject: Re: [Buildroot] [PATCH v5] package/gtkiostream: new package
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
Cc: romain.naour@smile.fr, Matt Flax <flatmax@flatmax.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 22:09:34 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> +GTKIOSTREAM_VERSION = v1.8.0
> +GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,$(GTKIOSTREAM_VERSION))
> +GTKIOSTREAM_LICENSE = GPL-2.0+
> +GTKIOSTREAM_LICENSE_FILES = gpl.txt
> +GTKIOSTREAM_DEPENDENCIES = eigen fftw-double fftw-single host-pkgconf
> +
> +GTKIOSTREAM_DEPENDENCIES += $(if $(BR2_PACKAGE_SOX),sox)

Better written as:

GTKIOSTREAM_DEPENDENCIES = \
	eigen \
	fftw-double \
	...
	host-pkgconf \
	$(if $(BR2_PACKAGE_SOX),sox)

> +
> +ifeq ($(BR2_PACKAGE_OCTAVE),y)
> +GTKIOSTREAM_DEPENDENCIES += octave
> +GTKIOSTREAM_CONF_OPTS += --enable-octave
> +else
> +GTKIOSTREAM_CONF_OPTS += --disable-octave
> +endif
> +
> +# configure script not available
> +GTKIOSTREAM_AUTORECONF = YES

This normally goes earlier in the makefile, like before the
dependencies/conf_opts.

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
