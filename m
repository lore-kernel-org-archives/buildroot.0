From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 Dec 2014 20:00:49 +0100
Subject: [Buildroot] [PATCH 1/1] xdriver_xf86-video-intel: Bump version to
	2.99.917
Message-ID: <1419361249-17674-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk   |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 801cdae..707cedd 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,12 +4,16 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.914
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.917
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
 
+# this fixes a getline-related compilation error in src/sna/kgem.c
+XDRIVER_XF86_VIDEO_INTEL_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS = \
 	--disable-xvmc \
 	--enable-sna \
-- 
1.7.10.4
