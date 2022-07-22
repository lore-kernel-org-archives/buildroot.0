Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417F6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF32847E6;
	Fri, 22 Jul 2022 07:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DF32847E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3vj2NSuMRdLT; Fri, 22 Jul 2022 07:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98FDA847D2;
	Fri, 22 Jul 2022 07:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98FDA847D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B2161BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F0C560EA1
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F0C560EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WI-ixgl3qQUA for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:00:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD1D60808
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BD1D60808
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:00:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8CDD6240008;
 Fri, 22 Jul 2022 07:00:00 +0000 (UTC)
Date: Fri, 22 Jul 2022 08:59:59 +0200
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Message-ID: <20220722085959.5fd21e9f@windsurf>
In-Reply-To: <CA+U=Dsr60t8_dfdAL7CAbtbGL2i8+WyWD-byyEFQg=vpc5dHBg@mail.gmail.com>
References: <20220721144939.1265027-1-ardeleanalex@gmail.com>
 <20220721181648.7eedcb41@windsurf>
 <CA+U=DsqEoXWjdBNFUQVLLWhABgqcFVLCF8FicwHw96Rq=bN3OA@mail.gmail.com>
 <CA+U=Dsr60t8_dfdAL7CAbtbGL2i8+WyWD-byyEFQg=vpc5dHBg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658473201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UV18/BKHs2oTayMPYDFBiPORmTuNDbS+mJBtqfHA6DA=;
 b=bbDLmA3vM3e8Jwr3Fz9rAhIYrVCes7zMXWhLAZbvTKBgCwTNnSWloja49qeYZuYaCQ8fYW
 LMwNOjIHPiHKsqVmwur5UZuskGj8gG6LpSo9yZNQYVO6EbJs/vI469nOB2D6/wRSFqu1CP
 Iz26th8Mi3RrRrp96yPduQQEUd2haflHSh2ra9+w4cldLrbTRs2gE2tWdHe4zQBh9RXMP8
 GouRDb2nc/qE9R2M2LJsnhwdjjVLgWFu1SV4PqRYU/buOMZCPy/gD4f2WxOw9Ptsf1wjRK
 KXER1TT6YmVRkrQOFl/AJeICXXWZ/s5n+slmvrEP+XjFBtnnMFaC0AhfwdABbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bbDLmA3v
Subject: Re: [Buildroot] [PATCH] package/cog: add libgbm as dependency when
 building with DRM support
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 22 Jul 2022 09:38:02 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> > > Of course, this aspect should be in a different patch: your change to
> > > add "libgbm" in the DEPENDENCIES variable is really a fix, while my
> > > proposed change in the Config.in file is really an improvement, that
> > > will allow using Cog on libgbm-capable platforms that don't use mesa3d
> > > as their OpenGL/libgbm implementation.  
> 
> Apologies for not including this part in the second email.
> So, at least cog 0.12.4 that is currently packaged in Buildroot
> doesn't seem to support (yet)

It's not about whether cog supports it, but whether it uses it.

> BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
> and
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> 
> at least what 'package/opengl/libgbm/Config.in ' mentions:
> - i can't see any use of gbm_device_get_format_modifier_plane_count in
> cog 0.12.4

Correct, but it is using:

gbm_bo_get_plane_count
gbm_bo_get_handle_for_plane
gbm_bo_get_stride_for_plane

etc. which are also related to the same "plane" support. Actually, I'm
wondering if the name
BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT was really
the best.

We do have versions of libgbm that don't have any support for this
plane API.

> - i can't see any use of gbm_bo_get_fd in cog 0.12.4
> 
> And also looking now through the code, I see that EGL is used in all 3
> platforms (DRM, X11 and Wayland).
> Buildroot builds for Wayland and DRM (AFAICT).
> So, I guess libegl is explicitly required for the DRM platform.

Correct.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
