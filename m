From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 01:02:40 +0200
Subject: [Buildroot] [PATCH 16/20 RFC] package/mesa3d: depends on libudev,
	not udev
In-Reply-To: <cover.1402699915.git.yann.morin.1998@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <e623bd3fd72faf81d9f1bace6f97ad7c75dd39ed.1402699915.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 2 +-
 package/mesa3d/mesa3d.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e698b3e..d912db5 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -10,7 +10,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XSERVER_XORG_SERVER
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1a61af8..ca35eb9 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -93,8 +93,8 @@ MESA3D_CONF_OPT += --enable-opengl
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
-# egl depends on gbm, gbm depends on udev
-MESA3D_DEPENDENCIES += udev
+# egl depends on gbm, gbm depends on libudev
+MESA3D_DEPENDENCIES += libudev
 MESA3D_EGL_PLATFORMS = drm
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland
-- 
1.8.3.2
