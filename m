Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF67EC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E5440352;
	Mon, 20 Feb 2023 21:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E5440352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2Xc_c099Se5; Mon, 20 Feb 2023 21:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C5444EC19;
	Mon, 20 Feb 2023 21:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C5444EC19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F40B01BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EB7F415B5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EB7F415B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uehO5av8gcFD for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7908C4168E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7908C4168E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 766C386494; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:49:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d77345d05169d2fe8df1afc3714c2b373e273ef9
X-Git-Newrev: 565f41e27c7a6cfd3b51ddf46071799a40f5eb99
X-Patchwork-Hint: ignore
Message-Id: <20230220205159.766C386494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-video-glint: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=565f41e27c7a6cfd3b51ddf46071799a40f5eb99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Building this package is broken with X.org xserver 21:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-glint/-/issues/1

Fixes:
http://autobuild.buildroot.net/results/f9d/f9d650ccb4173085cfc8873f1e52ee56caf982fa/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                           |  7 +++++++
 package/x11r7/Config.in                                    |  1 -
 package/x11r7/xdriver_xf86-video-glint/Config.in           | 10 ----------
 .../xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash |  4 ----
 .../xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk   | 14 --------------
 5 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 522102a0c0..bf3bd55f35 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
+	bool "xf86-video-glint removed"
+	select BR2_LEGACY
+	help
+	  The X.org xf86-video-glint package no longer builds with
+	  Xserver 21 and is unmaintained.
+
 config BR2_PACKAGE_USBREDIR_SERVER
 	bool "usbredirserver removed"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
