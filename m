From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Apr 2016 19:15:00 +0200
Subject: [Buildroot] [PATCH 4/6] package/x11r7/xdriver_xf86-video-ati: bump
	version to 7.7.0
In-Reply-To: <1460308502-14157-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460308502-14157-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460308502-14157-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove BR2_TOOLCHAIN_HAS_THREADS condition, it is already present
in package/x11r7/Config.in.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in                   | 1 -
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash | 4 ++--
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 55be603..00d91bd 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
 	depends on BR2_PACKAGE_MESA3D
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm -> libpthread-stubs
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index 57ebfe8..6eb3508 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-November/002658.html
-sha256 2516d9eeb8da8bcd3a01365ed1314919777910fa904ab268af342b5693e1d34c        xf86-video-ati-7.6.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-April/002684.html
+sha256	844d1c577b145c90dc8ef027678f0c27f554363f782cd696a3aea26415b2c1c3	xf86-video-ati-7.7.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 09af05a..29a0d2f 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 7.6.1
+XDRIVER_XF86_VIDEO_ATI_VERSION = 7.7.0
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
-- 
2.8.0.rc3
