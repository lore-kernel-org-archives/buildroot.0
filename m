Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6ADCA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 20:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76CF78426E;
	Wed, 10 Sep 2025 20:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzQfGPuYIf2k; Wed, 10 Sep 2025 20:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B358426F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64B358426F;
	Wed, 10 Sep 2025 20:13:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC601234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A98628426F
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcmRTZhfwLKO for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 20:13:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDDEA8426E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDDEA8426E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:13:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB80B83CE7; Wed, 10 Sep 2025 20:13:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 13:38:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b401a61f35dde14505f0f22f3bebf01af1e37290
X-Git-Newrev: 4cd4b2e1e6e8816555db38771d18daad46df3a6c
X-Patchwork-Hint: ignore
Message-Id: <20250910201333.AB80B83CE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 25.2.2
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4cd4b2e1e6e8816555db38771d18daad46df3a6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0001.

Removed Gallium xa state tracker:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/3be2c47db2318ebe9222c80bf981038df4374b2d

Legacy handling for blind option BR2_PACKAGE_MESA3D_NEEDS_XA is not
necessary.

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2025-August/000815.html
https://lists.freedesktop.org/archives/mesa-announce/2025-August/000818.html
https://lists.freedesktop.org/archives/mesa-announce/2025-September/000820.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk                       |  2 +-
 ...-vc4-add-meson-option-to-disable-optional-neon-suppor.patch |  6 +++---
 package/mesa3d/Config.in                                       |  9 ---------
 package/mesa3d/mesa3d.hash                                     |  6 +++---
 package/mesa3d/mesa3d.mk                                       | 10 ++--------
 5 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 5cd05cc9ff..5932d73f2c 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.1.8
+MESA3D_HEADERS_VERSION = 25.2.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index 04b33a7856..52e23e35da 100644
--- a/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -10,7 +10,7 @@ to force disabling it at compile time.
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0, 24.3.0 & 25.1.0]
+[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0, 24.3.0, 25.1.0 & 25.2.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [fix syntax error after previous rebases]
 ---
@@ -23,8 +23,8 @@ diff --git a/meson.options b/meson.options
 index 8e0bf2a..1cf0e07 100644
 --- a/meson.options
 +++ b/meson.options
-@@ -117,6 +117,13 @@ option(
-   description : 'enable gallium va frontend.',
+@@ -131,6 +131,13 @@ option(
+   description : 'enable gallium mediafoundation frontend tests.',
  )
  
 +option(
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 924437f033..d2003fce42 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -102,12 +102,6 @@ config BR2_PACKAGE_MESA3D_DRIVER
 	bool
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
 
-# Gallium xa state tracker.
-# Quote from mesa3d meson.build: "XA state tracker requires at least
-# one of the following gallium drivers: nouveau, freedreno, i915, svga.
-config BR2_PACKAGE_MESA3D_NEEDS_XA
-	bool
-
 # OpenGL GLX and Gallium VDPAU both needs X11
 config BR2_PACKAGE_MESA3D_NEEDS_X11
 	bool
@@ -194,7 +188,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
-	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
@@ -266,7 +259,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VMWGFX
-	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  This is a virtual GPU driver for VMWare virtual machines.
 
@@ -282,7 +274,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
-	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Adds support for Nvidia Tegra GPUs, requires nouveau.
 
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index a3858d398d..d76b384e26 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-August/000817.html
-sha256  5cf1571d0d646d90047f3d93f57acc787cf88ec7e95efe172c555b492c30fb71  mesa-25.1.8.tar.xz
-sha512  98435d52a2855c71b15060785c225dc674b3565545a8581a5dd501605a04f9d597636282f1bce61e7a2e8ee98c31ecf7fbccab594571e31bc8b827e18e98aaa5  mesa-25.1.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-September/000820.html
+sha256  43d7abcd4aa8049d8fd75538344a374104765e81e17b4a6314cee2c0160e4412  mesa-25.2.2.tar.xz
+sha512  69cd7ed33d0856e227a0219a9d09e5eb2fad28162276b5971bff4f7102cf58b0d914131ad6543562cba230ce6fb9b2076d3b156b1b8c375e74722a143aee5379  mesa-25.2.2.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e94bafed8c..9ab0ffdfc3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.1.8
+MESA3D_VERSION = 25.2.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -92,15 +92,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 MESA3D_CONF_OPTS += \
 	-Dglx=dri \
 	-Dglx-direct=true
-ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
-MESA3D_CONF_OPTS += -Dgallium-xa=enabled
-else
-MESA3D_CONF_OPTS += -Dgallium-xa=disabled
-endif
 else
 MESA3D_CONF_OPTS += \
-	-Dglx=disabled \
-	-Dgallium-xa=disabled
+	-Dglx=disabled
 endif
 
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
