From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:42 +0100
Subject: [Buildroot] [PATCH 38/91] xdriver_xf86-video-glint: Bump version to
	1.2.8
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP2292D930B7A2F626ABA4865D9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../xdriver_xf86-video-glint-0001-mbstring.patch   |   35 ++++++++++++++++++++
 .../xdriver_xf86-video-glint.mk                    |    2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-0001-mbstring.patch

diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-0001-mbstring.patch b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-0001-mbstring.patch
new file mode 100644
index 0000000..635600a
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-0001-mbstring.patch
@@ -0,0 +1,35 @@
+From 073d5b0b392781bf4a6aa7f9e2dbe2ae51caed2c Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 25 Sep 2012 12:54:38 +0000
+Subject: Remove mibstore.h
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-glint/commit/?id=073d5b0b392781bf4a6aa7f9e2dbe2ae51caed2c
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff --git a/src/glint_driver.c b/src/glint_driver.c
+index b6d20a9..aa78516 100644
+--- a/src/glint_driver.c
++++ b/src/glint_driver.c
+@@ -52,8 +52,6 @@
+ #include "compiler.h"
+ #include "mipointer.h"
+ 
+-#include "mibstore.h"
+-
+ #include "pm3_regs.h"
+ #include "glint_regs.h"
+ #include "IBM.h"
+@@ -2904,7 +2902,6 @@ GLINTScreenInit(SCREEN_INIT_ARGS_DECL)
+         }
+     }
+ 
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+     xf86SetSilkenMouse(pScreen);
+ 
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
index 396a162..76c3da1 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GLINT_VERSION = 1.2.7
+XDRIVER_XF86_VIDEO_GLINT_VERSION = 1.2.8
 XDRIVER_XF86_VIDEO_GLINT_SOURCE = xf86-video-glint-$(XDRIVER_XF86_VIDEO_GLINT_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GLINT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GLINT_LICENSE = MIT
-- 
1.7.10.4
