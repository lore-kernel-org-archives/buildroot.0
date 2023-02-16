Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56097C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 18:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05DD060758;
	Thu, 16 Feb 2023 18:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05DD060758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K7RB9y_F04Hn; Thu, 16 Feb 2023 18:37:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2092260591;
	Thu, 16 Feb 2023 18:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2092260591
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B581F1BF963
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D155812AC
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D155812AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwaKKDb1fctH for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 18:36:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6472081241
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6472081241
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 18:36:59 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout08.t-online.de (Postfix) with SMTP id 4E85C16B30
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 19:36:56 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.190.165]) by fwd76.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pSj7n-2Kcclt0; Thu, 16 Feb 2023 19:36:55 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46210)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pSj7n-0007ES-1U
 for buildroot@buildroot.org; Thu, 16 Feb 2023 19:36:55 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 19:36:54 +0100
Message-Id: <20230216183655.402798-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676572615-E55752C2-1DF911F1/0/0 CLEAN NORMAL
X-TOI-MSGID: d8904437-56de-4338-aafa-53875773dd54
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xdriver_xf86-video-trident:
 bump version to 1.4.0
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
https://lists.x.org/archives/xorg-announce/2023-February/003326.html

Removed patch which was applied upstream.
Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-Remove-ramdac.patch                  | 56 -------------------
 .../xdriver_xf86-video-trident.hash           |  5 +-
 .../xdriver_xf86-video-trident.mk             |  6 +-
 3 files changed, 6 insertions(+), 61 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch

diff --git a/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch b/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch
deleted file mode 100644
index 38ca9afebf..0000000000
--- a/package/x11r7/xdriver_xf86-video-trident/0001-Remove-ramdac.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 07a5c4732f1c28ffcb873ee04500e3cb813c50b4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 7 Dec 2021 22:28:04 +0100
-Subject: [PATCH] Remove ramdac
-
-ramdac drivers have been removed from xserver since version 21.0.99.1
-and
-https://gitlab.freedesktop.org/xorg/xserver/-/commit/f0385fb420158ac3bc1c4c325431ffc5c62344bb
-resulting in the following build failure:
-
-In file included from trident_bank.c:37:
-trident.h:41:10: fatal error: xf86RamDac.h: No such file or directory
-   41 | #include "xf86RamDac.h"
-      |          ^~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/c81ac8075af257e8626d9d097270be7a7b4a1496
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/xorg/driver/xf86-video-trident/-/merge_requests/1]
----
- src/trident.h | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/trident.h b/src/trident.h
-index 5cadf52..c82de4c 100644
---- a/src/trident.h
-+++ b/src/trident.h
-@@ -38,7 +38,6 @@
- #include "xaa.h"
- #endif
- #include "xf86fbman.h"
--#include "xf86RamDac.h"
- #include "compiler.h"
- #include "vgaHW.h"
- #include "xf86i2c.h"
-@@ -103,7 +102,6 @@ typedef struct {
-     int			useEXA;
-     int			Chipset;
-     int			DACtype;
--    int			RamDac;
-     int                 ChipRev;
-     int			HwBpp;
-     int			BppShift;
-@@ -169,7 +167,6 @@ typedef struct {
-     CARD32		BltScanDirection;
-     CARD32		DrawFlag;
-     CARD16		LinePattern;
--    RamDacRecPtr	RamDacRec;
-     int			CursorOffset;
-     xf86CursorInfoPtr	CursorInfoRec;
-     xf86Int10InfoPtr	Int10;
--- 
-2.33.0
-
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
index 321f35d4f0..2ef664487c 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002762.html
-sha256  9e5119d974c3e2221994542d35e3a0b3426a441869ddd6dd08a84f324856ac3f  xf86-video-trident-1.3.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-February/003326.html
+sha256  7f76219ca7d7dc6061aa3c2aa59bc2a63895b8e6217e413ce315949f57b0189b  xf86-video-trident-1.4.0.tar.xz
+sha512  86f349ccfcf7c704e77a95882f63ac92f55819a3a00388f294777762fed04dde2197dd6124cded9e787af1982fecc43ad4d0af34307845e616a73d5a2ba750b9  xf86-video-trident-1.4.0.tar.xz
 # Locally calculated
 sha256  4f065198c49eac1513b915bc4478152c21119f31a97919a6ea8f3e1d10133d15  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index 20ec4bbc24..53fe150420 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.8
-XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRIDENT_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.4.0
+XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRIDENT_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_TRIDENT_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_TRIDENT_LICENSE = MIT
 XDRIVER_XF86_VIDEO_TRIDENT_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
