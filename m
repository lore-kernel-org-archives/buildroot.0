Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F8AECAAD1
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 20:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EE6F825D3;
	Sat, 27 Aug 2022 20:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EE6F825D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pjocA9md7qB; Sat, 27 Aug 2022 20:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9569A82503;
	Sat, 27 Aug 2022 20:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9569A82503
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73C4F1BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F1C460E08
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1C460E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-qSh0XoqfGD for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 20:45:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AEC560E30
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AEC560E30
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 20:45:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 47F32780508;
 Sat, 27 Aug 2022 22:45:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 22:45:47 +0200
Date: Sat, 27 Aug 2022 22:45:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827204547.GD37358@scaer>
References: <20220827203557.272100-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827203557.272100-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661633151;
 bh=8Lp4tNnyS34YFTIbiWSQYj9dj2hL03eV4HwkOjekESM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MfDCdSb2iE6pqDlJ4VFiJzNhzHdkN1UdezvW/tHDy4ukUBz1WJriJVohFstxUlrl1
 aQxLQ6e+AQEl/yHu2sW+WC1OXViyoAbYlttym+csZ2oHnvyE0vDpEljc8f2MZNr39J
 0nSuf7yb9lXo7/A9Lin8doaEotATN0kZbzabfoUrBA2iv6xIjLsxQvkmDp7T+G8kdj
 vMP9vAwuOgcanYA4EC8R40IB+0YYKYxjZ1fR4fRPvJYXbYyMWVUOKqPJwqkPCKPYbM
 uGT6VVUfTvowAyzW2a0H6U7sfFuautT8RClEUwLAA7clpE0r7i4IIydpwc21rV1iZn
 IJmCmcT41U2cQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MfDCdSb2
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: needs gcc >= 8
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-27 22:35 +0200, Fabrice Fontaine spake thusly:
> libcamera needs gcc >= 8 since bump to
> 8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98 in commit
> 64f67ede01699c47ca3c8801ae5dd440295f1874 and
> https://git.libcamera.org/libcamera/libcamera.git/commit/?id=a7ab5ef1d2f9b05056db450e631a99a73382d589:
> 
> ../output-1/build/libcamera-ba6435930f08e802cffc688d90f156a8959a0f86/meson.build:82:8: ERROR: Problem encountered: gcc version is too old, libcamera requires 8.0 or newer
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f8eba0e564d03b83fcda4085baec16a4857c7d25
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcamera-apps/Config.in | 6 +++---
>  package/libcamera/Config.in      | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
> index 492a99cf55..711fd6de05 100644
> --- a/package/libcamera-apps/Config.in
> +++ b/package/libcamera-apps/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
>  	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
>  	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libcamera
>  	depends on !BR2_STATIC_LIBS # gnutls/libcamera
>  	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
>  	select BR2_PACKAGE_BOOST
> @@ -24,7 +24,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
>  
>  	  https://github.com/raspberrypi/libcamera-apps
>  
> -comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
> +comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
>  	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index 0febfef4bc..63c06173db 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -10,7 +10,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
>  	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
>  	depends on !BR2_STATIC_LIBS # gnutls
>  	depends on BR2_USE_WCHAR # gnutls
>  	select BR2_PACKAGE_GNUTLS
> @@ -92,7 +92,7 @@ comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads
>  
>  endif # BR2_PACKAGE_LIBCAMERA
>  
> -comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
> +comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
>  	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
> -- 
> 2.35.1
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
