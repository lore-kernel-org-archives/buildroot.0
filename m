From: Michel Stempin <michel.stempin@wanadoo.fr>
Date: Sat, 16 Mar 2019 23:37:10 +0100
Subject: [Buildroot] [PATCH v2] package/x11r7/xdriver_xf86-video-fbdev: bump
 to version 0.5.0
In-Reply-To: <1552775231-12318-1-git-send-email-michel.stempin@wanadoo.fr>
References: <1552775231-12318-1-git-send-email-michel.stempin@wanadoo.fr>
Message-ID: <1552775830-13211-1-git-send-email-michel.stempin@wanadoo.fr>
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

v1 --> v2 Fixed typo in comment line

Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
---
 package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash | 2 +-
 package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
index 0f34e51..d0cbc09 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
@@ -1,2 +1,2 @@
 # From http://lists.x.org/archives/xorg-announce/2013-September/002324.html
-sha256	9dd4b326498223abbfdf786089a46ea3db4fa6bbd341308eb48a9e00bc3fd51b	xf86-video-fbdev-0.4.4.tar.bz2
+sha256	dcc3d85f378022180e437a9ec00a59b6cb7680ff79c40394d695060af2374699	xf86-video-fbdev-0.5.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index f39311e..a480bef 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.4.4
+XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.5.0
 XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_FBDEV_LICENSE = MIT
-- 
2.7.4
