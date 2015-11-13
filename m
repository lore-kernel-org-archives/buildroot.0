From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Nov 2015 00:26:43 +0100
Subject: [Buildroot] [PATCH/next 13/13]
	package/x11r7/xdriver_xf86-video-ati: bump version to 7.6.1
In-Reply-To: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
References: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1447457203-27816-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package now needs O_CLOEXEC, which needs #define __USE_GNU with
uClibc.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/0001-cloexec.patch | 17 +++++++++++++++++
 .../xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash  |  4 ++--
 .../xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk    |  2 +-
 3 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-ati/0001-cloexec.patch

diff --git a/package/x11r7/xdriver_xf86-video-ati/0001-cloexec.patch b/package/x11r7/xdriver_xf86-video-ati/0001-cloexec.patch
new file mode 100644
index 0000000..64dd163
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-ati/0001-cloexec.patch
@@ -0,0 +1,17 @@
+Enable usage of O_CLOEXEC.
+
+O_CLOEXEC needs #define __USE_GNU with uClibc.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr xf86-video-ati-7.6.1.org/src/radeon_dri3.c xf86-video-ati-7.6.1/src/radeon_dri3.c
+--- xf86-video-ati-7.6.1.org/src/radeon_dri3.c	2015-11-12 03:57:33.000000000 +0100
++++ xf86-video-ati-7.6.1/src/radeon_dri3.c	2015-11-13 23:50:50.000000000 +0100
+@@ -36,6 +36,7 @@
+ 
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#define __USE_GNU
+ #include <fcntl.h>
+ #include <errno.h>
+ 
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index ccb8665..a9974c7 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2014-October/002486.html
-sha256	ec3e6f06b6cf9a40c72aafa3448aae8b034c80b37410ca9442d5cf6806e07936	xf86-video-ati-7.5.0.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-November/002658.html
+sha256	2516d9eeb8da8bcd3a01365ed1314919777910fa904ab268af342b5693e1d34c	xf86-video-ati-7.6.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index cba9e76..e00134e 100644
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
-- 
2.6.2
