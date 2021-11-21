Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CF1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F3884046B;
	Sun, 21 Nov 2021 20:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eA7Z0ewT6cQh; Sun, 21 Nov 2021 20:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B32714046C;
	Sun, 21 Nov 2021 20:50:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86A341BF95F
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75AFC80E1A
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzqIwYxBCNnn for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:50:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 672CD80E19
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:50:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3E9548DCCD; Sun, 21 Nov 2021 20:46:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:49:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7093957e9b52bb87a97249a276c0c4f86b7a410d
X-Git-Newrev: b6ab78b930a0b647d2c43b4b735f8359ca8d7518
X-Patchwork-Hint: ignore
Message-Id: <20211121204602.3E9548DCCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{mesa3d,
 mesa3d-headers}: bump version to 21.3.0
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7288830381070268810=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7288830381070268810==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b6ab78b930a0b647d2c43b4b735f8359ca8d7518
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add new crocus gallium driver:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=f3630548f1da904ec6c63b43ece7e68afdb8867e

Added two patches to fix uClibc-related build errors.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk    |  2 +-
 package/mesa3d/0006-fix-valist.patch        | 37 ++++++++++++++++++++++++++
 package/mesa3d/0007-fix-cpp-detection.patch | 40 +++++++++++++++++++++++++++++
 package/mesa3d/Config.in                    |  7 +++++
 package/mesa3d/mesa3d.hash                  |  6 ++---
 package/mesa3d/mesa3d.mk                    |  3 ++-
 6 files changed, 90 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 233292ab0a..39797f61b7 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.1.8
+MESA3D_HEADERS_VERSION = 21.3.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0006-fix-valist.patch b/package/mesa3d/0006-fix-valist.patch
new file mode 100644
index 0000000000..84a254cec5
--- /dev/null
+++ b/package/mesa3d/0006-fix-valist.patch
@@ -0,0 +1,37 @@
+From f6892df8eb115fa712fd69068432b48b028e1e54 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 20 Nov 2021 22:48:54 +0100
+Subject: [PATCH] util/u_printf.h: fix build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build error with uClibc and gcc-9.3.0:
+
+In file included from ../src/util/u_printf.cpp:24:
+../src/util/u_printf.h:43:41: error: ‘va_list’ has not been declared
+   43 | size_t u_printf_length(const char *fmt, va_list untouched_args);
+
+Patch sent upstream:
+https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13897
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/util/u_printf.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/util/u_printf.h b/src/util/u_printf.h
+index 44dcce5529f..14f324de10c 100644
+--- a/src/util/u_printf.h
++++ b/src/util/u_printf.h
+@@ -25,6 +25,7 @@
+ #ifdef __cplusplus
+ 
+ #include <string>
++#include <stdarg.h>
+ 
+ /* find next valid printf specifier in a C++ std::string */
+ size_t util_printf_next_spec_pos(const std::string &s, size_t pos);
+-- 
+GitLab
+
diff --git a/package/mesa3d/0007-fix-cpp-detection.patch b/package/mesa3d/0007-fix-cpp-detection.patch
new file mode 100644
index 0000000000..2e097277de
--- /dev/null
+++ b/package/mesa3d/0007-fix-cpp-detection.patch
@@ -0,0 +1,40 @@
+From ab5519971a090863f8c559907766e0b2382e0471 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 20 Nov 2021 23:02:18 +0100
+Subject: [PATCH] c11_compat.h: fix uClibc build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build error with uClibc and gcc-9.3.0:
+
+../src/egl/main/egldisplay.c: In function ‘_eglGetNativePlatformFromEnv’:
+../src/egl/main/egldisplay.c:101:4: error: implicit declaration of function ‘static_assert’ [-Werror=implicit-function-declaration]
+  101 |    static_assert(ARRAY_SIZE(egl_platforms) == _EGL_NUM_PLATFORMS,
+
+CC: 21.3 <mesa-stable>
+
+Patch sent upstream:
+https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13898
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/c11_compat.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/include/c11_compat.h b/include/c11_compat.h
+index d35740f47a4..cdcd3f1f52f 100644
+--- a/include/c11_compat.h
++++ b/include/c11_compat.h
+@@ -8,8 +8,6 @@
+ 
+ #if defined(__cplusplus)
+    /* This is C++ code, not C */
+-#elif (__STDC_VERSION__ >= 201112L)
+-   /* Already C11 */
+ #else
+ 
+ 
+-- 
+GitLab
+
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 7da9ca4f5b..c84f48413f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -97,6 +97,13 @@ config BR2_PACKAGE_MESA3D_NEEDS_X11
 
 comment "Gallium drivers"
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
+	bool "Gallium crocus driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	help
+	  Mesa driver for gen4-7 Intel GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 26176b85b7..6ada5aebc4 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-September/000644.html
-sha256  5cd32f5d089dca75300578a3d771a656eaed652090573a2655fe4e7022d56bfc  mesa-21.1.8.tar.xz
-sha512  80fcf2b1d59b49e384e9aa1ae63a3ce709833059af1ffd8eb821054c1976709134098cfc79fac1578a2f08a003223f1c96b38e2e650c5be49821c6f2fe1047af  mesa-21.1.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-November/000654.html
+sha256  a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7bb62c2ec8736eb09ce1  mesa-21.3.0.tar.xz
+sha512  b27c0ccf2fc9b96bbece715612cec4f4e267ab25dc5386c3debd2346c385afa0146317c67a3d2eec198dbf5338fb182b458c5fe5567216b265153c0b7b560de1  mesa-21.3.0.tar.xz
 
 # License
 sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e5cb65df36..617f1a8588 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.1.8
+MESA3D_VERSION = 21.3.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -85,6 +85,7 @@ endif
 # Drivers
 
 #Gallium Drivers
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS)   += crocus
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedreno
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915

--===============7288830381070268810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7288830381070268810==--
