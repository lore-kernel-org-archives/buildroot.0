Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411F7C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F05F370021;
	Tue, 21 Feb 2023 01:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F05F370021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyrKxHMkJzVO; Tue, 21 Feb 2023 01:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D817002D;
	Tue, 21 Feb 2023 01:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5D817002D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 632171BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A2A96FC2C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A2A96FC2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4eqj3xbdlrCO for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14F60610A4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F60610A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 132D581979; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 16:30:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 01ce9e95eb4f7fb731b20f3973edd582d4640084
X-Git-Newrev: aa7d11a2ad984930eb8e8830c44cbabebdcf8568
X-Patchwork-Hint: ignore
Message-Id: <20230220205250.132D581979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/xdriver_xf86-video-imx-viv: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa7d11a2ad984930eb8e8830c44cbabebdcf8568
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 424f53ac0730 (package/freescale-imx/imx-gpu-viv: drop X11 output)
dropped BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 which xdriver_xf86-video-imx-viv
depends on, so the package is no longer selectable.

So drop the package and add a legacy symbol for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |  6 +++
 DEVELOPERS                                         |  2 -
 package/x11r7/Config.in                            |  1 -
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 44 ----------------------
 .../xdriver_xf86-video-imx-viv.hash                |  3 --
 .../xdriver_xf86-video-imx-viv.mk                  | 34 -----------------
 6 files changed, 6 insertions(+), 84 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 191a209eeb..8b7ecd840b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -197,6 +197,12 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	help
 	  The X11 output was dropped by NXP.
 
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
+	bool "xf86-video-imx-viv has been removed"
+	select BR2_LEGACY
+	help
+	  The X11 output was dropped by NXP.
+
 config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
 	string "the QEMU specific targets option has been removed"
 	help
diff --git a/DEVELOPERS b/DEVELOPERS
index 97c28fbdd8..6597225ac3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1106,7 +1106,6 @@ F:	package/gstreamer1/gst1-imx/
 F:	package/libimxvpuapi/
 F:	package/mfgtools/
 F:	package/sshpass/
-F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
 N:	Geoff Levand <geoff@infradead.org>
 F:	package/flannel/
@@ -1487,7 +1486,6 @@ F:	package/lxc/
 F:	package/strongswan/
 F:	package/wmctrl/
 F:	package/x11r7/xdriver_xf86-video-imx/
-F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
 N:	Jesse Van Gavere <jesseevg@gmail.com>
 F:	package/qt6/
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 4d3613cf4d..365de34c98 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -165,7 +165,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-geode/Config.in
 		source package/x11r7/xdriver_xf86-video-i128/Config.in
 		source package/x11r7/xdriver_xf86-video-imx/Config.in
-		source package/x11r7/xdriver_xf86-video-imx-viv/Config.in
 		source package/x11r7/xdriver_xf86-video-intel/Config.in
 		source package/x11r7/xdriver_xf86-video-mach64/Config.in
 		source package/x11r7/xdriver_xf86-video-mga/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
deleted file mode 100644
index 984f63d6d3..0000000000
--- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
+++ /dev/null
@@ -1,44 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
-	bool "xf86-video-imx-viv"
-	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
-	depends on BR2_PACKAGE_IMX_GPU_G2D
-	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XORGPROTO
-	help
-	  X.Org driver for iMX6 GPU (Vivante)
-
-	  Notice EGL and GLes2 APIs are correctly supported. This
-	  driver should also be able to provide Desktop OpenGL
-	  implementation but, this feature seems broken since quite
-	  some time.
-
-	  To use this driver, add correct configuration to your
-	  /etc/X11/xorg.conf:
-
-	  Section "Device"
-	    [...]
-	    Driver          "vivante"
-	    Option          "vivante_fbdev" "/dev/fbX"
-	  EndSection
-
-	  Don't forget to load galcore.ko and create /dev/galcore
-	  before using this driver (else, Xorg will exit with an
-	  obscure message like "Segmentation fault at address 0xc").
-
-comment "xf86-video-imx-viv needs an OpenGL backend"
-	depends on BR2_arm
-	depends on !BR2_PACKAGE_HAS_LIBGL
-	depends on BR2_TOOLCHAIN_HAS_SYNC_1
-
-comment "xf86-video-imx-viv depends on imx-gpu-viv with X11 output"
-	depends on BR2_arm
-	depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
-	depends on BR2_TOOLCHAIN_HAS_SYNC_1
-
-comment "xf86-video-imx-viv depends on imx-gpu-g2d"
-	depends on BR2_arm
-	depends on !BR2_PACKAGE_IMX_GPU_G2D
-	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
-	depends on BR2_TOOLCHAIN_HAS_SYNC_1
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
deleted file mode 100644
index b79c236478..0000000000
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  8fe1f57334b22926d4ff3b0b9fdf50af835a99cdfd0ad3ba6a604b226b723e89  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga.tar.gz
-sha256  9d3e373f0440cc0c58853e963636a7c1ffda9308ec5f30ebe9adfb9c16a8a1e4  COPYING-MIT
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
deleted file mode 100644
index 3b346f323a..0000000000
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-imx-viv
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = rel_imx_4.9.x_1.0.0_ga
-XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(call github,nxp-imx,xf86-video-imx-vivante,$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION))
-XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv imx-gpu-g2d xserver_xorg-server \
-	xorgproto libdrm
-XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE = MIT
-XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE_FILES = COPYING-MIT
-XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING = YES
-XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD = $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/EXA/src -f makefile.linux
-
-define XDRIVER_XF86_VIDEO_IMX_VIV_BUILD_CMDS
-	$(XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD) sysroot=$(STAGING_DIR) \
-		BUSID_HAS_NUMBER=1 BUILD_IN_YOCTO=1 XSERVER_GREATER_THAN_13=1 \
-		CFLAGS="$(TARGET_CFLAGS)"
-endef
-
-define XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING_CMDS
-	$(XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD) prefix=$(STAGING_DIR)/usr install
-	$(INSTALL) -D -m 644 $(@D)/EXA/src/vivante_gal/vivante_priv.h \
-		$(STAGING_DIR)/usr/include/vivante_priv.h
-	$(INSTALL) -D -m 644 $(@D)/EXA/src/vivante_gal/vivante_gal.h \
-		$(STAGING_DIR)/usr/include/vivante_gal.h
-endef
-
-define XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_TARGET_CMDS
-	$(XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD) prefix=$(TARGET_DIR)/usr install
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
