From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:22:19 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-trident:
	bump version to 1.3.7, add hash
Message-ID: <20150418162756.EC69C8079D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75a6d207297ab413e29319fefef15fc75b206c42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches committed upstream:
http://lists.x.org/archives/xorg-announce/2015-March/002558.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-trident/0001-mibstore.patch |   34 -----------------
 .../xdriver_xf86-video-trident/0002-xaa.patch      |   39 --------------------
 .../xdriver_xf86-video-trident.hash                |    2 +
 .../xdriver_xf86-video-trident.mk                  |    2 +-
 4 files changed, 3 insertions(+), 74 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-trident/0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-trident/0001-mibstore.patch
deleted file mode 100644
index efdd6ac..0000000
--- a/package/x11r7/xdriver_xf86-video-trident/0001-mibstore.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 30787294c837aefa8820b6f76f00fe30d4e54181 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 25 Sep 2012 12:55:01 +0000
-Subject: Remove mibstore.h
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Fetch from:
-http://cgit.freedesktop.org/xorg/driver/xf86-video-trident/commit/?id=30787294c837aefa8820b6f76f00fe30d4e54181
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff --git a/src/trident_driver.c b/src/trident_driver.c
-index dc12b76..408c870 100644
---- a/src/trident_driver.c
-+++ b/src/trident_driver.c
-@@ -56,7 +56,6 @@
- 
- #include "mipointer.h"
- 
--#include "mibstore.h"
- #include "shadow.h"
- #include "trident.h"
- #include "trident_regs.h"
-@@ -3037,7 +3036,6 @@ TRIDENTScreenInit(SCREEN_INIT_ARGS_DECL)
-     	TridentAccelInit(pScreen);
-     }
- 
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
- 
-     /* Initialise cursor functions */
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-trident/0002-xaa.patch b/package/x11r7/xdriver_xf86-video-trident/0002-xaa.patch
deleted file mode 100644
index 0750002..0000000
--- a/package/x11r7/xdriver_xf86-video-trident/0002-xaa.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 48c15909691e28ad2c188a2978b1c8ef3d9d8760 Mon Sep 17 00:00:00 2001
-From: Timo Aaltonen <tjaalton@ubuntu.com>
-Date: Wed, 26 Sep 2012 08:01:26 +0000
-Subject: Fix loading the driver without XAA
-
----
-Fetch from:
-http://cgit.freedesktop.org/xorg/driver/xf86-video-trident/commit/?id=48c15909691e28ad2c188a2978b1c8ef3d9d8760
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff --git a/src/trident_dga.c b/src/trident_dga.c
-index 0263aa7..c4b5b9a 100644
---- a/src/trident_dga.c
-+++ b/src/trident_dga.c
-@@ -37,10 +37,10 @@
- static Bool TRIDENT_OpenFramebuffer(ScrnInfoPtr, char **, unsigned char **, 
- 					int *, int *, int *);
- static Bool TRIDENT_SetMode(ScrnInfoPtr, DGAModePtr);
--static void TRIDENT_Sync(ScrnInfoPtr);
- static int  TRIDENT_GetViewport(ScrnInfoPtr);
- static void TRIDENT_SetViewport(ScrnInfoPtr, int, int, int);
- #ifdef HAVE_XAA_H
-+static void TRIDENT_Sync(ScrnInfoPtr);
- static void TRIDENT_FillRect(ScrnInfoPtr, int, int, int, int, unsigned long);
- static void TRIDENT_BlitRect(ScrnInfoPtr, int, int, int, int, int, int);
- #if 0
-@@ -56,8 +56,8 @@ DGAFunctionRec TRIDENTDGAFuncs = {
-    TRIDENT_SetMode,
-    TRIDENT_SetViewport,
-    TRIDENT_GetViewport,
--   TRIDENT_Sync,
- #ifdef HAVE_XAA_H
-+   TRIDENT_Sync,
-    TRIDENT_FillRect,
-    TRIDENT_BlitRect,
- #if 0
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
new file mode 100644
index 0000000..e92c948
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-March/002558.html
+sha256	ecd518de627a0d49e17c158bfc72ab657386c6907c91ef89fa09332558e413ae	xf86-video-trident-1.3.7.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index 7a45e3f..a136e87 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.6
+XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.7
 XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRIDENT_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TRIDENT_LICENSE = MIT
