From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Jun 2014 14:31:12 +0200
Subject: [Buildroot] [PATCH v12 12/32] mesa3d: add dependency
	xproto_presentproto
In-Reply-To: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402144292-27837-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in |    1 +
 package/mesa3d/mesa3d.mk |    1 +
 2 files changed, 2 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index b645712..0bea798 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -4,6 +4,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_HOST_LIBXML2_PYTHON
 	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8685cb8..1604dbc 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -30,6 +30,7 @@ MESA3D_DEPENDENCIES += \
 	xproto_xf86driproto \
 	xproto_dri2proto \
 	xproto_glproto \
+	xproto_presentproto \
 	xlib_libX11 \
 	xlib_libXext \
 	xlib_libXdamage \
-- 
1.7.10.4
