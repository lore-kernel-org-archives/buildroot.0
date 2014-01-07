From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jan 2014 10:05:34 +0100
Subject: [Buildroot] [git commit] xorg: Bump xdriver_xf86-video-intel
	version to 2.99.907
Message-ID: <20140107090604.D21F49C3AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4da14cd16bc0bd66443b2def7bc486dfc953d117
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- enable sna support by default, disable unneeded stuff
  ported from OpenELEC:
  https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/x11/driver/xf86-video-intel/package.mk

[Peter: drop Xtst dependency]
Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-video-intel.mk                    |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 97fef99..332de54 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,13 +4,25 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.19.0
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.907
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = --enable-dri
+
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
+	--enable-dri \
+	--enable-kms-only \
+	--disable-xvmc \
+	--disable-ums-only \
+	--enable-sna \
+	--disable-uxa \
+	--disable-glamor \
+	--disable-xaa \
+	--disable-dga \
+	--disable-async-swap
+
 XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
 
 $(eval $(autotools-package))
