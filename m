Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8271C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 16:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35B2C4020B;
	Sat, 27 Jan 2024 16:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35B2C4020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q7g8kNI1T6kG; Sat, 27 Jan 2024 16:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5250403B3;
	Sat, 27 Jan 2024 16:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5250403B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 936D91BF23B
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BB114020B
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BB114020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UVHouhyAkNVG for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 16:25:12 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B5BD403B3
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 16:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B5BD403B3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1A55F13F8A9;
 Sat, 27 Jan 2024 17:25:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 17:25:06 +0100
Date: Sat, 27 Jan 2024 17:25:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <ZbUuYpIVqwwa5Csr@landeda>
References: <20240123085419.1761894-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123085419.1761894-1-aperez@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706372709;
 bh=09cBYZGydcQdX9BHO7Cn/dfObHhnMkBYV+zSUcR8xUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YuKt29NQvC+6n9HmEiRsx1V/o2cQT5D3feV7PZqtLXNWY8DpU5Gg1Upsl8h3BUS/l
 hHl40X9p21wSca7J9gqUU8Qez/mEX2sAYEQBaZcvo0EgO/JmGuYPhVRnAoMvOj0eym
 HjU8MGpGZjBQzI8N69ZDAR2x6s7MdP27IjfXX/4qCvrejGaLnxiXMdXsOL5OpH1QZd
 eCzrLqmLsoOoOXdCPjquJ++BwPidh/gn9p7I27YMCJSqjW6Y5NU/kQ1LOtszELeZGz
 5HMK2Yngo0vaNsBaGHzEeeaUVH2yNFXeylRoQ2804ZcytJSOJS77uIa7yfNJHlkzXA
 zDF3WWBug31og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YuKt29NQ
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.42.4
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

Adrian, All,

On 2024-01-23 10:54 +0200, Adrian Perez de Castro spake thusly:
> The minimum GCC version is changed to 10.x, conditionals added for
> USE_JPEGXL and USE_GBM. Both are optional and will be automatically
> enabled if the relevent packages have been enabled. GBM is recommended
> for performance, is it avoids a buffer copy on each frame rendered by
> WebKit.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Release notes:
> 
>  - https://wpewebkit.org/release/wpewebkit-2.40.4.html
>  - https://wpewebkit.org/release/wpewebkit-2.40.5.html
>  - https://wpewebkit.org/release/wpewebkit-2.42.0.html
>  - https://wpewebkit.org/release/wpewebkit-2.42.1.html
>  - https://wpewebkit.org/release/wpewebkit-2.42.2.html
>  - https://wpewebkit.org/release/wpewebkit-2.42.3.html
>  - https://wpewebkit.org/release/wpewebkit-2.42.4.html
> 
> This update covers fixes for CVE-2023-37450, CVE-2023-38133,
> CVE-2023-38572, CVE-2023-38592, CVE-2023-38594, CVE-2023-38595,
> CVE-2023-38597, CVE-2023-38599, CVE-2023-38600, CVE-2023-38611,
> CVE-2023-40397, CVE-2023-39928, CVE-2023-39434, CVE-2023-40451,
> CVE-2023-41074, CVE-2023-41993, CVE-2023-32359, CVE-2023-41983,
> CVE-2023-42852, CVE-2023-42916, CVE-2023-42917, CVE-2023-42883,
> and CVE-2023-42890.
> 
> Relevant security advisories:
> 
>  - https://wpewebkit.org/security/WSA-2023-0006.html
>  - https://wpewebkit.org/security/WSA-2023-0007.html
>  - https://wpewebkit.org/security/WSA-2023-0008.html
>  - https://wpewebkit.org/security/WSA-2023-0009.html
>  - https://wpewebkit.org/security/WSA-2023-0010.html
>  - https://wpewebkit.org/security/WSA-2023-0011.html
>  - https://wpewebkit.org/security/WSA-2023-0012.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpewebkit/Config.in      |  6 +++---
>  package/wpewebkit/wpewebkit.hash |  6 +++---
>  package/wpewebkit/wpewebkit.mk   | 16 +++++++++++++++-
>  3 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 81b66f8429..432aa4c3a3 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -16,12 +16,12 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>  
> -comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 9, host gcc >= 4.9"
> +comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 10, host gcc >= 4.9"
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
>  		|| !BR2_HOST_GCC_AT_LEAST_4_9
>  
>  comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
> @@ -37,7 +37,7 @@ config BR2_PACKAGE_WPEWEBKIT
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
>  	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	depends on BR2_USE_WCHAR # icu, libsoup3
>  	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
>  	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index aaeea2bcda..322e494c36 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,6 +1,6 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.40.3.tar.xz.sums
> -sha1  c840bd76b2c86cb8ca0d68b56598cb0abbafc727  wpewebkit-2.40.3.tar.xz
> -sha256  05b6a9cb1d7d03485e0dc41b2a8e6f99a36aea23d32ba3ecb38d0d6860747ada  wpewebkit-2.40.3.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.42.4.tar.xz.sums
> +sha1  34da38e9554586154c83fdbb5c20e353b6d97277  wpewebkit-2.42.4.tar.xz
> +sha256  8836040a3687581970b47a232b713e7023c080d5613427f52db619c29fb253a4  wpewebkit-2.42.4.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index bf0b095372..13143efb38 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WPEWEBKIT_VERSION = 2.40.3
> +WPEWEBKIT_VERSION = 2.42.4
>  WPEWEBKIT_SITE = https://wpewebkit.org/releases
>  WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>  WPEWEBKIT_INSTALL_STAGING = YES
> @@ -84,6 +84,13 @@ else
>  WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBJXL),y)
> +WPEWEBKIT_CONF_OPTS += -DUSE_JPEGXL=ON
> +WPEWEBKIT_DEPENDENCIES += libjxl
> +else
> +WPEWEBKIT_CONF_OPTS += -DUSE_JPEGXL=OFF
> +endif
> +
>  ifeq ($(BR2_INIT_SYSTEMD),y)
>  WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=ON
>  WPEWEBKIT_DEPENDENCIES += systemd
> @@ -91,6 +98,13 @@ else
>  WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
> +WPEWEBKIT_CONF_OPTS += -DUSE_GBM=ON
> +WPEWEBKIT_DEPENDENCIES += libgbm
> +else
> +WPEWEBKIT_CONF_OPTS += -DUSE_GBM=OFF
> +endif
> +
>  # JIT is not supported for MIPS r6, but the WebKit build system does not
>  # have a check for these processors. The same goes for ARMv5 and ARMv6.
>  # Disable JIT forcibly here and use the CLoop interpreter instead.
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
