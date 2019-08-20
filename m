From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 23:52:05 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/webkitgtk: remove
 upstreamed patch
Message-ID: <20190820214948.64ACE83D2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=996994f8f2535f497f9d03af2e475f8f6dedda90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The bump of webkitgtk to 2.24.3 in commit
3ff05d9094be1329b5987589d6b6fefb152ff006 forgot to drop a patch that
was upstreamed, and is now part of 2.24.3, causing a build failure, so
let's drop this patch.

Fixes:

  http://autobuild.buildroot.net/results/4d7bffd20344f06ca719b7c8083b81053b255aa5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d069301d6325075395a99bf041d7ea2a1410080c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-Build-failure-after-r243644-in-GTK-Li.patch | 36 ----------------------
 1 file changed, 36 deletions(-)

diff --git a/package/webkitgtk/0001-Build-failure-after-r243644-in-GTK-Li.patch b/package/webkitgtk/0001-Build-failure-after-r243644-in-GTK-Li.patch
deleted file mode 100644
index 748fc8e46e..0000000000
--- a/package/webkitgtk/0001-Build-failure-after-r243644-in-GTK-Li.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a672bbd75f257dd65844ad53dd21fb37345999b5 Mon Sep 17 00:00:00 2001
-From: "aperez at igalia.com"
- <aperez@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
-Date: Mon, 20 May 2019 21:20:02 +0000
-Subject: [PATCH] Build failure after r243644 in GTK
- Linux 64-bit stable builds https://bugs.webkit.org/show_bug.cgi?id=196440
-
-Patch by Pablo Saavedra <psaavedra@igalia.com> on 2019-04-01
-Reviewed by Philippe Normand.
-
-* platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:
-(WebCore::MediaPlayerPrivateGStreamerBase::updateTextureMapperFlags):
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-
-diff --git a/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp b/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp
-index 608aee2e1b3..c614050972a 100644
---- a/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp
-+++ b/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp
-@@ -1000,11 +1000,13 @@ void MediaPlayerPrivateGStreamerBase::updateTextureMapperFlags()
-         break;
-     }
- 
-+#if USE(GSTREAMER_GL)
-     // When the imxvpudecoder is used, the texture sampling of the
-     // directviv-uploaded texture returns an RGB value, so there's no need to
-     // convert it.
-     if (m_videoDecoderPlatform != WebKitGstVideoDecoderPlatform::ImxVPU)
-         m_textureMapperFlags |= TEXTURE_MAPPER_COLOR_CONVERT_FLAG;
-+#endif
- }
- #endif
- 
--- 
-2.21.0
-
