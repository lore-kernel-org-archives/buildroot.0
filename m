Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9BDC7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 10:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8739181546;
	Sun, 22 Jun 2025 10:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZjdcJ_vLA8z; Sun, 22 Jun 2025 10:10:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E3478169E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E3478169E;
	Sun, 22 Jun 2025 10:10:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C850C8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99A52816DA
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QO5ag3BRMmxv for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 10:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C72768169E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C72768169E
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:10:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6E8484226; Sun, 22 Jun 2025 10:10:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 12:08:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e1d85930f8376683d64331f5ca96a394b9adef2
X-Git-Newrev: c6252c2e50b7fe555f62cbf38fdde8ba540f00ea
X-Patchwork-Hint: ignore
Message-Id: <20250622101002.B6E8484226@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera-apps: bump version to
 v1.7.0-10-ge9645231
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5566225961762593805=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5566225961762593805==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c6252c2e50b7fe555f62cbf38fdde8ba540f00ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version bump is needed for compatibility with the upcoming bump of
ffmpeg to version 7.1.x.

Use the new configure option disable_rpi_features to allow building for
non-rbpi defconfigs.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: use "git describe --tags --abbrev=40" format in _VERSION]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...te-checks-for-disable_rpi_features-option.patch | 52 ++++++++++++++++++++++
 package/libcamera-apps/libcamera-apps.hash         |  2 +-
 package/libcamera-apps/libcamera-apps.mk           | 11 +++--
 3 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch b/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch
new file mode 100644
index 0000000000..1aba972d13
--- /dev/null
+++ b/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch
@@ -0,0 +1,52 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 21 Jun 2025 18:12:18 +0200
+Subject: [PATCH] core: Update checks for disable_rpi_features option
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Based on the original commit that added the sync feature there
+were a few more options that needed the disable_rpi_features
+code conditionals to ensure compilation against upstream
+libcamera so add them in to ensure this works.
+
+Fixes:
+../core/rpicam_app.cpp: In member function ‘void RPiCamApp::StartCamera()’:
+../core/rpicam_app.cpp:642:78: error: ‘controls::rpi’ has not been declared
+  642 |         if (!controls_.get(controls::ScalerCrop) && !controls_.get(controls::rpi::ScalerCrops))
+      |                                                                              ^~~
+../core/rpicam_app.cpp:673:49: error: ‘controls::rpi’ has not been declared
+  673 |                         controls_.set(controls::rpi::ScalerCrops, libcamera::Span<const Rectangle>(crops.data(), crops.size()));
+      |                                                 ^~~
+
+Upstream: https://github.com/raspberrypi/rpicam-apps/pull/827
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ core/rpicam_app.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/core/rpicam_app.cpp b/core/rpicam_app.cpp
+index bed69c0..1db784f 100644
+--- a/core/rpicam_app.cpp
++++ b/core/rpicam_app.cpp
+@@ -637,6 +637,7 @@ void RPiCamApp::StartCamera()
+ 	// This makes all the Request objects that we shall need.
+ 	makeRequests();
+ 
++#ifndef DISABLE_RPI_FEATURES
+ 	// Build a list of initial controls that we must set in the camera before starting it.
+ 	// We don't overwrite anything the application may have set before calling us.
+ 	if (!controls_.get(controls::ScalerCrop) && !controls_.get(controls::rpi::ScalerCrops))
+@@ -672,6 +673,7 @@ void RPiCamApp::StartCamera()
+ 		else
+ 			controls_.set(controls::rpi::ScalerCrops, libcamera::Span<const Rectangle>(crops.data(), crops.size()));
+ 	}
++#endif
+ 
+ 	if (!controls_.get(controls::AfWindows) && !controls_.get(controls::AfMetering) &&
+ 		options_->Get().afWindow_width != 0 && options_->Get().afWindow_height != 0)
+-- 
+2.39.5
+
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index 00b499d247..b11ea7fe67 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  576bcd585f1c8d8bc80e37fa3c8a172e9d1c8406490438cf6d0fbc7ba4996ec1  rpicam-apps-1.5.0.tar.xz
+sha256  b5535933ebc398616fd1b261fa9e3755dfb419e10ee7866078a8a8d99f54a59a  libcamera-apps-v1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 17983bb8ca..06efb9a960 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.5.0
-LIBCAMERA_APPS_SOURCE = rpicam-apps-$(LIBCAMERA_APPS_VERSION).tar.xz
-LIBCAMERA_APPS_SITE = https://github.com/raspberrypi/rpicam-apps/releases/download/v$(LIBCAMERA_APPS_VERSION)
+LIBCAMERA_APPS_VERSION = v1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a
+LIBCAMERA_APPS_SITE = $(call github,raspberrypi,rpicam-apps,$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
 LIBCAMERA_APPS_DEPENDENCIES = \
@@ -36,6 +35,12 @@ else
 LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+LIBCAMERA_APPS_CONF_OPTS += -Ddisable_rpi_features=false
+else
+LIBCAMERA_APPS_CONF_OPTS += -Ddisable_rpi_features=true
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBCAMERA_APPS_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \

--===============5566225961762593805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5566225961762593805==--
