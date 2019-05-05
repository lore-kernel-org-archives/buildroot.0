From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 May 2019 12:41:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: fix build with libvpx 1.8.0
Message-ID: <20190505104116.30311-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e44/e44d5ca85be9e0dafa4a3d8b0187c54cff6e2d55/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0010-codec-vpx-Detect-libvpx-1.8.0.patch  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/vlc/0010-codec-vpx-Detect-libvpx-1.8.0.patch

diff --git a/package/vlc/0010-codec-vpx-Detect-libvpx-1.8.0.patch b/package/vlc/0010-codec-vpx-Detect-libvpx-1.8.0.patch
new file mode 100644
index 0000000000..2c352310bd
--- /dev/null
+++ b/package/vlc/0010-codec-vpx-Detect-libvpx-1.8.0.patch
@@ -0,0 +1,41 @@
+From 2688feb2742a6021ca211ae5c106b12c3d822946 Mon Sep 17 00:00:00 2001
+From: Danny Milosavljevic <dannym@scratchpost.org>
+Date: Mon, 11 Feb 2019 16:07:12 +0100
+Subject: [PATCH] codec: vpx: Detect libvpx 1.8.0 and, if detected, use fewer
+ frame formats in the chroma_table
+
+Signed-off-by: Steve Lhomme <robux4@ycbcr.xyz>
+(cherry picked from commit 5575fe3eb3fd46bada8662268b74d03493476a84)
+
+Downloaded from upstream commit
+https://git.videolan.org/?p=vlc/vlc-3.0.git;a=commitdiff;h=2688feb2742a6021ca211ae5c106b12c3d822946
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ modules/codec/vpx.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/modules/codec/vpx.c b/modules/codec/vpx.c
+index 2b1e37818d..aba180361f 100644
+--- a/modules/codec/vpx.c
++++ b/modules/codec/vpx.c
+@@ -116,6 +116,7 @@ static const struct
+     { VLC_CODEC_I440, VPX_IMG_FMT_I440, 8, 0 },
+ 
+     { VLC_CODEC_YV12, VPX_IMG_FMT_YV12, 8, 0 },
++#if VPX_IMAGE_ABI_VERSION < 5
+     { VLC_CODEC_YUVA, VPX_IMG_FMT_444A, 8, 0 },
+     { VLC_CODEC_YUYV, VPX_IMG_FMT_YUY2, 8, 0 },
+     { VLC_CODEC_UYVY, VPX_IMG_FMT_UYVY, 8, 0 },
+@@ -128,7 +129,7 @@ static const struct
+ 
+     { VLC_CODEC_ARGB, VPX_IMG_FMT_ARGB, 8, 0 },
+     { VLC_CODEC_BGRA, VPX_IMG_FMT_ARGB_LE, 8, 0 },
+-
++#endif
+     { VLC_CODEC_GBR_PLANAR, VPX_IMG_FMT_I444, 8, 1 },
+     { VLC_CODEC_GBR_PLANAR_10L, VPX_IMG_FMT_I44416, 10, 1 },
+ 
+-- 
+2.11.0
+
-- 
2.20.1
