From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:38 +0100
Subject: [Buildroot] [PATCH 04/16]
	package/x11r7/xdriver_xf86-video-siliconmotion: bump version
	to 1.7.9
In-Reply-To: <20170131183750.15481-1-bernd.kuhls@t-online.de>
References: <20170131183750.15481-1-bernd.kuhls@t-online.de>
Message-ID: <20170131183750.15481-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0001-abi23.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-abi23.patch                               | 33 ----------------------
 .../xdriver_xf86-video-siliconmotion.hash          |  4 +--
 .../xdriver_xf86-video-siliconmotion.mk            |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-siliconmotion/0001-abi23.patch

diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/0001-abi23.patch b/package/x11r7/xdriver_xf86-video-siliconmotion/0001-abi23.patch
deleted file mode 100644
index 2cd6e637b..000000000
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/0001-abi23.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e67f3949648c20e16ac756ae28ea4a2b4a1d0f4c Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 19 Jul 2016 10:03:56 -0400
-Subject: Adapt Block/WakeupHandler signature for ABI 23
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Downloaded from
-https://cgit.freedesktop.org/xorg/driver/xf86-video-siliconmotion/patch/?id=e67f3949648c20e16ac756ae28ea4a2b4a1d0f4c
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
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
index 42f39d244..819698c61 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-May/002604.html
-sha256	e9d449a9fd9e58b4e018447b6c64005f7874cffb1777e513ac9fc41a86071beb	xf86-video-siliconmotion-1.7.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002763.html
+sha256 d0f3c691e71108d27a061beb62bf78b36ec35bd755905692734dd68cfb3359bc  xf86-video-siliconmotion-1.7.9.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index f8ea403c8..53b19f9fe 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.8
+XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.9
 XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE = MIT
-- 
2.11.0
