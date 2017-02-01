From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 21:39:20 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-sis: bump
	version to 0.10.9
Message-ID: <20170201204118.C730E82131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea367a7126d4d68627589c43bf569b63800f9e97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0002-abi23.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xdriver_xf86-video-sis/0002-abi23.patch  | 33 ----------------------
 .../xdriver_xf86-video-sis.hash                    |  4 +--
 .../xdriver_xf86-video-sis.mk                      |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-sis/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-sis/0002-abi23.patch
deleted file mode 100644
index 109f745..0000000
--- a/package/x11r7/xdriver_xf86-video-sis/0002-abi23.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 96fee560cd8bf7bf27048ce5fe67b7af6838c8d0 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 19 Jul 2016 10:03:56 -0400
-Subject: Adapt Block/WakeupHandler signature for ABI 23
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Downloaded from
-https://cgit.freedesktop.org/xorg/driver/xf86-video-sis/commit/?id=96fee560cd8bf7bf27048ce5fe67b7af6838c8d0
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
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
index dfc7814..98ea8b1 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-August/002628.html
-sha256	c8f3f2577f69334dfcc4bf96477dce45161170555f3abdfa105599e61bc7d3fe	xf86-video-sis-0.10.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002756.html
+sha256 5226b7407c601afa32d6cbf155f9182da95d92cdc89c1f83471e1927e552c10d  xf86-video-sis-0.10.9.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index 5792f8e..833246e 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.8
+XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.9
 XDRIVER_XF86_VIDEO_SIS_SOURCE = xf86-video-sis-$(XDRIVER_XF86_VIDEO_SIS_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SIS_LICENSE = MIT
