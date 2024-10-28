Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293CED33992
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA6840363;
	Mon, 28 Oct 2024 14:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0D6V-pfr9hlY; Mon, 28 Oct 2024 14:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D96404D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42D96404D4;
	Mon, 28 Oct 2024 14:47:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5031AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2C7840360
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghwZNImYNv0P for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E90CD40268
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E90CD40268
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:47:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D620184337; Mon, 28 Oct 2024 14:47:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 15:46:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c14926cecbec2ed4b09922813cf826d7fbfbb05a
X-Git-Newrev: 653c3d39a633a2106d50baa2625cb126bbb53d57
X-Patchwork-Hint: ignore
Message-Id: <20241028144701.D620184337@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglfw: bump version to 3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=653c3d39a633a2106d50baa2625cb126bbb53d57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0001 which was applied upstream:
https://github.com/glfw/glfw/commit/2747e47393cbca2d09db56223e735bd94b21e2eb

Removed patch 0002 which is not needed anymore due to the removal of the
dependency to wayland-protocols:
https://github.com/glfw/glfw/commit/e8cf53cf708d025a30895dd5671b208f32af2e73

Configure option GLFW_USE_WAYLAND was replaced by GLFW_BUILD_WAYLAND
and the option GLFW_BUILD_X11 was added:
https://github.com/glfw/glfw/commit/56a4cb0a3a2c7a44a2fd8ab3335adf915e19d30c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   1 -
 ...and-Remove-extra-cmake-modules-dependency.patch | 125 ---------------------
 ...sts.txt-allow-override-of-wayland-pkgdata.patch |  34 ------
 package/libglfw/Config.in                          |   1 -
 package/libglfw/libglfw.hash                       |   2 +-
 package/libglfw/libglfw.mk                         |  14 ++-
 6 files changed, 9 insertions(+), 168 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4788f97694..babcb813b4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -682,7 +682,6 @@ package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
 package/libfuse/0001-fix-aarch64-build.patch lib_patch.Upstream
 package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch lib_patch.Upstream
 package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch lib_patch.Upstream
-package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch lib_patch.Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch lib_patch.Upstream
 package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk2/0001-reduce-dependencies.patch lib_patch.Upstream
diff --git a/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch b/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
deleted file mode 100644
index ffa1d13f51..0000000000
--- a/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 8ebf1067390948d03330a5a0c814e5f7f860e678 Mon Sep 17 00:00:00 2001
-From: Joel Winarske <joel.winarske@gmail.com>
-Date: Mon, 28 Sep 2020 22:23:02 -0700
-Subject: [PATCH] Wayland: Remove extra-cmake-modules dependency
-
-Fixes #1774.
-
-[Retrieved (and backported) from:
-https://github.com/glfw/glfw/commit/2747e47393cbca2d09db56223e735bd94b21e2eb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0 dropping all Hunks]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- CMakeLists.txt     | 16 ++++++------
- src/CMakeLists.txt | 62 ++++++++++++++++++++++++++++------------------
- 2 files changed, 45 insertions(+), 33 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 75069161fc36..b315eaa15305 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -249,20 +249,18 @@ endif()
- # Use Wayland for window creation
- #--------------------------------------------------------------------
- if (_GLFW_WAYLAND)
--    find_package(ECM REQUIRED NO_MODULE)
--    list(APPEND CMAKE_MODULE_PATH "${ECM_MODULE_PATH}")
- 
--    find_package(Wayland REQUIRED Client Cursor Egl)
--    find_package(WaylandScanner REQUIRED)
--    find_package(WaylandProtocols 1.15 REQUIRED)
-+    include(FindPkgConfig)
-+    pkg_check_modules(Wayland REQUIRED
-+        wayland-client>=0.2.7
-+        wayland-cursor>=0.2.7
-+        wayland-egl>=0.2.7
-+        xkbcommon)
- 
-     list(APPEND glfw_PKG_DEPS "wayland-client")
- 
-     list(APPEND glfw_INCLUDE_DIRS "${Wayland_INCLUDE_DIRS}")
--    list(APPEND glfw_LIBRARIES "${Wayland_LIBRARIES}" "${CMAKE_THREAD_LIBS_INIT}")
--
--    find_package(XKBCommon REQUIRED)
--    list(APPEND glfw_INCLUDE_DIRS "${XKBCOMMON_INCLUDE_DIRS}")
-+    list(APPEND glfw_LIBRARIES "${Wayland_LINK_LIBRARIES}" "${CMAKE_THREAD_LIBS_INIT}")
- 
-     include(CheckIncludeFiles)
-     include(CheckFunctionExists)
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index b6dd86c54512..29be6515ae58 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -40,30 +40,44 @@ elseif (_GLFW_WAYLAND)
-                      posix_time.c posix_thread.c xkb_unicode.c
-                      egl_context.c osmesa_context.c)
- 
--    ecm_add_wayland_client_protocol(glfw_SOURCES
--        PROTOCOL
--        "${WAYLAND_PROTOCOLS_PKGDATADIR}/stable/xdg-shell/xdg-shell.xml"
--        BASENAME xdg-shell)
--    ecm_add_wayland_client_protocol(glfw_SOURCES
--        PROTOCOL
--        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml"
--        BASENAME xdg-decoration)
--    ecm_add_wayland_client_protocol(glfw_SOURCES
--        PROTOCOL
--        "${WAYLAND_PROTOCOLS_PKGDATADIR}/stable/viewporter/viewporter.xml"
--        BASENAME viewporter)
--    ecm_add_wayland_client_protocol(glfw_SOURCES
--        PROTOCOL
--        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/relative-pointer/relative-pointer-unstable-v1.xml"
--        BASENAME relative-pointer-unstable-v1)
--    ecm_add_wayland_client_protocol(glfw_SOURCES
--        PROTOCOL
--        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml"
--        BASENAME pointer-constraints-unstable-v1)
--    ecm_add_wayland_client_protocol(glfw_SOURCES
--        PROTOCOL
--        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/idle-inhibit/idle-inhibit-unstable-v1.xml"
--        BASENAME idle-inhibit-unstable-v1)
-+    find_program(WAYLAND_SCANNER_EXECUTABLE NAMES wayland-scanner)
-+    pkg_check_modules(WAYLAND_PROTOCOLS REQUIRED wayland-protocols>=1.15)
-+    pkg_get_variable(WAYLAND_PROTOCOLS_BASE wayland-protocols pkgdatadir)
-+
-+    macro(wayland_generate protocol_file output_file)
-+          add_custom_command(OUTPUT ${output_file}.h
-+              COMMAND ${WAYLAND_SCANNER_EXECUTABLE} client-header
-+              < ${protocol_file} > ${output_file}.h
-+              DEPENDS ${protocol_file})
-+          list(APPEND glfw_SOURCES ${output_file}.h)
-+
-+          add_custom_command(OUTPUT ${output_file}.c 
-+              COMMAND ${WAYLAND_SCANNER_EXECUTABLE} private-code
-+              < ${protocol_file} > ${output_file}.c
-+              DEPENDS ${protocol_file})
-+          list(APPEND glfw_SOURCES ${output_file}.c)
-+    endmacro()
-+
-+    set(GLFW_WAYLAND_PROTOCOL_SOURCES)
-+    wayland_generate(
-+        ${WAYLAND_PROTOCOLS_BASE}/stable/xdg-shell/xdg-shell.xml
-+        ${CMAKE_BINARY_DIR}/src/wayland-xdg-shell-client-protocol)
-+    wayland_generate(
-+        ${WAYLAND_PROTOCOLS_BASE}/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml
-+        ${CMAKE_BINARY_DIR}/src/wayland-xdg-decoration-client-protocol)
-+    wayland_generate(
-+        ${WAYLAND_PROTOCOLS_BASE}/stable/viewporter/viewporter.xml
-+        ${CMAKE_BINARY_DIR}/src/wayland-viewporter-client-protocol)
-+    wayland_generate(
-+        ${WAYLAND_PROTOCOLS_BASE}/unstable/relative-pointer/relative-pointer-unstable-v1.xml
-+        ${CMAKE_BINARY_DIR}/src/wayland-relative-pointer-unstable-v1-client-protocol)
-+    wayland_generate(
-+        ${WAYLAND_PROTOCOLS_BASE}/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml
-+        ${CMAKE_BINARY_DIR}/src/wayland-pointer-constraints-unstable-v1-client-protocol)
-+    wayland_generate(
-+        ${WAYLAND_PROTOCOLS_BASE}/unstable/idle-inhibit/idle-inhibit-unstable-v1.xml
-+        ${CMAKE_BINARY_DIR}/src/wayland-idle-inhibit-unstable-v1-client-protocol)
-+
- elseif (_GLFW_OSMESA)
-     set(glfw_HEADERS ${common_HEADERS} null_platform.h null_joystick.h
-                      posix_time.h posix_thread.h osmesa_context.h)
--- 
-2.43.0
-
diff --git a/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch b/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
deleted file mode 100644
index 268b124851..0000000000
--- a/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a2c88988b6cfe4023fe78f13519b56a8ac9f568b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 4 Mar 2022 17:59:19 +0100
-Subject: [PATCH] src/CMakeLists.txt: allow override of wayland pkgdatadir
-
-Allow the user to override WAYLAND_{PROTOCOLS_BASE,CLIENT_PKGDATADIR}
-(needed when cross-compiling)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/glfw/glfw/pull/2053
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- src/CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 29be6515ae58..1767b3c8ad8f 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -42,7 +42,9 @@ elseif (_GLFW_WAYLAND)
- 
-     find_program(WAYLAND_SCANNER_EXECUTABLE NAMES wayland-scanner)
-     pkg_check_modules(WAYLAND_PROTOCOLS REQUIRED wayland-protocols>=1.15)
--    pkg_get_variable(WAYLAND_PROTOCOLS_BASE wayland-protocols pkgdatadir)
-+    if (NOT WAYLAND_PROTOCOLS_BASE)
-+        pkg_get_variable(WAYLAND_PROTOCOLS_BASE wayland-protocols pkgdatadir)
-+    endif()
- 
-     macro(wayland_generate protocol_file output_file)
-           add_custom_command(OUTPUT ${output_file}.h
--- 
-2.43.0
-
diff --git a/package/libglfw/Config.in b/package/libglfw/Config.in
index e5e96036ff..239d5011a3 100644
--- a/package/libglfw/Config.in
+++ b/package/libglfw/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBGLFW
 	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_XORG7
diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
index 9d38946f3c..54b23471a3 100644
--- a/package/libglfw/libglfw.hash
+++ b/package/libglfw/libglfw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f30f42e05f11e5fc62483e513b0488d5bceeab7d9c5da0ffe2252ad81816c713  libglfw-3.3.8.tar.gz
+sha256  c038d34200234d071fae9345bc455e4a8f2f544ab60150765d7704e08f3dac01  libglfw-3.4.tar.gz
 sha256  149704059b5d0bf551637e50042dd4de9c2cae921021f6636298911e3a5f9462  LICENSE.md
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index f5d254eec3..9586d7f92c 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLFW_VERSION = 3.3.8
+LIBGLFW_VERSION = 3.4
 LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
 LIBGLFW_INSTALL_STAGING = YES
 LIBGLFW_LICENSE = Zlib
@@ -16,8 +16,11 @@ LIBGLFW_CONF_OPTS += \
 	-DGLFW_BUILD_DOCS=OFF
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
+LIBGLFW_CONF_OPTS += -DGLFW_BUILD_X11=ON
 LIBGLFW_DEPENDENCIES += xlib_libXcursor xlib_libXext \
 	xlib_libXi xlib_libXinerama xlib_libXrandr
+else
+LIBGLFW_CONF_OPTS += -DGLFW_BUILD_X11=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
@@ -29,11 +32,10 @@ LIBGLFW_DEPENDENCIES += libgles
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-LIBGLFW_DEPENDENCIES += libxkbcommon wayland wayland-protocols
-# Override pkg-config pkgdatadir variable, it needs the prefix
-LIBGLFW_CONF_OPTS += \
-	-DGLFW_USE_WAYLAND=1 \
-	-DWAYLAND_PROTOCOLS_BASE=$(STAGING_DIR)/usr/share/wayland-protocols
+LIBGLFW_CONF_OPTS += -DGLFW_BUILD_WAYLAND=ON
+LIBGLFW_DEPENDENCIES += libxkbcommon wayland
+else
+LIBGLFW_CONF_OPTS += -DGLFW_BUILD_WAYLAND=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
