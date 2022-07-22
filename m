Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3381CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6A1560E8C;
	Fri, 22 Jul 2022 06:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6A1560E8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id daFoImP7C1ix; Fri, 22 Jul 2022 06:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D21F560EF3;
	Fri, 22 Jul 2022 06:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D21F560EF3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C337C1BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E11840989
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E11840989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c0IXK9UfB7aU for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:26:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E4F2409D7
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E4F2409D7
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:26:02 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p11so1288027lfu.5
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 23:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TX3ylvoT63RoY1BE4f7WhxGKbFA5YIk9sXXTj3SlMFs=;
 b=AK+RWRaalqjeza5vXmsqKOgETuPX7HeJtpyBOkTf1GvkG/pDlCfBTutSmJp42WRkqz
 XQiW57dp4CLZo4m/+0O4DYouJolbvxXbzqyHC2C0ao+2sEgFo8T7eWxKIoR3q37qev3f
 94idTA2DpnhRfWU0oQlqNeDtCR5ZLbmzSiH594Wt8o3OmiNVP2uDCdI7HSClXGNBnnOq
 wWAq9pQHUNKZvTFY1jwiDHhouwNplnMhsnB4kRWKENX+tnAGUx2OclBFV3/dJyMEw04X
 zz4IlB7zRKUlTTqnwGBajYb0tK+4+pReDKhnnBbHi6LqooC3mt1GNvQct0MnEJdy1Zx3
 kbIw==
X-Gm-Message-State: AJIora/dRRl1r+4vJ01Ea9VNG7npkm63bETwC1QwPWeAse9ES+git++a
 RavO1J5HbOGffZ3a48mffS+bQjeOkorGyCpKnDRvXFYn0dttJg==
X-Google-Smtp-Source: AGRyM1uu+/HyofS/T9LiD0hZy+prRAFH79lqk/3dp9t7bkNAKjbni1hhokI/j2nk2cO6VQQlr7p1vT5RtOz5swwrbWg=
X-Received: by 2002:ac2:544a:0:b0:48a:7195:1224 with SMTP id
 d10-20020ac2544a000000b0048a71951224mr784148lfn.519.1658471160287; Thu, 21
 Jul 2022 23:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220721144939.1265027-1-ardeleanalex@gmail.com>
 <20220721181648.7eedcb41@windsurf>
In-Reply-To: <20220721181648.7eedcb41@windsurf>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Fri, 22 Jul 2022 09:25:49 +0300
Message-ID: <CA+U=DsqEoXWjdBNFUQVLLWhABgqcFVLCF8FicwHw96Rq=bN3OA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TX3ylvoT63RoY1BE4f7WhxGKbFA5YIk9sXXTj3SlMFs=;
 b=Ooxrwi2s/PK+lNyS9F+UGa5OGYaQgYDHahVVl5+fJCAwnKwEZRuYAitSaQFJ0ZGnp9
 kzUgHooKKv+NM0Xe2hfRuh1uIiOcOEen5h+iRmGwXOAvIh29KvseziOZ7YVxPoD4oNup
 hzkAFTsSgHTXjxL0j2YSa+hYg9rXP6+5NPnsn1OwdQXPFXGYbMoCM6S6Io3Jxl24tUzI
 w1TijcE6eZhQNKzbE9WwH1MdohRqFBrl1pbB3yuqsFrmlq4AwIj/ASLpNK3rdufK+0vx
 V3mg2bucPkzQR68xQpGeqp7fTsSOcq5QIy8e0AmCeyfnwRQz6vixFG0MoQ/MRr0IhwOr
 KRZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ooxrwi2s
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

On Thu, Jul 21, 2022 at 7:16 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Alexandru,
>
> On Thu, 21 Jul 2022 17:49:39 +0300
> Alexandru Ardelean <ardeleanalex@gmail.com> wrote:
>
> > When building with DRM support, it can happen that the libgbm library
> > is not yet built by the provider of libgbm (specified by
> > BR2_PACKAGE_PROVIDES_LIBGBM).
> >
> > The docs in cog `docs/platform-drm.md` specify this dep-list:
> > - **WPEBackend-fdo**:
> > - **Wayland**:
> > - **libdrm**:
> > - **libgbm**:
> > - **libinput**:
> > - **libudev**:
> >
> > libgbm needs to be added, whereas `libudev` is provided by systemd (in my
> > case).
>
> Then udev should also be in the dependencies when
> BR2_PACKAGE_COG_PLATFORM_DRM=y.
>
> >  ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
> >  COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> > -COG_DEPENDENCIES += libdrm libinput
> > +COG_DEPENDENCIES += libdrm libinput libgbm
>
> That is correct, but not complete. The DRM platform code in Cog also
> uses EGL, so we would also need libegl in the list of dependencies. In
> pratice, libgbm and libegl are most likely implemented by the same
> package, but for the sake of correctness, it would be better to have
> both.
>
> Another thing that is wrong is:
>
>         depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
>
> in the Config.in file. This used to be the only way to detect the
> availability of gbm, but since quite some time now, we have the libgbm
> virtual package.
>
> So this should be instead:
>
>         depends on BR2_PACKAGE_HAS_LIBGBM

So, I'm assuming a V2, would contain adding BR2_PACKAGE_HAS_LIBGBM to
the Config.in and libegl to the DEPENDENCIES var.

I can also do the second version, after the fix is agreed upon.
But no promises :)

>
> and I'm pretty sure Cog uses some "advanced" features of libgbm, so
> most likely at least depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> is needed, and probably also depends on
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT is needed.
> See package/opengl/libgbm/Config.in for details.
>
> Of course, this aspect should be in a different patch: your change to
> add "libgbm" in the DEPENDENCIES variable is really a fix, while my
> proposed change in the Config.in file is really an improvement, that
> will allow using Cog on libgbm-capable platforms that don't use mesa3d
> as their OpenGL/libgbm implementation.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
