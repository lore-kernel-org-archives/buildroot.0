Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF4CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C65D6111D;
	Tue, 29 Mar 2022 20:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jm-2qM71Odt2; Tue, 29 Mar 2022 20:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C94D61039;
	Tue, 29 Mar 2022 20:10:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54F1D1BF2E3
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C17284340
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fHrgL5Nt70l6 for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:10:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56702842D0
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:10:24 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-df26ea5bfbso2341538fac.1
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZmSD8uiBMsgoyWb7H2fs1l22tZLxQ/42dmLTATqRoes=;
 b=SSRhmeyJLFd582icstWz7JReJCk+bauFdeR2QZQwT8R2ZUqHtZ3Wo31+hy4DkZE4lN
 IqD+zMFjta0T20hudSSxrl8vkdUIHahXsfFWeR9MECIL7A3mhShNvgRi3ms94E2iu1F/
 THyxc1hj1VcZag9+UgAqiKYB6NGNQ7ERhVl3icHAA5P0ooQiii9AgjpKa7BryEp3MunR
 9LWpwvY/QM/mk9IoZ/nAwNZd0RWhVR0nUnX0RTes+vLBRdcldiPxGO/E4JmovxfeKTVx
 KWE1FNV+K1Pd30wR1/KQlIWWku+6NjcBSdg4KAOq39PeUQ5zI3t9tAthN/iwOD6zpgG7
 /vIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZmSD8uiBMsgoyWb7H2fs1l22tZLxQ/42dmLTATqRoes=;
 b=lyhjyQqd8wK3uMX/w7mqXtlHeV9UA1cyVPZLRQfF2j6g+ycwqc8W2tb2ipNlCDIGdk
 jjeNK0VxXMyDy74/puhL6gWNSy7YDZRiFkvLOZIwXARbWtxo7vA1ZrROhLUA7PuuJUhM
 iGBbCgACmGlRsydq9hxi/TwenPTaITdZ0LIdaVf1OrUwNW4L63ETtRJLtqFaF26niqJE
 G1MMgmjw93P8Ytq0J3xibQw+6EyjknXllcZtQNymxfugIZdZyT11A4Jt5mHorwK7AOn0
 jDNd42TMlQQCjFYrB64rBL1AXpJQjw3AILGjtz73Ez5E5if7lSnBoRTKeyLE2a5JtqZg
 K3BA==
X-Gm-Message-State: AOAM532UHqAvo6AwS41AYv3QK15nB+37VSlJufEfZ30wN35G4LGUsUst
 87Oglp55k3HN/FpbsqS4yVmA0puSnkH5g2tyxJuSbmuZWHw/sA==
X-Google-Smtp-Source: ABdhPJw1xjnPExHkDdqsgyV+roB3/qPQlJ0neIcwlDoZnM2A6Jf1+RVupwKIR/NrOXdDHfbITS8DO+UZNEBcoBQJrtM=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr526107oaa.200.1648584623300; Tue, 29
 Mar 2022 13:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220329185059.943889-1-alseycmiller@gmail.com>
 <A770A102-397D-4194-B7CA-FA413C944812@gmail.com>
 <CADvTj4oQxty5MOVPmjXcQXOGXgdFn=LAF4WsgC8Ntf8Q6h-wng@mail.gmail.com>
 <6DD9DC86-9DF3-4CF8-9D7E-92F238643AA6@gmail.com>
In-Reply-To: <6DD9DC86-9DF3-4CF8-9D7E-92F238643AA6@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 29 Mar 2022 14:10:12 -0600
Message-ID: <CADvTj4rQnote1-uhWj6SEuddjFoEt2sPmcAnvR=_1ugrtve81A@mail.gmail.com>
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

On Tue, Mar 29, 2022 at 1:58 PM Alsey Miller <alseycmiller@gmail.com> wrote:
>
> That commit is not merged and only seems to override the C flags. How can we force cmake to use Clang for target packages? I would be fine with basing my work that patch if support for using Clang and as the C and C++ compiler is added.

It should allow overriding any of the toolchain variables like this:
https://patchwork.ozlabs.org/project/buildroot/patch/20220322232224.2842266-6-james.hilliard1@gmail.com/

I think this will pretty much work as is with your libdispatch patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20220329185059.943889-2-alseycmiller@gmail.com/

It should allow you to drop this part:
LIBDISPATCH_SUPPORTS_CMAKE_TOOLCHAIN = NO

You might also be able to drop some of the other conf opts since the toolchain
file can then still be used with partial overrides.

>
> > On Mar 29, 2022, at 12:26 PM, James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > On Tue, Mar 29, 2022 at 1:18 PM Alsey Miller <alseycmiller@gmail.com> wrote:
> >>
> >> This change is necessary because if you specify the toolchain it will always use the GCC toolchain and C flags instead of the Clang cross compiler  and custom C flags. This is not an issue for host packages, only for target.
> >
> > I think this is probably a better way of dealing with the issue:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20220322232224.2842266-5-james.hilliard1@gmail.com/
> >
> >>
> >>> On Mar 29, 2022, at 11:50 AM, Alsey Coleman Miller <alseycmiller@gmail.com> wrote:
> >>>
> >>> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
> >>> ---
> >>> package/pkg-cmake.mk | 25 ++++++++++++++++++++++++-
> >>> 1 file changed, 24 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> >>> index 3b1db35fb6..9b36ee2b47 100644
> >>> --- a/package/pkg-cmake.mk
> >>> +++ b/package/pkg-cmake.mk
> >>> @@ -57,7 +57,7 @@ $(2)_INSTALL_STAGING_OPTS   ?= DESTDIR=$$(STAGING_DIR) install/fast
> >>> $(2)_INSTALL_TARGET_OPTS      ?= DESTDIR=$$(TARGET_DIR) install/fast
> >>>
> >>> $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
> >>> -
> >>> +$(3)_SUPPORTS_CMAKE_TOOLCHAIN ?= YES
> >>>
> >>> ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
> >>> $(2)_BUILDDIR                 = $$($(2)_SRCDIR)
> >>> @@ -82,6 +82,7 @@ ifeq ($(4),target)
> >>> #   documented as a standard CMake variable. If a package supports it,
> >>> #   it must handle it explicitly.
> >>> #
> >>> +ifeq ($(3)_SUPPORTS_CMAKE_TOOLCHAIN),YES)
> >>> define $(2)_CONFIGURE_CMDS
> >>>      (mkdir -p $$($$(PKG)_BUILDDIR) && \
> >>>      cd $$($$(PKG)_BUILDDIR) && \
> >>> @@ -104,6 +105,28 @@ define $(2)_CONFIGURE_CMDS
> >>>      )
> >>> endef
> >>> else
> >>> +define $(2)_CONFIGURE_CMDS
> >>> +     (mkdir -p $$($$(PKG)_BUILDDIR) && \
> >>> +     cd $$($$(PKG)_BUILDDIR) && \
> >>> +     rm -f CMakeCache.txt && \
> >>> +     PATH=$$(BR_PATH) \
> >>> +     $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> >>> +             -DCMAKE_INSTALL_PREFIX="/usr" \
> >>> +             -DCMAKE_COLOR_MAKEFILE=OFF \
> >>> +             -DBUILD_DOC=OFF \
> >>> +             -DBUILD_DOCS=OFF \
> >>> +             -DBUILD_EXAMPLE=OFF \
> >>> +             -DBUILD_EXAMPLES=OFF \
> >>> +             -DBUILD_TEST=OFF \
> >>> +             -DBUILD_TESTS=OFF \
> >>> +             -DBUILD_TESTING=OFF \
> >>> +             -DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
> >>> +             $$(CMAKE_QUIET) \
> >>> +             $$($$(PKG)_CONF_OPTS) \
> >>> +     )
> >>> +endef
> >>> +endif
> >>> +else
> >>>
> >>> # Configure package for host
> >>> define $(2)_CONFIGURE_CMDS
> >>> --
> >>> 2.35.1
> >>>
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@buildroot.org
> >> https://lists.buildroot.org/mailman/listinfo/buildroot
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
