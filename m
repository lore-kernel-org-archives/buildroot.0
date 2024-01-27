Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F3BC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 16:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 090F3403B3;
	Sat, 27 Jan 2024 16:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 090F3403B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id it222_RvgIi6; Sat, 27 Jan 2024 16:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86675408C9;
	Sat, 27 Jan 2024 16:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86675408C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D091F1BF23B
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA19A83D1E
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA19A83D1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADh2XpToXrB4 for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 16:35:27 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E36C83D1C
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 16:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E36C83D1C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8D16C13F8A7;
 Sat, 27 Jan 2024 17:35:21 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 17:35:21 +0100
Date: Sat, 27 Jan 2024 17:35:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <ZbUwyVDuKfeScv7T@landeda>
References: <20231110164617.569602-1-thomas@devoogdt.com>
 <20231110164617.569602-3-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231110164617.569602-3-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706373325;
 bh=4AEzUkploGnPkpUFsEIu+hcOPVoM8W63OuUuggQeais=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lg8PLA8xuxqbDskDXeuXuTyfelJpWbxFKZjjELp+pIyyFlVko4pvL7G2rcVw/gTUJ
 TqKG1fO9lSlK49vU41/k0C2emU4Qv+8rgGcXnlxoIp1Pxwra1jCsG8OSYRPIV/fCkA
 1mKfx0GOLUIEwoc4zKmMZwrPBMIupBALTHBexh7nYV/wB3Nn867Khn1I+rlzX3HC/f
 u4MKzpHUScn24QpjF96YTeSPLqF096HKIKZyPYAxCGGX3ynjQKglxlJKSppEmToh7L
 X8LWfbUBXZmRNrbcdG1ZInL1xjTGmOss0WAjCoy79ObN4sh+SEuMFGmY7theluwuoM
 fy1JWaaRUjuLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lg8PLA8x
Subject: Re: [Buildroot] [PATCH v5 3/3] package/webkitgtk: bump to version
 2.42.2
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

Thomas, All,

On 2023-11-10 17:46 +0100, Thomas Devoogdt spake thusly:
> Update to a new major release.
> 
> Release notes:
> 
> https://webkitgtk.org/2023/09/15/webkitgtk2.42.0-released.html
> https://webkitgtk.org/2023/09/27/webkitgtk2.42.1-released.html
> https://webkitgtk.org/2023/11/10/webkitgtk2.42.2-released.html
> 
> Security notes:
> 
> https://webkitgtk.org/security/WSA-2023-0008.html
> 
> - USE_JPEGXL is enabled by default now [1], so add a libjxl if used.
> 
> - ENABLE_GLES2 has been dropped, so drop it also here [2].
>   Instead, enable USE_OPENGL_OR_ES if libgles is present. Beware that also
>   libegl is needed for USE_OPENGL_OR_ES, but that one is most of the time a
>   dependency for libgles, so leave it out here.
> 
> - Also raise the minimal GCC version to 10.2, which is required since webkitgtk-2.42.x [3].
>   Similar to commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4,
>   we do check on >= GCC 10, because we can't check on >= GCC 10.2.
> 
> [1] https://github.com/WebKit/WebKit/commit/93865414f33190c57e293a80492e10edc461d7f0
> [2] https://github.com/WebKit/WebKit/commit/cfe917fec45bf72c371087ece034feee8454f1b4
> [3] https://github.com/WebKit/WebKit/commit/133498aaee8f44443d9e3b2a08be4a4b77b93fc9
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  v2: n/a
>  v3:
>  - replace for package/webkitgtk: add a USE_OPENGL_OR_ES config option
>  - 2.42.0 needs an extra bunch of patches, so bump to immediately to 2.42.1
>  v4:
>  - fixed incomplete git massage (a ____ line splits the git message apparently)
>  - re-added patches with upstream cherry-pick and hash
>  v5:
>  - 2.42.1 needs an extra bunch of patches, so bump to immediately to 2.42.2
> ---
>  ...e-when-gstreamer-support-is-disabled.patch | 36 -------------------
>  package/webkitgtk/Config.in                   |  6 ++--
>  package/webkitgtk/webkitgtk.hash              |  6 ++--
>  package/webkitgtk/webkitgtk.mk                | 16 ++++++---
>  4 files changed, 17 insertions(+), 47 deletions(-)
>  delete mode 100644 package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
> 
> diff --git a/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
> deleted file mode 100644
> index 3fa23b215b..0000000000
> --- a/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 9b31965cdf362768e86f7e592e59e68fb3351261 Mon Sep 17 00:00:00 2001
> -From: Matt Turner <mattst88@gmail.com>
> -Date: Tue, 8 Aug 2023 16:51:25 -0700
> -Subject: [PATCH] Fix build failure when gstreamer support is disabled
> - https://bugs.webkit.org/show_bug.cgi?id=259931 https://bugs.gentoo.org/911663
> -
> -Reviewed by Carlos Alberto Lopez Perez.
> -
> -* Source/WebCore/loader/MixedContentChecker.cpp:
> -
> -Canonical link: https://commits.webkit.org/260527.429@fix-build
> -
> -(cherry picked from commit f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732)
> -
> -Upstream: https://github.com/WebKit/WebKit/commit/f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732
> -Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ----
> - Source/WebCore/loader/MixedContentChecker.cpp | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/Source/WebCore/loader/MixedContentChecker.cpp b/Source/WebCore/loader/MixedContentChecker.cpp
> -index 9b4c7fe62020..ac4733bc08bc 100644
> ---- a/Source/WebCore/loader/MixedContentChecker.cpp
> -+++ b/Source/WebCore/loader/MixedContentChecker.cpp
> -@@ -33,6 +33,8 @@
> - #include "ContentSecurityPolicy.h"
> - #include "Document.h"
> - #include "Frame.h"
> -+#include "FrameLoader.h"
> -+#include "FrameLoaderClient.h"
> - #include "SecurityOrigin.h"
> - 
> - namespace WebCore {
> --- 
> -2.42.0
> -
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index cb10784133..ace1b8739f 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -16,12 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>  
> -comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 9, host gcc >= 4.9"
> +comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 10, host gcc >= 4.9"
>  	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
>  		!BR2_HOST_GCC_AT_LEAST_4_9
>  	depends on BR2_USE_MMU
>  
> @@ -32,7 +32,7 @@ config BR2_PACKAGE_WEBKITGTK
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	depends on BR2_USE_WCHAR # icu, libsoup3
>  	depends on BR2_PACKAGE_LIBGTK3
>  	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 7f50f1aa7b..59782732c3 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://www.webkitgtk.org/releases/webkitgtk-2.40.5.tar.xz.sums
> -sha1  2f4d06b021115eb4106177f7d5f534f45b5d3b2e  webkitgtk-2.40.5.tar.xz
> -sha256  7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f  webkitgtk-2.40.5.tar.xz
> +# From https://www.webkitgtk.org/releases/webkitgtk-2.42.2.tar.xz.sums
> +sha1  05bec6a824e46f043b865478735bc8395249510e  webkitgtk-2.42.2.tar.xz
> +sha256  5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118  webkitgtk-2.42.2.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 9c68fe73cf..611d7f65d3 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.40.5
> +WEBKITGTK_VERSION = 2.42.2
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
> @@ -73,6 +73,13 @@ else
>  WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBJXL),y)
> +WEBKITGTK_CONF_OPTS += -DUSE_JPEGXL=ON
> +WEBKITGTK_DEPENDENCIES += libjxl
> +else
> +WEBKITGTK_CONF_OPTS += -DUSE_JPEGXL=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
>  WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=ON
>  WEBKITGTK_DEPENDENCIES += libmanette
> @@ -80,12 +87,11 @@ else
>  WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=OFF
>  endif
>  
> -# Use GLES if available and desktop GL is not.
> -ifeq ($(BR2_PACKAGE_HAS_LIBGL):$(BR2_PACKAGE_HAS_LIBGLES),:y)
> -WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
> +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
> +WEBKITGTK_CONF_OPTS += -DUSE_OPENGL_OR_ES=ON
>  WEBKITGTK_DEPENDENCIES += libgles
>  else
> -WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
> +WEBKITGTK_CONF_OPTS += -DUSE_OPENGL_OR_ES=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
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
