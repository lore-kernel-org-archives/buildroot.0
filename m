Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F83E8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C4FD4086B;
	Fri, 26 Dec 2025 18:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEyfQrtj9vOI; Fri, 26 Dec 2025 18:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2868640A53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773294;
	bh=X+8ha1ZOLGykJ64zuXYf4tC2ieKmA2Ug+Ukvq+kaaho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PdBjvGifkPPJ/D7aUOlz/59Zm9WT8BdM6rDJiECF/NQIh8q5m6m3a0z5objrO33cq
	 YM0XXZKl58DgatalaAuGHgCm/eRlD9fe2Schi8isidnkuuml9tmosD11Rek2O+rlBS
	 K0EEAeWZm8mwccMVr1MpIt5M2g0MnCt2hVt+6ZXKnagrw6fcBklZ91zJdLwtvYH0p8
	 InpQ8ZHqudb+vTIUpXpVN8Erex9EJ4ES5WEY9SkqGYBnm6A4FcBX9PNCX5hMCJjcRh
	 X/ElivNK6HMaRTxbw18OacY9bZwPrf4JTNvTByila8wCRfO9GmmRumKEHOrVJOhqRi
	 drds8TzZ/GwsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2868640A53;
	Fri, 26 Dec 2025 18:21:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 184CDEC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEF5380C68
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3Kg-bwy824D for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C524980C24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C524980C24
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C31EF81840; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1c3cb5fe01533c965ff2d0f5daa029977981f9f
X-Git-Newrev: 7f32dd28b5c13c2747b27221480db694c99ac838
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.C31EF81840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-nouveau:
 bump version to 1.0.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f32dd28b5c13c2747b27221480db694c99ac838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2024-November/003552.html

Removed patch which is included in this release.

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...nouveau-fixup-driver-for-new-X-server-ABI.patch | 68 ----------------------
 .../xdriver_xf86-video-nouveau.hash                |  6 +-
 .../xdriver_xf86-video-nouveau.mk                  |  4 +-
 4 files changed, 5 insertions(+), 74 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index bb8d5b152f..cae06b629c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1117,7 +1117,6 @@ package/x11r7/xdriver_xf86-video-imx/0004-Make-video-API-forward-and-backward-co
 package/x11r7/xdriver_xf86-video-imx/0005-xf86-video-imxfb-fix-m4-hardcodded-paths.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-imx/0006-xserver-1.14-compat.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Upstream
-package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck lib_sysv.Variables
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch b/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch
deleted file mode 100644
index 96be4909e7..0000000000
--- a/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From e80e73ced69b15662103d0fd6837db4ce6c6eb5b Mon Sep 17 00:00:00 2001
-From: Dave Airlie <airlied@redhat.com>
-Date: Mon, 13 Jul 2020 09:20:15 +1000
-Subject: [PATCH] nouveau: fixup driver for new X server ABI
-
-Downloaded from upstream commit
-https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/commit/e80e73ced69b15662103d0fd6837db4ce6c6eb5b
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/compat-api.h  | 4 ++++
- src/nouveau_exa.c | 2 +-
- src/nv_driver.c   | 6 +++---
- 3 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/src/compat-api.h b/src/compat-api.h
-index fde2f4b..8a1fcf9 100644
---- a/src/compat-api.h
-+++ b/src/compat-api.h
-@@ -102,4 +102,8 @@
- 
- #endif
- 
-+#if ABI_VIDEODRV_VERSION < SET_ABI_VERSION(25, 2)
-+#define secondary_dst slave_dst
-+#endif
-+
- #endif
-diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
-index 55df6f8..db3b112 100644
---- a/src/nouveau_exa.c
-+++ b/src/nouveau_exa.c
-@@ -157,7 +157,7 @@ nouveau_exa_destroy_pixmap(ScreenPtr pScreen, void *priv)
- 
- #ifdef NOUVEAU_PIXMAP_SHARING
- static Bool
--nouveau_exa_share_pixmap_backing(PixmapPtr ppix, ScreenPtr slave, void **handle_p)
-+nouveau_exa_share_pixmap_backing(PixmapPtr ppix, ScreenPtr secondary, void **handle_p)
- {
- 	struct nouveau_bo *bo = nouveau_pixmap_bo(ppix);
- 	struct nouveau_pixmap *nvpix = nouveau_pixmap(ppix);
-diff --git a/src/nv_driver.c b/src/nv_driver.c
-index e72a6b6..f9ab4af 100644
---- a/src/nv_driver.c
-+++ b/src/nv_driver.c
-@@ -559,16 +559,16 @@ redisplay_dirty(ScreenPtr screen, PixmapDirtyUpdatePtr dirty)
- {
- 	RegionRec pixregion;
- 
--	PixmapRegionInit(&pixregion, dirty->slave_dst);
-+	PixmapRegionInit(&pixregion, dirty->secondary_dst);
- 
--	DamageRegionAppend(&dirty->slave_dst->drawable, &pixregion);
-+	DamageRegionAppend(&dirty->secondary_dst->drawable, &pixregion);
- #ifdef HAS_DIRTYTRACKING_ROTATION
- 	PixmapSyncDirtyHelper(dirty);
- #else
- 	PixmapSyncDirtyHelper(dirty, &pixregion);
- #endif
- 
--	DamageRegionProcessPending(&dirty->slave_dst->drawable);
-+	DamageRegionProcessPending(&dirty->secondary_dst->drawable);
- 	RegionUninit(&pixregion);
- }
- 
--- 
-GitLab
-
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
index 336f29be46..0888eaa3a5 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/nouveau/2021-January/037766.html
-sha256  499322e27a55c8183166bf2dd1e47d085eb834143e0d7036baba8427b90c156b  xf86-video-nouveau-1.0.17.tar.bz2
-sha512  adba58ba5298d1a5b3f9f8540f9ef2cb2e10e47bba8e374103ec2e1f92e915f5f4393ed0021168cd649646e12315135a1efcdf77e8fb1648e1295914d87279b2  xf86-video-nouveau-1.0.17.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-November/003552.html
+sha256  e82ad38e64326b733cc5b892d56f6eb63b07e8920f5ebf05864af080b2c32bfd  xf86-video-nouveau-1.0.18.tar.xz
+sha512  1330fa72f76a6fdc13e7bfa932627091d2735ddb277f6a24d4fefa79fad5f354c6bb661093f26b33770275deca435c3b018f451a6e6254fe35892c59c13e28dc  xf86-video-nouveau-1.0.18.tar.xz
 
 # Locally computed
 sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
index e63bc611bf..47bf682176 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.17
-XDRIVER_XF86_VIDEO_NOUVEAU_SOURCE = xf86-video-nouveau-$(XDRIVER_XF86_VIDEO_NOUVEAU_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.18
+XDRIVER_XF86_VIDEO_NOUVEAU_SOURCE = xf86-video-nouveau-$(XDRIVER_XF86_VIDEO_NOUVEAU_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_NOUVEAU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE = MIT
 XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
