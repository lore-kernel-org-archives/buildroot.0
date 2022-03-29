Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD711C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 19:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FD5D41825;
	Tue, 29 Mar 2022 19:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gj60rCgVxpGr; Tue, 29 Mar 2022 19:26:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAC94417BD;
	Tue, 29 Mar 2022 19:26:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3AF91BF83B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD1F2417BD
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qh5UxYPxiuvA for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 19:26:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55E2A417BA
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 19:26:47 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-df22f50e0cso2539769fac.3
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 12:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tt+bEjQK1mmLIx7NvSSA89F3wdaSTd5J6z6W4qPBIz4=;
 b=K+FUcmuqxDjVX2Jm/WU5T0dnxH8Uz+6KNRQDivmoX9iSrQq3M1dLBcJdqtMdzDz1XM
 bJPeUgErDyNCyM2yAn1wHpNKzm3xtfo6cCel6yk0GO61Af65xDnK2gcanGI8jDwysmF1
 eM7x0NHZs/PTb6E++17Tm/dTiTBssi4kZ3iUzfsTEV3zZJ+yUskd6gVuMc/WEJxFdHXX
 mzJwZNdffCpKjGxLHWsJQikVFPM3NQ+nxHN0LgzfuGba/mXae4cfTVt2Xwpp7Xm25nef
 DzYLLP7qbRhuvKBSr2WVeItPIUcCJosb5wBb7CIiYk0ClfoK9QryeuJ8Z0CfCVgpNEee
 QtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tt+bEjQK1mmLIx7NvSSA89F3wdaSTd5J6z6W4qPBIz4=;
 b=R0u+gu5eoE0MncmVoKdo+M8HWz2PB9h3YcLc05ln3nZfti+NfnN/hU9FnOH31/28uY
 /+oqtf+43SO1XvkqHJBWxEeasgJOn4g9E4RuD4eNKNkqtywa9d4vlFBTmeDilPPx26W3
 QSCowJp4Kr00uDD5aidEFm3MyMal4a5sIu0r0W2VrEJIeMuJ566CD2zrBtIvCJqwyNBS
 x3oeGO9gTpKof4IM2WR3xp1kITxbSewUPXuZ9WejjP3Ltxlm7CkE27N5QqgqngKy9UBF
 A6Y2FCxrhHYMXC2tZoQ9QJsVrN8yLjmVQGzmYnsrXkTXTTyv0vH/xDHpINoGWerstjbP
 cK0A==
X-Gm-Message-State: AOAM533De7Y0JJovWaTxxHSQKxWvRoyNsgp+GvOYDzXG41RIInzBcVbK
 YSfSeVKZj9jYVixycstZJEc4YXaUVD32zK5VzvS5cwNmPHauow==
X-Google-Smtp-Source: ABdhPJzNMExqX1krzZ2Qf9Sgk8WA7q9KdlHo6VPBrZhplAX3dGa+hJyFP59wdzS0tQq85KXmgScic5hTDS4wiHNBk/Q=
X-Received: by 2002:a05:6870:d0c4:b0:dd:c7f6:2d62 with SMTP id
 k4-20020a056870d0c400b000ddc7f62d62mr423885oaa.99.1648582006065; Tue, 29 Mar
 2022 12:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220329185059.943889-1-alseycmiller@gmail.com>
 <A770A102-397D-4194-B7CA-FA413C944812@gmail.com>
In-Reply-To: <A770A102-397D-4194-B7CA-FA413C944812@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 29 Mar 2022 13:26:35 -0600
Message-ID: <CADvTj4oQxty5MOVPmjXcQXOGXgdFn=LAF4WsgC8Ntf8Q6h-wng@mail.gmail.com>
To: Alsey Miller <alseycmiller@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/4] package/pkg-cmake: allow overriding
 toolchain
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Mar 29, 2022 at 1:18 PM Alsey Miller <alseycmiller@gmail.com> wrote:
>
> This change is necessary because if you specify the toolchain it will always use the GCC toolchain and C flags instead of the Clang cross compiler  and custom C flags. This is not an issue for host packages, only for target.

I think this is probably a better way of dealing with the issue:
https://patchwork.ozlabs.org/project/buildroot/patch/20220322232224.2842266-5-james.hilliard1@gmail.com/

>
> > On Mar 29, 2022, at 11:50 AM, Alsey Coleman Miller <alseycmiller@gmail.com> wrote:
> >
> > Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
> > ---
> > package/pkg-cmake.mk | 25 ++++++++++++++++++++++++-
> > 1 file changed, 24 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index 3b1db35fb6..9b36ee2b47 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -57,7 +57,7 @@ $(2)_INSTALL_STAGING_OPTS   ?= DESTDIR=$$(STAGING_DIR) install/fast
> > $(2)_INSTALL_TARGET_OPTS      ?= DESTDIR=$$(TARGET_DIR) install/fast
> >
> > $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
> > -
> > +$(3)_SUPPORTS_CMAKE_TOOLCHAIN ?= YES
> >
> > ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
> > $(2)_BUILDDIR                 = $$($(2)_SRCDIR)
> > @@ -82,6 +82,7 @@ ifeq ($(4),target)
> > #   documented as a standard CMake variable. If a package supports it,
> > #   it must handle it explicitly.
> > #
> > +ifeq ($(3)_SUPPORTS_CMAKE_TOOLCHAIN),YES)
> > define $(2)_CONFIGURE_CMDS
> >       (mkdir -p $$($$(PKG)_BUILDDIR) && \
> >       cd $$($$(PKG)_BUILDDIR) && \
> > @@ -104,6 +105,28 @@ define $(2)_CONFIGURE_CMDS
> >       )
> > endef
> > else
> > +define $(2)_CONFIGURE_CMDS
> > +     (mkdir -p $$($$(PKG)_BUILDDIR) && \
> > +     cd $$($$(PKG)_BUILDDIR) && \
> > +     rm -f CMakeCache.txt && \
> > +     PATH=$$(BR_PATH) \
> > +     $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> > +             -DCMAKE_INSTALL_PREFIX="/usr" \
> > +             -DCMAKE_COLOR_MAKEFILE=OFF \
> > +             -DBUILD_DOC=OFF \
> > +             -DBUILD_DOCS=OFF \
> > +             -DBUILD_EXAMPLE=OFF \
> > +             -DBUILD_EXAMPLES=OFF \
> > +             -DBUILD_TEST=OFF \
> > +             -DBUILD_TESTS=OFF \
> > +             -DBUILD_TESTING=OFF \
> > +             -DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
> > +             $$(CMAKE_QUIET) \
> > +             $$($$(PKG)_CONF_OPTS) \
> > +     )
> > +endef
> > +endif
> > +else
> >
> > # Configure package for host
> > define $(2)_CONFIGURE_CMDS
> > --
> > 2.35.1
> >
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
