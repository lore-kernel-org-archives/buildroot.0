Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C28FC6181
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 21:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35AEC40479;
	Sat,  3 Jan 2026 21:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gkgi21XIbGVQ; Sat,  3 Jan 2026 21:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD813403A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767477074;
	bh=SLhhnw1zguG4eDXH6g9WBv2r80uN9BP1sH49wjGrLQM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Oh98FQxgMVLUu5I0vvImSbttAhGCq6pY/EBtjwjRRs6n7gUVz2IzCAfOZdQh9IZaK
	 dXpWAeZ4Qq6gd0b8YV3YqdCHOD5muArN2LuV6hAQkdyT56c/4lN62LWzd8mHbsavyS
	 8uLUHH/RZWZw8bb1TNQtmCpt4QHaBVD9fAUGYfbgsEGIkNyhO83mGcsqYD+hwWSI1J
	 9Q78HPnPkSfAZeHNujTAiPIIMRQqE07JCCYMZasRWDfR4g1OfYtjkg/L5eRnlL5Ei1
	 U4LZ3LWStb6YRzpXCfseD+QkEe5oy3PSQgOqy8DhEuzWXleLd+r/TobvYzzupJPvPP
	 iMkeGFOTkl1qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD813403A7;
	Sat,  3 Jan 2026 21:51:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5535351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 21:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B5C5605A8
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 21:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60OMH38aUNgM for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 21:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ACF560594
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ACF560594
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 21:51:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 367B588158; Sat,  3 Jan 2026 21:51:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 22:50:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0580b9051a1a4fb388a202a4a0eae85c4b119463
X-Git-Newrev: 4b4d7621a1e99837637b4209187668975cd91d82
X-Patchwork-Hint: ignore
Message-Id: <20260103215112.367B588158@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/icu: now needs gcc >= 7 due to
 C++17 usage
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4b4d7621a1e99837637b4209187668975cd91d82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 bumped icu
from version 73-2 to 77-1.

Upstream raised the minimum C++ requirement to C++17 in version 75-1:

https://github.com/unicode-org/icu/releases/tag/release-75-1
https://icu.unicode.org/download/75
"C++ code now requires C++17 [...]"

Consequently, this commit switches the minimum gcc version needed by
package/icu to 7, and propagates this to icu's reverse dependencies.

No autobuilder errors were recorded since we don't test toolchains as
old as gcc 6.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cppcms/Config.in               | 10 +++++-----
 package/gerbera/Config.in              |  6 ++++--
 package/icu/Config.in                  | 10 +++++-----
 package/php/Config.ext                 | 10 +++++-----
 package/python-mwscrape2slob/Config.in | 10 +++++-----
 package/python-pyicu/Config.in         | 10 +++++-----
 package/python-slob/Config.in          | 10 +++++-----
 package/qt-webkit-kiosk/Config.in      | 10 +++++-----
 package/qt5/qt5base/Config.in          | 10 +++++-----
 package/qt5/qt5webengine/Config.in     |  8 +++++---
 package/qt5/qt5webkit/Config.in        | 10 +++++-----
 package/webkitgtk/Config.in            |  6 +++---
 package/wpewebkit/Config.in            |  6 +++---
 13 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 6c0bff934c..48266e00c1 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -24,17 +24,17 @@ if BR2_PACKAGE_CPPCMS
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
-comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
+comment "icu support needs a toolchain w/ gcc >= 7, host gcc >= 7"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_7
 
 endif
 
diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 3372d86fba..c5f7cf9cd1 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
@@ -28,9 +29,10 @@ config BR2_PACKAGE_GERBERA
 
 	  https://gerbera.io
 
-comment "gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 8"
+comment "gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 8, host gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/icu/Config.in b/package/icu/Config.in
index 4ed662e887..f5686085dd 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_ICU
 	bool "icu"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11 PR56019
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11 PR56019
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# icu does some funky things by generating by itself an ELF
 	# file, and it cannot easily be changed to generate FLAT
@@ -27,9 +27,9 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 
 endif
 
-comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.9, host gcc >= 4.9"
+comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 7, host gcc >= 7"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 8cf4a7d160..e6f29cdf4c 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -231,10 +231,10 @@ config BR2_PACKAGE_PHP_EXT_ICONV
 
 config BR2_PACKAGE_PHP_EXT_INTL
 	bool "intl"
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
 	depends on !BR2_STATIC_LIBS
@@ -242,12 +242,12 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	help
 	  Internationalization support
 
-comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9, host gcc >= 4.9"
+comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 7"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_PHP_EXT_MBSTRING
 	bool "mbstring"
diff --git a/package/python-mwscrape2slob/Config.in b/package/python-mwscrape2slob/Config.in
index 6ced253451..940ff48059 100644
--- a/package/python-mwscrape2slob/Config.in
+++ b/package/python-mwscrape2slob/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 	bool "python-mwscrape2slob"
 	depends on !BR2_BINFMT_FLAT # python-slob -> python-pyicu -> icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # python-slob -> python-pyicu -> icu
+	depends on BR2_HOST_GCC_AT_LEAST_7 # python-slob -> python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-slob -> python-pyicu -> icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-slob -> python-pyicu -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # python-slob -> python-pyicu -> icu
 	select BR2_PACKAGE_PYTHON_COUCHDB # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT # runtime
 	select BR2_PACKAGE_PYTHON_CSSUTILS # runtime
@@ -15,7 +15,7 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 
 	  https://github.com/itkach/mwscrape2slob
 
-comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
+comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 7, host gcc >= 7"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
index cbd75c0119..34655d4565 100644
--- a/package/python-pyicu/Config.in
+++ b/package/python-pyicu/Config.in
@@ -1,17 +1,17 @@
 config BR2_PACKAGE_PYTHON_PYICU
 	bool "python-pyicu"
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
 	depends on BR2_INSTALL_LIBSTDCPP # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Python extension wrapping the ICU C++ API.
 
 	  https://gitlab.pyicu.org/main/pyicu
 
-comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
+comment "python-pyicu needs a toolchain w/ C++, gcc >= 7, host gcc >= 7"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/python-slob/Config.in b/package/python-slob/Config.in
index c06f544534..293dd67de2 100644
--- a/package/python-slob/Config.in
+++ b/package/python-slob/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PYTHON_SLOB
 	bool "python-slob"
 	depends on !BR2_BINFMT_FLAT # python-pyicu -> icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # python-pyicu -> icu
+	depends on BR2_HOST_GCC_AT_LEAST_7 # python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyicu -> icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-pyicu -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # python-pyicu -> icu
 	select BR2_PACKAGE_PYTHON_PYICU # runtime
 	# although optional, it is used as default compression
 	select BR2_PACKAGE_PYTHON3_XZ # runtime
@@ -13,7 +13,7 @@ config BR2_PACKAGE_PYTHON_SLOB
 
 	  https://github.com/itkach/slob
 
-comment "python-slob needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
+comment "python-slob needs a toolchain w/ C++, gcc >= 7, host gcc >= 7"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 80f8e7c464..2df1f4da39 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_STATIC_LIBS # qt5webkit
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5webkit -> icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # qt5webkit -> icu
+	depends on BR2_HOST_GCC_AT_LEAST_7 # qt5webkit -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # qt5webkit -> icu
 	depends on !BR2_BINFMT_FLAT # qt5webkit -> icu
 	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	select BR2_PACKAGE_OPENSSL
@@ -26,9 +26,9 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
 
 endif
 
-comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 4.9, host gcc >= 4.9"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 7, host gcc >= 7"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_MIPS_SOFT_FLOAT
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 8f14540eb4..dfaa798bd4 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -290,17 +290,17 @@ config BR2_PACKAGE_QT5BASE_DBUS
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
-comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
+comment "icu support needs a toolchain w/ gcc >= 7, host gcc >= 7"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 6179591399..2c16d819d2 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -10,10 +10,11 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
 
-comment "qt5webengine needs udev /dev management and a glibc toolchain w/ host gcc >= 4.9, threads, wchar"
+comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 7, threads, wchar, host gcc >= 7"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_HOST_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_7 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "qt5webengine needs an OpenGL and EGL-capable backend"
@@ -24,7 +25,8 @@ config BR2_PACKAGE_QT5WEBENGINE
 	bool "qt5webengine"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # qt5base-icu
+	depends on BR2_HOST_GCC_AT_LEAST_7 # qt5base-icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libvpx
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 9b84ac5f96..52e5606534 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_QT5WEBKIT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP # leveldb
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # leveldb
 	depends on !BR2_BINFMT_FLAT # icu
 	# assumes a FPU is available on MIPS
@@ -50,9 +50,9 @@ config BR2_PACKAGE_QT5WEBKIT
 
 	  https://doc.qt.io/archives/qt-5.5/qtwebkit-index.html
 
-comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.9, host gcc >= 4.9"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 7, host gcc >= 7"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_MIPS_SOFT_FLOAT
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 7827dc6218..3a4c3ed792 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,14 +16,14 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on (!BR2_PACKAGE_LIBGTK3 && !BR2_PACKAGE_LIBGTK4) || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+		!BR2_HOST_GCC_AT_LEAST_7
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_WEBKITGTK
@@ -31,7 +31,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
+	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 5cbba43792..73ba4e6bdf 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -16,13 +16,13 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "wpewebkit needs a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
+comment "wpewebkit needs a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11 \
-		|| !BR2_HOST_GCC_AT_LEAST_4_9
+		|| !BR2_HOST_GCC_AT_LEAST_7
 
 comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
@@ -33,7 +33,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	bool "wpewebkit"
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
+	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
