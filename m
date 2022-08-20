Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D81DC25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 08:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF09419AA;
	Sat, 20 Aug 2022 08:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF09419AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHZSKdzYcrh2; Sat, 20 Aug 2022 08:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DDA24193B;
	Sat, 20 Aug 2022 08:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DDA24193B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 879DC1BF36A
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61990404D8
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61990404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p4i2RNqu61QQ for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 08:12:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 449D940195
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 449D940195
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 08:12:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0A0476013F;
 Sat, 20 Aug 2022 10:12:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 10:12:27 +0200
Date: Sat, 20 Aug 2022 10:12:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220820081227.GD2167049@scaer>
References: <20220804221559.46394-1-thomas.petazzoni@bootlin.com>
 <20220804221559.46394-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804221559.46394-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660983151;
 bh=9/b1o9NCX8LihbUXpuZDsg//EbPlDnxHBZUUoKtmeKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=np4M8R53EdzNc9+PwY+zKK5Ig6I1e+gJDp9fTDzVV0nvXxC8eo061/etHepxeqmQs
 OzeSxi8Z0UHf5T0hoAQVcZOkqc9bd+nQ/j1whmMwRetxHJKTN7oEZp6gm6vyyOhzYz
 wFyF9pD4GNSez5Hz++RojZcr+U6DjMHxkoym5LVw6aUwL15Mdy2urKPk6uwcK/q0CZ
 ThASr7qNWJYDFHRYCqAdxsHOyMW4ys6no2LUpOU6D5jWde2krB1uatSLYvFf6+Ug61
 rffUgqWPeeDZHNVYWCeKV7T472ZP0dynELkcFwQw8SnUTS2tSkQewZbNm4Jvf0JPg9
 7aeNMj4nH+T0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=np4M8R53
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

I think this is a feature change, so this does not fit master. However,
it can't be applied to next either as it requires the previous tw
patches.

Do, I've left this pending for later (either after we merge next back
into master, or after we merge the next -rc into next).

Regards,
Yann E. MORIN.

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
