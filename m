Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69974E6FE52
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 16:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 118D3610F3;
	Fri, 22 Sep 2023 16:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 118D3610F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLIqpIrHP17f; Fri, 22 Sep 2023 16:02:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF20E6110F;
	Fri, 22 Sep 2023 16:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF20E6110F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B77871BF2B0
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 16:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F34B41DA3
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 16:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F34B41DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDBs-FvE5bKJ for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 16:01:31 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45DAC41D9A
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 16:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45DAC41D9A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:94e1:f2dc:4d87:6249])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2E85913FA4F;
 Fri, 22 Sep 2023 18:01:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 22 Sep 2023 18:01:24 +0200
Date: Fri, 22 Sep 2023 18:01:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230922160124.GQ512384@scaer>
References: <20230909075753.7471-1-thomas@devoogdt.com>
 <20230909075753.7471-2-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230909075753.7471-2-thomas@devoogdt.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695398489;
 bh=9YeBGjOP40eed7EL43wTTQIe5GoXBGuXJFOfsVE0tv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h40XNz/bIrxTexaBTA6bpX+wanxYeWiM09yt7DOwPGu9KntiOJh6Ijg2yrUJb4tJz
 AqkvcoieuQyyD5rOSGoiKy01yOF13LyASJbgOqv+pdtaP+xcQckWuITBFy3u67nnEr
 1cGgSCo4t7GodCzq7SACFdT0uOE22YMBAOIgce1b7mxuvP98SGcE6TSLYXW8b4o/Sb
 QtbFxcxMXLBBtuwWuy2YdGkQI3cFY7QF+OoOVSS0kzeZGRii9X4fSGDIrf7ZBUAljD
 B4u4N/vScKOb61u+kRBofZ1MCoYSFVC766IOtXJzqbLAusTn08xOZhXNmXlbDFEHPT
 YUE8RaBJ00/1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h40XNz/b
Subject: Re: [Buildroot] [PATCH v2 2/4] package/webkitgtk: allow both X11
 and Wayland
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
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Adrian, All,

On 2023-09-09 09:57 +0200, Thomas Devoogdt spake thusly:
> From: Adrian Perez de Castro <aperez@igalia.com>
> 
> Allow enabling support for both the X11 and Wayland backends.
> 
> This in turn needs reorganizing how desktop GL or OpenGL ES is chosen,
> as it no longer can depend on whether Wayland support is enabled: the
> BR2_PACKAGE_HAS_LIBGL and BR2_PACKAGE_HAS_LIBGLES variables are both
> checked, and ENABLE_GLES2 is set only if the package providing OpenGL
> claims only GLES is supported; otherwise desktop GL is preferred. This
> matches the existing logic.
> 
> The existing comment indicating that only one of both windowing systems
> can be enabled was wrong: the same WebKitGTK build can target both
> X11 and Wayland at the same time, as long as GTK itself has been built
> accordingly. Enabling both is the approach taken by most Linux
> distributions, and has been supported for years.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: dropped info debug line
> ---
>  package/webkitgtk/webkitgtk.mk | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 71599477f2..bb6df3d592 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -80,32 +80,32 @@ else
>  WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=OFF
>  endif
>  
> -# Only one target platform can be built, assume X11 > Wayland
> +# Use GLES if available and desktop GL is not.
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL):$(BR2_PACKAGE_HAS_LIBGLES),:y)
> +WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
> +WEBKITGTK_DEPENDENCIES += libgles
> +else
> +WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
> +endif
>  
> -# GTK3-X11 target gives OpenGL from newer libgtk3 versions
> -# Consider this better than EGL + maybe GLESv2 since both can't be built
> -# 2D CANVAS acceleration requires OpenGL proper with cairo-gl
>  ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
> -WEBKITGTK_CONF_OPTS += \
> -	-DENABLE_GLES2=OFF \
> -	-DENABLE_X11_TARGET=ON
> +WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
>  WEBKITGTK_DEPENDENCIES += libgl \
>  	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
> -else # !X11
> -# GTK3-BROADWAY/WAYLAND needs at least EGL
> -WEBKITGTK_DEPENDENCIES += libegl
> -# GLESv2 support is optional though
> -ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
> -WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
> -WEBKITGTK_DEPENDENCIES += libgles
>  else
> -# Disable general OpenGL (shading) if there's no GLESv2
> -WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
> +WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=OFF
>  endif
> -# We must explicitly state the wayland target
> +
>  ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
>  WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
> +WEBKITGTK_DEPENDENCIES += libegl
> +else
> +WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=OFF
>  endif
> +
> +# If only the GTK Broadway backend is enabled, EGL is still needed.
> +ifeq ($(BR2_PACKAGE_LIBGTK3_X11):$(BR2_PACKAGE_LIBGTK3_WAYLAND):$(BR2_PACKAGE_LIBGTK3_BROADWAY),::y)
> +WEBKITGTK_DEPENDENCIES += libegl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND)$(BR2_PACKAGE_WPEBACKEND_FDO),yy)
> -- 
> 2.34.1
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
