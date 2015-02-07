From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 Feb 2015 14:53:23 +0100
Subject: [Buildroot] [PATCH 07/11 v7] package/mesa3d: remove suprefluous
	dependency on udev
In-Reply-To: <cover.1423317174.git.yann.morin.1998@free.fr>
References: <cover.1423317174.git.yann.morin.1998@free.fr>
Message-ID: <3735b54894259955c88e24980abd7783ecd8c4f9.1423317174.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d itself depends on udev, so there is not need to repeat that
dependency for its sub-options.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c407ece..fa04579 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -119,12 +119,8 @@ if BR2_PACKAGE_MESA3D_DRIVER
 
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
-- 
1.9.1
