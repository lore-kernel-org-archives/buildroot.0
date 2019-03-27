From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 10:47:49 +0100
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/x11r7/xdriver_xf86-video-fbdev: bump to version 0.5.0
Message-ID: <20190327094452.7746882592@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25e5c401fa3b1082653e0313b9f7bbeac1a06533
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Starting X manually resulted in a symbol error:
| Xorg: symbol lookup error: /usr/lib/xorg/modules/drivers/fbdev_drv.so: undefined symbol: shadowUpdatePackedWeak

This bug was reported against the fbdev driver, which is fixed
upstream in 0.5.0:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=900317

Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 904750363141935dc6b1143aaa1de21742df474a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash | 2 +-
 package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
index 0f34e5178e..d0cbc09038 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
@@ -1,2 +1,2 @@
 # From http://lists.x.org/archives/xorg-announce/2013-September/002324.html
-sha256	9dd4b326498223abbfdf786089a46ea3db4fa6bbd341308eb48a9e00bc3fd51b	xf86-video-fbdev-0.4.4.tar.bz2
+sha256	dcc3d85f378022180e437a9ec00a59b6cb7680ff79c40394d695060af2374699	xf86-video-fbdev-0.5.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index f39311e611..a480befdd0 100644
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
