Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CA1C61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 16:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5FA240B64;
	Sun, 19 Feb 2023 16:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5FA240B64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NmQmCt80r5vF; Sun, 19 Feb 2023 16:56:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E59C34119B;
	Sun, 19 Feb 2023 16:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E59C34119B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 841211BF287
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D4FF404F4
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D4FF404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iwmpwPekgQGf for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 16:56:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 860B640B62
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 16:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 860B640B62
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7364E803E2; Sun, 19 Feb 2023 16:56:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 17:53:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fc69996bcd190e693b1af95cc44fda89028d049
X-Git-Newrev: 05de8e14ce9bf9ea109aa028b34aba559aa18aad
X-Patchwork-Hint: ignore
Message-Id: <20230219165607.7364E803E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-trident:
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=05de8e14ce9bf9ea109aa028b34aba559aa18aad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003326.html

Removed patch which was applied upstream.
Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Remove-ramdac.patch                       | 56 ----------------------
 .../xdriver_xf86-video-trident.hash                |  5 +-
 .../xdriver_xf86-video-trident.mk                  |  6 +--
 3 files changed, 6 insertions(+), 61 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
