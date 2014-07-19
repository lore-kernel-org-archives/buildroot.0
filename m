From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:23 +0200
Subject: [Buildroot] [PATCH 16/20 v3] package/mesa3d: depends on libudev,
	not udev
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <4dc783b1cf59ca5bd018dd1796af6c8aa6608c7a.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 6 +++---
 package/mesa3d/mesa3d.mk | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c1be9e3..0a37cb8 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -9,7 +9,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -125,6 +125,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif # BR2_PACKAGE_MESA3D
 
-comment "mesa3d needs udev /dev management and a toolchain w/ C++, largefile, NPTL"
+comment "mesa3d needs a toolchain w/ C++, largefile, NPTL"
 	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index de6b1de..13d7362 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -98,8 +98,8 @@ MESA3D_CONF_OPT += --enable-opengl
 
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
1.9.1
