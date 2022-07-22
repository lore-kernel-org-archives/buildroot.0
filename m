Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFA8C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 456C640BB4;
	Fri, 22 Jul 2022 07:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 456C640BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZ2DLHpW2pmE; Fri, 22 Jul 2022 07:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 370EF40BB5;
	Fri, 22 Jul 2022 07:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 370EF40BB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 937971BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C89A41BDD
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C89A41BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fl75-2K87oID for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:05:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3203F41922
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3203F41922
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:05:29 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u19so6355703lfs.0
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 00:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fm54eQYMNxRBT+xd3aopCi+EhzZdjtz1n5lMuylpwi8=;
 b=BIhufyAXAfdORhwqhJDlNusnuHsrDRCgNQwrvTNr1o7rLeDZ0ye3lZM7S0KPrXCF6H
 GlwWsB7Q7bHqwotO3JSImtI3Khcldn96wbvbVyd1zKnAYb5PE0dwB3JyXdDvMpCONhmm
 8sAJUaP+aDCv22R20TNFCmZOAagrn3UsU6y6eMa9cWjECqcNL+viZaCI+76Vrho2v2tR
 F8HUtYtF3KACwwD8S5I57cWkdf3rWOiV/ZTBxz7WhxksRY8eAXcxtBwJSIBjr3/Ih7Lu
 AEzQnEOKDZcSFqJ3PJ7BesCBenWudlqS2VUXWkc9xBshqh/Jw6wW2AQu8KhkxV6bxCyO
 bV5g==
X-Gm-Message-State: AJIora88c0FekrIFy6bGVF8HNvv9YcORnXvswTJLwg9Rqu/QFrHsINSe
 ONLzOmmYCM6ZRhC4Q1/7fpfFLDXNHyvT/bwWh9Onf90BJpw=
X-Google-Smtp-Source: AGRyM1vabrbHIN6QS8DlH84vw0GhQu5pQWmzu0tqtYVOqGb2PJUsMzdS2skUtBWtJFJ5nfWpNobGyFxEjmTVouwDEKE=
X-Received: by 2002:a05:6512:13a6:b0:482:b947:77f7 with SMTP id
 p38-20020a05651213a600b00482b94777f7mr732845lfa.687.1658473526354; Fri, 22
 Jul 2022 00:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220721144939.1265027-1-ardeleanalex@gmail.com>
 <20220722070150.40715-1-ardeleanalex@gmail.com>
In-Reply-To: <20220722070150.40715-1-ardeleanalex@gmail.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Fri, 22 Jul 2022 10:05:15 +0300
Message-ID: <CA+U=DsoozP=w5Ew=iBFLV0F19KiHNqp1QV0rXqAqyzUMW1axoA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Fm54eQYMNxRBT+xd3aopCi+EhzZdjtz1n5lMuylpwi8=;
 b=d62ZGhgjNej1C0ZnFmXBELZv/fc9SfesJf1SkhWLkKP7jgEtMWe9oAW8MtvUdU/S6l
 MddbVOveHqmDhvXpRN/07KCX2hfHLAJCSUlJcxQyyWmB1eyv97gQ6ga+Gcb0oRIiXlPm
 6srAWO+D4gRVywEq0/WqMkAEOaRv0DeSPo2fKNzF+/sGoOZGkHtgaarS0aMGAv0VR9FK
 OIku4n4gNxI7Pptd35gaJrXcP2ZMgTCGwNcZWt347HrFwWwj0Fp6D0Hok0pKoTUocCoz
 +lMvyMXs2mIOvWSX/DswfCIuQ4jdp4pj4+kStpA8X3hAzGmP3zvQ0d0PaitsF6RCBchz
 GxBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d62ZGhgj
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Jul 22, 2022 at 10:02 AM Alexandru Ardelean
<ardeleanalex@gmail.com> wrote:
>
> When building with the DRM support, it can happen that the libgbm library
> is not yet built by the provider of this lib (specified by
> BR2_PACKAGE_PROVIDES_LIBGBM).
>
> The docs in cog `docs/platform-drm.md` specify this dep-list:
> - **WPEBackend-fdo**:
> - **Wayland**:
> - **libdrm**:
> - **libgbm**:
> - **libinput**:
> - **libudev**:
>
> libgbm needs to be added.
> Adding libegl as well.
>
> Updated package/cog/Config.in to define the dependencies (for DRM)
> according to libegl & libgbm.
>

I was sending this V2 while you (Thomas) were replying to my previous email :p

Feel free to nitpick directly on this patch.
I'm still not 100% what you would like this to be.
I'm happy to re-spin as needed ; as long as you tell me directly what to change.

> Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> ---
>  package/cog/Config.in | 9 ++++++---
>  package/cog/cog.mk    | 2 +-
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/package/cog/Config.in b/package/cog/Config.in
> index d4238750f9..484eb85c70 100644
> --- a/package/cog/Config.in
> +++ b/package/cog/Config.in
> @@ -39,7 +39,8 @@ config BR2_PACKAGE_COG_PLATFORM_FDO
>  config BR2_PACKAGE_COG_PLATFORM_DRM
>         bool "DRM backend"
>         depends on BR2_PACKAGE_HAS_UDEV # libinput
> -       depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
> +       depends on BR2_PACKAGE_HAS_LIBEGL
> +       depends on BR2_PACKAGE_HAS_LIBGBM
>         select BR2_PACKAGE_LIBDRM
>         select BR2_PACKAGE_LIBINPUT
>         help
> @@ -52,7 +53,9 @@ config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
>         help
>           Expose remote control interface on system bus
>
> -comment "DRM platform needs mesa3d w/ EGL driver and GBM"
> -       depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> +comment "DRM platform needs EGL and GBM"
> +       depends on \
> +               !BR2_PACKAGE_HAS_LIBEGL || \
> +               !BR2_PACKAGE_HAS_LIBGBM
>
>  endif
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index f2ca0af93d..da660eb7c1 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -28,7 +28,7 @@ endif
>
>  ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
>  COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> -COG_DEPENDENCIES += libdrm libinput
> +COG_DEPENDENCIES += libdrm libinput libgbm libegl
>  else
>  COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
>  endif
> --
> 2.34.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
