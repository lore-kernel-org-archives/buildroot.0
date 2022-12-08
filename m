Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ED2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12E6681403;
	Thu,  8 Dec 2022 22:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12E6681403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pyo8qCEWn7r; Thu,  8 Dec 2022 22:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0267C80F7E;
	Thu,  8 Dec 2022 22:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0267C80F7E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42FEC1BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9927820D4
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9927820D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LkJw299OTJao for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E745820F0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E745820F0
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:28 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout03.t-online.de (Postfix) with SMTP id DF4101ABB2
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:22 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX4-39oCDE0; Thu, 8 Dec 2022 23:38:22 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX3-00048i-2s
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:16 +0100
Message-Id: <20221208223817.1088619-70-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539102-D924D9D3-7B8F357C/0/0 CLEAN NORMAL
X-TOI-MSGID: 11ec6be2-4d56-4cd5-ae85-c8e5dc5cb020
Subject: [Buildroot] [PATCH 69/70] package/x11r7/xdriver_xf86-video-glint:
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

Building this package is broken with X.org xserver 21:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-glint/-/issues/1

Fixes:
http://autobuild.buildroot.net/results/f9d/f9d650ccb4173085cfc8873f1e52ee56caf982fa/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                   |  6 ++++++
 package/x11r7/Config.in                            |  1 -
 package/x11r7/xdriver_xf86-video-glint/Config.in   | 10 ----------
 .../xdriver_xf86-video-glint.hash                  |  4 ----
 .../xdriver_xf86-video-glint.mk                    | 14 --------------
 5 files changed, 6 insertions(+), 29 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index fd1e1ceeec..9565c5905f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
+	bool "xf86-video-glint removed"
+	select BR2_LEGACY
+	help
+	  The X.org xf86-video-glint package was removed.
+
 config BR2_PACKAGE_MESA3D_XVMC
 	bool "mesa Gallium XvMC state tracker removed"
 	select BR2_LEGACY
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 63259e88da..273db98e89 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -164,7 +164,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-fbdev/Config.in
 		source package/x11r7/xdriver_xf86-video-fbturbo/Config.in
 		source package/x11r7/xdriver_xf86-video-geode/Config.in
-		source package/x11r7/xdriver_xf86-video-glint/Config.in
 		source package/x11r7/xdriver_xf86-video-i128/Config.in
 		source package/x11r7/xdriver_xf86-video-imx/Config.in
 		source package/x11r7/xdriver_xf86-video-imx-viv/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-glint/Config.in b/package/x11r7/xdriver_xf86-video-glint/Config.in
deleted file mode 100644
index c474f6c912..0000000000
--- a/package/x11r7/xdriver_xf86-video-glint/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
-	bool "xf86-video-glint"
-	depends on BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XORGPROTO
-	help
-	  GLINT/Permedia video driver
-
-comment "xf86-video-glint needs mesa3d"
-	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash
deleted file mode 100644
index 40474ebc7b..0000000000
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002759.html
-sha256  852833ab2ea9ce519195dfd061a6c7aa5945a093cdc19546d1e9e69df7d577d2  xf86-video-glint-1.2.9.tar.bz2
-# Locally calculated
-sha256  6ca8e1a7e1d491f3618d3f14df1be64dbc8adefae7bbaf11d4920240dfb12f6e  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
deleted file mode 100644
index fba0030757..0000000000
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-glint
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_GLINT_VERSION = 1.2.9
-XDRIVER_XF86_VIDEO_GLINT_SOURCE = xf86-video-glint-$(XDRIVER_XF86_VIDEO_GLINT_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_GLINT_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_GLINT_LICENSE = MIT
-XDRIVER_XF86_VIDEO_GLINT_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
-
-$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
