Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1FAC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 15:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 710BC60E9D;
	Mon, 22 Aug 2022 15:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 710BC60E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_lpWrE9wrok; Mon, 22 Aug 2022 15:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E8FA60B52;
	Mon, 22 Aug 2022 15:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E8FA60B52
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45E0A1BF402
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 15:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E4BD60B52
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 15:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E4BD60B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gYJYNPjbL9PJ for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 15:01:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE7C260AA7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE7C260AA7
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 15:01:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:961:575d:b2ff:71eb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C30D16013A;
 Mon, 22 Aug 2022 17:01:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 22 Aug 2022 17:01:12 +0200
Date: Mon, 22 Aug 2022 17:01:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220822150112.GD2167049@scaer>
References: <20220804221559.46394-1-thomas.petazzoni@bootlin.com>
 <20220804221559.46394-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804221559.46394-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661180476;
 bh=WfRaj2vn3pO7AFl4yjJwFdXhW9A9y9YEd3zSrpgBYMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oyMnT6pur9HR7s6DZYRpBNnDc9OknAgj+HyXb6NsjUyFkx1m63kHsksmzaFUVDuju
 NMyWa3Mj/X3kmHB5KIb7A8uSVfbyAkTYzzHnf/0YfvXrbUVQ+uEXRhZE4jxv4bmmkh
 FMhbsXU3qD5vhW1gTPiFiYK8mVBi5RcHf3qCKK8Uihbqg9chvq5Sli7dxLMGSr9O4z
 eXIWu0CTCRnSJzffA61vgggBLLhyNgrL/sdQsLyxLcv2CyhBAWwCsjjORpqp1c1IdF
 PchaCnjGi6sYBl815oAC5kwBCpS+UBG7LEs26ZausNn+Gr99iGpV/srGGNlTDhX0PG
 i5BAClQihrRsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oyMnT6pu
Subject: Re: [Buildroot] [PATCH 3/3] package/sdl2: rework KMS/DRM video
 driver dependencies
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
Cc: Michael Fischer <mf@go-sys.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-05 00:15 +0200, Thomas Petazzoni via buildroot spake thusly:
> The KMS/DRM video driver of SDL2 can currently only be enabled when
> mesa3d is the OpenGL provider, as the option has a dependency on
> BR2_PACKAGE_MESA3D_GBM. Now that we have a libgbm virtual package and
> BR2_PACKAGE_HAS_LIBGBM, we can do better.
> 
> However, this has uncovered a number of additional related issues that
> are resolved at the same time. Here are some details:
> 
>  * the 'depends on BR2_PACKAGE_LIBDRM' is changed to a select, as we
>    normally do for library dependencies. Due to this, we inherit a
>    BR2_TOOLCHAIN_HAS_THREADS dependency.
> 
>  * the 'depends on BR2_PACKAGE_MESA3D_GBM' is changed to 'depends on
>    BR2_PACKAGE_HAS_LIBGBM', and the 'mesa3d' dependency is changed to
>    'libgbm'.
> 
>  * the KMS/DRM video driver in SDL2 needs EGL (hence the additional
>    'depends on BR2_PACKAGE_HAS_LIBEGL' and the libegbl dependency is
>    added in the .mk file). But in turn, EGL support is only checked
>    when either OpenGL or OpenGLES support is enabled in SDL2, which is
>    why we add logic to select the appropriate options.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I've forward-ported the tzo other patches to thhe next bracnh, fixed the
dependencies of the comment, and applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sdl2/Config.in | 17 ++++++++++-------
>  package/sdl2/sdl2.mk   |  2 +-
>  2 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
> index 2ad45e4d00..bce7d4e272 100644
> --- a/package/sdl2/Config.in
> +++ b/package/sdl2/Config.in
> @@ -31,14 +31,17 @@ comment "X11 video driver needs X.org"
>  
>  config BR2_PACKAGE_SDL2_KMSDRM
>  	bool "KMS/DRM video driver"
> -	depends on BR2_PACKAGE_LIBDRM
> -	depends on BR2_PACKAGE_MESA3D_GBM
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +	depends on BR2_PACKAGE_SDL2_OPENGL || BR2_PACKAGE_SDL2_OPENGLES
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBDRM
>  
> -comment "KMS/DRM video driver needs libdrm"
> -	depends on !BR2_PACKAGE_LIBDRM
> -
> -comment "KMS/DRM video driver needs mesa3d w/ GBM"
> -	depends on !BR2_PACKAGE_MESA3D_GBM
> +comment "KMS/DRM video driver needs a GBM provider, OpenGL or OpenGLES support, toolchain w/threads"
> +	depends on !BR2_PACKAGE_HAS_LIBGBM || \
> +		!(BR2_PACKAGE_SDL2_OPENGL || BR2_PACKAGE_SDL2_OPENGLES) || \
> +		BR2_PACKAGE_HAS_LIBEGL || \
> +		BR2_TOOLCHAIN_HAS_THREADS
>  
>  config BR2_PACKAGE_SDL2_OPENGL
>  	bool "OpenGL (GLX)"
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index c5e7968cec..b5e09b6078 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -169,7 +169,7 @@ SDL2_CONF_OPTS += --disable-alsa
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SDL2_KMSDRM),y)
> -SDL2_DEPENDENCIES += libdrm mesa3d
> +SDL2_DEPENDENCIES += libdrm libgbm libegl
>  SDL2_CONF_OPTS += --enable-video-kmsdrm
>  else
>  SDL2_CONF_OPTS += --disable-video-kmsdrm
> -- 
> 2.37.1
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
