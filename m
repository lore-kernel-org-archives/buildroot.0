Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F277BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 14:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CD64400F3;
	Tue,  7 Dec 2021 14:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9JiO8J74KX1; Tue,  7 Dec 2021 14:50:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4702940142;
	Tue,  7 Dec 2021 14:50:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0C441BF304
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 14:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF09640142
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 14:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id twb83_eyMOv0 for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 14:50:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 772B9400F3
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 14:50:45 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so18326508otu.10
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 06:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wq9FpWr6uAh04eLFfYInGqy5DQ6KTPXZaijb+osIARM=;
 b=B0TLa+Oqh2B0FrLv2V1Bcp1A5dvKnWGMlL39yUBbDTioJRg4iWEW//xHpwePlsdTAa
 3h7tu2JDxXQEhJgd8zmFohAa6KlOVH5ETiF7SUupdBUBsWzeOr7GSyMPGE9oFCYqrIkF
 71l+ST5zYfo7P7VaI+8FPDvXLe7YkVp+Zop4N3hwZqbwNZwCmsi2YeSZioT6q/DSiyXb
 rCjA1vtM7xv15amuaI0BWrmY3MYovwMIc0iae4BM4Ylb6Wzs05Gh0eOFN6fnLG6yTBVh
 hCctsvVSg79fGwg7tIBDzrn0Eo/Z/4yudouDn1EZtWkh8YWU4E4oD8HzEb1aV2PrMLjR
 URxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wq9FpWr6uAh04eLFfYInGqy5DQ6KTPXZaijb+osIARM=;
 b=PFVr98VfFETh6NUjSt3mh3ciBpoLbrADlf7L5ncGUblcb/kKPHCehGr/Thbe85duig
 7dQte/rkJAKU/SupNr19b6ZEFBfi+VRW2+Aap1rS8JWuoQgerTMZQpD12devemwrUBG/
 kT8XS9BhPDbVyEj/ipJxNL6K0YHH9yVw51EKPSqeh+FBehrb0IEH60WH6461NbsYAQ5Q
 0YrPmdIxTUeMk/YufJIZbbBp5w+UvfCq1MsD/OK5MD6wYuQpNc9rFDsc8vh3WrAnRbZS
 Dl7EKTKfaqt49tJtLI9mWBsOli0fjULSqFF1/Ne3zsm3OoG0PL6+CvqyiU9pLKzYOxoZ
 1ZYA==
X-Gm-Message-State: AOAM531Hut1YO/4kvE/I/03PAf95FSDfjnuX9EGRvPZxtuvfcwh+h6aP
 tbFOrnku37+pipmKQoVGEcjy5VErQuMRskxUrCY34GjVqeI=
X-Google-Smtp-Source: ABdhPJwos2MbO6bIYD526viIFvSBZBNyoFPQH4b1lUtO7KTRy0RZprzGZmdpZFNK5vmsj3Uen3n+rQqPimsDRaY8uzI=
X-Received: by 2002:a9d:6c54:: with SMTP id g20mr36131793otq.30.1638888644408; 
 Tue, 07 Dec 2021 06:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20211124212101.3037723-1-aperez@igalia.com>
In-Reply-To: <20211124212101.3037723-1-aperez@igalia.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 7 Dec 2021 07:50:33 -0700
Message-ID: <CADvTj4o7qGJyApdFrrPyjWNvWyO4Tidf9SeSmyryc6KvyBY6fA@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/cog: bump to verion 0.12.0
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Nov 24, 2021 at 2:21 PM Adrian Perez de Castro
<aperez@igalia.com> wrote:
>
> This new release includes a number of improvements. Release notes:
>
>   https://wpewebkit.org/release/cog-0.12.0.html
>
> Small tweaks were needed due to the "fdo" platform backend being renamed
> as "wl"; the symbol is kept as BR2_PACKAGE_COG_PLATFORM_FDO to avoid
> breaking existing configurations. Also the new version supports building
> with libsoup3, which is not yet packaged in Buildroot, so -DUSE_SOUP2=ON
> is always passed to CMake.
>
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/cog/Config.in | 4 ++--
>  package/cog/cog.hash  | 8 ++++----
>  package/cog/cog.mk    | 9 +++++----
>  3 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/package/cog/Config.in b/package/cog/Config.in
> index 5f00c5a2dd..d4238750f9 100644
> --- a/package/cog/Config.in
> +++ b/package/cog/Config.in
> @@ -28,12 +28,12 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
>           must be always specified in the command line.
>
>  config BR2_PACKAGE_COG_PLATFORM_FDO
> -       bool "FreeDesktop.org backend"
> +       bool "Wayland backend"
>         default y
>         select BR2_PACKAGE_LIBXKBCOMMON
>         select BR2_PACKAGE_WAYLAND_PROTOCOLS
>         help
> -         Enable the FreeDesktop.org backend. Cog will interface with
> +         Enable the Wayland backend. Cog will interface with
>           a compositor over the Wayland protocol.
>
>  config BR2_PACKAGE_COG_PLATFORM_DRM
> diff --git a/package/cog/cog.hash b/package/cog/cog.hash
> index 3abc5f2c83..6a9af1845d 100644
> --- a/package/cog/cog.hash
> +++ b/package/cog/cog.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/cog-0.10.1.tar.xz.sums
> -md5  b997da3c143bc34ec5e953eb7e7ccefc  cog-0.10.1.tar.xz
> -sha1  f25312141de918f41add3e3c9984faa985cda0a9  cog-0.10.1.tar.xz
> -sha256  aecf546d7b0645119d79559c5574cb5eb68364fc8409dfbd47a4920bd1f221bc  cog-0.10.1.tar.xz
> +# From https://wpewebkit.org/releases/cog-0.12.0.tar.xz.sums
> +md5  30d6f68914af0ba5c32ac14df504215a  cog-0.12.0.tar.xz
> +sha1  de367b33fb45a1bca9e443ca5c1d6cae3833d759  cog-0.12.0.tar.xz
> +sha256  aad413a8aaf15d400d70f9c909a28b92b138f7b0c0d825978de8788d0d75208a  cog-0.12.0.tar.xz
>
>  # Hashes for license files:
>  sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index 07b8e245ef..606374d9c3 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -COG_VERSION = 0.10.1
> +COG_VERSION = 0.12.0
>  COG_SITE = https://wpewebkit.org/releases
>  COG_SOURCE = cog-$(COG_VERSION).tar.xz
>  COG_INSTALL_STAGING = YES
> @@ -16,13 +16,14 @@ COG_CONF_OPTS = \
>         -DCOG_PLATFORM_HEADLESS=ON \
>         -DCOG_WESTON_DIRECT_DISPLAY=OFF \
>         -DINSTALL_MAN_PAGES=OFF \
> -       -DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
> +       -DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
> +       -DUSE_SOUP2=ON
>
>  ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
> -COG_CONF_OPTS += -DCOG_PLATFORM_FDO=ON
> +COG_CONF_OPTS += -DCOG_PLATFORM_WL=ON
>  COG_DEPENDENCIES += libxkbcommon wayland-protocols
>  else
> -COG_CONF_OPTS += -DCOG_PLATFORM_FDO=OFF
> +COG_CONF_OPTS += -DCOG_PLATFORM_WL=OFF
>  endif
>
>  ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
> --
> 2.34.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
