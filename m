From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jul 2011 14:16:35 +0200
Subject: [Buildroot] [git commit] libdrm: configure needs pkg-config
Message-ID: <20110725121732.F1D208B4A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=53f8882d445b8ce3fc2745c10f90d30cbb1384ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libdrm/libdrm.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index fe7a46f..f1d7c31 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -8,7 +8,14 @@ LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_INSTALL_STAGING = YES
 
-LIBDRM_DEPENDENCIES = xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xproto_dri2proto pthread-stubs
+LIBDRM_DEPENDENCIES = \
+	xproto_glproto \
+	xproto_xf86vidmodeproto \
+	xlib_libXxf86vm \
+	xlib_libXmu \
+	xproto_dri2proto \
+	pthread-stubs \
+	host-pkg-config
 
 ifeq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL),y)
 LIBDRM_CONF_OPT += --enable-intel
-- 
1.7.3.4
