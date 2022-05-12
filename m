Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9A8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5921409C1;
	Thu, 12 May 2022 18:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7-wRHyj3vZ0; Thu, 12 May 2022 18:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73B64401B9;
	Thu, 12 May 2022 18:57:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56DBC1C1189
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 882A760777
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXJZtQE_VR-v for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:54:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91B9C607F0
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:54:01 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout05.t-online.de (Postfix) with SMTP id 4629419774
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:57 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwi-0Sp6qj0; Thu, 12 May 2022 20:53:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwi-0004aZ-6T
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:56 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:41 +0200
Message-Id: <20220512185355.873825-11-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381636-0001606D-BB3ADD56/0/0 CLEAN NORMAL
X-TOI-MSGID: dba40f69-ec3d-4768-8756-89aa0083025f
Subject: [Buildroot] [PATCH 11/25] package/x11r7/xapp_setxkbmap: bump
 version to 1.3.3
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

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003146.html

Added dependency to xlib_libXrandr needed after upstream commit:
https://gitlab.freedesktop.org/xorg/app/setxkbmap/-/commit/13d1e26d696c5113a20dfc2f56c03ddb837a2eac

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_setxkbmap/Config.in           |  1 +
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash | 10 ++++------
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk   |  6 +++---
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_setxkbmap/Config.in b/package/x11r7/xapp_setxkbmap/Config.in
index 2b1389c753..add50813f0 100644
--- a/package/x11r7/xapp_setxkbmap/Config.in
+++ b/package/x11r7/xapp_setxkbmap/Config.in
@@ -2,5 +2,6 @@ config BR2_PACKAGE_XAPP_SETXKBMAP
 	bool "setxkbmap"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	select BR2_PACKAGE_XLIB_LIBXRANDR
 	help
 	  Controls the keyboard layout of a running X server.
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
index 4f963593cb..a57d7cc737 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003007.html
-md5 93e736c98fb75856ee8227a0c49a128d  setxkbmap-1.3.2.tar.bz2
-sha1 44783734bc58fca93165a20da0bb3eca1ccb9ad9  setxkbmap-1.3.2.tar.bz2
-sha256 8ff27486442725e50b02d7049152f51d125ecad71b7ce503cfa09d5d8ceeb9f5  setxkbmap-1.3.2.tar.bz2
-sha512 bfa8015dee0d8d3fdbbd89afbd71c8606ce168d6edca8521d5ed05a00fecbea39bc4bfcce84b71458bdeb34c60bd80a5df27e0691ccee3966443ecdc937faf38  setxkbmap-1.3.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003146.html
+sha256  b560c678da6930a0da267304fa3a41cc5df39a96a5e23d06f14984c87b6f587b  setxkbmap-1.3.3.tar.xz
+sha512  208f07a7f7bce47b573099d4cd8c941a3a4d74b456720bc3ca1cbba298381a2ab98c7500d6e6cd6d5dd61840b7c42cf6521da754ec395f266f8158102a55ad58  setxkbmap-1.3.3.tar.xz
 # Locally computed
-sha256 afb8ce58340b6a6b85b73e256425263ce46f5a427279785e275991cb660cce82  COPYING
+sha256  afb8ce58340b6a6b85b73e256425263ce46f5a427279785e275991cb660cce82  COPYING
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index 8b69747593..4d48a3fbc1 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-XAPP_SETXKBMAP_VERSION = 1.3.2
-XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.bz2
+XAPP_SETXKBMAP_VERSION = 1.3.3
+XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.xz
 XAPP_SETXKBMAP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SETXKBMAP_LICENSE = MIT
 XAPP_SETXKBMAP_LICENSE_FILES = COPYING
-XAPP_SETXKBMAP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
+XAPP_SETXKBMAP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile xlib_libXrandr
 
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
