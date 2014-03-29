From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:15:30 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-ark: Bump version to
	0.7.5
Message-ID: <20140329222158.C6E079C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1716776eec025a3ee439f7727ba2663786affaa8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xdriver_xf86-video-ark-0001-mibstore.patch
- added upstream patch to fix compile error:
http://cgit.freedesktop.org/xorg/driver/xf86-video-ark/commit/?id=3a3eb72baec46f48e6cf15a834271c3d3386deac

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-ark-0001-mibstore.patch     |   40 ++++++++++++++++++++
 .../xdriver_xf86-video-ark.mk                      |    2 +-
 2 files changed, 41 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark-0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark-0001-mibstore.patch
new file mode 100644
index 0000000..fa3e685
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark-0001-mibstore.patch
@@ -0,0 +1,40 @@
+From 3a3eb72baec46f48e6cf15a834271c3d3386deac Mon Sep 17 00:00:00 2001
+From: Gaetan Nadon <memsize@videotron.ca>
+Date: Tue, 17 Sep 2013 19:55:37 +0000
+Subject: Remove usage of mibstore.h (removed from server)
+
+The module had a compile error for this missing header file.
+
+Changes similar to vmware commit
+23d87c92b7211cc5249eefe4ab3a2c7f370e279e
+
+Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Gaetan Nadon <memsize@videotron.ca>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-ark/commit/?id=3a3eb72baec46f48e6cf15a834271c3d3386deac
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff --git a/src/ark_driver.c b/src/ark_driver.c
+index b7c287c..65cfe84 100644
+--- a/src/ark_driver.c
++++ b/src/ark_driver.c
+@@ -39,7 +39,6 @@
+ #include "compiler.h"
+ #include "mipointer.h"
+ #include "micmap.h"
+-#include "mibstore.h"
+ #include "fb.h"
+ #include "ark.h"
+ 
+@@ -538,7 +537,6 @@ static Bool ARKScreenInit(SCREEN_INIT_ARGS_DECL)
+ 
+ 	fbPictureInit (pScreen, 0, 0);
+ 
+-	miInitializeBackingStore(pScreen);
+ 	xf86SetBackingStore(pScreen);
+ 
+ 	if (!pARK->NoAccel) {
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
index 9b94b2a..c0b905b 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ARK_VERSION = 0.7.4
+XDRIVER_XF86_VIDEO_ARK_VERSION = 0.7.5
 XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ARK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ARK_LICENSE = MIT
