From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:43 +0100
Subject: [Buildroot] [PATCH 09/16] package/x11r7/xdriver_xf86-video-r128:
	bump version to 6.10.2
In-Reply-To: <20170131183750.15481-1-bernd.kuhls@t-online.de>
References: <20170131183750.15481-1-bernd.kuhls@t-online.de>
Message-ID: <20170131183750.15481-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0002-abi23.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-r128/0002-abi23.patch | 33 ----------------------
 .../xdriver_xf86-video-r128.hash                   |  4 +--
 .../xdriver_xf86-video-r128.mk                     |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-r128/0002-abi23.patch

diff --git a/package/x11r7/xdriver_xf86-video-r128/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-r128/0002-abi23.patch
deleted file mode 100644
index e79ffdfb6..000000000
--- a/package/x11r7/xdriver_xf86-video-r128/0002-abi23.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5ab23b3a8ef18ab9ff96ac8be174380d36e185e5 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 19 Jul 2016 10:03:56 -0400
-Subject: Adapt Block/WakeupHandler signature for ABI 23
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Downloaded from
-https://cgit.freedesktop.org/xorg/driver/xf86-video-r128/commit/?id=5ab23b3a8ef18ab9ff96ac8be174380d36e185e5
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/src/compat-api.h b/src/compat-api.h
-index 6bc946f..89976e4 100644
---- a/src/compat-api.h
-+++ b/src/compat-api.h
-@@ -75,8 +75,13 @@
- 
- #define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
- 
-+#if ABI_VIDEODRV_VERSION >= SET_ABI_VERSION(23, 0)
-+#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout
-+#define BLOCKHANDLER_ARGS arg, pTimeout
-+#else
- #define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
- #define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
-+#endif
- 
- #define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
- #define CLOSE_SCREEN_ARGS pScreen
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
index f5c92ab1c..b6d8bd819 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2016-January/002670.html
-sha256	5ebfef49831c9b12f7b7011c8314010596ac2ab0d5b9b7cfd17908e93d7de4ea	xf86-video-r128-6.10.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002764.html
+sha256 84da21517f3af7617fdf341e84ccb22444d6cdab1647e4808fa631528b9a77de  xf86-video-r128-6.10.2.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 5833efcfa..344b48415 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_R128_VERSION = 6.10.1
+XDRIVER_XF86_VIDEO_R128_VERSION = 6.10.2
 XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_R128_LICENSE = MIT
-- 
2.11.0
