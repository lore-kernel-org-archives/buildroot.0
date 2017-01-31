From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:37 +0100
Subject: [Buildroot] [PATCH 03/16] package/x11r7/xdriver_xf86-video-mga:
	bump version to 1.6.5
In-Reply-To: <20170131183750.15481-1-bernd.kuhls@t-online.de>
References: <20170131183750.15481-1-bernd.kuhls@t-online.de>
Message-ID: <20170131183750.15481-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0002-abi23.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-mga/0002-abi23.patch  | 33 ----------------------
 .../xdriver_xf86-video-mga.hash                    |  4 +--
 .../xdriver_xf86-video-mga.mk                      |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-mga/0002-abi23.patch

diff --git a/package/x11r7/xdriver_xf86-video-mga/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-mga/0002-abi23.patch
deleted file mode 100644
index b2b691789..000000000
--- a/package/x11r7/xdriver_xf86-video-mga/0002-abi23.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From df094bfffe4ef097bfd9a569f2d2e35649c1a3c7 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 19 Jul 2016 10:03:56 -0400
-Subject: Adapt Block/WakeupHandler signature for ABI 23
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Downloaded from
-https://cgit.freedesktop.org/xorg/driver/xf86-video-mga/commit/?id=df094bfffe4ef097bfd9a569f2d2e35649c1a3c7
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
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
index 081577d4a..0187e6fbb 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-February/002533.html
-sha256	48c6690b6751c76f53de64f8dbeaa9d6c62dbcfe890c768fd87167951247d44f	xf86-video-mga-1.6.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002765.html
+sha256 b663cd8e6364f7c4e2637b9fcab9861d0e3971518c73b00d213f6545a1289422  xf86-video-mga-1.6.5.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 771ec18ce..065a68ea6 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MGA_VERSION = 1.6.4
+XDRIVER_XF86_VIDEO_MGA_VERSION = 1.6.5
 XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_MGA_LICENSE = MIT
-- 
2.11.0
