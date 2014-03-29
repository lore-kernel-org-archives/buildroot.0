From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:41 +0100
Subject: [Buildroot] [PATCH 37/91] xdriver_xf86-video-i128: Bump version to
	1.3.6
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP377CCD1CBEACC6AC36DBE82D9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../xdriver_xf86-video-i128-0001-mbstring.patch    |   35 ++++++++++++++++++++
 .../xdriver_xf86-video-i128.mk                     |    2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128-0001-mbstring.patch

diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128-0001-mbstring.patch b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128-0001-mbstring.patch
new file mode 100644
index 0000000..40bb1ea
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128-0001-mbstring.patch
@@ -0,0 +1,35 @@
+From c87753733a6e1f85d1d037dced0b47ce0cf41658 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 25 Sep 2012 12:54:40 +0000
+Subject: Remove mibstore.h
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-i128/commit/?id=c87753733a6e1f85d1d037dced0b47ce0cf41658
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff --git a/src/i128_driver.c b/src/i128_driver.c
+index a0f08c0..51a4135 100644
+--- a/src/i128_driver.c
++++ b/src/i128_driver.c
+@@ -50,8 +50,6 @@
+ /* All drivers initialising the SW cursor need this */
+ #include "mipointer.h"
+ 
+-/* All drivers implementing backing store need this */
+-#include "mibstore.h"
+ #include "micmap.h"
+ 
+ #include "xf86DDC.h"
+@@ -1556,7 +1554,6 @@ I128ScreenInit(SCREEN_INIT_ARGS_DECL)
+         return FALSE;
+     }
+     
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+     xf86SetSilkenMouse(pScreen);
+ 
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index d18beb3..1bb760c 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_I128_VERSION = 1.3.5
+XDRIVER_XF86_VIDEO_I128_VERSION = 1.3.6
 XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_I128_LICENSE = MIT
-- 
1.7.10.4
