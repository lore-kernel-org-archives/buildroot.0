From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Feb 2015 21:11:40 +0100
Subject: [Buildroot] [PATCH 27/35] package/x11r7/xdriver_xf86-video-tdfx:
	bump version
In-Reply-To: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1423339908-2960-27-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use git snapshot for compatibility with xorg xserver 1.17.0,
remove patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-tdfx/0002-mibstore.patch    |   36 --------------------
 .../xdriver_xf86-video-tdfx.mk                     |    5 ++-
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-tdfx/0002-mibstore.patch

diff --git a/package/x11r7/xdriver_xf86-video-tdfx/0002-mibstore.patch b/package/x11r7/xdriver_xf86-video-tdfx/0002-mibstore.patch
deleted file mode 100644
index f156ea7..0000000
--- a/package/x11r7/xdriver_xf86-video-tdfx/0002-mibstore.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 10498d2730c651eb7a1890eb9e728269732e9dad Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 25 Sep 2012 12:54:59 +0000
-Subject: Remove mibstore.h
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Fetch from:
-http://cgit.freedesktop.org/xorg/driver/xf86-video-tdfx/commit/?id=10498d2730c651eb7a1890eb9e728269732e9dad
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-diff --git a/src/tdfx_driver.c b/src/tdfx_driver.c
-index ddd5431..412da07 100644
---- a/src/tdfx_driver.c
-+++ b/src/tdfx_driver.c
-@@ -62,10 +62,6 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- 
- #include "compiler.h"
- 
--/* Drivers using the mi implementation of backing store need: */
--
--#include "mibstore.h"
--
- /* All drivers using the vgahw module need this */
- /* This driver needs to be modified to not use vgaHW for multihead operation */
- #include "vgaHW.h"
-@@ -2373,7 +2369,6 @@ TDFXScreenInit(SCREEN_INIT_ARGS_DECL) {
-     }
-   }
- 
--  miInitializeBackingStore(pScreen);
-   xf86SetBackingStore(pScreen);
-   xf86SetSilkenMouse(pScreen);
- 
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index c23aa31..745fd2d 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.5
-XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_TDFX_VERSION = 2f71b05e29ae13a0fb6fbc74f4f76c78b6ddb0d7
+XDRIVER_XF86_VIDEO_TDFX_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-tdfx
 XDRIVER_XF86_VIDEO_TDFX_LICENSE = MIT
 XDRIVER_XF86_VIDEO_TDFX_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
-- 
1.7.10.4
