From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:26 +0100
Subject: [Buildroot] [PATCH 22/91] xdriver_xf86-video-geode: Bump version to
	2.11.15
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP4479C7E5CA1FCF1821D105D9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../xdriver_xf86-video-geode-0001-include.patch       |   17 +++++++++++++++++
 .../xdriver_xf86-video-geode.mk                       |    2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode-0001-include.patch

diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode-0001-include.patch b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode-0001-include.patch
new file mode 100644
index 0000000..e38424a
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode-0001-include.patch
@@ -0,0 +1,17 @@
+taken from upstream to fix FTBFS on xserver 1.15 and up
+http://cgit.freedesktop.org/xorg/driver/xf86-video-geode/commit/?id=9707a7a5eac25536a5150fc12d9ace52420b4d36
+http://cgit.freedesktop.org/xorg/driver/xf86-video-geode/commit/?id=70b131d09b7d21df1d1ffcf6a4e50d3086924228
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff -uNr xf86-video-geode-2.11.15.org/src/geode_dcon.c xf86-video-geode-2.11.15/src/geode_dcon.c
+--- xf86-video-geode-2.11.15.org/src/geode_dcon.c	2013-10-09 13:47:09.000000000 +0200
++++ xf86-video-geode-2.11.15/src/geode_dcon.c	2014-03-29 12:33:46.718311451 +0100
+@@ -29,6 +29,7 @@
+ 
+ /* Includes that are used by all drivers */
+ #include <xf86.h>
++#include <xf86Modes.h>
+ #include <xf86_OSproc.h>
+ #include <compiler.h>
+ 
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index 7c7feb2..c2bff37 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.13
+XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.15
 XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_LICENSE = MIT
-- 
1.7.10.4
