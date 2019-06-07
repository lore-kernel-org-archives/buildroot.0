From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  7 Jun 2019 21:09:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: bump version to 3.0.7
Message-ID: <20190607190935.15629-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0010, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0010-codec-vpx-Detect-libvpx-1.8.0.patch  | 41 -------------------
 package/vlc/vlc.hash                          | 12 +++---
 package/vlc/vlc.mk                            |  2 +-
 3 files changed, 7 insertions(+), 48 deletions(-)
 delete mode 100644 package/vlc/0010-codec-vpx-Detect-libvpx-1.8.0.patch

diff --git a/package/vlc/0010-codec-vpx-Detect-libvpx-1.8.0.patch b/package/vlc/0010-codec-vpx-Detect-libvpx-1.8.0.patch
deleted file mode 100644
index 2c352310bd..0000000000
--- a/package/vlc/0010-codec-vpx-Detect-libvpx-1.8.0.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2688feb2742a6021ca211ae5c106b12c3d822946 Mon Sep 17 00:00:00 2001
-From: Danny Milosavljevic <dannym@scratchpost.org>
-Date: Mon, 11 Feb 2019 16:07:12 +0100
-Subject: [PATCH] codec: vpx: Detect libvpx 1.8.0 and, if detected, use fewer
- frame formats in the chroma_table
-
-Signed-off-by: Steve Lhomme <robux4@ycbcr.xyz>
-(cherry picked from commit 5575fe3eb3fd46bada8662268b74d03493476a84)
-
-Downloaded from upstream commit
-https://git.videolan.org/?p=vlc/vlc-3.0.git;a=commitdiff;h=2688feb2742a6021ca211ae5c106b12c3d822946
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- modules/codec/vpx.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/modules/codec/vpx.c b/modules/codec/vpx.c
-index 2b1e37818d..aba180361f 100644
---- a/modules/codec/vpx.c
-+++ b/modules/codec/vpx.c
-@@ -116,6 +116,7 @@ static const struct
-     { VLC_CODEC_I440, VPX_IMG_FMT_I440, 8, 0 },
- 
-     { VLC_CODEC_YV12, VPX_IMG_FMT_YV12, 8, 0 },
-+#if VPX_IMAGE_ABI_VERSION < 5
-     { VLC_CODEC_YUVA, VPX_IMG_FMT_444A, 8, 0 },
-     { VLC_CODEC_YUYV, VPX_IMG_FMT_YUY2, 8, 0 },
-     { VLC_CODEC_UYVY, VPX_IMG_FMT_UYVY, 8, 0 },
-@@ -128,7 +129,7 @@ static const struct
- 
-     { VLC_CODEC_ARGB, VPX_IMG_FMT_ARGB, 8, 0 },
-     { VLC_CODEC_BGRA, VPX_IMG_FMT_ARGB_LE, 8, 0 },
--
-+#endif
-     { VLC_CODEC_GBR_PLANAR, VPX_IMG_FMT_I444, 8, 1 },
-     { VLC_CODEC_GBR_PLANAR_10L, VPX_IMG_FMT_I44416, 10, 1 },
- 
--- 
-2.11.0
-
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index e2c5fecfad..9cda094337 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,9 +1,9 @@
-# From http://download.videolan.org/pub/videolan/vlc/3.0.6/vlc-3.0.6.tar.xz.sha256
-sha256 18c16d4be0f34861d0aa51fbd274fb87f0cab3b7119757ead93f3db3a1f27ed3 vlc-3.0.6.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.6/vlc-3.0.6.tar.xz.sha1
-sha1 b35168c1811b07844d861311bd0f2194f4bb82ac vlc-3.0.6.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.6/vlc-3.0.6.tar.xz.md5
-md5 4ff71d262e070fd19f86a1c3542c7b4e vlc-3.0.6.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.7/vlc-3.0.7.tar.xz.sha256
+sha256 5cb5fe140f0f4bae3e0a613fb5f516270f62e2dbde6de27fa78ea9f43cd73916 vlc-3.0.7.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.7/vlc-3.0.7.tar.xz.sha1
+sha1 8c9f96a11199e813ec718c3d1885501a557e336f vlc-3.0.7.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.7/vlc-3.0.7.tar.xz.md5
+md5 230932ec40185856af28f82ec2e38b8a vlc-3.0.7.tar.xz
 # Locally computed
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 8dbaf86a08..1f58823ad3 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.6
+VLC_VERSION = 3.0.7
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.20.1
