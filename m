Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74066C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 18:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BF4683CCC;
	Thu, 11 Jan 2024 18:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF4683CCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1VKqXEjbz470; Thu, 11 Jan 2024 18:35:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA6784046;
	Thu, 11 Jan 2024 18:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CA6784046
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7E0D1BF255
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 792E284046
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 792E284046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rAIrpMaNl8P for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 18:35:45 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34A4183CCC
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 18:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34A4183CCC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3F3A4B00592;
 Thu, 11 Jan 2024 19:35:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 19:35:40 +0100
Date: Thu, 11 Jan 2024 19:35:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZaA0_M8cevIjVey2@landeda>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
 <20240102235957.3072102-6-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102235957.3072102-6-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704998142;
 bh=K8gWO8zJpT+c4zZNsNBP/a94Yit+sA+gYQQ+PNS7xSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s84Z/6iDM1T+pui2Ftw+TYyI6+Y5pBvT3Z6t4FDAkRoguk8uE1dT7qwqOlvOlv6Hr
 3UoyuHuZUk11xBqNC2KY+XP+hUekJlfslm+t9A7z3fW4Cpyz14B24Mw7pkUmdMjQNV
 qq10Cb2nXtLAs6ZZJoF1alIIftnvpwdBTiaiKKguue767vucZbXlaIVBRDoYXuSTJd
 /jDWtvWXCu4nYJlgSK2p2e8MVKPtBKA2egJd6oHoWnM9e/UF7MsWRcXjjctuwUieKa
 Sx3xyuPzSCaKdCKlZEb8ZwUE5JxIus2+tEkv5fDm4u3CdvD0r2RQjnNabY3rj++uHv
 DBNZRemUo6rMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s84Z/6iD
Subject: Re: [Buildroot] [PATCH v3 05/11] package/flutter-pi: bump version
 to f34d7bdbda713ba607b9625541ddfa314d9999a0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2024-01-02 16:59 -0700, Adam Duskett spake thusly:
> For f34d7bdbda713ba607b9625541ddfa314d9999a0, there is a single commit:
> ```
> Docs say it shouldn't make a difference, though in
> https://github.com/ardera/flutter-pi/issues/370 it was reported to resolve
> a memory leak on iMX6.
> ``

I am not sure singling out single upstream commits is so intersting, and
that one was not really critical (a bug fix for a memory leak does not
really warrant being singled out). So I dropped that part.

> However, there are 14 commits between the current version of d62e84 and f34d7b.
> Some highlights include:
>   - egl_gbm_render_surface: fix initialization of is_locked:
>   - src/egl_gbm_render_surface: properly fallback to surface with no modifier
>   - user input: store mt positions separately
>   - video player: Transition to READY before NULL
>   - check all malloc returns

Such a list of a few highlights is indeed pretty interesting, thanks!
I added a note below the second item, as it allows us to drop our patch.

> Users reading this commit may find a full list of changes found here:
> https://github.com/ardera/flutter-pi/commits/master/

Users interested in seeing what upstream has done will go to the upstrem
repo or homepage, whatever the package, so I dropped that part.

> In addition, commit 6a28738 introduces the charset_converter, which is a
> platform-side implementation of the charset_converter plugin found here:
> https://pub.dev/packages/charset_converter
> 
> The charset_converter plugin does the following:
> ```
> Encode and decode charsets using platform built-in converter.
> This plugin saves app package size as you don't need external charset maps or
> whole libraries like iconv. This package doesn't even contain any Dart
> dependencies. However, this comes with the dependency on the platform.
> ```
> 
> As this is a new plugin, disable it by default and enable it in the next patch
> in this series.

I trimmed that to drop te plugin description (it is not added now, so the
description is not interesting in this commit).

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...er_surface-properly-fallback-to-surf.patch | 59 -------------------
>  package/flutter-pi/flutter-pi.hash            |  2 +-
>  package/flutter-pi/flutter-pi.mk              |  3 +-
>  3 files changed, 3 insertions(+), 61 deletions(-)
>  delete mode 100644 package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
> 
> diff --git a/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch b/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
> deleted file mode 100644
> index 7a1a49b3d4..0000000000
> --- a/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 856f9849763535d62ed01b538ba23905875c93f4 Mon Sep 17 00:00:00 2001
> -From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Date: Tue, 26 Sep 2023 20:31:17 +0200
> -Subject: [PATCH] src/egl_gbm_render_surface: properly fallback to surface with
> - no modifier
> -
> -In 869fa7fcfbeb, we added a fallback to be able to create an EGL sruface
> -when the driver do not support modifiers, like the llvmpipe software
> -renderer (or like some proprietary drivers, like the MALI ones), as
> -reported in #269 [0].
> -
> -However, in c6537673c9b6, there was a big overhaul of renderer
> -infrastructure. That commit lost the with-modifiers code path and only
> -kept the without-modifiers fallback one (i.e. it only kept the call to
> -gbm_surface_create(), not to gbm_surface_create_with_modifiers()).
> -
> -Then in b0d09f5032a4, the with-modifier code path was re-instated, but
> -in a way that made it exclusive with the without-modifiers one. That is,
> -the without-modifiers code path was not a fallback to when the other
> -failed.
> -
> -Re-instate the fallback mechanism as intiially implemented.
> -
> -[0] https://github.com/ardera/flutter-pi/issues/269
> -
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> -Upstream: https://github.com/ardera/flutter-pi/pull/367
> ----
> - src/egl_gbm_render_surface.c | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/egl_gbm_render_surface.c b/src/egl_gbm_render_surface.c
> -index ce9e5e7..8a58667 100644
> ---- a/src/egl_gbm_render_surface.c
> -+++ b/src/egl_gbm_render_surface.c
> -@@ -146,6 +146,7 @@ static int egl_gbm_render_surface_init(
> -     }
> - #endif
> - 
> -+    gbm_surface = NULL;
> -     if (allowed_modifiers != NULL) {
> -         gbm_surface = gbm_surface_create_with_modifiers(
> -             gbm_device,
> -@@ -158,9 +159,10 @@ static int egl_gbm_render_surface_init(
> -         if (gbm_surface == NULL) {
> -             ok = errno;
> -             LOG_ERROR("Couldn't create GBM surface for rendering. gbm_surface_create_with_modifiers: %s\n", strerror(ok));
> --            return ok;
> -+            LOG_ERROR("Will retry without modifiers\n");
> -         }
> --    } else {
> -+    }
> -+    if (gbm_surface == NULL) {
> -         gbm_surface = gbm_surface_create(
> -             gbm_device,
> -             size.x,
> --- 
> -2.25.1
> -
> diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
> index f7148963a4..6c5371d18a 100644
> --- a/package/flutter-pi/flutter-pi.hash
> +++ b/package/flutter-pi/flutter-pi.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  e4af79c8f53c15913f52a83a221f099a2a750d023a0bc4560d0db6f15def79a2  flutter-pi-d62e84350d2869b3ec1dfb1af21bfe234c4b817f-br1.tar.gz
> +sha256  cf10ca9e26beea036ccf218e6a900de5f1f2000e00c03e7a48898c2a0c99f591  flutter-pi-f34d7bdbda713ba607b9625541ddfa314d9999a0-br1.tar.gz
>  sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
> diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
> index 27f140c177..4ec89bdfad 100644
> --- a/package/flutter-pi/flutter-pi.mk
> +++ b/package/flutter-pi/flutter-pi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLUTTER_PI_VERSION = d62e84350d2869b3ec1dfb1af21bfe234c4b817f
> +FLUTTER_PI_VERSION = f34d7bdbda713ba607b9625541ddfa314d9999a0
>  FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
>  FLUTTER_PI_SITE_METHOD = git
>  FLUTTER_PI_LICENSE = MIT
> @@ -27,6 +27,7 @@ FLUTTER_PI_CONF_OPTS = \
>  	-DENABLE_VULKAN=OFF \
>  	-DFILESYSTEM_LAYOUT=meta-flutter \
>  	-DLINT_EGL_HEADERS=OFF \
> +	-DBUILD_CHARSET_CONVERTER_PLUGIN=OFF \
>  	-DTRY_BUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF \
>  	-DTRY_BUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=OFF \
>  	-DTRY_ENABLE_OPENGL=OFF \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
