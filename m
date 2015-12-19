From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Dec 2015 12:01:28 +0100
Subject: [Buildroot] [PATCH 08/12] package/x11r7/xdriver_xf86-video-ati:
	bump version to 7.6.1
In-Reply-To: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1450522892-14611-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash | 4 ++--
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk   | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index ccb8665..57ebfe8 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2014-October/002486.html
-sha256	ec3e6f06b6cf9a40c72aafa3448aae8b034c80b37410ca9442d5cf6806e07936	xf86-video-ati-7.5.0.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-November/002658.html
+sha256 2516d9eeb8da8bcd3a01365ed1314919777910fa904ab268af342b5693e1d34c        xf86-video-ati-7.6.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index cba9e76..3dd3d07 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 7.5.0
+XDRIVER_XF86_VIDEO_ATI_VERSION = 7.6.1
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
@@ -28,4 +28,7 @@ else
 XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --disable-glamor
 endif
 
+# xdriver_xf86-video-ati requires O_CLOEXEC
+XDRIVER_XF86_VIDEO_ATI_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
 $(eval $(autotools-package))
-- 
2.6.4
