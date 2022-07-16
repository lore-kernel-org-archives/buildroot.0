Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA183C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 15:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F61C41B89;
	Sat, 16 Jul 2022 15:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F61C41B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2-s6E9xohzQ; Sat, 16 Jul 2022 15:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7705C41B62;
	Sat, 16 Jul 2022 15:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7705C41B62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E648B1BF4DA
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEC0B847A0
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC0B847A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghskcfV55juH for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 15:35:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70C784791
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D70C784791
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 15:35:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44d:f503:4d93:3115])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D28E3B0072D;
 Sat, 16 Jul 2022 17:35:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jul 2022 17:35:33 +0200
Date: Sat, 16 Jul 2022 17:35:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220716153533.GE2543@scaer>
References: <20220713123920.892044-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713123920.892044-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1657985735;
 bh=m4vP50boWZVq241iorr7oo3RpIoo6hVigetpHz2R9A0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=osKvnQ637LxEcz6D207F73i6B5MHOhoUuTols8qtuj8dcsEASDoGRjL8A9lThspCx
 1/tLgC7bTyls2kTC1bkvK4XLjung0yHB8Il6Hw8FJt7K4/b4PbYlSzplF6rgZaYenh
 FyVGtjNR66otPkzs8B3gnJAmqv/6Ji1atl8S0cj0d//VY1br/afH/dXpxLkLcZVdnZ
 B6GleRbLYYs612SyKw5pPiLEoarM2yGaU6sTrPm2J79WcMHJsw4kDR8fwvTVr6GtgT
 A4IPtwlQIDez4Ssy9FJM5Qv+cHweUwzfS9TCgn4ekuS4HPPQlJzfe9wFRG5RDIqls7
 itej0ymgYb0kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=osKvnQ63
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.36.4
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

On 2022-07-13 15:39 +0300, Adrian Perez de Castro spake thusly:
> Bugfix release, fixes a WPEWebProcess leak, MPRIS/MediaSession support,
> adds a missing ATSPI a11y interface, and security patches for
> CVE-2022-22677 and CVE-2022-26710.
> 
> Release notes:
> 
>   https://wpewebkit.org/release/wpewebkit-2.36.4.html
> 
> Accompanying security advisory:
> 
>   https://wpewebkit.org/security/WSA-2022-0006.html
> 
> One patch is not included in the packaged release, and another with a
> build fix imported, which is actually a revert of a patch that made it
> into the release but can cause linking issues when using LTO.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...en-cross-building-for-64-bit-ARM-htt.patch | 32 ----------
>  ...5034-WebKitTestRunner-shouldn-t-link.patch | 58 +++++++++++++++++++
>  package/wpewebkit/wpewebkit.hash              |  8 +--
>  package/wpewebkit/wpewebkit.mk                |  2 +-
>  4 files changed, 63 insertions(+), 37 deletions(-)
>  delete mode 100644 package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
>  create mode 100644 package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch
> 
> diff --git a/package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch b/package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
> deleted file mode 100644
> index 7c9c8666ad..0000000000
> --- a/package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From b0c63502f004db68b485354967bb1c56c071f4eb Mon Sep 17 00:00:00 2001
> -From: Adrian Perez de Castro <aperez@igalia.com>
> -Date: Tue, 31 May 2022 00:48:21 +0300
> -Subject: [PATCH] Build failure when cross-building for 64-bit ARM
> - https://bugs.webkit.org/show_bug.cgi?id=241109
> -
> -Unreviewed build fix.
> -
> -* Source/WebCore/bindings/js/JSDOMMapLike.cpp: Add missing
> -  JavaScriptCore/HashMapImplInlines.h header inclusion.
> -
> -Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> -Upstream status: https://github.com/WebKit/WebKit/pull/1165
> ----
> - Source/WebCore/bindings/js/JSDOMMapLike.cpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/Source/WebCore/bindings/js/JSDOMMapLike.cpp b/Source/WebCore/bindings/js/JSDOMMapLike.cpp
> -index e132c39fa54..2cb4b1b59a3 100644
> ---- a/Source/WebCore/bindings/js/JSDOMMapLike.cpp
> -+++ b/Source/WebCore/bindings/js/JSDOMMapLike.cpp
> -@@ -28,6 +28,7 @@
> - 
> - #include "WebCoreJSClientData.h"
> - #include <JavaScriptCore/CatchScope.h>
> -+#include <JavaScriptCore/HashMapImplInlines.h>
> - #include <JavaScriptCore/JSMap.h>
> - #include <JavaScriptCore/VMTrapsInlines.h>
> - 
> --- 
> -2.36.1
> -
> diff --git a/package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch b/package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch
> new file mode 100644
> index 0000000000..d1edd36660
> --- /dev/null
> +++ b/package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch
> @@ -0,0 +1,58 @@
> +From a780527a1b79538f1e1f5144e9b522d0927a2312 Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Wed, 13 Jul 2022 00:53:48 +0300
> +Subject: [PATCH] Revert "Merge r295034 - WebKitTestRunner shouldn't link
> + object files of JavaScriptCore and WebCore"
> +
> +This reverts commit 7916fda00b347ff263fbfe72c065032d1d9b523c.
> +
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +[Upstream status: https://bugs.webkit.org/show_bug.cgi?id=241002]
> +
> +---
> + Source/JavaScriptCore/CMakeLists.txt     | 12 +++++++++---
> + Tools/WebKitTestRunner/CMakeLists.txt    |  1 -
> + Tools/WebKitTestRunner/PlatformGTK.cmake |  4 ++++
> + Tools/WebKitTestRunner/PlatformWin.cmake |  4 ++++
> + 4 files changed, 17 insertions(+), 4 deletions(-)
> +
> +diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
> +index 95a1300ce1b3..238208eb1137 100644
> +--- a/Source/JavaScriptCore/CMakeLists.txt
> ++++ b/Source/JavaScriptCore/CMakeLists.txt
> +@@ -456,7 +456,7 @@ if (MSVC AND NOT ENABLE_C_LOOP)
> +         COMMAND ${MASM_EXECUTABLE} ${LLINT_MASM_FLAGS} ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.obj ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.asm
> +         VERBATIM)
> +     list(APPEND JavaScriptCore_SOURCES ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.obj)
> +-    add_library(LowLevelInterpreterLib STATIC llint/LowLevelInterpreter.cpp)
> ++    add_library(LowLevelInterpreterLib OBJECT llint/LowLevelInterpreter.cpp)
> + else ()
> +     # As there's poor toolchain support for using `.file` directives in
> +     # inline asm (i.e. there's no way to avoid clashes with the `.file`
> +@@ -465,7 +465,7 @@ else ()
> +     # an object file. We only need to do this for LowLevelInterpreter.cpp
> +     # and cmake doesn't allow us to introduce a compiler wrapper for a
> +     # single source file, so we need to create a separate target for it.
> +-    add_library(LowLevelInterpreterLib STATIC llint/LowLevelInterpreter.cpp
> ++    add_library(LowLevelInterpreterLib OBJECT llint/LowLevelInterpreter.cpp
> +         ${JavaScriptCore_DERIVED_SOURCES_DIR}/${LLIntOutput})
> + endif ()
> + 
> +@@ -1496,7 +1496,13 @@ if (CMAKE_COMPILER_IS_GNUCXX AND GCC_OFFLINEASM_SOURCE_MAP)
> +         COMPILE_OPTIONS "-fno-lto")
> + endif ()
> + 
> +-list(APPEND JavaScriptCore_PRIVATE_LIBRARIES LowLevelInterpreterLib)
> ++# When building JavaScriptCore as an object library, we need to make sure the
> ++# lowlevelinterpreter lib objects get propogated.
> ++if (${JavaScriptCore_LIBRARY_TYPE} STREQUAL "OBJECT")
> ++    list(APPEND JavaScriptCore_PRIVATE_LIBRARIES $<TARGET_OBJECTS:LowLevelInterpreterLib>)
> ++else ()
> ++    list(APPEND JavaScriptCore_SOURCES $<TARGET_OBJECTS:LowLevelInterpreterLib>)
> ++endif ()
> + 
> + WEBKIT_COMPUTE_SOURCES(JavaScriptCore)
> + list(APPEND JavaScriptCore_SOURCES
> +-- 
> +2.37.1
> +
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index 253b4756d0..2a8205d40c 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.36.3.tar.xz.sums
> -md5  8bc53f86a3489da31fdbb581e1b87f7a  wpewebkit-2.36.3.tar.xz
> -sha1  44a3d99ae48481917ddc478c5f91e6a4faa21ff5  wpewebkit-2.36.3.tar.xz
> -sha256  66275debca7497daff3a7826734cd56262a807adb76c5dccdf257c89968c2fc8  wpewebkit-2.36.3.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.36.4.tar.xz.sums
> +md5  ba8e5f5444fd50f53906a7376b25bb26  wpewebkit-2.36.4.tar.xz
> +sha1  91259642da6fe55446c3352eeeafdaa188fc14bd  wpewebkit-2.36.4.tar.xz
> +sha256  307a3bedf5d4299a861f773f631c39a44c3e6276c3af37f7cbefaed2c8d7c021  wpewebkit-2.36.4.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index abd09829a5..ca6833bcd1 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WPEWEBKIT_VERSION = 2.36.3
> +WPEWEBKIT_VERSION = 2.36.4
>  WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
>  WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>  WPEWEBKIT_INSTALL_STAGING = YES
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
