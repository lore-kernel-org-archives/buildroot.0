Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CF8C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 20:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4242581E43;
	Mon, 21 Nov 2022 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4242581E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IlzC2MbIoi9x; Mon, 21 Nov 2022 20:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D6A781E29;
	Mon, 21 Nov 2022 20:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D6A781E29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29A391BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 20:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 055AB405D2
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 20:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 055AB405D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vnpx-nXrK9_e for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 20:45:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2190402F5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2190402F5
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 20:45:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:187b:ecdb:c1bc:94df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A10B113F84C;
 Mon, 21 Nov 2022 21:45:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Nov 2022 21:45:34 +0100
Date: Mon, 21 Nov 2022 21:45:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221121204534.GL2516@scaer>
References: <20221121072444.3980541-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121072444.3980541-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669063536;
 bh=/uYE0TC5r3fE05ul+FmfHJeny+iEmhPE5yIzNZ0Q/HU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cKQkscDFpi9TQbw1jGD+srvbA7MLJEKjXXHY5FnOcTz8sGhQVWkq1QtvXJwOJAbCZ
 lnPgi5q9bynQmI+FT8hA4fyvrg5XacS+MniYo6IXDrwz59Q6PZbylCF0seQ2SbPSHq
 W7bh+gfRRspvFTc+Az6HX8hSn6Hw9MNlSuqdXsca6yiqhGZRgDMMJ8CCr2blCSoIG4
 yj4ijkUxyj/1170Xvu7yTXYfkbis06W5Sj7TvYwX//1KIzF0MqAqgEo2cpN7thB8p8
 bL9V0Y/3tJxORfBRRTl0lTPWkQDEGOQJrMuV8/CX/frnsJoCJrA5DisXptfYwtqq9b
 eIOpWNzTFyY6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cKQkscDF
Subject: Re: [Buildroot] [PATCH] package/sdl: add upstream security fix for
 CVE-2022-34568
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

Peter, All,

On 2022-11-21 08:24 +0100, Peter Korsgaard spake thusly:
> SDL v1.2 was discovered to contain a use-after-free via the XFree function
> at /src/video/x11/SDL_x11yuv.c.
> 
> https://github.com/advisories/GHSA-wr7h-5wm3-p3h4
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...x11yuv.c-fix-possible-use-after-free.patch | 28 +++++++++++++++++++
>  package/sdl/sdl.mk                            |  3 ++
>  2 files changed, 31 insertions(+)
>  create mode 100644 package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
> 
> diff --git a/package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch b/package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
> new file mode 100644
> index 0000000000..d7858d0f96
> --- /dev/null
> +++ b/package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
> @@ -0,0 +1,28 @@
> +From d7e00208738a0bc6af302723fe64908ac35b777b Mon Sep 17 00:00:00 2001
> +From: Ozkan Sezer <sezeroz@gmail.com>
> +Date: Sat, 18 Jun 2022 14:55:00 +0300
> +Subject: [PATCH] SDL_x11yuv.c: fix possible use-after-free
> +
> +Fixes: https://github.com/libsdl-org/SDL-1.2/issues/863
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + src/video/x11/SDL_x11yuv.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/video/x11/SDL_x11yuv.c b/src/video/x11/SDL_x11yuv.c
> +index 62698dfd..0d5754e3 100644
> +--- a/src/video/x11/SDL_x11yuv.c
> ++++ b/src/video/x11/SDL_x11yuv.c
> +@@ -374,8 +374,8 @@ SDL_Overlay *X11_CreateYUVOverlay(_THIS, int width, int height, Uint32 format, S
> + #ifdef PITCH_WORKAROUND
> + 		if ( hwdata->image != NULL && hwdata->image->pitches[0] != (width*bpp) ) {
> + 			/* Ajust overlay width according to pitch */ 
> +-			XFree(hwdata->image);
> + 			width = hwdata->image->pitches[0] / bpp;
> ++			XFree(hwdata->image);
> + 			hwdata->image = SDL_NAME(XvCreateImage)(GFX_Display, xv_port, format,
> + 								0, width, height);
> + 		}
> +-- 
> +2.30.2
> +
> diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
> index 7389cd3edb..462600debb 100644
> --- a/package/sdl/sdl.mk
> +++ b/package/sdl/sdl.mk
> @@ -13,6 +13,9 @@ SDL_CPE_ID_VENDOR = libsdl
>  SDL_CPE_ID_PRODUCT = simple_directmedia_layer
>  SDL_INSTALL_STAGING = YES
>  
> +# 0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
> +SDL_IGNORE_CVES += CVE-2022-34568
> +
>  # we're patching configure.in, but package cannot autoreconf with our version of
>  # autotools, so we have to do it manually instead of setting SDL_AUTORECONF = YES
>  define SDL_RUN_AUTOGEN
> -- 
> 2.30.2
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
