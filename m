Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9FFC32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 15:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D9E841D12;
	Sat, 24 Sep 2022 15:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D9E841D12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X_mCBFPoT1FC; Sat, 24 Sep 2022 15:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAB5A41C1E;
	Sat, 24 Sep 2022 15:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAB5A41C1E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4952D1BF852
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 15:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A85960BB2
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 15:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A85960BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfYiWa-L-r62 for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 15:37:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF6E66077D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF6E66077D
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 15:37:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:139f:51c2:7bd0:4f35])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3F46413F8DB;
 Sat, 24 Sep 2022 17:37:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Sep 2022 17:37:29 +0200
Date: Sat, 24 Sep 2022 17:37:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220924153729.GF1127102@scaer>
References: <20220924150726.1402747-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220924150726.1402747-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664033860;
 bh=0LW7VGm8cqwofqnfQRSRbGgc78Cq5seVeSqLIkFuTVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l/HPJFirQ8lYLgQvoaRgLCc0oPh/6Rky44LeMFTuJIeLSkglB7qu9FvJ6XVtikeZk
 Q5JeRgfj+OR34B1tD48yDR0pKHBB/Ql2n4U5q6Y0j2Se/Iru5RvC3TYlsGkwMpPQS8
 XBhHQ/+GQbEDmTxsZOdKcbh3YkgUBa7YXAg6G51O/QjAHw7rp7edIahHa9tNH7ODFo
 4Uj9JrRzhAxGu0C9vdhaGnG1iQXHDuvf4cat20NG8tyQCXrh1DdtyW0KM4T9/gSsgd
 CBSoymgFGAntbqWvVRnHyiUpyXLgDZIWkoEHEZmTuLJxUgeJgeKT5cUm2JZsIp3BR8
 kCwclYyzrSa6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l/HPJFir
Subject: Re: [Buildroot] [PATCH] package/opengl/libegl: remove
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Buildroot List <buildroot@buildroot.org>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-09-24 17:07 +0200, Thomas Petazzoni spake thusly:
> Since Wayland 15 (upstream commit

I guess you meant wayland 1.15.0 ? ;-)

[--SNIP--]
> diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
> index a8617a939b..e4a9dde0a0 100644
> --- a/package/nvidia-driver/Config.in
> +++ b/package/nvidia-driver/Config.in
> @@ -26,7 +26,6 @@ config BR2_PACKAGE_NVIDIA_DRIVER_XORG
>  	select BR2_PACKAGE_XLIB_LIBXEXT
>  	select BR2_PACKAGE_HAS_LIBGL
>  	select BR2_PACKAGE_HAS_LIBEGL
> -	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND

So, what I understood from upstream commit log, was that NVIdia driver
does have a libwayland-egl, but our nvidia-driver does not install one.

So, there seems to be no conflict. Still, this is strange that our
nvidia-driver did select BR2_PACKAGE_HAS_LIBEGL_WAYLAND without
installing libwayland-egl.so...

[--SNIP--]
> diff --git a/package/vte/Config.in b/package/vte/Config.in
> index 45d627885f..8a231a21af 100644
> --- a/package/vte/Config.in
> +++ b/package/vte/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_VTE
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +	depends on BR2_PACKAGE_HAS_LIBEGL || \

I am not sure this is equivalent in this case: indeed, it is possivble
to have EGL without having wayland enabled, and there currently is
nothing that enforces wayland to be enabled for vte, even conditionally.

[--SNIP--]
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 3b4e932b7d..cba0469d16 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -152,16 +152,16 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
>  	depends on BR2_USE_WCHAR # pango
>  	depends on BR2_PACKAGE_HAS_LIBGLES
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_PANGO
>  	help
>  	  This enables the installation of Weston's demo clients.
>  
> -comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland backend and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "demo clients needs an OpenGL ES/EGL provider and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
> -		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_PACKAGE_HAS_LIBEGL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  endif
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 5e71473640..1c7c8a98df 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -71,7 +71,7 @@ else
>  WESTON_CONF_OPTS += -Ddeprecated-weston-launch=false
>  endif
>  
> -ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
> +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)

Why can we drop the BR2_PACKAGE_HAS_LIBEGL entirely here?

As far as I can see and remember, the two are orthogonal (even if GLES
is in practice most often used in conjunction with EGL rather than full
GL).

Regards,
Yann E. MORIN.

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
