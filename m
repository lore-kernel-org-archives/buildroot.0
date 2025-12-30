Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C495EE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E86860BF1;
	Tue, 30 Dec 2025 22:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0H5ptGRZDaW; Tue, 30 Dec 2025 22:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F2F060C19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133608;
	bh=EpdJzXrrkhg922NvcM1+vdvMhKGNbR1eH3vjZlDINWU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZMcLQsqTIFpKT95f9r+kZPQzYCm/X/IBW1Xny+RM+NuPyHvZxUlPz9ctm/2mNQIqF
	 Dy+AaY37Q3L+Fy17Wz1Xv4/se2UBsZ0E4Bafsl5u5qsPH8oJ6FymxXxclPLMyWmSom
	 svuqcJ7SsivDmUqgSNOduDXfnktlfjfIrWC17mrxLzy2d7vjY7hYj7oLQb1ncxeYhr
	 uznn4JPQydEFyerLu4uEbxtPwJbuqupNaJBZcASiaTDBKYYvMTpWI6177TnaU1HlkE
	 Mo2lEorArRVuHI2k2mrVzui1xwVfXyHWGxZeVmzgrpLVIxZM1Vx9jPqCMIv/XZPBbw
	 HQsaDNR68IX5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F2F060C19;
	Tue, 30 Dec 2025 22:26:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C633177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A3A440333
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvQDILG77oRe for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC9B40339
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CC9B40339
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C0DD87D4A; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 830a1ef488ba8f245048ee0cbce198ea34d21270
X-Git-Newrev: c91fbaef27c88f97f2b822ade42e2b80947821b5
X-Patchwork-Hint: ignore
Message-Id: <20251230222628.3C0DD87D4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-base: drop
 rpi-userland support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c91fbaef27c88f97f2b822ade42e2b80947821b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the rpi-userland package, drop support for it
from package/gstreamer/gst1-plugins-base.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   |  7 +++++
 package/gstreamer1/gst1-plugins-base/Config.in     | 30 +++-------------------
 .../gst1-plugins-base/gst1-plugins-base.mk         |  4 ---
 3 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 719f99c06f..2d6868cd10 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX
+	bool "gst1-plugins-base dispmanx option removed"
+	select BR2_LEGACY
+	help
+	  Due to the removal of the rpi-userland package, the dispmanx
+	  OpenGL plug-in from GStreamer plugin base has been removed.
+
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
 	bool "rpi-firmware vcdbg option removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index df10774ac7..6eff685c2f 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -178,7 +178,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX
 	default y
 	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
-	depends on !BR2_PACKAGE_RPI_USERLAND # x11
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11
@@ -186,13 +185,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX
 	help
 	  OpenGL Extension to the X Window System
 
-comment "glx not supported with rpi-userland"
-	depends on BR2_PACKAGE_RPI_USERLAND
-
 comment "glx needs the opengl API and modular X.org"
-	depends on !BR2_PACKAGE_RPI_USERLAND && \
-		(!BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL || \
-		!BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL || \
+		!BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
 	bool "egl"
@@ -214,19 +209,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11
 	bool "x11"
 	default y
 	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
-	depends on !BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
 
-comment "x11 not supported with rpi-userland"
-	depends on BR2_PACKAGE_RPI_USERLAND
-
 comment "x11 needs a platform and X.org"
-	depends on !BR2_PACKAGE_RPI_USERLAND && \
-		(!BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM || \
-		!BR2_PACKAGE_XORG7)
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM || \
+		!BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND
 	bool "wayland"
@@ -240,18 +230,6 @@ comment "wayland needs the egl platform and the wayland package"
 	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL || \
 		!BR2_PACKAGE_WAYLAND
 
-config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX
-	bool "dispmanx"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
-	depends on BR2_PACKAGE_RPI_USERLAND
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
-	help
-	  Raspberry Pi's Dispmanx windowing system
-
-comment "dispmanx needs the egl platform and rpi-userland"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL || \
-		!BR2_PACKAGE_RPI_USERLAND
 endif
 
 comment "opengl needs an OpenGL or OpenGL ES backend"
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 456cd205bb..adfb407386 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -93,10 +93,6 @@ GST1_PLUGINS_BASE_WINSYS_LIST += wayland
 GST1_PLUGINS_BASE_DEPENDENCIES += wayland wayland-protocols
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX),y)
-GST1_PLUGINS_BASE_WINSYS_LIST += dispmanx
-GST1_PLUGINS_BASE_DEPENDENCIES += rpi-userland
-endif
 GST1_PLUGINS_BASE_CONF_OPTS += -Dgl_winsys='$(subst $(space),$(comma),$(GST1_PLUGINS_BASE_WINSYS_LIST))'
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
