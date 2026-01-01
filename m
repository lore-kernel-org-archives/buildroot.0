Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0A5EED609
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 14:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3BF9605E4;
	Thu,  1 Jan 2026 14:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ggv5UFOwQPe5; Thu,  1 Jan 2026 14:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5E29606E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767276433;
	bh=k6quxBXwXpXynI25jCspnWDdnJ4p36cKWS4VWGFo9rY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QDiKTzuNzF8g0l23m532SschJ0EbKsFz42onEE3aSCXNPXQ/rXjnM8CwXQBKV9tMc
	 tU71UE4a6f9/td+qrMnMcJTNso/alDnajvV704J2NqTvsxoWas1soWKpHRAyaJO60g
	 c+r7fuxG5XV6f7YV2P6ALc+3UpJWK7njvkyeU3FC3EyDCArpeiGJd3erIUgLO+kzD3
	 Kt98VP+g2TGHXlF8zN0/5DHN0eX9D+1OZ+K5/JeWJWCFAnN4KQ73J81yJ9/nMhOTwX
	 0UXYlMzFek156+hAj9rX9paN6bjdBsDSJSZsrbigA80AN4FqZReJBAUkozOtxl8jno
	 jbdbe5SKq+x8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E29606E8;
	Thu,  1 Jan 2026 14:07:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 851EA206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 14:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82B68407D8
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 14:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RSrWEzHGjsz for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 14:07:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914344066F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 914344066F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 14:07:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 823C987DA3; Thu,  1 Jan 2026 14:07:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 15:05:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2992604a3267a1c5e12dfd1280199c388b9dd75
X-Git-Newrev: 3dd73c30d387b235589275bad729e66619d062c3
X-Patchwork-Hint: ignore
Message-Id: <20260101140711.823C987DA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk: allow compiling without
 X11 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=3dd73c30d387b235589275bad729e66619d062c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added patches (17.0.12+7 and 21.0.4+7) to allow compilation
without X11 support.

0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
is only needed for 21.0.4+7, 17.0.12+7 already has this commit:
https://github.com/openjdk/jdk17u/commit/f97ec359ec688346956c29002edb28703d3ba032

Next to that, add a new option BR2_PACKAGE_OPENJDK_X11,
to allow compilation with both head and headless support.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Thomas: split into two commits]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-awt-fix-HEADLESS-compilation-without-X11.patch | 83 ++++++++++++++++++++++
 ...-awt-fix-HEADLESS-compilation-without-X11.patch | 83 ++++++++++++++++++++++
 ...braries-drop-the-need-for-X11-in-headless.patch | 35 +++++++++
 package/openjdk/Config.in                          | 22 +++---
 package/openjdk/openjdk.mk                         | 14 ++--
 5 files changed, 219 insertions(+), 18 deletions(-)

diff --git a/package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
new file mode 100644
index 0000000000..183f667dea
--- /dev/null
+++ b/package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
@@ -0,0 +1,83 @@
+From 8df09bb41f8aec8904a2231facc76660d2a83236 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Thu, 13 Nov 2025 17:23:44 +0100
+Subject: [PATCH] awt: fix HEADLESS compilation without X11
+
+Upstream: https://github.com/openjdk/jdk/pull/28310
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ make/modules/java.desktop/lib/Awt2dLibraries.gmk | 16 ++++++++++++++--
+ .../unix/native/common/awt/utility/rect.h        |  4 ++--
+ 2 files changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/make/modules/java.desktop/lib/Awt2dLibraries.gmk b/make/modules/java.desktop/lib/Awt2dLibraries.gmk
+index 46e3b1677f7..0e92ce6aeca 100644
+--- a/make/modules/java.desktop/lib/Awt2dLibraries.gmk
++++ b/make/modules/java.desktop/lib/Awt2dLibraries.gmk
+@@ -77,6 +77,10 @@ ifeq ($(call isTargetOs, windows), true)
+       #
+ endif
+ 
++ifeq ($(ENABLE_HEADLESS_ONLY), true)
++  LIBAWT_CFLAGS += -DHEADLESS
++endif
++
+ ifeq ($(call isTargetOs, linux macosx aix), true)
+   LIBAWT_EXFILES += awt_Font.c CUPSfuncs.c fontpath.c X11Color.c
+ endif
+@@ -362,13 +366,20 @@ ifeq ($(call isTargetOs, windows macosx), false)
+       $(TOPDIR)/src/$(MODULE)/$(OPENJDK_TARGET_OS_TYPE)/native/common/awt \
+       #
+ 
+-  LIBAWT_HEADLESS_EXCLUDES := medialib
++  LIBAWT_HEADLESS_EXCLUDES := medialib opengl
++
++  LIBAWT_HEADLESS_EXCLUDE_FILES := \
++      GLXGraphicsConfig.c \
++      GLXSurfaceData.c \
++      X11PMBlitLoops.c \
++      X11Renderer.c \
++      X11SurfaceData.c \
++      #
+ 
+   LIBAWT_HEADLESS_EXTRA_HEADER_DIRS := \
+       $(LIBAWT_DEFAULT_HEADER_DIRS) \
+       common/awt/debug \
+       common/font \
+-      common/java2d/opengl \
+       #
+ 
+   LIBAWT_HEADLESS_CFLAGS := $(CUPS_CFLAGS) $(FONTCONFIG_CFLAGS) $(X_CFLAGS) \
+@@ -378,6 +389,7 @@ ifeq ($(call isTargetOs, windows macosx), false)
+       NAME := awt_headless, \
+       EXTRA_SRC := $(LIBAWT_HEADLESS_EXTRA_SRC), \
+       EXCLUDES := $(LIBAWT_HEADLESS_EXCLUDES), \
++      EXCLUDE_FILES := $(LIBAWT_HEADLESS_EXCLUDE_FILES), \
+       OPTIMIZATION := LOW, \
+       CFLAGS := $(CFLAGS_JDKLIB) \
+           $(LIBAWT_HEADLESS_CFLAGS), \
+diff --git a/src/java.desktop/unix/native/common/awt/utility/rect.h b/src/java.desktop/unix/native/common/awt/utility/rect.h
+index ceea38f4349..91b5a17ec58 100644
+--- a/src/java.desktop/unix/native/common/awt/utility/rect.h
++++ b/src/java.desktop/unix/native/common/awt/utility/rect.h
+@@ -28,7 +28,7 @@
+ #ifndef _AWT_RECT_H
+ #define _AWT_RECT_H
+ 
+-#ifndef MACOSX
++#if !defined(HEADLESS) && !defined(MACOSX)
+ #include <X11/Xlib.h>
+ typedef XRectangle RECT_T;
+ #else
+@@ -39,7 +39,7 @@ typedef struct {
+     int width;
+     int height;
+ } RECT_T;
+-#endif /* !MACOSX */
++#endif /* !HEADLESS && !MACOSX */
+ 
+ #define RECT_EQ_X(r1,r2)        ((r1).x==(r2).x && (r1).width==(r2).width)
+ 
+-- 
+2.43.0
+
diff --git a/package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
new file mode 100644
index 0000000000..5bb59a0bdd
--- /dev/null
+++ b/package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
@@ -0,0 +1,83 @@
+From 13a908b3d192e477b7572b522837efd771f5e2f9 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Thu, 13 Nov 2025 17:23:44 +0100
+Subject: [PATCH] awt: fix HEADLESS compilation without X11
+
+Upstream: https://github.com/openjdk/jdk/pull/28310
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ make/modules/java.desktop/lib/Awt2dLibraries.gmk | 16 ++++++++++++++--
+ .../unix/native/common/awt/utility/rect.h        |  4 ++--
+ 2 files changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/make/modules/java.desktop/lib/Awt2dLibraries.gmk b/make/modules/java.desktop/lib/Awt2dLibraries.gmk
+index a33f219e83e..de57e88a4ce 100644
+--- a/make/modules/java.desktop/lib/Awt2dLibraries.gmk
++++ b/make/modules/java.desktop/lib/Awt2dLibraries.gmk
+@@ -77,6 +77,10 @@ ifeq ($(call isTargetOs, windows), true)
+       #
+ endif
+ 
++ifeq ($(ENABLE_HEADLESS_ONLY), true)
++  LIBAWT_CFLAGS += -DHEADLESS
++endif
++
+ ifeq ($(call isTargetOs, linux macosx aix), true)
+   LIBAWT_EXFILES += awt_Font.c CUPSfuncs.c fontpath.c X11Color.c
+ endif
+@@ -368,13 +372,20 @@ ifeq ($(call isTargetOs, windows macosx), false)
+       $(TOPDIR)/src/$(MODULE)/$(OPENJDK_TARGET_OS_TYPE)/native/common/awt \
+       #
+ 
+-  LIBAWT_HEADLESS_EXCLUDES := medialib
++  LIBAWT_HEADLESS_EXCLUDES := medialib opengl
++
++  LIBAWT_HEADLESS_EXCLUDE_FILES := \
++      GLXGraphicsConfig.c \
++      GLXSurfaceData.c \
++      X11PMBlitLoops.c \
++      X11Renderer.c \
++      X11SurfaceData.c \
++      #
+ 
+   LIBAWT_HEADLESS_EXTRA_HEADER_DIRS := \
+       $(LIBAWT_DEFAULT_HEADER_DIRS) \
+       common/awt/debug \
+       common/font \
+-      common/java2d/opengl \
+       #
+ 
+   LIBAWT_HEADLESS_CFLAGS := $(CUPS_CFLAGS) $(FONTCONFIG_CFLAGS) $(X_CFLAGS) \
+@@ -384,6 +395,7 @@ ifeq ($(call isTargetOs, windows macosx), false)
+       NAME := awt_headless, \
+       EXTRA_SRC := $(LIBAWT_HEADLESS_EXTRA_SRC), \
+       EXCLUDES := $(LIBAWT_HEADLESS_EXCLUDES), \
++      EXCLUDE_FILES := $(LIBAWT_HEADLESS_EXCLUDE_FILES), \
+       OPTIMIZATION := LOW, \
+       CFLAGS := $(CFLAGS_JDKLIB) \
+           $(LIBAWT_HEADLESS_CFLAGS), \
+diff --git a/src/java.desktop/unix/native/common/awt/utility/rect.h b/src/java.desktop/unix/native/common/awt/utility/rect.h
+index ceea38f4349..91b5a17ec58 100644
+--- a/src/java.desktop/unix/native/common/awt/utility/rect.h
++++ b/src/java.desktop/unix/native/common/awt/utility/rect.h
+@@ -28,7 +28,7 @@
+ #ifndef _AWT_RECT_H
+ #define _AWT_RECT_H
+ 
+-#ifndef MACOSX
++#if !defined(HEADLESS) && !defined(MACOSX)
+ #include <X11/Xlib.h>
+ typedef XRectangle RECT_T;
+ #else
+@@ -39,7 +39,7 @@ typedef struct {
+     int width;
+     int height;
+ } RECT_T;
+-#endif /* !MACOSX */
++#endif /* !HEADLESS && !MACOSX */
+ 
+ #define RECT_EQ_X(r1,r2)        ((r1).x==(r2).x && (r1).width==(r2).width)
+ 
+-- 
+2.43.0
+
diff --git a/package/openjdk/21.0.4+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch b/package/openjdk/21.0.4+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
new file mode 100644
index 0000000000..bb182fa2b9
--- /dev/null
+++ b/package/openjdk/21.0.4+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
@@ -0,0 +1,35 @@
+From 46b9a0ad24f7f299ff23e13bc8ef01c188d246b6 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Thu, 13 Nov 2025 23:10:20 +0100
+Subject: [PATCH] autoconf: libraries: drop the need for X11 in headless mode
+
+Upstream: https://github.com/openjdk/jdk/pull/28310
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ make/autoconf/libraries.m4 | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
+index 51d4f724c33..6a8b925c3f2 100644
+--- a/make/autoconf/libraries.m4
++++ b/make/autoconf/libraries.m4
+@@ -42,12 +42,12 @@ m4_include([lib-tests.m4])
+ AC_DEFUN_ONCE([LIB_DETERMINE_DEPENDENCIES],
+ [
+   # Check if X11 is needed
+-  if test "x$OPENJDK_TARGET_OS" = xwindows || test "x$OPENJDK_TARGET_OS" = xmacosx; then
+-    # No X11 support on windows or macosx
++  if test "x$OPENJDK_TARGET_OS" = xwindows ||
++     test "x$OPENJDK_TARGET_OS" = xmacosx ||
++     test "x$ENABLE_HEADLESS_ONLY" = xtrue; then
+     NEEDS_LIB_X11=false
+   else
+-    # All other instances need X11, even if building headless only, libawt still
+-    # needs X11 headers.
++    # All other instances need X11 for libawt.
+     NEEDS_LIB_X11=true
+   fi
+ 
+-- 
+2.43.0
+
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 78775370ca..7f29e7a489 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -29,7 +29,6 @@ config BR2_PACKAGE_OPENJDK
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_USE_MMU # cups
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_ALSA_LIB_PCM
@@ -42,10 +41,6 @@ config BR2_PACKAGE_OPENJDK
 	select BR2_PACKAGE_LCMS2
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_XLIB_LIBXRANDR
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_ZLIB
 	help
 	  OpenJDK is a free and open-source implementation of the
@@ -71,6 +66,17 @@ config BR2_PACKAGE_OPENJDK_VERSION_21
 
 endchoice
 
+config BR2_PACKAGE_OPENJDK_X11
+	bool "Build with AWT head support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBXTST
+
+comment "openjdk AWT head support needs X.org"
+	depends on !BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_OPENJDK_FULL_JDK
 	bool "Build the full JDK"
 	help
@@ -155,12 +161,6 @@ config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
 endchoice
 endif
 
-comment "openjdk needs X.Org"
-	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
-	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_XORG7
-
 comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 6868ca191d..58b266c4e9 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -21,8 +21,6 @@ OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 OPENJDK_INSTALL_STAGING = YES
 
-# OpenJDK requires Alsa, cups, and X11 even for a headless build.
-# host-zip is needed for the zip executable.
 OPENJDK_DEPENDENCIES = \
 	host-gawk \
 	host-openjdk-bin \
@@ -37,10 +35,6 @@ OPENJDK_DEPENDENCIES = \
 	lcms2 \
 	libpng \
 	libusb \
-	xlib_libXrandr \
-	xlib_libXrender \
-	xlib_libXt \
-	xlib_libXtst \
 	zlib
 
 # JVM variants
@@ -88,7 +82,6 @@ OPENJDK_CONF_OPTS = \
 	--disable-full-docs \
 	--disable-manpages \
 	--disable-warnings-as-errors \
-	--enable-headless-only \
 	--enable-openjdk-only \
 	--enable-unlimited-crypto \
 	--openjdk-target=$(GNU_TARGET_NAME) \
@@ -112,6 +105,13 @@ OPENJDK_CONF_OPTS = \
 	--with-version-build="$(OPENJDK_VERSION_BUILD)" \
 	--with-version-string="$(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)"
 
+ifeq ($(BR2_PACKAGE_OPENJDK_X11),y)
+OPENJDK_CONF_OPTS += --disable-headless-only
+OPENJDK_DEPENDENCIES += xlib_libXrandr xlib_libXrender xlib_libXt xlib_libXtst
+else
+OPENJDK_CONF_OPTS += --enable-headless-only
+endif
+
 # If building for AArch64, use the provided CPU port.
 ifeq ($(BR2_aarch64),y)
 OPENJDK_CONF_OPTS += --with-abi-profile=aarch64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
