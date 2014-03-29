From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:34 +0100
Subject: [Buildroot] [PATCH 30/91] xdriver_xf86-video-nv: Bump version to
	2.1.20
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP15515D736AFE20BD36A8E68D9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../xdriver_xf86-video-nv-0001-mibstore.patch      |   86 ++++++++++++++++++++
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |    2 +-
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv-0001-mibstore.patch

diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv-0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv-0001-mibstore.patch
new file mode 100644
index 0000000..e71418b
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv-0001-mibstore.patch
@@ -0,0 +1,86 @@
+From fc78fe98222b0204b8a2872a529763d6fe5048da Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 25 Sep 2012 12:54:49 +0000
+Subject: Remove mibstore.h
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-nv/commit/?id=fc78fe98222b0204b8a2872a529763d6fe5048da
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff --git a/src/g80_driver.c b/src/g80_driver.c
+index cc4e197..719b96c 100644
+--- a/src/g80_driver.c
++++ b/src/g80_driver.c
+@@ -34,7 +34,6 @@
+ #include <xf86Resources.h>
+ #endif
+ #include <mipointer.h>
+-#include <mibstore.h>
+ #include <micmap.h>
+ #include <xf86cmap.h>
+ #include <fb.h>
+@@ -833,7 +832,6 @@ G80ScreenInit(SCREEN_INIT_ARGS_DECL)
+         }
+     }
+ 
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+     xf86SetSilkenMouse(pScreen);
+ 
+diff --git a/src/nv_driver.c b/src/nv_driver.c
+index 6dad6e5..8f35334 100644
+--- a/src/nv_driver.c
++++ b/src/nv_driver.c
+@@ -2550,7 +2550,6 @@ NVScreenInit(SCREEN_INIT_ARGS_DECL)
+     if (!pNv->NoAccel)
+ 	NVAccelInit(pScreen);
+     
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+     xf86SetSilkenMouse(pScreen);
+ 
+diff --git a/src/nv_include.h b/src/nv_include.h
+index fb190bf..f174eef 100644
+--- a/src/nv_include.h
++++ b/src/nv_include.h
+@@ -24,9 +24,6 @@
+ /* All drivers initialising the SW cursor need this */
+ #include "mipointer.h"
+ 
+-/* All drivers implementing backing store need this */
+-#include "mibstore.h"
+-
+ #include "micmap.h"
+ 
+ #include "xf86DDC.h"
+diff --git a/src/riva_driver.c b/src/riva_driver.c
+index e0667ef..759501e 100644
+--- a/src/riva_driver.c
++++ b/src/riva_driver.c
+@@ -1168,7 +1168,6 @@ RivaScreenInit(SCREEN_INIT_ARGS_DECL)
+     if (!pRiva->NoAccel)
+ 	RivaAccelInit(pScreen);
+     
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+     xf86SetSilkenMouse(pScreen);
+ 
+diff --git a/src/riva_include.h b/src/riva_include.h
+index f2c5302..c7aeef7 100644
+--- a/src/riva_include.h
++++ b/src/riva_include.h
+@@ -22,9 +22,6 @@
+ /* All drivers initialising the SW cursor need this */
+ #include "mipointer.h"
+ 
+-/* All drivers implementing backing store need this */
+-#include "mibstore.h"
+-
+ #include "micmap.h"
+ 
+ #include "xf86DDC.h"
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 8f9d6e8..655bee9 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.18
+XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.20
 XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_LICENSE = MIT
-- 
1.7.10.4
