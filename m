From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Sep 2014 18:05:30 +0200
Subject: [Buildroot] [PATCH 2/2] sq: package/mesa3d: depends on libudev,
	not udev
In-Reply-To: <1410019530-2060-1-git-send-email-bernd.kuhls@t-online.de>
References: <1410019530-2060-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1410019530-2060-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 6711025..058219f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -97,12 +97,8 @@ if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "Additional API Support"
 
-comment "OpenGL EGL needs udev /dev management"
-	depends on !BR2_PACKAGE_HAS_UDEV
-
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
-	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_HAS_LIBEGL
 	help
 	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL applications
@@ -125,6 +121,7 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif # BR2_PACKAGE_MESA3D
 
-comment "mesa3d needs a toolchain w/ C++, largefile, NPTL"
+comment "mesa3d needs a toolchain w/ C++, largefile, NPTL, udev"
 	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_PACKAGE_HAS_LIBUDEV
-- 
1.7.10.4
