From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:37 +0100
Subject: [Buildroot] [PATCH 33/91] xdriver_xf86-video-tga: Bump version to
	1.2.2
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP392BF79FE3953C95C5F8EE4D9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../xdriver_xf86-video-tga-0001-mibstore.patch     |   47 ++++++++++++++++++++
 .../xdriver_xf86-video-tga.mk                      |    2 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-0001-mibstore.patch

diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-0001-mibstore.patch
new file mode 100644
index 0000000..07bcd04
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-0001-mibstore.patch
@@ -0,0 +1,47 @@
+From b7022db0559cd1b6cd3eb6b5abf6896a607b478d Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 25 Sep 2012 12:55:00 +0000
+Subject: Remove mibstore.h
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-tga/commit/?id=b7022db0559cd1b6cd3eb6b5abf6896a607b478d
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff --git a/src/tga_accel.c b/src/tga_accel.c
+index 35af1a4..b414df5 100644
+--- a/src/tga_accel.c
++++ b/src/tga_accel.c
+@@ -37,7 +37,6 @@
+ #include "xf86cmap.h"
+ #include "mipointer.h"
+ 
+-#include "mibstore.h"
+ #include "miline.h"
+ 
+ #include "tga_regs.h"
+diff --git a/src/tga_driver.c b/src/tga_driver.c
+index dd4f3e6..90d2660 100644
+--- a/src/tga_driver.c
++++ b/src/tga_driver.c
+@@ -46,8 +46,6 @@
+ 
+ /* software cursor */
+ #include "mipointer.h"
+-/* backing store */
+-#include "mibstore.h"
+ 
+ /*  #include "mibank.h" */
+ /* colormap manipulation */
+@@ -1451,7 +1449,6 @@ TGAScreenInit(SCREEN_INIT_ARGS_DECL)
+     
+     fbPictureInit (pScreen, 0, 0);
+     
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+     xf86SetSilkenMouse(pScreen);
+ 
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
index 16423a2..8af5ac8 100644
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TGA_VERSION = 1.2.1
+XDRIVER_XF86_VIDEO_TGA_VERSION = 1.2.2
 XDRIVER_XF86_VIDEO_TGA_SOURCE = xf86-video-tga-$(XDRIVER_XF86_VIDEO_TGA_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TGA_LICENSE = MIT
-- 
1.7.10.4
