Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C1CC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 22:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92068400A6;
	Sat, 20 Jan 2024 22:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92068400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOIRsY9Qg2UL; Sat, 20 Jan 2024 22:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 441DE40012;
	Sat, 20 Jan 2024 22:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 441DE40012
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A59181BF471
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 22:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D3BE41F6A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 22:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D3BE41F6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWPcuye4VFHB for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 22:56:21 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23B62416D0
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 22:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B62416D0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F411C13F846;
 Sat, 20 Jan 2024 23:56:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Jan 2024 23:56:15 +0100
Date: Sat, 20 Jan 2024 23:56:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZaxPj8lsqNMDsF6S@landeda>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
 <20240117225049.28443-8-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240117225049.28443-8-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705791378;
 bh=39IJ7QLeX2asFps12l6i1RfGomEt4voCA2fo/ZbLu8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZWcf5xRi86rHF/RyEVOGNQRNG9/fxcxN7LIHgGGE4LFAc0PqtT1E5gG76A++fA/1u
 ouZisu7qet3qRmiIXlHgrExRpT227L2/RvKq7/RyDxGIQjswYAfgHyQjWJReDvH0Zl
 3VppFrDeFWaJrgwLcFT4Bq4AxXrjlOX87IPWwgdE4prkT/YKaOoVkV6f4A2mNR41Si
 cu6xPCUyzhKE8k7Uzk/bh6Y//9EvCd8HH5I6xDHmz/SWXEEwfPA+7AFbkxJgH9wsUX
 owdanzBeP1pA/xuqFEIqmCWDmZPvFEGYF+SFoYuEAbfc2QFgcpVwqv9w1tb1beWH4L
 7D21HgdFs/VPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZWcf5xRi
Subject: Re: [Buildroot] [PATCH v3 07/10] package/flutter-pi/Config.in:
 propagate flutter-engine dependencies
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

On 2024-01-17 15:50 -0700, Adam Duskett spake thusly:
> As discussed with Yann, it is better to make the dependencies of
> flutter-pi verbose, even if flutter-engine and host-flutter-sdk-bin have
> eleven dependencies combined. This change clears up any ambiguity a user may
> have regarding the dependencies the flutter-pi package relies upon and why.

This patch does not really do what the commit log states. Indeed, there
is no need to "propagate flutter-engine dependencies", as the package
"depends on" flutter-engine.

What the package does, really, is invert the semantics of the dependency
to flutter-engine.

Indeed, the reasoning is that flutter-engine, by name, is an engine,
i.e. a runtime that executes applications. As such, it is more logical
that applications select flutter-engine, rather than depend on it, hence
the inversion of the dependency logic in this patch.

It also makes flutter-pi, an embedder, behave the same as
ivi-homescreen, another embedder.

So, I've eventually applied to master, with a reworded commit log,
thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-pi/Config.in | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
> index 4bbdc3cc77..bb0e3702c1 100644
> --- a/package/flutter-pi/Config.in
> +++ b/package/flutter-pi/Config.in
> @@ -1,9 +1,20 @@
>  menuconfig BR2_PACKAGE_FLUTTER_PI
>  	bool "flutter-pi"
> -	depends on BR2_PACKAGE_FLUTTER_ENGINE
> +	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
> +	depends on BR2_HOST_GCC_AT_LEAST_5 # flutter-engine
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # flutter-engine
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # flutter-engine
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # flutter-engine
> +	depends on BR2_INSTALL_LIBSTDCPP # flutter-engine
> +	depends on !BR2_STATIC_LIBS # flutter-engine, wayland
> +	depends on BR2_USE_WCHAR # flutter-engine
> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES # flutter-engine
>  	depends on BR2_PACKAGE_HAS_LIBGBM
>  	depends on BR2_PACKAGE_SYSTEMD # Event loop and dbus support
>  	depends on BR2_PACKAGE_HAS_UDEV # libinput
> +	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
> +	select BR2_PACKAGE_FLUTTER_ENGINE
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBINPUT
>  	select BR2_PACKAGE_LIBXKBCOMMON
> @@ -80,8 +91,22 @@ config BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN
>  
>  endif
>  
> -comment "flutter-pi needs flutter-engine"
> -	depends on !BR2_PACKAGE_FLUTTER_ENGINE
> +comment "flutter-pi needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5"
> +	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS \
> +		|| !BR2_USE_WCHAR || !BR2_HOST_GCC_AT_LEAST_5
> +
> +comment "flutter-pi needs a toolchain not affected by GCC bug 64735"
> +	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> +
> +comment "flutter-pi needs an OpenGL or OpenGLES backend"
> +	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
> +	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
>  
>  comment "flutter-pi needs GBM, systemd, and udev"
>  	depends on !BR2_PACKAGE_HAS_LIBGBM || \
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
