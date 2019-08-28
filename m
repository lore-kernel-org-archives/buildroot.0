From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 23:43:16 +0200
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-video-sis: bump version to 0.11.0
Message-ID: <20190828214038.EC1D28820B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96c9052d60066e478e8383bc4ed3b79ae2137cf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed all patches after they were applied upstream:
https://cgit.freedesktop.org/xorg/driver/xf86-video-sis/commit/?id=9e42918588b65860422cb296a92ecede15db7419
https://cgit.freedesktop.org/xorg/driver/xf86-video-sis/commit/?id=4b1356a2b7fd06e9a05d134caa4033681c939737

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../x11r7/xdriver_xf86-video-sis/0001-cross.patch  | 21 --------------
 .../0002-Remove-reference-to-virtualFrom.patch     | 33 ----------------------
 .../xdriver_xf86-video-sis.hash                    |  9 ++++--
 .../xdriver_xf86-video-sis.mk                      |  3 +-
 4 files changed, 8 insertions(+), 58 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-sis/0001-cross.patch b/package/x11r7/xdriver_xf86-video-sis/0001-cross.patch
deleted file mode 100644
index 9e06480d40..0000000000
--- a/package/x11r7/xdriver_xf86-video-sis/0001-cross.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- xf86-video-sis-0.9.3/configure.ac.orig	2007-06-10 21:00:29.000000000 +0200
-+++ xf86-video-sis-0.9.3/configure.ac	2007-06-10 21:00:45.000000000 +0200
-@@ -71,12 +71,18 @@
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
-+	if test "$cross_compiling" = "no" ; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
-         AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+	else
-+		have_dri_h="yes"
-+		have_sarea_h="yes"
-+		have_dristruct_h="yes"
-+	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-sis/0002-Remove-reference-to-virtualFrom.patch b/package/x11r7/xdriver_xf86-video-sis/0002-Remove-reference-to-virtualFrom.patch
deleted file mode 100644
index c9e05efb76..0000000000
--- a/package/x11r7/xdriver_xf86-video-sis/0002-Remove-reference-to-virtualFrom.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 4b1356a2b7fd06e9a05d134caa4033681c939737 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Thu, 16 Feb 2017 11:21:27 -0500
-Subject: [PATCH] Remove reference to ->virtualFrom
-
-The core will print this information as well anyway.
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
-
-Downloaded from upstream commit
-https://cgit.freedesktop.org/xorg/driver/xf86-video-sis/commit/?id=4b1356a2b7fd06e9a05d134caa4033681c939737
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/sis_driver.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sis_driver.c b/src/sis_driver.c
-index 8f06164..513f68b 100644
---- a/src/sis_driver.c
-+++ b/src/sis_driver.c
-@@ -2738,7 +2738,7 @@ SiSPrintModes(ScrnInfoPtr pScrn)
-     float hsync, refresh = 0.0;
-     char *desc, *desc2, *prefix, *uprefix, *output;
- 
--    xf86DrvMsg(pScrn->scrnIndex, pScrn->virtualFrom, "Virtual size is %dx%d "
-+    xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Virtual size is %dx%d "
- 	       "(pitch %d)\n", pScrn->virtualX, pScrn->virtualY,
- 	       pScrn->displayWidth);
- 
--- 
-2.17.1
-
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
index 98ea8b1e4c..bcce6d4740 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002756.html
-sha256 5226b7407c601afa32d6cbf155f9182da95d92cdc89c1f83471e1927e552c10d  xf86-video-sis-0.10.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-July/003016.html
+md5 b4ad0e572bffa609f75df787ea7b3d11  xf86-video-sis-0.11.0.tar.bz2
+sha1 3e6b22a1c8061fb7efc7bf7012ca47fbf9f64722  xf86-video-sis-0.11.0.tar.bz2
+sha256 2177901a21a980552f8be429f063388e4c5d5f2e24e8b0ce72d65bd93ccc3b6b  xf86-video-sis-0.11.0.tar.bz2
+sha512 b8ad05b3faa24c6df65d825b576ddb8e2ce44705ce8b55d8cf0d9f37aa47a429ab43765d8daea57ff35c4cffed056fbec6dfe8ce95efcd6269cc7711115ea09c  xf86-video-sis-0.11.0.tar.bz2
+# Locally computed
+sha256 e7958f9497a4daa3ae5aeaf885e4565520af2c540b6e4e04b52bf95d41d56c39  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index af80e15da9..7a43d26553 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.9
+XDRIVER_XF86_VIDEO_SIS_VERSION = 0.11.0
 XDRIVER_XF86_VIDEO_SIS_SOURCE = xf86-video-sis-$(XDRIVER_XF86_VIDEO_SIS_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SIS_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SIS_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
