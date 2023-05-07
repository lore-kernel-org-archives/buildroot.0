Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB85C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BFF1821D9;
	Sun,  7 May 2023 12:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BFF1821D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmFYhnPZ7XAU; Sun,  7 May 2023 12:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B8E821D0;
	Sun,  7 May 2023 12:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04B8E821D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 180BB1BF2FA
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9C4E82109
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9C4E82109
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zkRxK37sGAVb for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11326821B4
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11326821B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 027E485EF1; Sun,  7 May 2023 12:04:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:59:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd1b1bcc0ec31b3af8d901cb7e05bd2794e3130f
X-Git-Newrev: 458c85990e5b364ffcb48c14a917a8157ee5e399
X-Patchwork-Hint: ignore
Message-Id: <20230507120439.027E485EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ati: bump
 version to 22.0.0
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
Content-Type: multipart/mixed; boundary="===============0216772977782110133=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0216772977782110133==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=458c85990e5b364ffcb48c14a917a8157ee5e399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-April/003386.html

Removed all patches because they were cherry-picked from upstream,
update .checkpackageignore as well.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |   4 -
 .../0001-Fix-link-failure-with-gcc-10.patch        |  35 --
 ...anup-terminology-to-use-primary-secondary.patch | 371 ---------------------
 ...local-variable-priv-only-used-with-glamor.patch |  66 ----
 ...lude-dri-h-with-older-versions-of-xserver.patch |  32 --
 .../xdriver_xf86-video-ati.hash                    |   8 +-
 .../xdriver_xf86-video-ati.mk                      |   6 +-
 7 files changed, 6 insertions(+), 516 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 476a802770..fa35f2d391 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1695,10 +1695,6 @@ package/x11r7/xdriver_xf86-input-joystick/0001-build-get-rid-of-sdkdir.patch Ups
 package/x11r7/xdriver_xf86-input-libinput/0001-build-get-rid-of-sdkdir.patch Upstream
 package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch Upstream
 package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch Upstream
-package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch Upstream
-package/x11r7/xdriver_xf86-video-ati/0002-ati-cleanup-terminology-to-use-primary-secondary.patch Upstream
-package/x11r7/xdriver_xf86-video-ati/0003-Guard-local-variable-priv-only-used-with-glamor.patch Upstream
-package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch Upstream
 package/x11r7/xdriver_xf86-video-fbturbo/0001-sunxi_x_g2d-drop-unused-dri2-include.patch Upstream
 package/x11r7/xdriver_xf86-video-fbturbo/0002-Use-own-thunk-functions-instead-of-fbdevHW-Weak.patch Upstream
 package/x11r7/xdriver_xf86-video-fbturbo/0003-Update-for-1.20-ABI.patch Upstream
diff --git a/package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch b/package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch
deleted file mode 100644
index ec9e49ebc7..0000000000
--- a/package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f223035f4ffcff2a9296d1e907a5193f8e8845a3 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 4 Feb 2020 16:38:06 -0500
-Subject: [PATCH] Fix link failure with gcc 10
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Without the 'extern' this looks like a definition not just a
-declaration, in every file that includes the header. gcc 10 is stricter
-about this kind of multiple definition.
-
-Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
-[backport from upstream: f223035f4ffcff2a9296d1e907a5193f8e8845a3]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/drmmode_display.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/drmmode_display.h b/src/drmmode_display.h
-index 96eaef0a..8cd8a0a6 100644
---- a/src/drmmode_display.h
-+++ b/src/drmmode_display.h
-@@ -262,7 +262,7 @@ Bool drmmode_wait_vblank(xf86CrtcPtr crtc, drmVBlankSeqType type,
- 			 uint64_t *ust, uint32_t *result_seq);
- 
- 
--miPointerSpriteFuncRec drmmode_sprite_funcs;
-+extern miPointerSpriteFuncRec drmmode_sprite_funcs;
- 
- 
- #endif
--- 
-2.25.4
-
diff --git a/package/x11r7/xdriver_xf86-video-ati/0002-ati-cleanup-terminology-to-use-primary-secondary.patch b/package/x11r7/xdriver_xf86-video-ati/0002-ati-cleanup-terminology-to-use-primary-secondary.patch
deleted file mode 100644
index ed8413b0cd..0000000000
--- a/package/x11r7/xdriver_xf86-video-ati/0002-ati-cleanup-terminology-to-use-primary-secondary.patch
+++ /dev/null
@@ -1,371 +0,0 @@
-From d96815a32431e0f434964a786013083bc0d835fc Mon Sep 17 00:00:00 2001
-From: Dave Airlie <airlied@redhat.com>
-Date: Mon, 13 Jul 2020 09:11:28 +1000
-Subject: [PATCH] ati: cleanup terminology to use primary/secondary
-
-The X server changed some API/ABIs here.
-
-Based on amdgpu patch by Michel
-
-(cherry picked from commit 8da3e4561ef82bb78c9a17b8cd8bf139b9cfd680)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- man/radeon.man        |  2 +-
- src/compat-api.h      |  6 ++++
- src/drmmode_display.c |  4 +--
- src/evergreen_state.h |  2 +-
- src/r600_state.h      |  2 +-
- src/radeon.h          | 10 +++---
- src/radeon_exa.c      |  2 +-
- src/radeon_glamor.c   |  2 +-
- src/radeon_kms.c      | 74 +++++++++++++++++++++----------------------
- 9 files changed, 55 insertions(+), 49 deletions(-)
-
-diff --git a/man/radeon.man b/man/radeon.man
-index dcebf537..247dcdb7 100644
---- a/man/radeon.man
-+++ b/man/radeon.man
-@@ -290,7 +290,7 @@ on. If this option is set, the default value of the property is 'on' or 'off'
- accordingly. If this option isn't set, the default value of the property is
- .B auto,
- which means that TearFree is on for rotated outputs, outputs with RandR
--transforms applied and for RandR 1.4 slave outputs, otherwise off.
-+transforms applied and for RandR 1.4 secondary outputs, otherwise off.
- .TP
- .BI "Option \*qAccelMethod\*q \*q" "string" \*q
- Chooses between available acceleration architectures.  Valid values are
-diff --git a/src/compat-api.h b/src/compat-api.h
-index f4e7524f..def6d3e4 100644
---- a/src/compat-api.h
-+++ b/src/compat-api.h
-@@ -34,4 +34,10 @@
- #define BLOCKHANDLER_ARGS pScreen, pTimeout, pReadmask
- #endif
- 
-+#if ABI_VIDEODRV_VERSION < SET_ABI_VERSION(25, 2)
-+#define current_primary current_master
-+#define primary_pixmap master_pixmap
-+#define secondary_dst slave_dst
-+#endif
-+
- #endif
-diff --git a/src/drmmode_display.c b/src/drmmode_display.c
-index 0e9e2474..3dec91e8 100644
---- a/src/drmmode_display.c
-+++ b/src/drmmode_display.c
-@@ -720,7 +720,7 @@ drmmode_crtc_prime_scanout_update(xf86CrtcPtr crtc, DisplayModePtr mode,
- 		xorg_list_for_each_entry(dirty, &screen->pixmap_dirty_list,
- 					 ent) {
- 			if (radeon_dirty_src_equals(dirty, drmmode_crtc->prime_scanout_pixmap)) {
--				dirty->slave_dst =
-+				dirty->secondary_dst =
- 					drmmode_crtc->scanout[scanout_id].pixmap;
- 				break;
- 			}
-@@ -1356,7 +1356,7 @@ drmmode_set_scanout_pixmap(xf86CrtcPtr crtc, PixmapPtr ppix)
- 
- 	xorg_list_for_each_entry(dirty, &screen->pixmap_dirty_list, ent) {
- 		if (radeon_dirty_src_equals(dirty, drmmode_crtc->prime_scanout_pixmap)) {
--			PixmapStopDirtyTracking(dirty->src, dirty->slave_dst);
-+			PixmapStopDirtyTracking(dirty->src, dirty->secondary_dst);
- 			break;
- 		}
- 	}
-diff --git a/src/evergreen_state.h b/src/evergreen_state.h
-index 7e54e1c7..34ba87b6 100644
---- a/src/evergreen_state.h
-+++ b/src/evergreen_state.h
-@@ -350,7 +350,7 @@ extern void *RADEONEXACreatePixmap2(ScreenPtr pScreen, int width, int height,
- 				    int *new_pitch);
- extern void RADEONEXADestroyPixmap(ScreenPtr pScreen, void *driverPriv);
- extern Bool RADEONEXAPixmapIsOffscreen(PixmapPtr pPix);
--extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr slave, void **handle_p);
-+extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr secondary, void **handle_p);
- extern Bool RADEONEXASetSharedPixmapBacking(PixmapPtr ppix, void *handle);
- 
- #endif
-diff --git a/src/r600_state.h b/src/r600_state.h
-index 34345996..567c3ca2 100644
---- a/src/r600_state.h
-+++ b/src/r600_state.h
-@@ -321,6 +321,6 @@ extern void *RADEONEXACreatePixmap2(ScreenPtr pScreen, int width, int height,
- 				    int *new_pitch);
- extern void RADEONEXADestroyPixmap(ScreenPtr pScreen, void *driverPriv);
- extern Bool RADEONEXAPixmapIsOffscreen(PixmapPtr pPix);
--extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr slave, void **handle_p);
-+extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr secondary, void **handle_p);
- extern Bool RADEONEXASetSharedPixmapBacking(PixmapPtr ppix, void *handle);
- #endif
-diff --git a/src/radeon.h b/src/radeon.h
-index 2c913466..85fd0217 100644
---- a/src/radeon.h
-+++ b/src/radeon.h
-@@ -182,18 +182,18 @@ typedef enum {
- 
- 
- static inline ScreenPtr
--radeon_master_screen(ScreenPtr screen)
-+radeon_primary_screen(ScreenPtr screen)
- {
--    if (screen->current_master)
--	return screen->current_master;
-+    if (screen->current_primary)
-+	return screen->current_primary;
- 
-     return screen;
- }
- 
- static inline ScreenPtr
--radeon_dirty_master(PixmapDirtyUpdatePtr dirty)
-+radeon_dirty_primary(PixmapDirtyUpdatePtr dirty)
- {
--    return radeon_master_screen(dirty->slave_dst->drawable.pScreen);
-+    return radeon_primary_screen(dirty->secondary_dst->drawable.pScreen);
- }
- 
- static inline DrawablePtr
-diff --git a/src/radeon_exa.c b/src/radeon_exa.c
-index 268155ed..320ff992 100644
---- a/src/radeon_exa.c
-+++ b/src/radeon_exa.c
-@@ -282,7 +282,7 @@ void RADEONEXADestroyPixmap(ScreenPtr pScreen, void *driverPriv)
-     free(driverPriv);
- }
- 
--Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr slave, void **fd_handle)
-+Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr seconndary, void **fd_handle)
- {
-     struct radeon_exa_pixmap_priv *driver_priv = exaGetPixmapDriverPrivate(ppix);
- 
-diff --git a/src/radeon_glamor.c b/src/radeon_glamor.c
-index f1098381..ccf99941 100644
---- a/src/radeon_glamor.c
-+++ b/src/radeon_glamor.c
-@@ -366,7 +366,7 @@ radeon_glamor_set_pixmap_bo(DrawablePtr drawable, PixmapPtr pixmap)
- 
- 
- static Bool
--radeon_glamor_share_pixmap_backing(PixmapPtr pixmap, ScreenPtr slave,
-+radeon_glamor_share_pixmap_backing(PixmapPtr pixmap, ScreenPtr secondary,
- 				   void **handle_p)
- {
- 	ScreenPtr screen = pixmap->drawable.pScreen;
-diff --git a/src/radeon_kms.c b/src/radeon_kms.c
-index b3db7c41..62962d61 100644
---- a/src/radeon_kms.c
-+++ b/src/radeon_kms.c
-@@ -559,8 +559,8 @@ dirty_region(PixmapDirtyUpdatePtr dirty)
- 	if (dirty->rotation != RR_Rotate_0) {
- 		dstregion = transform_region(damageregion,
- 					     &dirty->f_inverse,
--					     dirty->slave_dst->drawable.width,
--					     dirty->slave_dst->drawable.height);
-+					     dirty->secondary_dst->drawable.width,
-+					     dirty->secondary_dst->drawable.height);
- 	} else
- #endif
- 	{
-@@ -568,7 +568,7 @@ dirty_region(PixmapDirtyUpdatePtr dirty)
- 
- 	    dstregion = RegionDuplicate(damageregion);
- 	    RegionTranslate(dstregion, -dirty->x, -dirty->y);
--	    PixmapRegionInit(&pixregion, dirty->slave_dst);
-+	    PixmapRegionInit(&pixregion, dirty->secondary_dst);
- 	    RegionIntersect(dstregion, dstregion, &pixregion);
- 	    RegionUninit(&pixregion);
- 	}
-@@ -585,8 +585,8 @@ redisplay_dirty(PixmapDirtyUpdatePtr dirty, RegionPtr region)
- 	if (RegionNil(region))
- 		goto out;
- 
--	if (dirty->slave_dst->master_pixmap)
--	    DamageRegionAppend(&dirty->slave_dst->drawable, region);
-+	if (dirty->secondary_dst->primary_pixmap)
-+	    DamageRegionAppend(&dirty->secondary_dst->drawable, region);
- 
- #ifdef HAS_DIRTYTRACKING_ROTATION
- 	PixmapSyncDirtyHelper(dirty);
-@@ -595,8 +595,8 @@ redisplay_dirty(PixmapDirtyUpdatePtr dirty, RegionPtr region)
- #endif
- 
- 	radeon_cs_flush_indirect(src_scrn);
--	if (dirty->slave_dst->master_pixmap)
--	    DamageRegionProcessPending(&dirty->slave_dst->drawable);
-+	if (dirty->secondary_dst->primary_pixmap)
-+	    DamageRegionProcessPending(&dirty->secondary_dst->drawable);
- 
- out:
- 	DamageEmpty(dirty->damage);
-@@ -613,12 +613,12 @@ radeon_prime_scanout_update_abort(xf86CrtcPtr crtc, void *event_data)
- void
- radeon_sync_shared_pixmap(PixmapDirtyUpdatePtr dirty)
- {
--    ScreenPtr master_screen = radeon_dirty_master(dirty);
-+    ScreenPtr primary_screen = radeon_dirty_primary(dirty);
-     PixmapDirtyUpdatePtr ent;
-     RegionPtr region;
- 
--    xorg_list_for_each_entry(ent, &master_screen->pixmap_dirty_list, ent) {
--	if (!radeon_dirty_src_equals(dirty, ent->slave_dst))
-+    xorg_list_for_each_entry(ent, &primary_screen->pixmap_dirty_list, ent) {
-+	if (!radeon_dirty_src_equals(dirty, ent->secondary_dst))
- 	    continue;
- 
- 	region = dirty_region(ent);
-@@ -631,45 +631,45 @@ radeon_sync_shared_pixmap(PixmapDirtyUpdatePtr dirty)
- #if HAS_SYNC_SHARED_PIXMAP
- 
- static Bool
--master_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
-+primary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
- {
--    ScreenPtr master_screen = radeon_dirty_master(dirty);
-+    ScreenPtr primary_screen = radeon_dirty_primary(dirty);
- 
--    return !!master_screen->SyncSharedPixmap;
-+    return !!primary_screen->SyncSharedPixmap;
- }
- 
- static Bool
--slave_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
-+secondary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
- {
--    ScreenPtr slave_screen = dirty->slave_dst->drawable.pScreen;
-+    ScreenPtr secondary_screen = dirty->secondary_dst->drawable.pScreen;
- 
--    return !!slave_screen->SyncSharedPixmap;
-+    return !!secondary_screen->SyncSharedPixmap;
- }
- 
- static void
- call_sync_shared_pixmap(PixmapDirtyUpdatePtr dirty)
- {
--    ScreenPtr master_screen = radeon_dirty_master(dirty);
-+    ScreenPtr primary_screen = radeon_dirty_primary(dirty);
- 
--    master_screen->SyncSharedPixmap(dirty);
-+    primary_screen->SyncSharedPixmap(dirty);
- }
- 
- #else /* !HAS_SYNC_SHARED_PIXMAP */
- 
- static Bool
--master_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
-+primary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
- {
--    ScrnInfoPtr master_scrn = xf86ScreenToScrn(radeon_dirty_master(dirty));
-+    ScrnInfoPtr primary_scrn = xf86ScreenToScrn(radeon_dirty_primary(dirty));
- 
--    return master_scrn->driverName == scrn->driverName;
-+    return primary_scrn->driverName == scrn->driverName;
- }
- 
- static Bool
--slave_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
-+secondary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dirty)
- {
--    ScrnInfoPtr slave_scrn = xf86ScreenToScrn(dirty->slave_dst->drawable.pScreen);
-+    ScrnInfoPtr secondary_scrn = xf86ScreenToScrn(dirty->secondary_dst->drawable.pScreen);
- 
--    return slave_scrn->driverName == scrn->driverName;
-+    return secondary_scrn->driverName == scrn->driverName;
- }
- 
- static void
-@@ -684,12 +684,12 @@ call_sync_shared_pixmap(PixmapDirtyUpdatePtr dirty)
- static xf86CrtcPtr
- radeon_prime_dirty_to_crtc(PixmapDirtyUpdatePtr dirty)
- {
--    ScreenPtr screen = dirty->slave_dst->drawable.pScreen;
-+    ScreenPtr screen = dirty->secondary_dst->drawable.pScreen;
-     ScrnInfoPtr scrn = xf86ScreenToScrn(screen);
-     xf86CrtcConfigPtr xf86_config = XF86_CRTC_CONFIG_PTR(scrn);
-     int c;
- 
--    /* Find the CRTC which is scanning out from this slave pixmap */
-+    /* Find the CRTC which is scanning out from this secondary pixmap */
-     for (c = 0; c < xf86_config->num_crtc; c++) {
- 	xf86CrtcPtr xf86_crtc = xf86_config->crtc[c];
- 	drmmode_crtc_private_ptr drmmode_crtc = xf86_crtc->driver_private;
-@@ -714,7 +714,7 @@ radeon_prime_scanout_do_update(xf86CrtcPtr crtc, unsigned scanout_id)
- 	if (radeon_dirty_src_equals(dirty, drmmode_crtc->prime_scanout_pixmap)) {
- 	    RegionPtr region;
- 
--	    if (master_has_sync_shared_pixmap(scrn, dirty))
-+	    if (primary_has_sync_shared_pixmap(scrn, dirty))
- 		call_sync_shared_pixmap(dirty);
- 
- 	    region = dirty_region(dirty);
-@@ -727,7 +727,7 @@ radeon_prime_scanout_do_update(xf86CrtcPtr crtc, unsigned scanout_id)
- 		radeon_cs_flush_indirect(scrn);
- 		RegionCopy(&drmmode_crtc->scanout_last_region, region);
- 		RegionTranslate(region, -crtc->x, -crtc->y);
--		dirty->slave_dst = drmmode_crtc->scanout[scanout_id].pixmap;
-+		dirty->secondary_dst = drmmode_crtc->scanout[scanout_id].pixmap;
- 	    }
- 
- 	    redisplay_dirty(dirty, region);
-@@ -754,7 +754,7 @@ radeon_prime_scanout_update_handler(xf86CrtcPtr crtc, uint32_t frame, uint64_t u
- static void
- radeon_prime_scanout_update(PixmapDirtyUpdatePtr dirty)
- {
--    ScreenPtr screen = dirty->slave_dst->drawable.pScreen;
-+    ScreenPtr screen = dirty->secondary_dst->drawable.pScreen;
-     ScrnInfoPtr scrn = xf86ScreenToScrn(screen);
-     RADEONEntPtr pRADEONEnt = RADEONEntPriv(scrn);
-     xf86CrtcPtr xf86_crtc = radeon_prime_dirty_to_crtc(dirty);
-@@ -818,7 +818,7 @@ radeon_prime_scanout_update(PixmapDirtyUpdatePtr dirty)
- static void
- radeon_prime_scanout_flip(PixmapDirtyUpdatePtr ent)
- {
--    ScreenPtr screen = ent->slave_dst->drawable.pScreen;
-+    ScreenPtr screen = ent->secondary_dst->drawable.pScreen;
-     ScrnInfoPtr scrn = xf86ScreenToScrn(screen);
-     RADEONEntPtr pRADEONEnt = RADEONEntPriv(scrn);
-     xf86CrtcPtr crtc = radeon_prime_dirty_to_crtc(ent);
-@@ -893,11 +893,11 @@ radeon_dirty_update(ScrnInfoPtr scrn)
- 		if (screen->isGPU) {
- 			PixmapDirtyUpdatePtr region_ent = ent;
- 
--			if (master_has_sync_shared_pixmap(scrn, ent)) {
--				ScreenPtr master_screen = radeon_dirty_master(ent);
-+			if (primary_has_sync_shared_pixmap(scrn, ent)) {
-+				ScreenPtr primary_screen = radeon_dirty_primary(ent);
- 
--				xorg_list_for_each_entry(region_ent, &master_screen->pixmap_dirty_list, ent) {
--					if (radeon_dirty_src_equals(ent, region_ent->slave_dst))
-+				xorg_list_for_each_entry(region_ent, &primary_screen->pixmap_dirty_list, ent) {
-+					if (radeon_dirty_src_equals(ent, region_ent->secondary_dst))
- 						break;
- 				}
- 			}
-@@ -921,7 +921,7 @@ radeon_dirty_update(ScrnInfoPtr scrn)
- 
- 			RegionDestroy(region);
- 		} else {
--			if (slave_has_sync_shared_pixmap(scrn, ent))
-+			if (secondary_has_sync_shared_pixmap(scrn, ent))
- 				continue;
- 
- 			region = dirty_region(ent);
-@@ -1216,7 +1216,7 @@ static void RADEONBlockHandler_KMS(BLOCKHANDLER_ARGS_DECL)
-     (*pScreen->BlockHandler) (BLOCKHANDLER_ARGS);
-     pScreen->BlockHandler = RADEONBlockHandler_KMS;
- 
--    if (!xf86ScreenToScrn(radeon_master_screen(pScreen))->vtSema)
-+    if (!xf86ScreenToScrn(radeon_primary_screen(pScreen))->vtSema)
- 	return;
- 
-     if (!pScreen->isGPU)
-@@ -2584,7 +2584,7 @@ CARD32 cleanup_black_fb(OsTimerPtr timer, CARD32 now, pointer data)
-     xf86CrtcConfigPtr xf86_config = XF86_CRTC_CONFIG_PTR(scrn);
-     int c;
- 
--    if (xf86ScreenToScrn(radeon_master_screen(screen))->vtSema)
-+    if (xf86ScreenToScrn(radeon_primary_screen(screen))->vtSema)
- 	return 0;
- 
-     /* Unreference the all-black FB created by RADEONLeaveVT_KMS. After
--- 
-2.31.1
-
diff --git a/package/x11r7/xdriver_xf86-video-ati/0003-Guard-local-variable-priv-only-used-with-glamor.patch b/package/x11r7/xdriver_xf86-video-ati/0003-Guard-local-variable-priv-only-used-with-glamor.patch
deleted file mode 100644
index 0a23c54cce..0000000000
--- a/package/x11r7/xdriver_xf86-video-ati/0003-Guard-local-variable-priv-only-used-with-glamor.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From a78e31b5fffadd73b00483f21e54bd144f1b439a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>
-Date: Fri, 26 Mar 2021 17:42:10 +0100
-Subject: [PATCH] Guard local variable priv only used with glamor
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes compile errors with glamor disabled:
-
-../../src/radeon_present.c: In function ‘radeon_present_check_flip’:
-../../src/radeon_present.c:281:21: error: invalid use of undefined type ‘struct radeon_pixmap’
-  281 |     if (priv && priv->fb_failed)
-      |                     ^~
-../../src/radeon_present.c:288:19: error: invalid use of undefined type ‘struct radeon_pixmap’
-  288 |  if (priv && !priv->fb_failed) {
-      |                   ^~
-../../src/radeon_present.c:292:10: error: invalid use of undefined type ‘struct radeon_pixmap’
-  292 |      priv->fb_failed = TRUE;
-      |          ^~
-
-(cherry picked from commit 3c7c84ed49564907a148ae99b03200e0be350060)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/radeon_present.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/radeon_present.c b/src/radeon_present.c
-index 494655c9..d010aa19 100644
---- a/src/radeon_present.c
-+++ b/src/radeon_present.c
-@@ -254,7 +254,9 @@ radeon_present_check_flip(RRCrtcPtr crtc, WindowPtr window, PixmapPtr pixmap,
-     xf86CrtcPtr xf86_crtc = crtc->devPrivate;
-     ScreenPtr screen = window->drawable.pScreen;
-     ScrnInfoPtr scrn = xf86_crtc->scrn;
-+#ifdef USE_GLAMOR
-     struct radeon_pixmap *priv = radeon_get_pixmap_private(pixmap);
-+#endif
-     xf86CrtcConfigPtr config = XF86_CRTC_CONFIG_PTR(scrn);
-     RADEONInfoPtr info = RADEONPTR(scrn);
-     PixmapPtr screen_pixmap = screen->GetScreenPixmap(screen);
-@@ -278,10 +280,13 @@ radeon_present_check_flip(RRCrtcPtr crtc, WindowPtr window, PixmapPtr pixmap,
- 	return FALSE;
- #endif
- 
-+#ifdef USE_GLAMOR
-     if (priv && priv->fb_failed)
- 	return FALSE;
-+#endif
- 
-     if (!radeon_pixmap_get_fb(pixmap)) {
-+#ifdef USE_GLAMOR
- 	if (!priv)
- 	    priv = radeon_get_pixmap_private(pixmap);
- 
-@@ -291,6 +296,7 @@ radeon_present_check_flip(RRCrtcPtr crtc, WindowPtr window, PixmapPtr pixmap,
- 		       "normal if using PRIME render offloading)\n");
- 	    priv->fb_failed = TRUE;
- 	}
-+#endif
- 
- 	return FALSE;
-     }
--- 
-2.31.1
-
diff --git a/package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch b/package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch
deleted file mode 100644
index a969d61913..0000000000
--- a/package/x11r7/xdriver_xf86-video-ati/0004-Only-include-dri-h-with-older-versions-of-xserver.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5eba006e4129e8015b822f9e1d2f1e613e252cda Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>
-Date: Tue, 2 Feb 2021 12:45:54 +0100
-Subject: [PATCH] Only include dri.h with older versions of xserver
-
-Not needed anymore with current versions.
-
-Downloaded from upstream commit
-https://gitlab.freedesktop.org/xorg/driver/xf86-video-ati/-/commit/5eba006e4129e8015b822f9e1d2f1e613e252cda
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/drmmode_display.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/drmmode_display.c b/src/drmmode_display.c
-index 3099a729..a58f24dd 100644
---- a/src/drmmode_display.c
-+++ b/src/drmmode_display.c
-@@ -45,7 +45,9 @@
- #include "radeon_glamor.h"
- #include "radeon_reg.h"
- 
-+#if XORG_VERSION_CURRENT < XORG_VERSION_NUMERIC(1,19,99,1,0)
- #include <dri.h>
-+#endif
- 
- #include "drmmode_display.h"
- 
--- 
-GitLab
-
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index 1e7376cbfc..74530c122f 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-October/003027.html
-md5  6e49d3c2839582af415ceded76e626e6  xf86-video-ati-19.1.0.tar.bz2
-sha1  aea1d11c05531b03f2eb67c6785cddf6d7f30e5f  xf86-video-ati-19.1.0.tar.bz2
-sha256  659f5a1629eea5f5334d9b39b18e6807a63aa1efa33c1236d9cc53acbb223c49  xf86-video-ati-19.1.0.tar.bz2
-sha512  73a81f6c492daf2e89067fb52b3033dc0fe6841f109627ddca1aee54a45a738c8c134443753a2a2aaa2c131e1d560057ebc76351ff2304c16407df3ff568fcd6  xf86-video-ati-19.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-April/003386.html
+sha256  c8c8bb56d3f6227c97e59c3a3c85a25133584ceb82ab5bc05a902a743ab7bf6d  xf86-video-ati-22.0.0.tar.xz
+sha512  fba9ffc7b0eeb0c369eb1a6f8ef0bb3061cfeca26bc269baf6e3d16dcd943fbf4092f1e37adfb1bc71051cee0b7a0e6fb253f0b8bcd210732ccaf99e8f2356fe  xf86-video-ati-22.0.0.tar.xz
 # Locally computed
 sha256  58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index e7f5852811..b663279c20 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 19.1.0
-XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_ATI_VERSION = 22.0.0
+XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_ATI_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
 XDRIVER_XF86_VIDEO_ATI_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \

--===============0216772977782110133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0216772977782110133==--
