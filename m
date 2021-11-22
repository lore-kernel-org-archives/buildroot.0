Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C892BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E2AC605D0;
	Mon,  6 Dec 2021 18:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6FeZwKDEeBTk; Mon,  6 Dec 2021 18:30:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E1EF60D65;
	Mon,  6 Dec 2021 18:30:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C978A1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC72F60D7B
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2xrDThfblbt for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E00FF60D74
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8994881504; Mon,  6 Dec 2021 18:07:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 00:06:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 351dbaef4e9c5bc94a67b8a92a92f6e101cf6bf6
X-Git-Newrev: 42f19d49fb2da891be9266a2f843292d24847f18
X-Patchwork-Hint: ignore
Message-Id: <20211206180741.8994881504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/midori: bump to version 9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=42f19d49fb2da891be9266a2f843292d24847f18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a substantial update as the last time the midori version was bumped
was on Fri Apr 29 2016 commit 54bbd88b1f0c4de25688dae1d0c30d222722feb4.

Changes:

package/Config.in: Move midori out of the "X applications" submenu and into
the "Graphic applications" submenu, as it is not dependent on X.

- Drop the two existing patches as they no longer apply.
- 0001-disable-vala-fatal-warnings.patch: new patch. This patch fixes
  errors when building midori in a buildroot source repository that is also
  a git project.

- 0002-add-option-to-specify-path-to-g-ir-compiler.patchL new patch.
  This patch introduces a new option that allows the make system to specify
  a path to the g-ir-compiler, or else the host path's g-ir-compiler is used
  which results in failed builds.

- Change the site to the github repository, as that is where the latest
  releases are published.

- New dependencies: gobject-introspection, json-glib, libarchive, and libpeas.
- gcr is no longer an optional dependency.
- host-python3 is now a mandatory dependency.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                                  |  2 +-
 .../midori/0001-disable-vala-fatal-warnings.patch  | 30 ++++++++++++++
 package/midori/0001-fix-bug-1492932.patch          | 44 ---------------------
 ...d-option-to-specify-path-to-g-ir-compiler.patch | 37 +++++++++++++++++
 package/midori/0002-gcr-for-x11-only.patch         | 32 ---------------
 package/midori/Config.in                           | 46 ++++++++++++++++------
 package/midori/midori.hash                         |  4 +-
 package/midori/midori.mk                           | 19 +++++----
 8 files changed, 112 insertions(+), 102 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4dc7bca443..311004db2c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -307,6 +307,7 @@ comment "Graphic applications"
 	source "package/kmscube/Config.in"
 	source "package/libva-utils/Config.in"
 	source "package/mesa3d-demos/Config.in"
+	source "package/midori/Config.in"
 	source "package/netsurf/Config.in"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
@@ -377,7 +378,6 @@ comment "X applications"
 	source "package/gmpc/Config.in"
 	source "package/gtkperf/Config.in"
 	source "package/leafpad/Config.in"
-	source "package/midori/Config.in"
 	source "package/mupdf/Config.in"
 	source "package/nodm/Config.in"
 	source "package/pcmanfm/Config.in"
diff --git a/package/midori/0001-disable-vala-fatal-warnings.patch b/package/midori/0001-disable-vala-fatal-warnings.patch
new file mode 100644
index 0000000000..c3f245f141
--- /dev/null
+++ b/package/midori/0001-disable-vala-fatal-warnings.patch
@@ -0,0 +1,30 @@
+From be91b1260d3215119e4ab5b19012ab80d6ff788d Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 11 Oct 2021 16:58:34 -0700
+Subject: [PATCH] disable vala fatal warnings
+
+When building midori in a buildroot directory cloned from git, the git
+descript --tags command return tags from buildroot, which in turn sets
+the --fatal-warnings flag. Disable --fatal-warnings unconditionally.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8e72f08..39941e2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -18,7 +18,7 @@ execute_process(COMMAND "git" "describe" "--tags"
+ if (REVISION)
+     set(CORE_VERSION "${REVISION}")
+     # All warnings are errors in development builds
+-    set(VALAFLAGS ${VALAFLAGS} --fatal-warnings)
++    set(VALAFLAGS ${VALAFLAGS} --disable-assert)
+ else ()
+     # No runtime type checks
+     set(VALAFLAGS ${VALAFLAGS} --disable-assert)
+-- 
+2.30.2
+
diff --git a/package/midori/0001-fix-bug-1492932.patch b/package/midori/0001-fix-bug-1492932.patch
deleted file mode 100644
index 27ad283a58..0000000000
--- a/package/midori/0001-fix-bug-1492932.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Fix for https://bugs.launchpad.net/midori/+bug/1492932
-Patch status: upstream
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- a/midori/midori-browser.c	2015-07-11 16:03:43 +0000
-+++ b/midori/midori-browser.c	2015-09-25 21:30:31 +0000
-@@ -5953,11 +5953,6 @@
-                       G_CALLBACK (midori_browser_destroy_cb), NULL);
-     gtk_window_set_role (GTK_WINDOW (browser), "browser");
-     gtk_window_set_icon_name (GTK_WINDOW (browser), MIDORI_STOCK_WEB_BROWSER);
--    #if GTK_CHECK_VERSION (3, 4, 0)
--    #ifndef HAVE_GRANITE
--    gtk_window_set_hide_titlebar_when_maximized (GTK_WINDOW (browser), TRUE);
--    #endif
--    #endif
-     vbox = gtk_vbox_new (FALSE, 0);
-     /* gtk_container_add (GTK_CONTAINER (browser), vbox);
-     gtk_widget_show (vbox); */
-
---- a/midori/midori-view.c	2015-07-06 21:26:46 +0000
-+++ b/midori/midori-view.c	2015-09-25 21:30:31 +0000
-@@ -3495,9 +3495,6 @@
-     }
-     else
-         gtk_window_set_icon_name (GTK_WINDOW (window), icon_name);
--    #if GTK_CHECK_VERSION (3, 4, 0)
--    gtk_window_set_hide_titlebar_when_maximized (GTK_WINDOW (window), TRUE);
--    #endif
-     gtk_widget_set_size_request (GTK_WIDGET (inspector_view), 700, 100);
-     #if GTK_CHECK_VERSION (3, 0, 0)
-     scrolled = gtk_scrolled_window_new (NULL, NULL);
-
---- a/midori/midori-window.vala	2015-08-16 00:14:26 +0000
-+++ b/midori/midori-window.vala	2015-09-25 21:30:31 +0000
-@@ -28,7 +28,6 @@
-                 toolbar.show_arrow = true;
- #if HAVE_GTK3
-                 toolbar.get_style_context ().add_class ("primary-toolbar");
--                hide_titlebar_when_maximized = true;
- #endif
-                 toolbar.popup_context_menu.connect ((x, y, button) => {
-                     return button == 3 && context_menu (toolbar); });
-
diff --git a/package/midori/0002-add-option-to-specify-path-to-g-ir-compiler.patch b/package/midori/0002-add-option-to-specify-path-to-g-ir-compiler.patch
new file mode 100644
index 0000000000..4bbcbaaf12
--- /dev/null
+++ b/package/midori/0002-add-option-to-specify-path-to-g-ir-compiler.patch
@@ -0,0 +1,37 @@
+From 118ac24b2c488f490ee8814336291a58eae45395 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Tue, 12 Oct 2021 13:21:19 -0700
+Subject: [PATCH] add option to specify path to g-ir-compiler
+
+By default, find_program (GIR_COMPILER_BIN g-ir-compiler) returns the host path
+to g-ir-compiler, which is undesirable in a cross-compile environment.
+
+Add an option to manually specify a path to the g-ir-compiler.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ core/CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/core/CMakeLists.txt b/core/CMakeLists.txt
+index c4982de..6584229 100644
+--- a/core/CMakeLists.txt
++++ b/core/CMakeLists.txt
+@@ -66,7 +66,13 @@ set_target_properties("${LIBCORE}" PROPERTIES
+                       VERSION ${LIBCORE_VERSION}
+                       )
+ 
+-find_program (GIR_COMPILER_BIN g-ir-compiler)
++option(GIR_COMPILER_PATH "Specify a path to g-ir-compiler" OFF)
++if(GIR_COMPILER_PATH)
++  set(GIR_COMPILER_BIN "${GIR_COMPILER_PATH}")
++else()
++  find_program (GIR_COMPILER_BIN g-ir-compiler)
++endif(GIR_COMPILER_PATH)
++
+ add_custom_target(${LIBCORE_GIR}.typelib ALL
+                   COMMAND ${GIR_COMPILER_BIN} ${CMAKE_CURRENT_BINARY_DIR}/${LIBCORE_GIR}.gir
+                   --output ${CMAKE_CURRENT_BINARY_DIR}/${LIBCORE_GIR}.typelib
+-- 
+2.30.2
+
diff --git a/package/midori/0002-gcr-for-x11-only.patch b/package/midori/0002-gcr-for-x11-only.patch
deleted file mode 100644
index 85e769765f..0000000000
--- a/package/midori/0002-gcr-for-x11-only.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-GCR support only works/is useful with X11 support.
-
-Reported upstream: https://bugs.launchpad.net/midori/+bug/1515985
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura midori-0.5.11.orig/CMakeLists.txt midori-0.5.11/CMakeLists.txt
---- midori-0.5.11.orig/CMakeLists.txt	2015-11-12 13:41:02.045898814 -0300
-+++ midori-0.5.11/CMakeLists.txt	2015-11-12 14:00:09.765545018 -0300
-@@ -175,18 +175,14 @@
-     set(PKGS ${PKGS} zeitgeist-2.0)
- endif()
- 
--if (WIN32)
--    add_definitions("-DGCR_VERSION=\"No\"")
--else ()
--    if (USE_GTK3)
--        pkg_check_modules(GCR REQUIRED gcr-3>=2.32)
--    else ()
--        pkg_check_modules(GCR REQUIRED gcr-base-3>=2.32)
--    endif ()
-+if (USE_GTK3 AND X11)
-+    pkg_check_modules(GCR REQUIRED gcr-3>=2.32)
-     add_definitions("-DGCR_VERSION=\"${GCR_VERSION}\"")
-     add_definitions("-DHAVE_GCR")
-     set(OPTS_INCLUDE_DIRS ${OPTS_INCLUDE_DIRS} ${GCR_INCLUDE_DIRS})
-     set(OPTS_LIBRARIES ${OPTS_LIBRARIES} ${GCR_LIBRARIES})
-+else ()
-+    add_definitions("-DGCR_VERSION=\"No\"")
- endif ()
- 
- if (HALF_BRO_INCOM_WEBKIT2)
diff --git a/package/midori/Config.in b/package/midori/Config.in
index e2cc2ac612..d98d7cb161 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,31 +1,53 @@
-comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7, host gcc >= 4.9"
+config BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
+	depends on !BR2_BINFMT_FLAT # webkitgtk -> icu
+
+comment "midori needs a glibc toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 8"
+	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_HOST_GCC_AT_LEAST_8 || \
+		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || !BR2_USE_WCHAR
+
+comment "midori needs libgtk3 w/ X11 or wayland backend"
+	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_LIBGTK3_X11 && \
+		!BR2_PACKAGE_LIBGTK3_WAYLAND
 
 config BR2_PACKAGE_MIDORI
 	bool "midori"
-	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
-	depends on BR2_PACKAGE_LIBGTK3
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # webkitgtk
+	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # webkitgtk
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
+	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
-	# GCR can only be used with the X11 backend
-	select BR2_PACKAGE_GCR if BR2_PACKAGE_LIBGTK3_X11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
+	depends on BR2_USE_WCHAR # granite, gcr, libsoup, libpeas, gobject-introspection
+	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND
+	select BR2_PACKAGE_GCR
 	select BR2_PACKAGE_GRANITE
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_LIBPEAS
+	select BR2_PACKAGE_LIBPEAS_WIDGETS
 	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_LIBSOUP_GNOME
 	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Midori is a lightweight web browser based on WebKit
 
-	  http://www.midori-browser.org/
+	  https://github.com/midori-browser/core
diff --git a/package/midori/midori.hash b/package/midori/midori.hash
index d8fd1b7a26..d0be396a5a 100644
--- a/package/midori/midori.hash
+++ b/package/midori/midori.hash
@@ -1,5 +1,3 @@
-# From download link @ http://midori-browser.org/download/source/
-sha1	64c86935028feb5f89d799c2acacaad67764da6f	midori_0.5.11_all_.tar.bz2
-
 # Locally computed
+sha256  913a7cba95ddcc3dc5f6b12d861e765d6fa990fe7d4efc3768d3a3567ea460db  midori-9.0.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index eebec815c0..693507dbb3 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-MIDORI_VERSION = 0.5.11
-MIDORI_SOURCE = midori_$(MIDORI_VERSION)_all_.tar.bz2
-MIDORI_SITE = http://midori-browser.org/downloads
+MIDORI_VERSION = 9.0
+MIDORI_SITE = $(call github,midori-browser,core,v$(MIDORI_VERSION))
 MIDORI_LICENSE = LGPL-2.1+
 MIDORI_LICENSE_FILES = COPYING
 MIDORI_CPE_ID_VENDOR = midori-browser
@@ -15,10 +14,14 @@ MIDORI_DEPENDENCIES = \
 	host-librsvg \
 	host-pkgconf \
 	host-vala \
-	host-python \
-	$(if $(BR2_PACKAGE_LIBGTK3_X11),gcr) \
+	host-python3 \
+	gcr \
+	gobject-introspection \
 	granite \
+	json-glib \
+	libarchive \
 	libgtk3 \
+	libpeas \
 	libsoup \
 	libxml2 \
 	sqlite \
@@ -26,10 +29,6 @@ MIDORI_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-MIDORI_CONF_OPTS = \
-	-DHALF_BRO_INCOM_WEBKIT2=ON \
-	-DUSE_GRANITE=ON \
-	-DUSE_GTK3=ON \
-	-DUSE_ZEITGEIST=OFF
+MIDORI_CONF_OPTS += -DGIR_COMPILER_PATH=$(STAGING_DIR)/usr/bin/g-ir-compiler
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
