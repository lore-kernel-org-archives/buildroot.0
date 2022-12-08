Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC46C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A834C60B2F;
	Thu,  8 Dec 2022 22:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A834C60B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-T90MEjbT8q; Thu,  8 Dec 2022 22:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6494960B16;
	Thu,  8 Dec 2022 22:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6494960B16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69BC81BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52C43400FE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52C43400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoXgZXghMEr8 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3382B401B7
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3382B401B7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:33 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout11.t-online.de (Postfix) with SMTP id 91AE1246C7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX4-21qtnP0; Thu, 8 Dec 2022 23:38:22 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX3-00048i-3C
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:22 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:17 +0100
Message-Id: <20221208223817.1088619-71-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539102-C13271D1-B49F8F04/0/0 CLEAN NORMAL
X-TOI-MSGID: f339c597-44d6-447b-86ce-529d355707d1
Subject: [Buildroot] [PATCH 70/70] package/x11r7/xdriver_xf86-video-tga:
 remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building this package is broken with X.org xserver 21.

Fixes:
http://autobuild.buildroot.net/results/de5/de5efd922edb9eb7dc9981b5f10ea402487ee431/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                              |  6 +++
 package/x11r7/Config.in                       |  1 -
 .../0001-mibstore.patch                       | 47 -------------------
 .../x11r7/xdriver_xf86-video-tga/Config.in    |  5 --
 .../xdriver_xf86-video-tga.hash               |  4 --
 .../xdriver_xf86-video-tga.mk                 | 14 ------
 6 files changed, 6 insertions(+), 71 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-tga/0001-mibstore.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-tga/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.hash
 delete mode 100644 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 9565c5905f..acf9671ad7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
+	bool "xf86-video-tga removed"
+	select BR2_LEGACY
+	help
+	  The X.org xf86-video-tga package was removed.
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
 	bool "xf86-video-glint removed"
 	select BR2_LEGACY
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 273db98e89..da79c4e851 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -180,7 +180,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
 		source package/x11r7/xdriver_xf86-video-sis/Config.in
 		source package/x11r7/xdriver_xf86-video-tdfx/Config.in
-		source package/x11r7/xdriver_xf86-video-tga/Config.in
 		source package/x11r7/xdriver_xf86-video-trident/Config.in
 		source package/x11r7/xdriver_xf86-video-vesa/Config.in
 		source package/x11r7/xdriver_xf86-video-vmware/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-tga/0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-tga/0001-mibstore.patch
deleted file mode 100644
index 07bcd04f25..0000000000
--- a/package/x11r7/xdriver_xf86-video-tga/0001-mibstore.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From b7022db0559cd1b6cd3eb6b5abf6896a607b478d Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 25 Sep 2012 12:55:00 +0000
-Subject: Remove mibstore.h
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Fetch from:
-http://cgit.freedesktop.org/xorg/driver/xf86-video-tga/commit/?id=b7022db0559cd1b6cd3eb6b5abf6896a607b478d
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff --git a/src/tga_accel.c b/src/tga_accel.c
-index 35af1a4..b414df5 100644
---- a/src/tga_accel.c
-+++ b/src/tga_accel.c
-@@ -37,7 +37,6 @@
- #include "xf86cmap.h"
- #include "mipointer.h"
- 
--#include "mibstore.h"
- #include "miline.h"
- 
- #include "tga_regs.h"
-diff --git a/src/tga_driver.c b/src/tga_driver.c
-index dd4f3e6..90d2660 100644
---- a/src/tga_driver.c
-+++ b/src/tga_driver.c
-@@ -46,8 +46,6 @@
- 
- /* software cursor */
- #include "mipointer.h"
--/* backing store */
--#include "mibstore.h"
- 
- /*  #include "mibank.h" */
- /* colormap manipulation */
-@@ -1451,7 +1449,6 @@ TGAScreenInit(SCREEN_INIT_ARGS_DECL)
-     
-     fbPictureInit (pScreen, 0, 0);
-     
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
-     xf86SetSilkenMouse(pScreen);
- 
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-tga/Config.in b/package/x11r7/xdriver_xf86-video-tga/Config.in
deleted file mode 100644
index 7c75661acc..0000000000
--- a/package/x11r7/xdriver_xf86-video-tga/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
-	bool "xf86-video-tga"
-	select BR2_PACKAGE_XORGPROTO
-	help
-	  X.Org driver for tga cards
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.hash b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.hash
deleted file mode 100644
index 4f8c10965c..0000000000
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From http://lists.x.org/archives/xorg-announce/2012-July/002025.html
-sha256  2023818000200eb50a59476e36d59b07a361b110e73b1d9cc526beb669306131  xf86-video-tga-1.2.2.tar.bz2
-# Locally calculated
-sha256  92e36c6b7c99c8335e5823d53686e58ebd82ee8051a6360f60c8c0fb05745954  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
deleted file mode 100644
index 421b09be22..0000000000
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-tga
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_TGA_VERSION = 1.2.2
-XDRIVER_XF86_VIDEO_TGA_SOURCE = xf86-video-tga-$(XDRIVER_XF86_VIDEO_TGA_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_TGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_TGA_LICENSE = MIT
-XDRIVER_XF86_VIDEO_TGA_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_TGA_DEPENDENCIES = xserver_xorg-server xorgproto
-
-$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
