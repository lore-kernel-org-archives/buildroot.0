Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BA0C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C24860888;
	Sat,  8 Jan 2022 19:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZSQKMp-B582; Sat,  8 Jan 2022 19:18:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 985FB60797;
	Sat,  8 Jan 2022 19:18:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A58E21BF3C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93E3981445
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DP15wv6Rn8E4 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:18:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41E338143D
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:18:20 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id hv15so2009919pjb.5
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 11:18:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5vtvN3DJ5Gam+/cVFwn3HYZezYHGXQqqhOj+Bg3MfIk=;
 b=cecRok1K5oI7lep4bWSZ2NmF3Mrf/Nt3/0EsNj1ZO2H8UHOQUOM9FB//pTUm8XAGaI
 XsjOw6KXKZV4ABQC4c4GTODKeE/fOY+bE1Ttm4tlGRt4lT6E4P3y7z7alyzj42Jtz/Vb
 b7VBWYwmEdSqI7gS6nfjIgTK9NwNfOv3MncJRHYb/vDLInx7qBjQpQHMB7OyQNw+BJD6
 shJeH9eicaKatzRycHEPPHvcGv5EzeEEil0nab0zon3U9WRg6mgW3edEbUo/LKZ915G8
 pHHoJLgFm6sH8DaOdxU9ZH4F1IVBWVvV+MRgMbhAe+SYI3ISXCpWWWanKhkhB6VVU7Qt
 T71g==
X-Gm-Message-State: AOAM530Oz5fRtBOypzFEk5sMIUyRPvhw/i/BkvpmGDwWalv4K18MEmMu
 CPYyyCFlNNi7WljKTG4EUMwJnWxrG+XanJe3GeE=
X-Google-Smtp-Source: ABdhPJx4SsCLZjKqr8NwHYo0Uof6wV+OszXlIFqK6Mj1DwfmiCs/LayaS2y0NFi6TZlu/Iv/riGJE98h3cFPwrD2snE=
X-Received: by 2002:a65:654f:: with SMTP id a15mr9535447pgw.61.1641669499625; 
 Sat, 08 Jan 2022 11:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20201104074311.491932-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20201104074311.491932-1-fontaine.fabrice@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Jan 2022 20:18:07 +0100
Message-ID: <CACXmViaNETs9yV0F8XeGFzX2HC4-FMpwiN1vYQCMf8f9kz6HOA@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/civetweb: drop
 BR2_PACKAGE_CIVETWEB_WITH_LUA
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
Cc: Thomas Davis <sunsetbrew@sunsetbrew.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Sorry for the very slow response.

On Wed, Nov 4, 2020 at 8:44 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Drop BR2_PACKAGE_CIVETWEB_WITH_LUA and enable Lua support depending on
> BR2_PACKAGE_LUA and BR2_PACKAGE_LUAJIT
>
> It should be noted that civetweb will still use its embedded version of
> sqlite
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy             |  9 +++++++++
>  package/civetweb/Config.in   | 12 ------------
>  package/civetweb/civetweb.mk | 20 +++++++++++++++++---
>  3 files changed, 26 insertions(+), 15 deletions(-)

> +++ b/package/civetweb/civetweb.mk
> @@ -25,9 +25,23 @@ ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),)
>  CIVETWEB_COPT += -DNO_ATOMICS=1
>  endif
>
> -ifeq ($(BR2_PACKAGE_CIVETWEB_WITH_LUA),y)
> -CIVETWEB_CONF_OPTS += WITH_LUA=1
> -CIVETWEB_LIBS += -ldl
> +ifeq ($(BR2_PACKAGE_LUA),y)

You forgot about the !BR2_STATIC_LIBS dependency.

> +CIVETWEB_CONF_OPTS += WITH_LUA=1 WITH_LUA_SHARED=1

I also had to pass LUA_SHARED_LIB_FLAG='' to not get civetweb to pass
-llua5.3 or similar (we only install liblua.so*)

> +CIVETWEB_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs lua`
> +CIVETWEB_DEPENDENCIES += host-pkgconf lua
> +ifeq ($(BR2_PACKAGE_LUA_5_1),y)
> +CIVETWEB_CONF_OPTS += WITH_LUA_VERSION=501
> +else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
> +CIVETWEB_CONF_OPTS += WITH_LUA_VERSION=503
> +else ifeq ($(BR2_PACKAGE_LUA_5_4),y)
> +CIVETWEB_CONF_OPTS += WITH_LUA_VERSION=504
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)

I know that you cannot enable luajit and lua at the same time, but I
still find it easier to reason about if these two are mutually
exclusive, so I reworked it to do that.

> +CIVETWEB_CONF_OPTS += WITH_LUA=1 WITH_LUAJIT_SHARED=1
> +CIVETWEB_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs luajit`

The luajit .pc file doesn't add -ldl, so I had to maually add that as well.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
