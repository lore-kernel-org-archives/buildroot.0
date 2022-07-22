Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21D4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0DC760ED7;
	Fri, 22 Jul 2022 06:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0DC760ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEPiNF9jTXf0; Fri, 22 Jul 2022 06:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3D3F60DFD;
	Fri, 22 Jul 2022 06:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3D3F60DFD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4571BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB3C240989
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB3C240989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83YUvGV1n91k for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:38:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B03D403C8
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B03D403C8
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:38:16 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id o7so6187466lfq.9
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 23:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kHZUfX55pHX8eUYG4sSwXOUKvVUkkdAWz9wRNnhLZss=;
 b=6Z/G9DtfJwmvWPX6w9WBCy5WmsBn/NLic8E/uZQiM1Y+NOZP2ppvkxQRg70TNi3sSO
 tvJNIUKbfRX6a01YcnvH80HrhJgtlLt41KR4oPeZrgZwlmo2sR5WkFJeCe+gMu1dGo9U
 J9n7i/x4tgmM/ZFwYUy7uSSMZjcQAHTsqx50NBQbw/yj2/ft/4I3ty1vzsb8Mm23/JZf
 awGJIGnWnw03vc5mhLkftkk1sjd487LlfAHUBv7xq8RBUaoEsmFgYL+oGAJX47SOWATY
 UswYUk6JYW5Ad8hSYkJMnxrVNl5AxSWT06+LgrMH2O0bmJsCX7dLGJYX8vd6VLCmY8z6
 Q9fg==
X-Gm-Message-State: AJIora8H7XAKEsewNn5ZuG4Yemi3J6MZNv2CaKR/ULT+Lqcc5VSN2NjG
 Me3UNVIfMXJNf17inWFUxNPClpgSH18a3udzRw2gM1KoiLg3Lg==
X-Google-Smtp-Source: AGRyM1ufcaNb4/09YH03vYVcT7/K+xPOUOw/x9LFWGUyte7AckxfdX6KKFy4F+KEKXDDCbWwDHUhanR+6v27AYVd3rg=
X-Received: by 2002:ac2:456c:0:b0:489:fc8d:e23f with SMTP id
 k12-20020ac2456c000000b00489fc8de23fmr784985lfm.234.1658471893956; Thu, 21
 Jul 2022 23:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220721144939.1265027-1-ardeleanalex@gmail.com>
 <20220721181648.7eedcb41@windsurf>
 <CA+U=DsqEoXWjdBNFUQVLLWhABgqcFVLCF8FicwHw96Rq=bN3OA@mail.gmail.com>
In-Reply-To: <CA+U=DsqEoXWjdBNFUQVLLWhABgqcFVLCF8FicwHw96Rq=bN3OA@mail.gmail.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Fri, 22 Jul 2022 09:38:02 +0300
Message-ID: <CA+U=Dsr60t8_dfdAL7CAbtbGL2i8+WyWD-byyEFQg=vpc5dHBg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kHZUfX55pHX8eUYG4sSwXOUKvVUkkdAWz9wRNnhLZss=;
 b=GUfbqRqUp467DZJWD6VAdeJMm5FIrP2FjrqsM22g1Eky/XT2jgpsG9FZEY9oG1CoPt
 GNU2kfifHg14z7qWaRLhIj2OF4QCoqERpHOrXLVIMUSBNxp5rO+4mF8HPApxz1BfY3D/
 z795xFLByrv/sLx4dW540HGxmqQ60LwtC1dx1CPXV6mITJmFhWK+ydX/9yHZq+b6UxKB
 N9AsOfsa/v1Mc9nG3YjaENlsSC6p/O6RT6cu2C6iXVpZdiozCVGguW6xmhxxdUI/Tv1N
 ZCj73ZFB+aJ3EBvXAcjB5Ngsq9eH6KFgWS0ozH5D55rUbtka3wkO9vlnhhxne9mqKF9A
 jI9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GUfbqRqU
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Jul 22, 2022 at 9:25 AM Alexandru Ardelean
<ardeleanalex@gmail.com> wrote:
>
> On Thu, Jul 21, 2022 at 7:16 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello Alexandru,
> >
> > On Thu, 21 Jul 2022 17:49:39 +0300
> > Alexandru Ardelean <ardeleanalex@gmail.com> wrote:
> >
> > > When building with DRM support, it can happen that the libgbm library
> > > is not yet built by the provider of libgbm (specified by
> > > BR2_PACKAGE_PROVIDES_LIBGBM).
> > >
> > > The docs in cog `docs/platform-drm.md` specify this dep-list:
> > > - **WPEBackend-fdo**:
> > > - **Wayland**:
> > > - **libdrm**:
> > > - **libgbm**:
> > > - **libinput**:
> > > - **libudev**:
> > >
> > > libgbm needs to be added, whereas `libudev` is provided by systemd (in my
> > > case).
> >
> > Then udev should also be in the dependencies when
> > BR2_PACKAGE_COG_PLATFORM_DRM=y.
> >
> > >  ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
> > >  COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> > > -COG_DEPENDENCIES += libdrm libinput
> > > +COG_DEPENDENCIES += libdrm libinput libgbm
> >
> > That is correct, but not complete. The DRM platform code in Cog also
> > uses EGL, so we would also need libegl in the list of dependencies. In
> > pratice, libgbm and libegl are most likely implemented by the same
> > package, but for the sake of correctness, it would be better to have
> > both.
> >
> > Another thing that is wrong is:
> >
> >         depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
> >
> > in the Config.in file. This used to be the only way to detect the
> > availability of gbm, but since quite some time now, we have the libgbm
> > virtual package.
> >
> > So this should be instead:
> >
> >         depends on BR2_PACKAGE_HAS_LIBGBM
>
> So, I'm assuming a V2, would contain adding BR2_PACKAGE_HAS_LIBGBM to
> the Config.in and libegl to the DEPENDENCIES var.
>
> I can also do the second version, after the fix is agreed upon.
> But no promises :)
>
> >
> > and I'm pretty sure Cog uses some "advanced" features of libgbm, so
> > most likely at least depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> > is needed, and probably also depends on
> > BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT is needed.
> > See package/opengl/libgbm/Config.in for details.
> >
> > Of course, this aspect should be in a different patch: your change to
> > add "libgbm" in the DEPENDENCIES variable is really a fix, while my
> > proposed change in the Config.in file is really an improvement, that
> > will allow using Cog on libgbm-capable platforms that don't use mesa3d
> > as their OpenGL/libgbm implementation.

Apologies for not including this part in the second email.
So, at least cog 0.12.4 that is currently packaged in Buildroot
doesn't seem to support (yet)
BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
and
BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF

at least what 'package/opengl/libgbm/Config.in ' mentions:
- i can't see any use of gbm_device_get_format_modifier_plane_count in
cog 0.12.4
- i can't see any use of gbm_bo_get_fd in cog 0.12.4

And also looking now through the code, I see that EGL is used in all 3
platforms (DRM, X11 and Wayland).
Buildroot builds for Wayland and DRM (AFAICT).
So, I guess libegl is explicitly required for the DRM platform.

> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering and training
> > https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
