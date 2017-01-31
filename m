From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:39 +0100
Subject: [Buildroot] [PATCH 05/16] package/x11r7/xdriver_xf86-video-nv: bump
	version to 2.1.21
In-Reply-To: <20170131183750.15481-1-bernd.kuhls@t-online.de>
References: <20170131183750.15481-1-bernd.kuhls@t-online.de>
Message-ID: <20170131183750.15481-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0001-mibstore.patch & 0002-abi23.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-nv/0001-mibstore.patch      | 86 ----------------------
 .../x11r7/xdriver_xf86-video-nv/0002-abi23.patch   | 39 ----------
 .../xdriver_xf86-video-nv.hash                     |  4 +-
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |  2 +-
 4 files changed, 3 insertions(+), 128 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-nv/0001-mibstore.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-nv/0002-abi23.patch

diff --git a/package/x11r7/xdriver_xf86-video-nv/0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-nv/0001-mibstore.patch
deleted file mode 100644
index e71418bc9..000000000
--- a/package/x11r7/xdriver_xf86-video-nv/0001-mibstore.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From fc78fe98222b0204b8a2872a529763d6fe5048da Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 25 Sep 2012 12:54:49 +0000
-Subject: Remove mibstore.h
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Fetch from:
-http://cgit.freedesktop.org/xorg/driver/xf86-video-nv/commit/?id=fc78fe98222b0204b8a2872a529763d6fe5048da
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff --git a/src/g80_driver.c b/src/g80_driver.c
-index cc4e197..719b96c 100644
---- a/src/g80_driver.c
-+++ b/src/g80_driver.c
-@@ -34,7 +34,6 @@
- #include <xf86Resources.h>
- #endif
- #include <mipointer.h>
--#include <mibstore.h>
- #include <micmap.h>
- #include <xf86cmap.h>
- #include <fb.h>
-@@ -833,7 +832,6 @@ G80ScreenInit(SCREEN_INIT_ARGS_DECL)
-         }
-     }
- 
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
-     xf86SetSilkenMouse(pScreen);
- 
-diff --git a/src/nv_driver.c b/src/nv_driver.c
-index 6dad6e5..8f35334 100644
---- a/src/nv_driver.c
-+++ b/src/nv_driver.c
-@@ -2550,7 +2550,6 @@ NVScreenInit(SCREEN_INIT_ARGS_DECL)
-     if (!pNv->NoAccel)
- 	NVAccelInit(pScreen);
-     
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
-     xf86SetSilkenMouse(pScreen);
- 
-diff --git a/src/nv_include.h b/src/nv_include.h
-index fb190bf..f174eef 100644
---- a/src/nv_include.h
-+++ b/src/nv_include.h
-@@ -24,9 +24,6 @@
- /* All drivers initialising the SW cursor need this */
- #include "mipointer.h"
- 
--/* All drivers implementing backing store need this */
--#include "mibstore.h"
--
- #include "micmap.h"
- 
- #include "xf86DDC.h"
-diff --git a/src/riva_driver.c b/src/riva_driver.c
-index e0667ef..759501e 100644
---- a/src/riva_driver.c
-+++ b/src/riva_driver.c
-@@ -1168,7 +1168,6 @@ RivaScreenInit(SCREEN_INIT_ARGS_DECL)
-     if (!pRiva->NoAccel)
- 	RivaAccelInit(pScreen);
-     
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
-     xf86SetSilkenMouse(pScreen);
- 
-diff --git a/src/riva_include.h b/src/riva_include.h
-index f2c5302..c7aeef7 100644
---- a/src/riva_include.h
-+++ b/src/riva_include.h
-@@ -22,9 +22,6 @@
- /* All drivers initialising the SW cursor need this */
- #include "mipointer.h"
- 
--/* All drivers implementing backing store need this */
--#include "mibstore.h"
--
- #include "micmap.h"
- 
- #include "xf86DDC.h"
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-nv/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-nv/0002-abi23.patch
deleted file mode 100644
index 7b7bb34cd..000000000
--- a/package/x11r7/xdriver_xf86-video-nv/0002-abi23.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 42e260a7ab630fdfa4664f467dad25e7178ff809 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 19 Jul 2016 10:03:56 -0400
-Subject: Adapt Block/WakeupHandler signature for ABI 23
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Downloaded from
-https://cgit.freedesktop.org/xorg/driver/xf86-video-nv/commit/?id=42e260a7ab630fdfa4664f467dad25e7178ff809
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/src/compat-api.h b/src/compat-api.h
-index 0a87cf5..62d9481 100644
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
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
index 8083ea29d..fe91307a6 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2012-July/002030.html
-sha256	8395f65501f16f9cbaae8f598b02c6f18e78f4d3d30a08cb8d547dc2e00c10bf xf86-video-nv-2.1.20.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002761.html
+sha256 1f98649e6ff0e8214b9d5dcac661f1d004be8e73823d8247b9c7025fd81db32d  xf86-video-nv-2.1.21.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 655bee928..430ce4a1d 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.20
+XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.21
 XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_LICENSE = MIT
-- 
2.11.0
