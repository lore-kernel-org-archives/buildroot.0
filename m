From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 21:39:21 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-mga: bump
	version to 1.6.5
Message-ID: <20170201204118.C5D928212C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28a51f619a66d600e3862691b1f1eb4ea0fe9950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0002-abi23.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xdriver_xf86-video-mga/0002-abi23.patch  | 33 ----------------------
 .../xdriver_xf86-video-mga.hash                    |  4 +--
 .../xdriver_xf86-video-mga.mk                      |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mga/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-mga/0002-abi23.patch
deleted file mode 100644
index b2b6917..0000000
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
index 081577d..0187e6f 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-February/002533.html
-sha256	48c6690b6751c76f53de64f8dbeaa9d6c62dbcfe890c768fd87167951247d44f	xf86-video-mga-1.6.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002765.html
+sha256 b663cd8e6364f7c4e2637b9fcab9861d0e3971518c73b00d213f6545a1289422  xf86-video-mga-1.6.5.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 771ec18..065a68e 100644
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
