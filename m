From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 8 Mar 2017 00:50:53 +0100
Subject: [Buildroot] [PATCH 5/6] xdriver_xf86-video-v4l: remove broken
	package
In-Reply-To: <20170307235054.25149-1-arnout@mind.be>
References: <20170307235054.25149-1-arnout@mind.be>
Message-ID: <20170307235054.25149-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package has been marked as broken since 2015.02. Since this was
already unavailable without mention in Config.in.legacy for 9 Buildroot
releases, legacy handling isn't very useful.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Bernd, last chance to unbreak the package :-)
---
 package/x11r7/Config.in                                    |  1 -
 package/x11r7/xdriver_xf86-video-v4l/Config.in             |  8 --------
 .../xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.hash     |  2 --
 .../x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk | 14 --------------
 4 files changed, 25 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-v4l/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.hash
 delete mode 100644 package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 4510871eee..ddceaa407f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -183,7 +183,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-tdfx/Config.in
 		source package/x11r7/xdriver_xf86-video-tga/Config.in
 		source package/x11r7/xdriver_xf86-video-trident/Config.in
-		source package/x11r7/xdriver_xf86-video-v4l/Config.in
 		source package/x11r7/xdriver_xf86-video-vesa/Config.in
 		source package/x11r7/xdriver_xf86-video-vmware/Config.in
 		source package/x11r7/xdriver_xf86-video-voodoo/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-v4l/Config.in b/package/x11r7/xdriver_xf86-video-v4l/Config.in
deleted file mode 100644
index 27ffd87113..0000000000
--- a/package/x11r7/xdriver_xf86-video-v4l/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_V4L
-	bool "xf86-video-v4l"
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	depends on BROKEN # Fails to build with xorg xserver >= 1.17
-	help
-	  video4linux driver
diff --git a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.hash b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.hash
deleted file mode 100644
index c4bcfadc4b..0000000000
--- a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://lists.x.org/archives/xorg-announce/2008-March/000504.html
-sha1	7f2212c529a5bcc34f67858a9d0167a0d4848aaa	xf86-video-v4l-0.2.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
deleted file mode 100644
index 607b605f80..0000000000
--- a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-v4l
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_V4L_VERSION = 0.2.0
-XDRIVER_XF86_VIDEO_V4L_SOURCE = xf86-video-v4l-$(XDRIVER_XF86_VIDEO_V4L_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_V4L_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_V4L_LICENSE = MIT
-XDRIVER_XF86_VIDEO_V4L_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_V4L_DEPENDENCIES = xserver_xorg-server xproto_randrproto xproto_videoproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
2.11.0
