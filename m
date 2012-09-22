From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 20:45:54 +0200
Subject: [Buildroot] [git commit] libdrm: bump version
Message-ID: <20120922194145.5724E9969B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42a8064763379c3fd172e3f75e4e4a9182867424
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Allan W. Nielsen.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libdrm/libdrm.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 6bd65f9..76ee763 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -3,7 +3,7 @@
 # libdrm
 #
 #############################################################
-LIBDRM_VERSION = 2.4.19
+LIBDRM_VERSION = 2.4.23
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_INSTALL_STAGING = YES
@@ -28,4 +28,11 @@ ifneq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI),y)
 LIBDRM_CONF_OPT += --disable-radeon
 endif
 
+ifeq ($(BR2_PACKAGE_UDEV),y)
+LIBDRM_CONF_OPT += --enable-udev
+LIBDRM_DEPENDENCIES += udev
+else
+LIBDRM_CONF_OPT += --disable-udev
+endif
+
 $(eval $(autotools-package))
