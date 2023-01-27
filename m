Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96190C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42CE361397;
	Tue, 21 Feb 2023 01:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42CE361397
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMV-XpkM0w6G; Tue, 21 Feb 2023 01:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B6A6FAD4;
	Tue, 21 Feb 2023 01:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B6A6FAD4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C99041BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F29B6FBB1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F29B6FBB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-Gu0zDsf_Z9 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92B8F6FBB3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92B8F6FBB3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 892FD81979; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 11:45:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2890f308b5e884b2cbf9db3ccfd7ea7e0f4b0ddb
X-Git-Newrev: 3fac163b9315a26f2ad041e0624fac283078d795
X-Patchwork-Hint: ignore
Message-Id: <20230220205240.892FD81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcamera-apps: bump
 to version 1.1.0
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
Content-Type: multipart/mixed; boundary="===============5708193287542023311=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5708193287542023311==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3fac163b9315a26f2ad041e0624fac283078d795
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-Werror-and-Wfatal-errors-compiler-comma.patch | 37 --------------------
 ...-egl_preview-compile-conversion-from-Wind.patch | 39 ----------------------
 package/libcamera-apps/libcamera-apps.hash         |  2 +-
 package/libcamera-apps/libcamera-apps.mk           |  4 +--
 4 files changed, 3 insertions(+), 79 deletions(-)

diff --git a/package/libcamera-apps/0001-cmake-remove-Werror-and-Wfatal-errors-compiler-comma.patch b/package/libcamera-apps/0001-cmake-remove-Werror-and-Wfatal-errors-compiler-comma.patch
deleted file mode 100644
index 988d89cca3..0000000000
--- a/package/libcamera-apps/0001-cmake-remove-Werror-and-Wfatal-errors-compiler-comma.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6bd733b52f0b4039407c676cd3126a9e2f79456b Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 5 Feb 2021 18:24:08 +0100
-Subject: [PATCH] cmake: remove -Werror and -Wfatal-errors compiler command
- line option
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes (with bootlin-riscv64-musl toolchain):
-
-  .../build/libcamera-apps-2d1009e3badcc8047361ff81149ad6cba3b911b5/core/libcamera_app.cpp:30:22: error: overflow in conversion from ‘long unsigned int’ to ‘int’ changes value from ‘2154321408’ to ‘-2140645888’ [-Werror=overflow]
-     30 |  int ret = ioctl(fd, VIDIOC_QUERYCAP, &caps);
-        |                      ^~~~~~~~~~~~~~~
-  cc1plus: all warnings being treated as errors
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 748c6dd..1ca1e39 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -11,7 +11,7 @@ endif()
- 
- set (CMAKE_EXPORT_COMPILE_COMMANDS ON)
- set (CMAKE_CXX_STANDARD 17)
--add_compile_options(-Wall -Wextra -pedantic -Wno-unused-parameter -faligned-new -Werror -Wfatal-errors)
-+add_compile_options(-Wall -Wextra -pedantic -Wno-unused-parameter -faligned-new)
- add_definitions(-D_FILE_OFFSET_BITS=64)
- 
- if (CMAKE_COMPILER_IS_GNUCXX)
--- 
-2.34.1
-
diff --git a/package/libcamera-apps/0002-preview-fix-egl_preview-compile-conversion-from-Wind.patch b/package/libcamera-apps/0002-preview-fix-egl_preview-compile-conversion-from-Wind.patch
deleted file mode 100644
index cc9069aa86..0000000000
--- a/package/libcamera-apps/0002-preview-fix-egl_preview-compile-conversion-from-Wind.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 60715769cd5368a63b2bdc2e6d6bb6df0030a54d Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 31 Mar 2022 21:44:22 +0200
-Subject: [PATCH] preview: fix egl_preview compile (conversion from Window to
- EGLNativeWindowType)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  .../build/libcamera-apps-2d1009e3badcc8047361ff81149ad6cba3b911b5/preview/egl_preview.cpp:329:69: error: invalid conversion from ‘Window’ {aka ‘long unsigned int’} to ‘EGLNativeWindowType’ {aka ‘fbdev_window*’} [-fpermissive]
-    329 |         egl_surface_ = eglCreateWindowSurface(egl_display_, config, window_, NULL);
-        |                                                                     ^~~~~~~
-        |                                                                     |
-        |                                                                     Window {aka long unsigned int}
-
-[Upstream: https://github.com/raspberrypi/libcamera-apps/pull/283]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- preview/egl_preview.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/preview/egl_preview.cpp b/preview/egl_preview.cpp
-index b936e57..593583d 100644
---- a/preview/egl_preview.cpp
-+++ b/preview/egl_preview.cpp
-@@ -326,7 +326,7 @@ void EglPreview::makeWindow(char const *name)
- 	wm_delete_window_ = XInternAtom(display_, "WM_DELETE_WINDOW", False);
- 	XSetWMProtocols(display_, window_, &wm_delete_window_, 1);
- 
--	egl_surface_ = eglCreateWindowSurface(egl_display_, config, window_, NULL);
-+	egl_surface_ = eglCreateWindowSurface(egl_display_, config, reinterpret_cast<EGLNativeWindowType>(window_), NULL);
- 	if (!egl_surface_)
- 		throw std::runtime_error("eglCreateWindowSurface failed");
- 
--- 
-2.35.1
-
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index 2dbb74d463..cc2d3b6926 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  611aec06dd24de6586580164d9b7c55da0698ac4cf129944b2fc41fe67210597  libcamera-apps-2d1009e3badcc8047361ff81149ad6cba3b911b5.tar.gz
+sha256  2d895ad5d11a6004b1e84eb8d486d5dca64dda1b41e0f4f3f87904666f249e3e  libcamera-apps-1.1.0.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index f4fc019c17..a5d9227250 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 2d1009e3badcc8047361ff81149ad6cba3b911b5
-LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,$(LIBCAMERA_APPS_VERSION))
+LIBCAMERA_APPS_VERSION = 1.1.0
+LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
 LIBCAMERA_APPS_DEPENDENCIES = \

--===============5708193287542023311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5708193287542023311==--
