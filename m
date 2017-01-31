From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:35 +0100
Subject: [Buildroot] [PATCH 01/16] package/x11r7/xdriver_xf86-video-tdfx:
	bump version to 1.4.7
Message-ID: <20170131183750.15481-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0002-abi23.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-tdfx/0002-abi23.patch | 39 ----------------------
 .../xdriver_xf86-video-tdfx.hash                   |  4 +--
 .../xdriver_xf86-video-tdfx.mk                     |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-tdfx/0002-abi23.patch

diff --git a/package/x11r7/xdriver_xf86-video-tdfx/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-tdfx/0002-abi23.patch
deleted file mode 100644
index 7e5d650f9..000000000
--- a/package/x11r7/xdriver_xf86-video-tdfx/0002-abi23.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b99390efcb55d7d4a68e8c595119c1af4426fc0b Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 19 Jul 2016 10:03:56 -0400
-Subject: Adapt Block/WakeupHandler signature for ABI 23
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Downloaded from
-https://cgit.freedesktop.org/xorg/driver/xf86-video-tdfx/patch/?id=b99390efcb55d7d4a68e8c595119c1af4426fc0b
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/src/compat-api.h b/src/compat-api.h
-index 98ba435..44daea4 100644
---- a/src/compat-api.h
-+++ b/src/compat-api.h
-@@ -78,11 +78,19 @@
- 
- #define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
- 
-+#if ABI_VIDEODRV_VERSION >= SET_ABI_VERSION(23, 0)
-+#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout
-+#define BLOCKHANDLER_ARGS arg, pTimeout
-+
-+#define WAKEUPHANDLER_ARGS_DECL ScreenPtr arg, unsigned long result
-+#define WAKEUPHANDLER_ARGS arg, result
-+#else
- #define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
- #define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
- 
- #define WAKEUPHANDLER_ARGS_DECL ScreenPtr arg, unsigned long result, pointer read_mask
- #define WAKEUPHANDLER_ARGS arg, result, read_mask
-+#endif
- 
- #define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
- #define CLOSE_SCREEN_ARGS pScreen
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash
index 1cdef2ab8..84885596f 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-February/002536.html
-sha256	3a8a88867c40ad61f1c9a09ffd7ac64102fa821685855d50ce66c7603dcc6d37	xf86-video-tdfx-1.4.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002755.html
+sha256 4cf48ee14ead52b23493c3dce5032496fd68bf1d000170bb138730497e212a42  xf86-video-tdfx-1.4.7.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 942dcf3d6..471e6cf4d 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.6
+XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.7
 XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TDFX_LICENSE = MIT
-- 
2.11.0
