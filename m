From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 30 Aug 2019 17:15:28 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.24.3
Message-ID: <20190830141528.16446-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a minor release which includes fixes for CVE-2019-8644,
CVE-2019-8649, CVE-2019-8658, CVE-2019-8666, CVE-2019-8669,
CVE-2019-8673, CVE-2019-8676, CVE-2019-8678, CVE-2019-8680,
CVE-2019-8681, CVE-2019-8683, CVE-2019-8684, CVE-2019-8687,
CVE-2019-8688, CVE-2019-8689, and CVE-2019-8690.

This release also contains many build fixes, a few media playback
improvements, and a Web compatibility fix. For a complete list,
the full release notes are available at:

  https://wpewebkit.org/release/wpewebkit-2.24.3.html

The detailed security advisory can be found at:

  https://wpewebkit.org/security/WSA-2019-0004.html

Patch "0001-Build-failure-after-r243644-in-GTK-Li.patch" is now
unneeded because it is one of the build included in this release.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...uild-failure-after-r243644-in-GTK-Li.patch | 36 -------------------
 package/wpewebkit/wpewebkit.hash              |  8 ++---
 package/wpewebkit/wpewebkit.mk                |  2 +-
 3 files changed, 5 insertions(+), 41 deletions(-)
 delete mode 100644 package/wpewebkit/0001-Build-failure-after-r243644-in-GTK-Li.patch

diff --git a/package/wpewebkit/0001-Build-failure-after-r243644-in-GTK-Li.patch b/package/wpewebkit/0001-Build-failure-after-r243644-in-GTK-Li.patch
deleted file mode 100644
index 748fc8e46e..0000000000
--- a/package/wpewebkit/0001-Build-failure-after-r243644-in-GTK-Li.patch
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
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index ddab159d4f..8d09930267 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.24.2.tar.xz.sums
-md5 3604a2167827c8354f6dcbab98305d7b wpewebkit-2.24.2.tar.xz
-sha1 1248d7723d0e6aec52cafc27a92c5c335c1abdd4 wpewebkit-2.24.2.tar.xz
-sha256 cf251a467b3bcae50f97e22f4baccca49fcbbd54162dc5b71c0b1ebf655fd95f wpewebkit-2.24.2.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.24.3.tar.xz.sums
+md5 b5c6fe640b03c3e87594da2c0a0a8469 wpewebkit-2.24.3.tar.xz
+sha1 c9ccb6c4c65446e96ed6d534a1556db0fcca8268 wpewebkit-2.24.3.tar.xz
+sha256 907b20907a32a4288cbf67b56eab04cbbd997a7ca0f40b3c466cbbbbfba0e7ca wpewebkit-2.24.3.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 4dc4a29064..48ed4f4afe 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.24.2
+WPEWEBKIT_VERSION = 2.24.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.23.0
