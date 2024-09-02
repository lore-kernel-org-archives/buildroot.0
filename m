Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50234CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 15:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 200674067B;
	Mon,  2 Sep 2024 15:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDzQ75rGgS29; Mon,  2 Sep 2024 15:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C983408D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C983408D4;
	Mon,  2 Sep 2024 15:38:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B39441BF292
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B71340906
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgOWzaN5MgBb for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 15:38:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DCDC408EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DCDC408EC
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 15:38:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 369FA869DC; Mon,  2 Sep 2024 15:38:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 2 Sep 2024 17:36:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bab2c9374775e57746a89b10534ddc2fe86d605
X-Git-Newrev: 88f120d031456fd439bca2ac8a96f9b7477b35cc
X-Patchwork-Hint: ignore
Message-Id: <20240902153807.369FA869DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/midori: drop package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=88f120d031456fd439bca2ac8a96f9b7477b35cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original WebKitGTK-based Midori is no longer maintained and doesn't build
since WebKitGTK moved to libsoup3 as of commit 38a098df133aaa2ebf09742054b02db5a44f58e5.

Last WebKitGTK based release: https://github.com/midori-browser/core/tree/v9.0.
New browser, based on Gecko/Firefox: https://github.com/goastian/midori-desktop.

The intention is also to start migrating WebKitGTK to GTK4, as this is now the default
version. See: https://webkitgtk.org/2024/03/27/webkigit-2.44.html.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  2 -
 Config.in.legacy                                   |  8 ++++
 package/Config.in                                  |  1 -
 .../midori/0001-disable-vala-fatal-warnings.patch  | 30 -------------
 ...d-option-to-specify-path-to-g-ir-compiler.patch | 37 ---------------
 package/midori/Config.in                           | 52 ----------------------
 package/midori/midori.hash                         |  3 --
 package/midori/midori.mk                           | 35 ---------------
 8 files changed, 8 insertions(+), 160 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 96358d0d6c..a824a50c49 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -892,8 +892,6 @@ package/metacity/0001-add-libm-reference.patch lib_patch.Upstream
 package/metacity/0002-gconf.patch lib_patch.Upstream
 package/metacity/0003-mag-add-libm-reference.patch lib_patch.Upstream
 package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch lib_patch.Upstream
-package/midori/0001-disable-vala-fatal-warnings.patch lib_patch.Upstream
-package/midori/0002-add-option-to-specify-path-to-g-ir-compiler.patch lib_patch.Upstream
 package/mii-diag/0001-strchr.patch lib_patch.Sob lib_patch.Upstream
 package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch lib_patch.Upstream
 package/mini-snmpd/0001-linux.c-fix-musl-build.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index d8480106ba..d1f892dded 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_MIDORI
+	bool "midori has been removed"
+	select BR2_LEGACY
+	help
+	  The original WebKitGTK-based Midori is no longer maintained
+	  and doesn't build since WebKitGTK moved to libsoup3 as of
+	  commit 38a098df133aaa2ebf09742054b02db5a44f58e5.
+
 config BR2_PACKAGE_FROTZ
 	bool "frotz has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 211080345a..f33c4780f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -331,7 +331,6 @@ comment "Graphic applications"
 	source "package/kmscube/Config.in"
 	source "package/libva-utils/Config.in"
 	source "package/mesa3d-demos/Config.in"
-	source "package/midori/Config.in"
 	source "package/netsurf/Config.in"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
diff --git a/package/midori/0001-disable-vala-fatal-warnings.patch b/package/midori/0001-disable-vala-fatal-warnings.patch
deleted file mode 100644
index c3f245f141..0000000000
--- a/package/midori/0001-disable-vala-fatal-warnings.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From be91b1260d3215119e4ab5b19012ab80d6ff788d Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 11 Oct 2021 16:58:34 -0700
-Subject: [PATCH] disable vala fatal warnings
-
-When building midori in a buildroot directory cloned from git, the git
-descript --tags command return tags from buildroot, which in turn sets
-the --fatal-warnings flag. Disable --fatal-warnings unconditionally.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8e72f08..39941e2 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -18,7 +18,7 @@ execute_process(COMMAND "git" "describe" "--tags"
- if (REVISION)
-     set(CORE_VERSION "${REVISION}")
-     # All warnings are errors in development builds
--    set(VALAFLAGS ${VALAFLAGS} --fatal-warnings)
-+    set(VALAFLAGS ${VALAFLAGS} --disable-assert)
- else ()
-     # No runtime type checks
-     set(VALAFLAGS ${VALAFLAGS} --disable-assert)
--- 
-2.30.2
-
diff --git a/package/midori/0002-add-option-to-specify-path-to-g-ir-compiler.patch b/package/midori/0002-add-option-to-specify-path-to-g-ir-compiler.patch
deleted file mode 100644
index 4bbcbaaf12..0000000000
--- a/package/midori/0002-add-option-to-specify-path-to-g-ir-compiler.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 118ac24b2c488f490ee8814336291a58eae45395 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Tue, 12 Oct 2021 13:21:19 -0700
-Subject: [PATCH] add option to specify path to g-ir-compiler
-
-By default, find_program (GIR_COMPILER_BIN g-ir-compiler) returns the host path
-to g-ir-compiler, which is undesirable in a cross-compile environment.
-
-Add an option to manually specify a path to the g-ir-compiler.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- core/CMakeLists.txt | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/core/CMakeLists.txt b/core/CMakeLists.txt
-index c4982de..6584229 100644
---- a/core/CMakeLists.txt
-+++ b/core/CMakeLists.txt
-@@ -66,7 +66,13 @@ set_target_properties("${LIBCORE}" PROPERTIES
-                       VERSION ${LIBCORE_VERSION}
-                       )
- 
--find_program (GIR_COMPILER_BIN g-ir-compiler)
-+option(GIR_COMPILER_PATH "Specify a path to g-ir-compiler" OFF)
-+if(GIR_COMPILER_PATH)
-+  set(GIR_COMPILER_BIN "${GIR_COMPILER_PATH}")
-+else()
-+  find_program (GIR_COMPILER_BIN g-ir-compiler)
-+endif(GIR_COMPILER_PATH)
-+
- add_custom_target(${LIBCORE_GIR}.typelib ALL
-                   COMMAND ${GIR_COMPILER_BIN} ${CMAKE_CURRENT_BINARY_DIR}/${LIBCORE_GIR}.gir
-                   --output ${CMAKE_CURRENT_BINARY_DIR}/${LIBCORE_GIR}.typelib
--- 
-2.30.2
-
diff --git a/package/midori/Config.in b/package/midori/Config.in
deleted file mode 100644
index 6029c0a9df..0000000000
--- a/package/midori/Config.in
+++ /dev/null
@@ -1,52 +0,0 @@
-config BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
-	bool
-	default y
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # gcr -> libgcrypt -> libgpg-error
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
-	depends on !BR2_BINFMT_FLAT # webkitgtk -> icu
-
-comment "midori needs a glibc toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 8"
-	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		!BR2_HOST_GCC_AT_LEAST_8 || \
-		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_USE_WCHAR
-
-comment "midori needs libgtk3 w/ X11 or wayland backend"
-	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_LIBGTK3_X11 && \
-		!BR2_PACKAGE_LIBGTK3_WAYLAND
-
-config BR2_PACKAGE_MIDORI
-	bool "midori"
-	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
-	depends on !BR2_STATIC_LIBS # webkitgtk
-	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
-	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
-	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
-	depends on BR2_USE_WCHAR # granite, gcr, libsoup, libpeas, gobject-introspection
-	depends on BR2_PACKAGE_LIBGTK3
-	depends on BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND
-	select BR2_PACKAGE_GCR
-	select BR2_PACKAGE_GRANITE
-	select BR2_PACKAGE_JSON_GLIB
-	select BR2_PACKAGE_LIBARCHIVE
-	select BR2_PACKAGE_LIBPEAS
-	select BR2_PACKAGE_LIBPEAS_WIDGETS
-	select BR2_PACKAGE_LIBSOUP
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_PYTHON3 # gobject-introspection
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_WEBKITGTK
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  Midori is a lightweight web browser based on WebKit
-
-	  https://github.com/midori-browser/core
diff --git a/package/midori/midori.hash b/package/midori/midori.hash
deleted file mode 100644
index f14ec6d929..0000000000
--- a/package/midori/midori.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  5e0a531455c47b0ff7589940aa2b0d9c16f59c99ba933e5fcdcab68114262016  midori-v9.0.tar.gz
-sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
deleted file mode 100644
index aeafa9bfdc..0000000000
--- a/package/midori/midori.mk
+++ /dev/null
@@ -1,35 +0,0 @@
-################################################################################
-#
-# midori
-#
-################################################################################
-
-MIDORI_VERSION = 9.0
-MIDORI_SOURCE = midori-v$(MIDORI_VERSION).tar.gz
-MIDORI_SITE = https://github.com/midori-browser/core/releases/download/v$(MIDORI_VERSION)
-MIDORI_LICENSE = LGPL-2.1+
-MIDORI_LICENSE_FILES = COPYING
-MIDORI_CPE_ID_VENDOR = midori-browser
-MIDORI_DEPENDENCIES = \
-	host-intltool \
-	host-librsvg \
-	host-pkgconf \
-	host-vala \
-	host-python3 \
-	gcr \
-	gobject-introspection \
-	granite \
-	json-glib \
-	libarchive \
-	libgtk3 \
-	libpeas \
-	libsoup \
-	libxml2 \
-	sqlite \
-	webkitgtk \
-	$(TARGET_NLS_DEPENDENCIES) \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
-
-MIDORI_CONF_OPTS += -DGIR_COMPILER_PATH=$(STAGING_DIR)/usr/bin/g-ir-compiler
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
