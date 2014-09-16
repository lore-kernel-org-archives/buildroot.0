From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 16 Sep 2014 16:58:38 +0100
Subject: [Buildroot] [PATCH] mesa3d: Add missing dependencies
Message-ID: <1410883118-57489-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add xcb-dri3, xcb-present and xshmfence to mesa3d's dependencies.
Otherwise it will fail during the configure phase.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mesa3d/Config.in | 3 +++
 package/mesa3d/mesa3d.mk | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 74ebbed..c362467 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -3,11 +3,14 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XPROTO_DRI3PROTO if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f986d0e..f5a274a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -28,11 +28,14 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
 	xproto_xf86driproto \
 	xproto_dri2proto \
+	xproto_dri3proto \
+	xproto_presentproto \
 	xproto_glproto \
 	xlib_libX11 \
 	xlib_libXext \
 	xlib_libXdamage \
 	xlib_libXfixes \
+	xlib_libxshmfence \
 	libxcb
 MESA3D_CONF_OPT += --enable-glx
 # quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
-- 
1.9.0
