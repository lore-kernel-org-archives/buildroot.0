Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C73C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 18:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7453C83F81;
	Thu, 11 Jan 2024 18:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7453C83F81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GuknSyD_0yBQ; Thu, 11 Jan 2024 18:30:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D02483D60;
	Thu, 11 Jan 2024 18:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D02483D60
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1571BF255
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB50742CD2
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB50742CD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkMXHpA7DGZJ for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 18:30:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD8AC42CC8
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 18:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD8AC42CC8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C984485EA6; Thu, 11 Jan 2024 18:30:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 19:28:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24b2ef0c6799c4d8fb1a9de78590c4e48b5470e7
X-Git-Newrev: 694b0ce218b984db3cad9c45541b0d49c46dfd2a
X-Patchwork-Hint: ignore
Message-Id: <20240111183023.C984485EA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-pi: bump version to
 f34d7bdbda713ba607b9625541ddfa314d9999a0
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

commit: https://git.buildroot.net/buildroot/commit/?id=694b0ce218b984db3cad9c45541b0d49c46dfd2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are 14 commits between the current version of d62e84 and f34d7b.
Some highlights include:
  - egl_gbm_render_surface: fix initialization of is_locked:
  - src/egl_gbm_render_surface: properly fallback to surface with no modifier
    (so we can drop our patch)
  - user input: store mt positions separately
  - video player: Transition to READY before NULL
  - check all malloc returns

In addition, commit 6a28738 introduces the charset_converter, which is a
platform-side implementation of the charset_converter plugin found here:
https://pub.dev/packages/charset_converter

As this is a new plugin, disable it; a follow-up commit will add an
option to enable it.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ..._render_surface-properly-fallback-to-surf.patch | 59 ----------------------
 package/flutter-pi/flutter-pi.hash                 |  2 +-
 package/flutter-pi/flutter-pi.mk                   |  3 +-
 3 files changed, 3 insertions(+), 61 deletions(-)

diff --git a/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch b/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
deleted file mode 100644
index 7a1a49b3d4..0000000000
--- a/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 856f9849763535d62ed01b538ba23905875c93f4 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Tue, 26 Sep 2023 20:31:17 +0200
-Subject: [PATCH] src/egl_gbm_render_surface: properly fallback to surface with
- no modifier
-
-In 869fa7fcfbeb, we added a fallback to be able to create an EGL sruface
-when the driver do not support modifiers, like the llvmpipe software
-renderer (or like some proprietary drivers, like the MALI ones), as
-reported in #269 [0].
-
-However, in c6537673c9b6, there was a big overhaul of renderer
-infrastructure. That commit lost the with-modifiers code path and only
-kept the without-modifiers fallback one (i.e. it only kept the call to
-gbm_surface_create(), not to gbm_surface_create_with_modifiers()).
-
-Then in b0d09f5032a4, the with-modifier code path was re-instated, but
-in a way that made it exclusive with the without-modifiers one. That is,
-the without-modifiers code path was not a fallback to when the other
-failed.
-
-Re-instate the fallback mechanism as intiially implemented.
-
-[0] https://github.com/ardera/flutter-pi/issues/269
-
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: https://github.com/ardera/flutter-pi/pull/367
----
- src/egl_gbm_render_surface.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/egl_gbm_render_surface.c b/src/egl_gbm_render_surface.c
-index ce9e5e7..8a58667 100644
---- a/src/egl_gbm_render_surface.c
-+++ b/src/egl_gbm_render_surface.c
-@@ -146,6 +146,7 @@ static int egl_gbm_render_surface_init(
-     }
- #endif
- 
-+    gbm_surface = NULL;
-     if (allowed_modifiers != NULL) {
-         gbm_surface = gbm_surface_create_with_modifiers(
-             gbm_device,
-@@ -158,9 +159,10 @@ static int egl_gbm_render_surface_init(
-         if (gbm_surface == NULL) {
-             ok = errno;
-             LOG_ERROR("Couldn't create GBM surface for rendering. gbm_surface_create_with_modifiers: %s\n", strerror(ok));
--            return ok;
-+            LOG_ERROR("Will retry without modifiers\n");
-         }
--    } else {
-+    }
-+    if (gbm_surface == NULL) {
-         gbm_surface = gbm_surface_create(
-             gbm_device,
-             size.x,
--- 
-2.25.1
-
diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index f7148963a4..6c5371d18a 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4af79c8f53c15913f52a83a221f099a2a750d023a0bc4560d0db6f15def79a2  flutter-pi-d62e84350d2869b3ec1dfb1af21bfe234c4b817f-br1.tar.gz
+sha256  cf10ca9e26beea036ccf218e6a900de5f1f2000e00c03e7a48898c2a0c99f591  flutter-pi-f34d7bdbda713ba607b9625541ddfa314d9999a0-br1.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index 27f140c177..4ec89bdfad 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = d62e84350d2869b3ec1dfb1af21bfe234c4b817f
+FLUTTER_PI_VERSION = f34d7bdbda713ba607b9625541ddfa314d9999a0
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
@@ -27,6 +27,7 @@ FLUTTER_PI_CONF_OPTS = \
 	-DENABLE_VULKAN=OFF \
 	-DFILESYSTEM_LAYOUT=meta-flutter \
 	-DLINT_EGL_HEADERS=OFF \
+	-DBUILD_CHARSET_CONVERTER_PLUGIN=OFF \
 	-DTRY_BUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF \
 	-DTRY_BUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=OFF \
 	-DTRY_ENABLE_OPENGL=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
