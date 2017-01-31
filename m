From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:40 +0100
Subject: [Buildroot] [PATCH 06/16] package/x11r7/xdriver_xf86-video-glint:
	bump version to 1.2.9
In-Reply-To: <20170131183750.15481-1-bernd.kuhls@t-online.de>
References: <20170131183750.15481-1-bernd.kuhls@t-online.de>
Message-ID: <20170131183750.15481-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0001-mbstring.patch & 0002-abi23.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-glint/0001-mbstring.patch   | 35 ----------------------
 .../xdriver_xf86-video-glint/0002-abi23.patch      | 33 --------------------
 .../xdriver_xf86-video-glint.hash                  |  4 +--
 .../xdriver_xf86-video-glint.mk                    |  3 +-
 4 files changed, 3 insertions(+), 72 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/0001-mbstring.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/0002-abi23.patch

diff --git a/package/x11r7/xdriver_xf86-video-glint/0001-mbstring.patch b/package/x11r7/xdriver_xf86-video-glint/0001-mbstring.patch
deleted file mode 100644
index 635600abb..000000000
--- a/package/x11r7/xdriver_xf86-video-glint/0001-mbstring.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 073d5b0b392781bf4a6aa7f9e2dbe2ae51caed2c Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 25 Sep 2012 12:54:38 +0000
-Subject: Remove mibstore.h
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Fetch from:
-http://cgit.freedesktop.org/xorg/driver/xf86-video-glint/commit/?id=073d5b0b392781bf4a6aa7f9e2dbe2ae51caed2c
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff --git a/src/glint_driver.c b/src/glint_driver.c
-index b6d20a9..aa78516 100644
---- a/src/glint_driver.c
-+++ b/src/glint_driver.c
-@@ -52,8 +52,6 @@
- #include "compiler.h"
- #include "mipointer.h"
- 
--#include "mibstore.h"
--
- #include "pm3_regs.h"
- #include "glint_regs.h"
- #include "IBM.h"
-@@ -2904,7 +2902,6 @@ GLINTScreenInit(SCREEN_INIT_ARGS_DECL)
-         }
-     }
- 
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
-     xf86SetSilkenMouse(pScreen);
- 
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-glint/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-glint/0002-abi23.patch
deleted file mode 100644
index 1d8f7f22c..000000000
--- a/package/x11r7/xdriver_xf86-video-glint/0002-abi23.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2eb4d03d2280deec4d6f1b06aaa16477a641af9a Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 19 Jul 2016 10:03:56 -0400
-Subject: Adapt Block/WakeupHandler signature for ABI 23
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Downloaded from:
-https://cgit.freedesktop.org/xorg/driver/xf86-video-glint/commit/?id=2eb4d03d2280deec4d6f1b06aaa16477a641af9a
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
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash
index ad3fbaa76..f4e42bf4c 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2012-July/002011.html
-sha256	657f883bb3a4e4278399eba73840862c3642706ae8b0a4798ec97a31b3524221	xf86-video-glint-1.2.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002759.html
+sha256 852833ab2ea9ce519195dfd061a6c7aa5945a093cdc19546d1e9e69df7d577d2  xf86-video-glint-1.2.9.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
index 76c3da1ca..52bc567e5 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GLINT_VERSION = 1.2.8
+XDRIVER_XF86_VIDEO_GLINT_VERSION = 1.2.9
 XDRIVER_XF86_VIDEO_GLINT_SOURCE = xf86-video-glint-$(XDRIVER_XF86_VIDEO_GLINT_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GLINT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GLINT_LICENSE = MIT
 XDRIVER_XF86_VIDEO_GLINT_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_GLINT_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xproto
 
 $(eval $(autotools-package))
-- 
2.11.0
