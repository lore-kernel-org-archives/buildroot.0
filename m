From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:15:23 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-tdfx: Bump version to
	1.4.5
Message-ID: <20140329222158.A76749C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17aa463339038ea6ec35432568fe1aa0bfd5358a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ch => xdriver_xf86-video-tdfx-0001-cross.patch} |    0
 .../xdriver_xf86-video-tdfx-0002-mibstore.patch    |   36 ++++++++++++++++++++
 .../xdriver_xf86-video-tdfx.mk                     |    2 +-
 3 files changed, 37 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.4.0.patch b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-0001-cross.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.4.0.patch
rename to package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-0001-cross.patch
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-0002-mibstore.patch b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-0002-mibstore.patch
new file mode 100644
index 0000000..f156ea7
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-0002-mibstore.patch
@@ -0,0 +1,36 @@
+From 10498d2730c651eb7a1890eb9e728269732e9dad Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 25 Sep 2012 12:54:59 +0000
+Subject: Remove mibstore.h
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-tdfx/commit/?id=10498d2730c651eb7a1890eb9e728269732e9dad
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+diff --git a/src/tdfx_driver.c b/src/tdfx_driver.c
+index ddd5431..412da07 100644
+--- a/src/tdfx_driver.c
++++ b/src/tdfx_driver.c
+@@ -62,10 +62,6 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ 
+ #include "compiler.h"
+ 
+-/* Drivers using the mi implementation of backing store need: */
+-
+-#include "mibstore.h"
+-
+ /* All drivers using the vgahw module need this */
+ /* This driver needs to be modified to not use vgaHW for multihead operation */
+ #include "vgaHW.h"
+@@ -2373,7 +2369,6 @@ TDFXScreenInit(SCREEN_INIT_ARGS_DECL) {
+     }
+   }
+ 
+-  miInitializeBackingStore(pScreen);
+   xf86SetBackingStore(pScreen);
+   xf86SetSilkenMouse(pScreen);
+ 
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 7c06fb8..c23aa31 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.4
+XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.5
 XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TDFX_LICENSE = MIT
