Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E5FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 15:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2279B60F86;
	Wed, 23 Feb 2022 15:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CcF8pHiAu41; Wed, 23 Feb 2022 15:59:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4462D60F76;
	Wed, 23 Feb 2022 15:59:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 305B81BF20F
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 15:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F12B60F76
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 15:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUJbAFHpumJX for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 15:59:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00E1560803
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 15:59:45 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout03.t-online.de (Postfix) with SMTP id 65C6E242A
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 16:59:43 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.196.238]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nMu3K-32wnYH0; Wed, 23 Feb 2022 16:59:42 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44824)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nMu3K-00086z-GI
 for buildroot@buildroot.org; Wed, 23 Feb 2022 16:59:42 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 16:59:42 +0100
Message-Id: <20220223155942.831349-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645631982-000184BD-B0B34B2C/0/0 CLEAN NORMAL
X-TOI-MSGID: da767f31-a627-447f-a06f-4c515de05ed6
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-nouveau:
 fix build error
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

Add upstream commit to fix build with xorg-server 21.1 which was bumped
with commit d9185c6ba38430a017ed996c4180e141881ba570.

No autobuild errors found yet.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...au-fixup-driver-for-new-X-server-ABI.patch | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch

diff --git a/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch b/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch
new file mode 100644
index 0000000000..96be4909e7
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch
@@ -0,0 +1,68 @@
+From e80e73ced69b15662103d0fd6837db4ce6c6eb5b Mon Sep 17 00:00:00 2001
+From: Dave Airlie <airlied@redhat.com>
+Date: Mon, 13 Jul 2020 09:20:15 +1000
+Subject: [PATCH] nouveau: fixup driver for new X server ABI
+
+Downloaded from upstream commit
+https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/commit/e80e73ced69b15662103d0fd6837db4ce6c6eb5b
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/compat-api.h  | 4 ++++
+ src/nouveau_exa.c | 2 +-
+ src/nv_driver.c   | 6 +++---
+ 3 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+index fde2f4b..8a1fcf9 100644
+--- a/src/compat-api.h
++++ b/src/compat-api.h
+@@ -102,4 +102,8 @@
+ 
+ #endif
+ 
++#if ABI_VIDEODRV_VERSION < SET_ABI_VERSION(25, 2)
++#define secondary_dst slave_dst
++#endif
++
+ #endif
+diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
+index 55df6f8..db3b112 100644
+--- a/src/nouveau_exa.c
++++ b/src/nouveau_exa.c
+@@ -157,7 +157,7 @@ nouveau_exa_destroy_pixmap(ScreenPtr pScreen, void *priv)
+ 
+ #ifdef NOUVEAU_PIXMAP_SHARING
+ static Bool
+-nouveau_exa_share_pixmap_backing(PixmapPtr ppix, ScreenPtr slave, void **handle_p)
++nouveau_exa_share_pixmap_backing(PixmapPtr ppix, ScreenPtr secondary, void **handle_p)
+ {
+ 	struct nouveau_bo *bo = nouveau_pixmap_bo(ppix);
+ 	struct nouveau_pixmap *nvpix = nouveau_pixmap(ppix);
+diff --git a/src/nv_driver.c b/src/nv_driver.c
+index e72a6b6..f9ab4af 100644
+--- a/src/nv_driver.c
++++ b/src/nv_driver.c
+@@ -559,16 +559,16 @@ redisplay_dirty(ScreenPtr screen, PixmapDirtyUpdatePtr dirty)
+ {
+ 	RegionRec pixregion;
+ 
+-	PixmapRegionInit(&pixregion, dirty->slave_dst);
++	PixmapRegionInit(&pixregion, dirty->secondary_dst);
+ 
+-	DamageRegionAppend(&dirty->slave_dst->drawable, &pixregion);
++	DamageRegionAppend(&dirty->secondary_dst->drawable, &pixregion);
+ #ifdef HAS_DIRTYTRACKING_ROTATION
+ 	PixmapSyncDirtyHelper(dirty);
+ #else
+ 	PixmapSyncDirtyHelper(dirty, &pixregion);
+ #endif
+ 
+-	DamageRegionProcessPending(&dirty->slave_dst->drawable);
++	DamageRegionProcessPending(&dirty->secondary_dst->drawable);
+ 	RegionUninit(&pixregion);
+ }
+ 
+-- 
+GitLab
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
