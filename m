Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C957C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001D360C24;
	Wed, 27 Jul 2022 13:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 001D360C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHkQBV8UQit6; Wed, 27 Jul 2022 13:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 036A760BDE;
	Wed, 27 Jul 2022 13:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 036A760BDE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE2CD1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88BAA60BDD
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88BAA60BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANigO_gXB1yG for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:38:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03F2660A88
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03F2660A88
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:38:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 67192240003;
 Wed, 27 Jul 2022 13:38:29 +0000 (UTC)
Date: Wed, 27 Jul 2022 15:38:27 +0200
To: Dominik Michael Rauh <dmrauh@posteo.de>
Message-ID: <20220727153827.6a926131@windsurf>
In-Reply-To: <20220507094650.496076-1-dmrauh@posteo.de>
References: <20210802092426.1259479-1-dmrauh@posteo.de>
 <20220507094650.496076-1-dmrauh@posteo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658929109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LQYRTRINu2sYYGTqB6cfp4vLY+t5MKlOF2eL/B1KToc=;
 b=C8EMpnK3Ugpt5BvYE2qP9Oj8vVakXI1JriQydG7p/6h0kfh0O/rBpEYHXE5mZ4JpxmRPm8
 KCjUGPfpTqLiiRTyXA0NeOfQomtcRhkDgKjWpMaOPxWUi1Uxgy/Q2TbJ2p2ZqVfIml9fVv
 O9Vhbn+UjAuFXvmTZ2jcWXf4WcnF/GIEVlNY2JjQCyzqegFtajqxaDGntY6p75ILT4saU2
 aYSCKWg8tTG6+G3ywaO4DVAJyosRgzMblNMJczNkg+tZxEKlw8SC8LqdUGPo2KGdHtx/A9
 X4nJ+Ruvs0swQsVs4LCNv9yfnMcsj3hNaRKR9WMJPnE0eGkQw/WvXSlyxJ9rdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C8EMpnK3
Subject: Re: [Buildroot] [PATCH v5] package/gdal: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dominik,

On Sat,  7 May 2022 09:46:50 +0000
Dominik Michael Rauh <dmrauh@posteo.de> wrote:

> GDAL is a translator library for raster and vector geospatial data
> formats. As a library, it presents a single raster abstract data model
> and single vector abstract data model to the calling application for all
> supported formats. It also comes with a variety of useful command line
> utilities for data translation and processing.
> 
> https://gdal.org/
> 
> test-pkg shows that this package is affected by binutils bug 27597.
> 
> Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>

Believe it or not, but we finally applied your patch! I had to do a few
changes:

 - Addition of an entry to the DEVELOPERS file

 - Removal of PROVENANCE.TXT as a license file, and simplification of
   the license variable to just "MIT, many others" as the licensing
   situation of GDAL is very complicated.

 - Use GDAL_CONF_OPTS = (and not +=) to define all unconditional
   options, and do that before the conditional features.

 - Removal of the postgis change for gdal support, which I have moved
   to a separate commit. It also required an extra patch to PostGIS to
   build properly.

 - Bump to the latest version of gdal.

You can see the final 3 commits at:

  https://gitlab.com/buildroot.org/buildroot/-/commit/d48af707737ece6242d58e83b98e5c601fa55acc
  https://gitlab.com/buildroot.org/buildroot/-/commit/1e64fa2956171cdc9d6e6c8896b4b589ce573513
  https://gitlab.com/buildroot.org/buildroot/-/commit/b9a38a42ac817b963be2b4b51d218c5eabb1059d

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
