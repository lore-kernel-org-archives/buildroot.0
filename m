Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48070C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 19:49:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B951610FC
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 19:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B951610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D586460664;
	Thu, 28 Oct 2021 19:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTMlNmqKHhwE; Thu, 28 Oct 2021 19:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DE4C607E5;
	Thu, 28 Oct 2021 19:49:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F27551BF39C
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 19:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E15FC40639
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 19:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NZDKxa4TL8a for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 19:49:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D4EB4020D
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 19:49:28 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout01.t-online.de (Postfix) with SMTP id 557A8166F;
 Thu, 28 Oct 2021 21:49:25 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.237]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mgBOs-1ScRH70; Thu, 28 Oct 2021 21:49:22 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40092)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mgBOr-0006Oc-Oe;
 Thu, 28 Oct 2021 21:49:22 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 28 Oct 2021 21:49:21 +0200
Message-Id: <20211028194921.1263869-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1635450562-00001468-DC2C0397/0/0 CLEAN NORMAL
X-TOI-MSGID: c12aab83-8655-4102-b488-e5a3add7c141
Subject: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.2.5
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new crocus gallium driver:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=f3630548f1da904ec6c63b43ece7e68afdb8867e

Added patch to fix uClibc build.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: bumped to 21.2.5, git-formatted patch (Thomas)

 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 .../0006-c11_compat.h-fix-uClibc-build.patch  | 35 +++++++++++++++++++
 package/mesa3d/Config.in                      |  7 ++++
 package/mesa3d/mesa3d.hash                    |  6 ++--
 package/mesa3d/mesa3d.mk                      |  3 +-
 5 files changed, 48 insertions(+), 5 deletions(-)
 create mode 100644 package/mesa3d/0006-c11_compat.h-fix-uClibc-build.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 233292ab0a..3698cccf78 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.1.8
+MESA3D_HEADERS_VERSION = 21.2.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0006-c11_compat.h-fix-uClibc-build.patch b/package/mesa3d/0006-c11_compat.h-fix-uClibc-build.patch
new file mode 100644
index 0000000000..06c8be2557
--- /dev/null
+++ b/package/mesa3d/0006-c11_compat.h-fix-uClibc-build.patch
@@ -0,0 +1,35 @@
+From 735485556a029ee4077b51864a9715168bd59ea9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 28 Oct 2021 21:31:26 +0200
+Subject: [PATCH] c11_compat.h: fix uClibc build
+
+uClibc does not define static_assert so we copy the code from the else-
+clause. Fixes build error:
+
+../src/egl/main/egldisplay.c: In function '_eglGetNativePlatformFromEnv':
+../src/egl/main/egldisplay.c:93:4: error: implicit declaration of function 'static_assert' [-Werror=implicit-function-declaration]
+   93 |    static_assert(ARRAY_SIZE(egl_platforms) == _EGL_NUM_PLATFORMS,
+      |    ^~~~~~~~~~~~~
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/c11_compat.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/include/c11_compat.h b/include/c11_compat.h
+index d35740f47a4..deac48f6e9b 100644
+--- a/include/c11_compat.h
++++ b/include/c11_compat.h
+@@ -9,6 +9,9 @@
+ #if defined(__cplusplus)
+    /* This is C++ code, not C */
+ #elif (__STDC_VERSION__ >= 201112L)
++#ifndef static_assert
++#define static_assert _Static_assert
++#endif
+    /* Already C11 */
+ #else
+ 
+-- 
+2.30.2
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
index 26176b85b7..af028be1cf 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-September/000644.html
-sha256  5cd32f5d089dca75300578a3d771a656eaed652090573a2655fe4e7022d56bfc  mesa-21.1.8.tar.xz
-sha512  80fcf2b1d59b49e384e9aa1ae63a3ce709833059af1ffd8eb821054c1976709134098cfc79fac1578a2f08a003223f1c96b38e2e650c5be49821c6f2fe1047af  mesa-21.1.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-October/000651.html
+sha256  8e49585fb760d973723dab6435d0c86f7849b8305b1e6d99f475138d896bacbb  mesa-21.2.5.tar.xz
+sha512  aaa1ebaa1e18eea76c3784c9a65942c3e417c1079d7bf75dcede574999dc459fb4d68d041cf2f767afb9cbfa834a985e0a4edd5a56b0fc90f8fdc506359aa5da  mesa-21.2.5.tar.xz
 
 # License
 sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index dc63d8c9f4..550049d880 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.1.8
+MESA3D_VERSION = 21.2.5
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
