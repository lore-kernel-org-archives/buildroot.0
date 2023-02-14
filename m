Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6652C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 14:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6725281AF6;
	Tue, 14 Feb 2023 14:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6725281AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Usu32HpG4IK; Tue, 14 Feb 2023 14:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 734BF81E69;
	Tue, 14 Feb 2023 14:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 734BF81E69
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A26FA1BF95C
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 14:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CB1E81AC1
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 14:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB1E81AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f4NoBYg_vnoC for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 14:42:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7472C80CF2
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 14:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7472C80CF2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E80085D74; Tue, 14 Feb 2023 14:42:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 15:13:51 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 8e9afb26b93bcdeab3115c0f170d73c5368ac36c
X-Git-Newrev: 594acef246416a0b95452db393765ff60e37d662
X-Patchwork-Hint: ignore
Message-Id: <20230214144233.5E80085D74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/sdl2: security
 bump to version 2.26.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=594acef246416a0b95452db393765ff60e37d662
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

- Drop patch (already in version)
- Fix CVE-2022-4743: A potential memory leak issue was discovered in
  SDL2 in GLES_CreateTexture() function in SDL_render_gles.c. The
  vulnerability allows an attacker to cause a denial of service attack.

https://github.com/libsdl-org/SDL/releases/tag/release-2.26.0
https://github.com/libsdl-org/SDL/releases/tag/release-2.26.1
https://github.com/libsdl-org/SDL/releases/tag/release-2.26.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d33a8417bf1bc5d7276e19da5c37da210d4de31a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...oesn-t-have-a-mode-configured-use-the-pre.patch | 76 ----------------------
 package/sdl2/sdl2.hash                             |  4 +-
 package/sdl2/sdl2.mk                               |  2 +-
 3 files changed, 3 insertions(+), 79 deletions(-)

diff --git a/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch b/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch
deleted file mode 100644
index c8be280c56..0000000000
--- a/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From da9ba3a2a1536017e4ce1ee0f4276578d1ce6e29 Mon Sep 17 00:00:00 2001
-From: Sam Lantinga <slouken@libsdl.org>
-Date: Fri, 18 Nov 2022 12:17:27 -0800
-Subject: [PATCH] If a CRTC doesn't have a mode configured, use the preferred
- or largest mode as the default mode
-
-Fixes https://github.com/libsdl-org/SDL/issues/6421
-
-[mf@go-sys.de: backport from upstream]
-Signed-off-by: Michael Fischer <mf@go-sys.de>
-[yann.morin.1998@free.fr: do an actual backport]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- src/video/kmsdrm/SDL_kmsdrmvideo.c | 35 +++++++++++++++++++++++++-----
- 1 file changed, 29 insertions(+), 6 deletions(-)
-
-diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
-index eae721455..eeeefef2b 100644
---- a/src/video/kmsdrm/SDL_kmsdrmvideo.c
-+++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c
-@@ -666,8 +666,8 @@ KMSDRM_CrtcGetVrr(uint32_t drm_fd, uint32_t crtc_id)
- /* Gets a DRM connector, builds an SDL_Display with it, and adds it to the
-    list of SDL Displays in _this->displays[]  */
- static void
--KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources) {
--
-+KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources)
-+{
-     SDL_VideoData *viddata = ((SDL_VideoData *)_this->driverdata);
-     SDL_DisplayData *dispdata = NULL;
-     SDL_VideoDisplay display = {0};
-@@ -770,14 +770,37 @@ KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources) {
-         drmModeModeInfo *mode = &connector->modes[i];
- 
-         if (!SDL_memcmp(mode, &crtc->mode, sizeof(crtc->mode))) {
--          mode_index = i;
--          break;
-+            mode_index = i;
-+            break;
-         }
-     }
- 
-     if (mode_index == -1) {
--      ret = SDL_SetError("Failed to find index of mode attached to the CRTC.");
--      goto cleanup;
-+        int current_area, largest_area = 0;
-+
-+        /* Find the preferred mode or the highest resolution mode */
-+        for (i = 0; i < connector->count_modes; i++) {
-+            drmModeModeInfo *mode = &connector->modes[i];
-+
-+            if (mode->type & DRM_MODE_TYPE_PREFERRED) {
-+                mode_index = i;
-+                break;
-+            }
-+
-+            current_area = mode->hdisplay * mode->vdisplay;
-+            if (current_area > largest_area) {
-+                mode_index = i;
-+                largest_area = current_area;
-+            }
-+        }
-+        if (mode_index != -1) {
-+            crtc->mode = connector->modes[mode_index];
-+        }
-+    }
-+
-+    if (mode_index == -1) {
-+        ret = SDL_SetError("Failed to find index of mode attached to the CRTC.");
-+        goto cleanup;
-     }
- 
-     /*********************************************/
--- 
-2.25.1
-
diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 923a900dc0..86e0d86e7c 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.24.2.tar.gz.sig
-sha256  b35ef0a802b09d90ed3add0dcac0e95820804202914f5bb7b0feb710f1a1329f  SDL2-2.24.2.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.26.2.tar.gz.sig
+sha256  95d39bc3de037fbdfa722623737340648de4f180a601b0afad27645d150b99e0  SDL2-2.26.2.tar.gz
 # Locally calculated
 sha256  fcb07e07ac6bc8b2fcf047b50431ef4ebe5b619d7ca7c82212018309a9067426  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index a1dc8b5b73..8995178e71 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.24.2
+SDL2_VERSION = 2.26.2
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
