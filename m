Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B35DEE49B4
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DEB660BF8;
	Tue, 30 Dec 2025 22:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8-yJjrd2zHP; Tue, 30 Dec 2025 22:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B96860BEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133600;
	bh=RCbKcEuGzxIjHfOpV0Jmm+iqC9JenzDOwyC1ihXZmDo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yt/PF8He/MSQerPAbbHxUYoCri9e5cjMrzRSHLgPiytYGlD6HtikbvnaWGfkaIQNr
	 zUjbb70kbORad5FfEBYs4tDUe3TgvXxsfxgNczmv9UDVvAzh9f63aA1Hlvq12JEqBN
	 CssaHg9a7h8vaeDK6L7uZHO+Utq1IZcTWXFzhWJDXVUMYL+uiJwCDym2YjEomMRv7a
	 gzVTsCIojHmVpKRJedWsKtO3FCCMKsjv5xc8J6r6xjZKkCD3/QtFG3JCujz1FdMzrL
	 G4pMTc5wWUwEPWR60DL6+4vC2B9OslhADwqLGjpzztclc6mOqqaDXJOS4iLByNvdUL
	 M7D7g1LuGlBQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B96860BEE;
	Tue, 30 Dec 2025 22:26:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3D23177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C78DC40099
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTvPPO0pZ8Tx for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EB954044E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EB954044E
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F69280714; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd1451e65cf0868b33b204c03428256659cb5bef
X-Git-Newrev: 9dd6908a4223aa624cacfe41cda4cf9b9f9bca97
X-Patchwork-Hint: ignore
Message-Id: <20251230222629.0F69280714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-userland: remove package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4869305893389866746=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4869305893389866746==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9dd6908a4223aa624cacfe41cda4cf9b9f9bca97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rpi-userland package no longer builds with CMake >= 4. While
fixing it is probably not too difficult,
https://github.com/raspberrypi/userland tells us:

"""
This repo is ancient and deprecated.

It largely contains code using proprietary APIs to interface to the
VideoCore firmware. We have since move to standard linux APIs.

V4L2, DRM/KMS and Mesa are the APIs you should be using.

The few useful tools from here (dtoverlay, dtmerge, vcmailbox,
vcgencmd) have been moved to the raspberrypi/utils repo.

Code from here is no longer installed on latest RPiOS Bookworm images.

If you are using code from here you should rethink your solution.

Consider this repo closed.
"""

Hence it is time to drop this package from Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   7 -
 Config.in.legacy                                   |   8 +
 DEVELOPERS                                         |   1 -
 package/Config.in                                  |   1 -
 ...es-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch | 107 -------------
 ...emove-faulty-assert-to-make-weston-happy-.patch |  35 -----
 .../0003-Disable-Werror-everywhere.patch           | 165 ---------------------
 ...applications-disable-missing-applications.patch |  34 -----
 ...5-dtmerge-add-missing-include-for-va_list.patch |  34 -----
 ...cos-pthreads-CMakeLists.txt-fix-build-wit.patch |  45 ------
 ...t.h-add-GLint64-GLuint64-and-GLsync-typed.patch |  99 -------------
 .../0008-Fix-conflicting-types-build-error.patch   |  41 -----
 ...009-Fix-raspicommonsettings_parse_cmdline.patch |  28 ----
 package/rpi-userland/Config.in                     |  45 ------
 package/rpi-userland/rpi-userland.hash             |   3 -
 package/rpi-userland/rpi-userland.mk               |  61 --------
 16 files changed, 8 insertions(+), 706 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7b08791dcb..c36e9401ba 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -881,13 +881,6 @@ package/rng-tools/S21rngd Shellcheck lib_sysv.Variables
 package/rocksdb/0001-build_tools-build_detect_platform-fix-C-tests.patch lib_patch.Upstream
 package/rpcbind/0001-Remove-yellow-pages-support.patch lib_patch.Upstream
 package/rpcbind/S30rpcbind lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
-package/rpi-userland/0001-Add-.pc-files-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch lib_patch.Upstream
-package/rpi-userland/0002-interface-remove-faulty-assert-to-make-weston-happy-.patch lib_patch.Upstream
-package/rpi-userland/0003-Disable-Werror-everywhere.patch lib_patch.Upstream
-package/rpi-userland/0004-host-applications-disable-missing-applications.patch lib_patch.Upstream
-package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch lib_patch.Upstream
-package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch lib_patch.Upstream
-package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch lib_patch.Upstream
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch lib_patch.Upstream
 package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
 package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 2d6868cd10..c237f2f552 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_RPI_USERLAND
+	bool "rpi-userland has been removed"
+	select BR2_LEGACY
+	help
+	  According to https://github.com/raspberrypi/userland, "This
+	  repo is ancient and deprecated. [...] If you are using code
+	  from here you should rethink your solution.".
+
 config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX
 	bool "gst1-plugins-base dispmanx option removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d88c7899e7..6a6c3ad8f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2204,7 +2204,6 @@ N:	Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
 F:	package/ffmpeg/
 F:	package/mpv/
 F:	package/rpi-firmware/
-F:	package/rpi-userland/
 
 N:	Marcin Bis <marcin@bis.org.pl>
 F:	package/bluez5_utils/
diff --git a/package/Config.in b/package/Config.in
index a23f382fde..e30d769b48 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -588,7 +588,6 @@ endmenu
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
 	source "package/rockchip-rkbin/Config.in"
-	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
 	source "package/rtl8188eu/Config.in"
diff --git a/package/rpi-userland/0001-Add-.pc-files-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch b/package/rpi-userland/0001-Add-.pc-files-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch
deleted file mode 100644
index fb87337111..0000000000
--- a/package/rpi-userland/0001-Add-.pc-files-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 4824be8986c2b6ef0b0bd2b32bc99c4ba6406640 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 24 Jan 2015 19:44:14 +0100
-Subject: [PATCH] Add .pc files for the OpenGLESv2, EGL and bcm_host libraries
-
-Those pkg-config files make it easier for Qt5 to find those libraries
-and the appropriate link flags.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-[Rebased for rpi-userland-a1b89e91f393c7134b4cdc36431f863bb3333163]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- host_applications/linux/libs/bcm_host/CMakeLists.txt |  4 ++++
- host_applications/linux/libs/bcm_host/bcm_host.pc.in | 10 ++++++++++
- interface/khronos/CMakeLists.txt                     |  8 ++++++++
- interface/khronos/egl/egl.pc.in                      | 11 +++++++++++
- interface/khronos/glxx/glesv2.pc.in                  | 10 ++++++++++
- 5 files changed, 43 insertions(+)
- create mode 100644 host_applications/linux/libs/bcm_host/bcm_host.pc.in
- create mode 100644 interface/khronos/egl/egl.pc.in
- create mode 100644 interface/khronos/glxx/glesv2.pc.in
-
-diff --git a/host_applications/linux/libs/bcm_host/CMakeLists.txt b/host_applications/linux/libs/bcm_host/CMakeLists.txt
-index 1edf50a..1f29ead 100644
---- a/host_applications/linux/libs/bcm_host/CMakeLists.txt
-+++ b/host_applications/linux/libs/bcm_host/CMakeLists.txt
-@@ -20,3 +20,7 @@ target_link_libraries(bcm_host vcos vchostif)
- 
- install(TARGETS bcm_host DESTINATION lib)
- 
-+configure_file("${CMAKE_CURRENT_SOURCE_DIR}/bcm_host.pc.in"
-+  "${CMAKE_CURRENT_BINARY_DIR}/bcm_host.pc" @ONLY)
-+install(FILES "${CMAKE_CURRENT_BINARY_DIR}/bcm_host.pc"
-+  DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig")
-diff --git a/host_applications/linux/libs/bcm_host/bcm_host.pc.in b/host_applications/linux/libs/bcm_host/bcm_host.pc.in
-new file mode 100644
-index 0000000..d40d350
---- /dev/null
-+++ b/host_applications/linux/libs/bcm_host/bcm_host.pc.in
-@@ -0,0 +1,10 @@
-+prefix=/usr
-+exec_prefix=${prefix}
-+libdir=${exec_prefix}/lib
-+includedir=${prefix}/include
-+
-+Name: bcm_host
-+Description: Broadcom VideoCore host API library
-+Version: 1
-+Libs: -L${libdir} -lbcm_host -lvcos -lvchiq_arm
-+Cflags: -I${includedir} -I${includedir}/interface/vmcs_host/linux -I${includedir}/interface/vcos/pthreads -DUSE_VCHIQ_ARM
-diff --git a/interface/khronos/CMakeLists.txt b/interface/khronos/CMakeLists.txt
-index 4231af4..2844ebd 100644
---- a/interface/khronos/CMakeLists.txt
-+++ b/interface/khronos/CMakeLists.txt
-@@ -74,6 +74,14 @@ target_link_libraries(OpenVG EGL)
- 
- install(TARGETS EGL GLESv2 OpenVG WFC khrn_client DESTINATION lib)
- install(TARGETS EGL_static GLESv2_static khrn_static DESTINATION lib)
-+configure_file("${CMAKE_CURRENT_SOURCE_DIR}/egl/egl.pc.in"
-+  "${CMAKE_CURRENT_BINARY_DIR}/egl/egl.pc" @ONLY)
-+install(FILES "${CMAKE_CURRENT_BINARY_DIR}/egl/egl.pc"
-+  DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig")
-+configure_file("${CMAKE_CURRENT_SOURCE_DIR}/glxx/glesv2.pc.in"
-+  "${CMAKE_CURRENT_BINARY_DIR}/glxx/glesv2.pc" @ONLY)
-+install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glxx/glesv2.pc"
-+  DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig")
- 
- # recommended names to use to avoid conflicts with mesa libs
- add_library(brcmEGL ${SHARED} ${EGL_SOURCE})
-diff --git a/interface/khronos/egl/egl.pc.in b/interface/khronos/egl/egl.pc.in
-new file mode 100644
-index 0000000..5868706
---- /dev/null
-+++ b/interface/khronos/egl/egl.pc.in
-@@ -0,0 +1,11 @@
-+prefix=@CMAKE_INSTALL_PREFIX@
-+exec_prefix=${prefix}
-+libdir=${exec_prefix}/lib
-+includedir=${prefix}/include
-+
-+Name: egl
-+Description: RasberryPi implementation of EGL
-+Version: 10
-+Libs: -L${libdir} -lEGL -lGLESv2 -lbcm_host -lvchostif
-+Cflags: -I${includedir}/ -I${includedir}/interface/vcos/pthreads/ \
-+        -I${includedir}/interface/vmcs_host/linux/
-diff --git a/interface/khronos/glxx/glesv2.pc.in b/interface/khronos/glxx/glesv2.pc.in
-new file mode 100644
-index 0000000..2f58eed
---- /dev/null
-+++ b/interface/khronos/glxx/glesv2.pc.in
-@@ -0,0 +1,10 @@
-+prefix=@CMAKE_INSTALL_PREFIX@
-+exec_prefix=${prefix}
-+libdir=${exec_prefix}/lib
-+includedir=${prefix}/include
-+
-+Name: glesv2
-+Description: RasberryPi implementation of OpenGL ESv2
-+Version: 2.0
-+Libs: -L${libdir} -lGLESv2
-+Cflags: -I${includedir}/
--- 
-2.8.1
-
diff --git a/package/rpi-userland/0002-interface-remove-faulty-assert-to-make-weston-happy-.patch b/package/rpi-userland/0002-interface-remove-faulty-assert-to-make-weston-happy-.patch
deleted file mode 100644
index 0e9dede5eb..0000000000
--- a/package/rpi-userland/0002-interface-remove-faulty-assert-to-make-weston-happy-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a126ee5a3235792abb58daffd9d4b3e1012f675b Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 24 Jan 2015 22:07:19 +0100
-Subject: [PATCH] interface: remove faulty assert() to make weston happy at
- runtime
-
-This was removed after a discussion on IRC with the weston guys
-('daniels' on irc.freenode.net/#wayland).
-
-Upstream status: no, will be pushed by weston guys later.
-If not, I'll do it.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-[Rebased for rpi-userland-a1b89e91f393c7134b4cdc36431f863bb3333163]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- interface/vmcs_host/vc_vchi_dispmanx.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/interface/vmcs_host/vc_vchi_dispmanx.c b/interface/vmcs_host/vc_vchi_dispmanx.c
-index 133e86d..0c7873c 100755
---- a/interface/vmcs_host/vc_vchi_dispmanx.c
-+++ b/interface/vmcs_host/vc_vchi_dispmanx.c
-@@ -1306,7 +1306,6 @@ static void *dispmanx_notify_func( void *arg ) {
-             // Decrement the use count - the corresponding "use" is in vc_dispmanx_update_submit.
-             vchi_service_release(dispmanx_client.notify_handle[0]);
-             if (dispmanx_client.update_callback ) {
--               vcos_assert( dispmanx_client.pending_update_handle == handle);
-                dispmanx_client.update_callback(handle, dispmanx_client.update_callback_param);
-             }
-          } else {
--- 
-2.8.1
-
diff --git a/package/rpi-userland/0003-Disable-Werror-everywhere.patch b/package/rpi-userland/0003-Disable-Werror-everywhere.patch
deleted file mode 100644
index 27c8acdd41..0000000000
--- a/package/rpi-userland/0003-Disable-Werror-everywhere.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-From cc9ac86bcff79697d354cc51d3a984fd0f362868 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 22 Sep 2016 22:59:11 +0200
-Subject: [PATCH] Disable Werror everywhere
-
-With gcc-5.1, some constructs that were previously accepted (but wrong)
-are now considered warnings, and thus -Werror makes them errors.
-
-Ditch -Werror altoghether.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-[Rebased for rpi-userland-a1b89e91f393c7134b4cdc36431f863bb3333163]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-
-[Rebased for rpi-userland-8f0abfb07b96e7ee85f46e59d895014ec5e25f5e]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-
-[Rebased for rpi-userland-5070cb7fc150fc98f1ed64a7739c3356970d9f76]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- host_applications/android/apps/vidtex/CMakeLists.txt | 2 +-
- host_applications/linux/apps/gencmd/CMakeLists.txt   | 2 +-
- host_applications/linux/apps/raspicam/CMakeLists.txt | 2 +-
- host_applications/linux/apps/smem/CMakeLists.txt     | 2 +-
- host_applications/linux/libs/bcm_host/CMakeLists.txt | 2 +-
- host_applications/linux/libs/sm/CMakeLists.txt       | 2 +-
- interface/mmal/CMakeLists.txt                        | 2 +-
- interface/vcos/CMakeLists.txt                        | 2 +-
- interface/vcos/pthreads/CMakeLists.txt               | 2 +-
- interface/vmcs_host/CMakeLists.txt                   | 2 +-
- 10 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/host_applications/android/apps/vidtex/CMakeLists.txt b/host_applications/android/apps/vidtex/CMakeLists.txt
-index 6d66d69..06a3192 100644
---- a/host_applications/android/apps/vidtex/CMakeLists.txt
-+++ b/host_applications/android/apps/vidtex/CMakeLists.txt
-@@ -1,6 +1,6 @@
- cmake_minimum_required(VERSION 2.8)
- 
--SET(COMPILE_DEFINITIONS -Werror -Wall)
-+SET(COMPILE_DEFINITIONS -Wall)
- 
- # Set --no-as-needed to stop the linker discarding mmal_vc_client
- # as it can't see that the constructor registers a load of functionality
-diff --git a/host_applications/linux/apps/gencmd/CMakeLists.txt b/host_applications/linux/apps/gencmd/CMakeLists.txt
-index f95d1a1..034bf20 100644
---- a/host_applications/linux/apps/gencmd/CMakeLists.txt
-+++ b/host_applications/linux/apps/gencmd/CMakeLists.txt
-@@ -4,7 +4,7 @@ if (WIN32)
-    set(VCOS_PLATFORM win32)
- else ()
-    set(VCOS_PLATFORM pthreads)
--   add_definitions(-Wall -Werror)
-+   add_definitions(-Wall )
- endif ()
- 
- include_directories( ../../../.. 
-diff --git a/host_applications/linux/apps/raspicam/CMakeLists.txt b/host_applications/linux/apps/raspicam/CMakeLists.txt
-index f7db21e..b94bdc3 100644
---- a/host_applications/linux/apps/raspicam/CMakeLists.txt
-+++ b/host_applications/linux/apps/raspicam/CMakeLists.txt
-@@ -1,7 +1,7 @@
- 
- # raspistill/raspivid/raspiyuv
- 
--SET(COMPILE_DEFINITIONS -Werror)
-+SET(COMPILE_DEFINITIONS )
- 
- # Set --no-as-needed to stop the linker discarding mmal_vc_client
- # as it can't see that the constructor registers a load of functionality
-diff --git a/host_applications/linux/apps/smem/CMakeLists.txt b/host_applications/linux/apps/smem/CMakeLists.txt
-index 0fa8328..f0d1e77 100644
---- a/host_applications/linux/apps/smem/CMakeLists.txt
-+++ b/host_applications/linux/apps/smem/CMakeLists.txt
-@@ -4,7 +4,7 @@ get_filename_component (VIDEOCORE_ROOT ../../../.. ABSOLUTE)
- include (${VIDEOCORE_ROOT}/makefiles/cmake/global_settings.cmake)
- 
- if (NOT WIN32)
--   add_definitions(-Wall -Werror)
-+   add_definitions(-Wall )
- endif ()
- 
- include_directories (
-diff --git a/host_applications/linux/libs/bcm_host/CMakeLists.txt b/host_applications/linux/libs/bcm_host/CMakeLists.txt
-index 2154e53..c23779b 100644
---- a/host_applications/linux/libs/bcm_host/CMakeLists.txt
-+++ b/host_applications/linux/libs/bcm_host/CMakeLists.txt
-@@ -3,7 +3,7 @@ if (WIN32)
-    set(VCOS_PLATFORM win32)
- else ()
-    set(VCOS_PLATFORM pthreads)
--   add_definitions(-Wall -Werror)
-+   add_definitions(-Wall )
- endif ()
- 
- # set this as we want all the source of vchostif to be available in libbcm_host
-diff --git a/host_applications/linux/libs/sm/CMakeLists.txt b/host_applications/linux/libs/sm/CMakeLists.txt
-index 5ce5aca..02aea7c 100644
---- a/host_applications/linux/libs/sm/CMakeLists.txt
-+++ b/host_applications/linux/libs/sm/CMakeLists.txt
-@@ -3,7 +3,7 @@ if (WIN32)
-    set(VCOS_PLATFORM win32)
- else ()
-    set(VCOS_PLATFORM pthreads)
--   add_definitions(-Wall -Werror)
-+   add_definitions(-Wall )
- endif ()
- 
- include_directories( ../../../..
-diff --git a/interface/mmal/CMakeLists.txt b/interface/mmal/CMakeLists.txt
-index 46f149d..06273dc 100644
---- a/interface/mmal/CMakeLists.txt
-+++ b/interface/mmal/CMakeLists.txt
-@@ -3,7 +3,7 @@ if (NOT DEFINED LIBRARY_TYPE)
- set(LIBRARY_TYPE SHARED)
- endif (NOT DEFINED LIBRARY_TYPE)
- 
--add_definitions(-Wall -Werror)
-+add_definitions(-Wall )
- 
- add_library(mmal SHARED util/mmal_util.c)
- 
-diff --git a/interface/vcos/CMakeLists.txt b/interface/vcos/CMakeLists.txt
-index 23a8d72..988b104 100644
---- a/interface/vcos/CMakeLists.txt
-+++ b/interface/vcos/CMakeLists.txt
-@@ -43,7 +43,7 @@ foreach (header ${HEADERS})
- endforeach ()
- 
- if (CMAKE_COMPILER_IS_GNUCC)
--   add_definitions (-ggdb -Werror -Wall)
-+   add_definitions (-ggdb  -Wall)
- endif ()
- 
- if (CMAKE_COMPILER_2005)
-diff --git a/interface/vcos/pthreads/CMakeLists.txt b/interface/vcos/pthreads/CMakeLists.txt
-index 1d81ca3..b35cd8e 100644
---- a/interface/vcos/pthreads/CMakeLists.txt
-+++ b/interface/vcos/pthreads/CMakeLists.txt
-@@ -1,7 +1,7 @@
- # MSVC5 does not fully support C99, enabling declaration-after-statement
- # warnings allows a common MSVC5 build error to be detected in Linux builds.
- if (CMAKE_COMPILER_IS_GNUCC)
--   set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Werror -Wdeclaration-after-statement")
-+   set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall  -Wdeclaration-after-statement")
-    add_definitions (-D_GNU_SOURCE)
- endif ()
- 
-diff --git a/interface/vmcs_host/CMakeLists.txt b/interface/vmcs_host/CMakeLists.txt
-index a157db1..dc384ca 100755
---- a/interface/vmcs_host/CMakeLists.txt
-+++ b/interface/vmcs_host/CMakeLists.txt
-@@ -2,7 +2,7 @@
- # interface/vmcs_host
- 
- # not working in release build
--# add_definitions(-Werror)
-+# add_definitions()
- 
- # vc_vchi_gencmd.c has a type-punning problem in vc_gencmd_read_response
- add_definitions(-fno-strict-aliasing)
--- 
-2.23.0
-
diff --git a/package/rpi-userland/0004-host-applications-disable-missing-applications.patch b/package/rpi-userland/0004-host-applications-disable-missing-applications.patch
deleted file mode 100644
index 08039123a4..0000000000
--- a/package/rpi-userland/0004-host-applications-disable-missing-applications.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c8d2c332da2a03ed80d62628bbf54187a66f49b6 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Fri, 24 Jul 2015 20:20:33 +0200
-Subject: [PATCH] host-applications: disable missing applications
-
-Those applications are missing from the public rpi-firmware package, so
-do not even try to build them.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-[Rebased for rpi-userland-a1b89e91f393c7134b4cdc36431f863bb3333163]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- host_applications/linux/CMakeLists.txt | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/host_applications/linux/CMakeLists.txt b/host_applications/linux/CMakeLists.txt
-index 5a648e7..83bb66e 100644
---- a/host_applications/linux/CMakeLists.txt
-+++ b/host_applications/linux/CMakeLists.txt
-@@ -12,10 +12,7 @@ add_subdirectory(apps/dtoverlay)
- add_subdirectory(apps/dtmerge)
- 
- if(ALL_APPS)
-- add_subdirectory(apps/vcdbg)
-- add_subdirectory(libs/elftoolchain)
-  # add_subdirectory(apps/smct)
-- add_subdirectory(apps/edid_parser)
-  add_subdirectory(apps/hello_pi)
- endif()
- 
--- 
-2.8.1
-
diff --git a/package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch b/package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch
deleted file mode 100644
index f028f67bdc..0000000000
--- a/package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1ffed0e8601afb7e65545bd545772edd0fccc404 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 23 Apr 2016 17:48:13 +0200
-Subject: [PATCH] dtmerge: add missing include for va_list
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes compile error with uclibc-1.0.14:
-
-  In file included from rpi-userland-52eca998aa43f278314579dba4798a3fe1da46c3/host_applications/linux/apps/dtmerge/dtmerge.c:32:0:
-  rpi-userland-52eca998aa43f278314579dba4798a3fe1da46c3/helpers/dtoverlay/dtoverlay.h:65:54: error: unknown type name ‘va_list’
-                                     const char *fmt, va_list args);
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- host_applications/linux/apps/dtmerge/dtmerge.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/host_applications/linux/apps/dtmerge/dtmerge.c b/host_applications/linux/apps/dtmerge/dtmerge.c
-index 9243da1..2ac8d39 100644
---- a/host_applications/linux/apps/dtmerge/dtmerge.c
-+++ b/host_applications/linux/apps/dtmerge/dtmerge.c
-@@ -28,6 +28,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #include <stdio.h>
- #include <stdlib.h>
- #include <libfdt.h>
-+#include <stdarg.h>
- 
- #include "dtoverlay.h"
- 
--- 
-2.8.1
-
diff --git a/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch b/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
deleted file mode 100644
index 6c596395f9..0000000000
--- a/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c8270cea98bcce0d22ddc8e2f86eae2c9989efd4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 25 Feb 2022 19:21:06 +0100
-Subject: [PATCH] interface/vcos/pthreads/CMakeLists.txt: fix build with
- libexecinfo
-
-interface/vcos/glibc/vcos_backtrace.c uses execinfo.h which can be
-provided by libexecinfo on uclibc or musl so link with it if needed to
-avoid the following build failure:
-
-/home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../build/lib/libvcos.so: undefined reference to `backtrace_symbols'
-
-Fixes:
- - http://autobuild.buildroot.org/results/93d3b8cc2ac5dfa9d4b44946c0b4d8171e8f52a1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/raspberrypi/userland/pull/719]
----
- interface/vcos/pthreads/CMakeLists.txt | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/interface/vcos/pthreads/CMakeLists.txt b/interface/vcos/pthreads/CMakeLists.txt
-index 1d81ca3..100207f 100644
---- a/interface/vcos/pthreads/CMakeLists.txt
-+++ b/interface/vcos/pthreads/CMakeLists.txt
-@@ -33,12 +33,14 @@ set (SOURCES
-    ../generic/vcos_generic_blockpool.c
- )
- 
-+find_library (EXECINFO_LIBRARY execinfo)
-+
- if (VCOS_PTHREADS_BUILD_SHARED)
-    add_library (vcos SHARED ${SOURCES})
--   target_link_libraries (vcos pthread dl rt)
-+   target_link_libraries (vcos pthread dl rt $<$<BOOL:${EXECINFO_LIBRARY}>:${EXECINFO_LIBRARY}>)
- else ()
-    add_library (vcos ${SOURCES})
--   target_link_libraries (vcos pthread rt)
-+   target_link_libraries (vcos pthread rt $<$<BOOL:${EXECINFO_LIBRARY}>:${EXECINFO_LIBRARY}>)
- endif ()
- 
- 
--- 
-2.35.1
-
diff --git a/package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch b/package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch
deleted file mode 100644
index 6dca2e7b8a..0000000000
--- a/package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From ffb8eafe2d745ddf2f44101ffc4e6599ed096e69 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 10 May 2021 19:15:48 +0200
-Subject: [PATCH] GLES2/gl2ext.h: add GLint64, GLuint64 and GLsync typedefs
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/gstreamer-1.0/gst/gl/glprototypes/gstgl_compat.h:40:18: error: conflicting declaration ‘typedef void* GLsync’
-   40 | typedef gpointer GLsync;
-      |                  ^~~~~~
-
-.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/qt5/QtGui/qopengles2ext.h:24:26: note: previous declaration as ‘typedef struct __GLsync* GLsync’
-   24 | typedef struct __GLsync *GLsync;
-      |                          ^~~~~~
-
-File gstgl_compat.h:
-
- 39 #if !GST_GL_HAVE_GLSYNC
- 40 typedef gpointer GLsync;
- 41 #endif
-
-File qopengles2ext.h:
-
-   1 #ifndef __gles2_gl2ext_h_
-   2 #define __gles2_gl2ext_h_ 1
-   3
-   4 #if 0
-   5 #pragma qt_no_master_include
-   6 #pragma qt_sync_skip_header_check
-   7 #pragma qt_sync_stop_processing
-   8 #endif
-   9
-  10 #ifdef __cplusplus
-  11 extern "C" {
-  12 #endif
-  13
-  14 #ifndef __gl3_h_
-  15 /* These types are defined with reference to <inttypes.h>
-  16  * in the Apple extension spec, but here we use the Khronos
-  17  * portable types in khrplatform.h, and assume those types
-  18  * are always defined.
-  19  * If any other extensions using these types are defined,
-  20  * the typedefs must move out of this block and be shared.
-  21  */
-  22 typedef khronos_int64_t GLint64;
-  23 typedef khronos_uint64_t GLuint64;
-  24 typedef struct __GLsync *GLsync;
-  25 #endif
-
-The problem is that rpi-userland doesn't define GLsync, and both
-GStreamer and Qt have their own definition of GLsync in this case, but
-they are not the same.
-
-We reported this issue to:
-
- * rpi-userland, to get the headers updated:
-   https://github.com/raspberrypi/userland/issues/469#issuecomment-1193864294
-
- * gstreamer, to get their bogus definition of GLsync fixed:
-   https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues/973
-
-In the mean time, fix this by adding the missing definitions to
-rpi-userland, so that GStreamer and Qt don't try to provide their own.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- interface/khronos/include/GLES2/gl2ext.h | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/interface/khronos/include/GLES2/gl2ext.h b/interface/khronos/include/GLES2/gl2ext.h
-index 4eacf7f..96e87ec 100644
---- a/interface/khronos/include/GLES2/gl2ext.h
-+++ b/interface/khronos/include/GLES2/gl2ext.h
-@@ -33,6 +33,19 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- extern "C" {
- #endif
- 
-+#ifndef __gl3_h_
-+/* These types are defined with reference to <inttypes.h>
-+ * in the Apple extension spec, but here we use the Khronos
-+ * portable types in khrplatform.h, and assume those types
-+ * are always defined.
-+ * If any other extensions using these types are defined,
-+ * the typedefs must move out of this block and be shared.
-+ */
-+typedef khronos_int64_t GLint64;
-+typedef khronos_uint64_t GLuint64;
-+typedef struct __GLsync *GLsync;
-+#endif
-+
- /* We want this */
- #ifndef GL_GLEXT_PROTOTYPES
- #define GL_GLEXT_PROTOTYPES
--- 
-2.31.1
-
diff --git a/package/rpi-userland/0008-Fix-conflicting-types-build-error.patch b/package/rpi-userland/0008-Fix-conflicting-types-build-error.patch
deleted file mode 100644
index 349ef2027e..0000000000
--- a/package/rpi-userland/0008-Fix-conflicting-types-build-error.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From c2337c83c627dd94f9b673361dca6ffafca7f59b Mon Sep 17 00:00:00 2001
-From: Jonas Kvinge <jonas@jkvinge.net>
-Date: Sun, 6 Jul 2025 20:21:00 +0200
-Subject: [PATCH] Fix conflicting types build error
-
-Upstream: https://github.com/raspberrypi/userland/pull/744
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- interface/vchiq_arm/vchiq_lib.c       | 2 +-
- interface/vmcs_host/vc_vchi_gpuserv.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/interface/vchiq_arm/vchiq_lib.c b/interface/vchiq_arm/vchiq_lib.c
-index 133d5ca..7a2dae5 100755
---- a/interface/vchiq_arm/vchiq_lib.c
-+++ b/interface/vchiq_arm/vchiq_lib.c
-@@ -537,7 +537,7 @@ vchiq_bulk_receive_handle(VCHIQ_SERVICE_HANDLE_T handle,
-    int size,
-    void *userdata,
-    VCHIQ_BULK_MODE_T mode,
--   int (*copy_pagelist)())
-+   int (*copy_pagelist)(char *vcptr, const struct pagelist_struct *pagelist))
- {
-    VCHIQ_SERVICE_T *service = find_service_by_handle(handle);
-    VCHIQ_QUEUE_BULK_TRANSFER_T args;
-diff --git a/interface/vmcs_host/vc_vchi_gpuserv.h b/interface/vmcs_host/vc_vchi_gpuserv.h
-index fc0bfee..ce6cb58 100755
---- a/interface/vmcs_host/vc_vchi_gpuserv.h
-+++ b/interface/vmcs_host/vc_vchi_gpuserv.h
-@@ -58,7 +58,7 @@ struct sync_job_s {
- 
- struct gpu_callback_s {
-   // callback to call when complete (can be NULL)
--  void (*func)();
-+  void (*func)(void*);
-   void *cookie;
- };
- 
--- 
-2.50.1
-
diff --git a/package/rpi-userland/0009-Fix-raspicommonsettings_parse_cmdline.patch b/package/rpi-userland/0009-Fix-raspicommonsettings_parse_cmdline.patch
deleted file mode 100644
index df11d591fc..0000000000
--- a/package/rpi-userland/0009-Fix-raspicommonsettings_parse_cmdline.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From cf6d0ac0d31fcc2e64c83b8105b078e792f2d441 Mon Sep 17 00:00:00 2001
-From: Krawlow <mglarecerca@gmail.com>
-Date: Wed, 23 Mar 2022 16:46:18 +0100
-Subject: [PATCH] Fix raspicommonsettings_parse_cmdline
-
-Fix raspicommonsettings_parse_cmdline's definition to match declaration
-
-Upstream: c4fd1b8986c6d6d4ae5cd51e65a8bbeb495dfa4e
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- host_applications/linux/apps/raspicam/RaspiCommonSettings.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/host_applications/linux/apps/raspicam/RaspiCommonSettings.h b/host_applications/linux/apps/raspicam/RaspiCommonSettings.h
-index 75b2937..2e9de7d 100644
---- a/host_applications/linux/apps/raspicam/RaspiCommonSettings.h
-+++ b/host_applications/linux/apps/raspicam/RaspiCommonSettings.h
-@@ -54,6 +54,6 @@ typedef struct
- void raspicommonsettings_set_defaults(RASPICOMMONSETTINGS_PARAMETERS *);
- void raspicommonsettings_dump_parameters(RASPICOMMONSETTINGS_PARAMETERS *);
- void raspicommonsettings_display_help();
--int raspicommonsettings_parse_cmdline(RASPICOMMONSETTINGS_PARAMETERS *state, const char *arg1, const char *arg2, void (*app_help)());
-+int raspicommonsettings_parse_cmdline(RASPICOMMONSETTINGS_PARAMETERS *state, const char *arg1, const char *arg2, void (*app_help)(char*));
- 
- #endif
--- 
-2.50.1
-
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
deleted file mode 100644
index 4219bdb9c4..0000000000
--- a/package/rpi-userland/Config.in
+++ /dev/null
@@ -1,45 +0,0 @@
-config BR2_PACKAGE_RPI_USERLAND
-	bool "rpi-userland"
-	depends on BR2_arm || BR2_aarch64
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_HAS_LIBEGL if BR2_arm
-	select BR2_PACKAGE_HAS_LIBGLES if BR2_arm
-	select BR2_PACKAGE_HAS_LIBOPENVG if BR2_arm
-	select BR2_PACKAGE_HAS_LIBOPENMAX if BR2_arm
-	help
-	  Raspberry Pi Userland contains the necessary library to use
-	  the VideoCore driver.
-
-	  Includes source for the ARM side code to interface to: EGL,
-	  mmal, GLESv2, vcos, openmaxil, vchiq_arm, bcm_host, WFC,
-	  OpenVG.
-
-	  https://github.com/raspberrypi/userland/
-
-if BR2_PACKAGE_RPI_USERLAND && BR2_arm
-
-config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "rpi-userland"
-
-config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "rpi-userland"
-
-config BR2_PACKAGE_PROVIDES_LIBOPENVG
-	default "rpi-userland"
-
-config BR2_PACKAGE_PROVIDES_LIBOPENMAX
-	default "rpi-userland"
-
-config BR2_PACKAGE_RPI_USERLAND_HELLO
-	bool "hello_pi examples"
-	help
-	  Install the hello-pi examples to test the HW (GPU, camera...)
-
-endif
-
-comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_arm || BR2_aarch64
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
deleted file mode 100644
index b837cfe709..0000000000
--- a/package/rpi-userland/rpi-userland.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  bb682f3c20bc5c7877531d5666c8dcc674a2f347aa792cf979dc0b07b6261e77  rpi-userland-14b90ff9d9f031391a299e6e006965d02bfd1bb1.tar.gz
-sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
deleted file mode 100644
index cb08945156..0000000000
--- a/package/rpi-userland/rpi-userland.mk
+++ /dev/null
@@ -1,61 +0,0 @@
-################################################################################
-#
-# rpi-userland
-#
-################################################################################
-
-RPI_USERLAND_VERSION = 14b90ff9d9f031391a299e6e006965d02bfd1bb1
-RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
-RPI_USERLAND_LICENSE = BSD-3-Clause
-RPI_USERLAND_LICENSE_FILES = LICENCE
-RPI_USERLAND_INSTALL_STAGING = YES
-RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
-
-ifeq ($(BR2_arm),y)
-RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
-RPI_USERLAND_DEPENDENCIES += libexecinfo
-endif
-
-ifeq ($(BR2_aarch64),y)
-RPI_USERLAND_CONF_OPTS += -DARM64=ON
-endif
-
-ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
-
-RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
-
-define RPI_USERLAND_EXTRA_LIBS_TARGET
-	$(INSTALL) -m 0644 -D \
-		$(@D)/build/lib/libilclient.so \
-		$(TARGET_DIR)/usr/lib/libilclient.so
-	$(INSTALL) -m 0644 -D \
-		$(@D)/build/lib/librevision.so \
-		$(TARGET_DIR)/usr/lib/librevision.so
-endef
-RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_EXTRA_LIBS_TARGET
-
-define RPI_USERLAND_EXTRA_LIBS_STAGING
-	$(INSTALL) -m 0644 -D \
-		$(@D)/build/lib/libilclient.so \
-		$(STAGING_DIR)/usr/lib/libilclient.so
-	$(INSTALL) -m 0644 -D \
-		$(@D)/build/lib/librevision.so \
-		$(STAGING_DIR)/usr/lib/librevision.so
-endef
-RPI_USERLAND_POST_INSTALL_STAGING_HOOKS += RPI_USERLAND_EXTRA_LIBS_STAGING
-
-else
-
-RPI_USERLAND_CONF_OPTS += -DALL_APPS=OFF
-
-endif # BR2_PACKAGE_RPI_USERLAND_HELLO
-
-define RPI_USERLAND_POST_TARGET_CLEANUP
-	rm -Rf $(TARGET_DIR)/usr/src
-endef
-RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
-
-$(eval $(cmake-package))

--===============4869305893389866746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4869305893389866746==--
