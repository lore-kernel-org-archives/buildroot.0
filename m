Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0547CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 08:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76EF9612D5;
	Tue, 26 Jul 2022 08:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76EF9612D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnkcburzpGEq; Tue, 26 Jul 2022 08:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A7B360ECD;
	Tue, 26 Jul 2022 08:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A7B360ECD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12CC81BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEFB941B74
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEFB941B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHKqDTgNpn_4 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 08:29:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 985ED41B72
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 985ED41B72
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:29:56 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b16so9081228lfb.7
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 01:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rGOI0w4IPJ81jqR2oduWn7uSr2stGfBxXZRlo2WIOnU=;
 b=lxbkWyX+oYHRca/1yHXHConQ522MRnr/CpKl94ckM+ccNTTT57bsINIr0VORr9oAQg
 oKNZYhH0aJzYRfAeOFK4sUNOtHJ1012ceuz9BvxaETgqfbT2wvHg9QmjHWs/qERjuWGU
 0bPiVPyzZMWvHdl2FCS8bjB3BLD1TmLX7NnFdVDapDT5PVvxoasFmIE6EIF8YLGY20gu
 hqWHTgKtJH5XJxbe1Y3opJRWHVoDyGH1LpdL11AUPRFVfU8F6evpmhyJe9X1Z8Y+8YEf
 xw/PWi6GRXJfBkAgCjo36FaydiNicIg89VhpDXaaEdTWqrIOCWrgTWZqs3z0BOJjZ1D7
 6oUw==
X-Gm-Message-State: AJIora/l5/iUKQfjfodDfurxC3JPAjDpOM84sLKgDmKoObWdlO214C9d
 KLzA9q0Wv3ByogSVrXDLzekMEb7nV0AE3R85YUk0Cu6uyJU=
X-Google-Smtp-Source: AGRyM1uZialp/1azmwOA1Qy187JthyGoq+MmpmR6WH7Tu87e96MreNggF4dhUJxrilLVoLkTPiEsJ0yTTQ82B+fYVxE=
X-Received: by 2002:a05:6512:374a:b0:48a:8c6c:20d with SMTP id
 a10-20020a056512374a00b0048a8c6c020dmr3485714lfs.234.1658824194060; Tue, 26
 Jul 2022 01:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220721144939.1265027-1-ardeleanalex@gmail.com>
 <20220722070150.40715-1-ardeleanalex@gmail.com>
 <43e30f67-d82b-b6af-13bc-cc2088b3e253@mind.be>
In-Reply-To: <43e30f67-d82b-b6af-13bc-cc2088b3e253@mind.be>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Tue, 26 Jul 2022 11:29:42 +0300
Message-ID: <CA+U=DsqxbbH63h6u6xApqm-pgC3gE0grvaeqn=BRy+J8bwgazQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rGOI0w4IPJ81jqR2oduWn7uSr2stGfBxXZRlo2WIOnU=;
 b=MdFv0RA8Qf3kFlhmwET2fcIVPGvtcazCQAJ3Y+rg+pHIGF5ZjzJ8NKx3vXIh6XKUU+
 E0Grbur0mN6POVo8wE02WVhVVTvFwOWYdOqORFJv+/SfKB0OfvTiTBtBrFlLwch7sJsR
 lTSGP9PQPCW2s8zfBEjtRFkwi72vW72oXgO0GLDDP7QAsA66Bwb26Gg1U7G+YF+tsbLs
 Tw+V60kCzxwxFBz/W+iMQHGmZ4eO+Vo/NJOovsGeUd9EgqSh/WCI7lbaFIEWwom6Zfho
 k4UyN4sjPPcYYBIU4xxQA+borGWUUVyW6VHfrhb7DPtWw567bkE0YFNN9ui5ZsW9QTWL
 nIZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MdFv0RA8
Subject: Re: [Buildroot] [PATCH v2] package/cog: add libgbm as dependency
 when building with DRM support
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jul 23, 2022 at 11:48 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 22/07/2022 09:01, Alexandru Ardelean wrote:
> > When building with the DRM support, it can happen that the libgbm library
> > is not yet built by the provider of this lib (specified by
> > BR2_PACKAGE_PROVIDES_LIBGBM).
>
>   I've applied this one to master already, however there are two comments on v1
> that remain unaddressed.

yes
i wasn't sure whether to do this patch-first (which is more of a fix)
and do a follow-up
will do a follow-up :)
since this was applied
thanks :)

>
> >
> > The docs in cog `docs/platform-drm.md` specify this dep-list:
> > - **WPEBackend-fdo**:
> > - **Wayland**:
> > - **libdrm**:
> > - **libgbm**:
> > - **libinput**:
> > - **libudev**:
>
>   This would imply that a dependency on udev is needed as well (both in the
> Config.in and the .mk). It is actually implied by libinput, so we won't get
> build failures, but it's better to have explicit dependencies.

ack; will add

>
> >
> > libgbm needs to be added.
> > Adding libegl as well.
> >
> > Updated package/cog/Config.in to define the dependencies (for DRM)
> > according to libegl & libgbm.
> >
> > Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> > ---
> >   package/cog/Config.in | 9 ++++++---
> >   package/cog/cog.mk    | 2 +-
> >   2 files changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/cog/Config.in b/package/cog/Config.in
> > index d4238750f9..484eb85c70 100644
> > --- a/package/cog/Config.in
> > +++ b/package/cog/Config.in
> > @@ -39,7 +39,8 @@ config BR2_PACKAGE_COG_PLATFORM_FDO
> >   config BR2_PACKAGE_COG_PLATFORM_DRM
> >       bool "DRM backend"
> >       depends on BR2_PACKAGE_HAS_UDEV # libinput
> > -     depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
> > +     depends on BR2_PACKAGE_HAS_LIBEGL
> > +     depends on BR2_PACKAGE_HAS_LIBGBM
>
>   It apparently needs the
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT feature. You can test
> that by trying a build with rockchip-mali or ti-sgx-um as provider, since those
> packages don't have that feature.

ack; will add
i think i should also add BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF as
Thomas mentioned

>
>
>   Regards,
>   Arnout
>
> >       select BR2_PACKAGE_LIBDRM
> >       select BR2_PACKAGE_LIBINPUT
> >       help
> > @@ -52,7 +53,9 @@ config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
> >       help
> >         Expose remote control interface on system bus
> >
> > -comment "DRM platform needs mesa3d w/ EGL driver and GBM"
> > -     depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> > +comment "DRM platform needs EGL and GBM"
> > +     depends on \
> > +             !BR2_PACKAGE_HAS_LIBEGL || \
> > +             !BR2_PACKAGE_HAS_LIBGBM
> >
> >   endif
> > diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> > index f2ca0af93d..da660eb7c1 100644
> > --- a/package/cog/cog.mk
> > +++ b/package/cog/cog.mk
> > @@ -28,7 +28,7 @@ endif
> >
> >   ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
> >   COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> > -COG_DEPENDENCIES += libdrm libinput
> > +COG_DEPENDENCIES += libdrm libinput libgbm libegl
> >   else
> >   COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
> >   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
