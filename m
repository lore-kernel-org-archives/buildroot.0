From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:14:01 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-geode: Bump version to
	2.11.15
Message-ID: <20140329222158.5BE2D9C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b63bf9352872c8c197a7df1d00631167fa9c4314
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-geode-0001-include.patch    |   17 +++++++++++++++++
 .../xdriver_xf86-video-geode.mk                    |    2 +-
 2 files changed, 18 insertions(+), 1 deletions(-)

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
