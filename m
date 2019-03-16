From: Michel Stempin <michel.stempin@wanadoo.fr>
Date: Sat, 16 Mar 2019 23:27:11 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xdriver_xf86-video-fbdev: bump to
 version 0.5.0
Message-ID: <1552775231-12318-1-git-send-email-michel.stempin@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting X manually resulted in a symbol error:
| Xorg: symbol lookup error: /usr/lib/xorg/modules/drivers/fbdev_drv.so: undefined symbol: shadowUpdatePackedWeak

This bug was reported against the fbdev driver, which is fixed
upstream in 0.5.0:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=900317

Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
---
 package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash | 2 +-
 package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
index 0f34e51..d0cbc09 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
@@ -1,2 +1,2 @@
 # From http://lists.x.org/archives/xorg-announce/2013-September/002324.html
-sha256	9dd4b326498223abbfdf786089a46ea3db4fa6bbd341308eb48a9e00bc3fd51b	xf86-video-fbdev-0.4.4.tar.bz2
+sha256	dcc3d85f378022180e437a9ec00a59b6cb7680ff79c40394d695060af2374699	xf86-video-fbdev-0.5.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index f39311e..ab0acfb 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -1,10 +1,10 @@
-################################################################################
+###############################################################################
 #
 # xdriver_xf86-video-fbdev
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.4.4
+XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.5.0
 XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_FBDEV_LICENSE = MIT
-- 
2.7.4
