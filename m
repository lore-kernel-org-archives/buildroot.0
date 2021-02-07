From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun,  7 Feb 2021 11:51:55 +0100
Subject: [Buildroot] [PATCH 2/2] package/cage: update dependencies to match
 wlroot's
In-Reply-To: <20210207105155.516654-1-gilles.talis@gmail.com>
References: <20210207105155.516654-1-gilles.talis@gmail.com>
Message-ID: <20210207105155.516654-2-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Olivain <ju.o@free.fr>

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/cage/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cage/Config.in b/package/cage/Config.in
index 3bef08f037..4f823c768c 100644
--- a/package/cage/Config.in
+++ b/package/cage/Config.in
@@ -1,6 +1,6 @@
-comment "cage needs udev, mesa3d w/ EGL and GLES support"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
-		!BR2_PACKAGE_MESA3D_OPENGL_ES || \
+comment "cage needs udev, EGL and OpenGL ES support"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_UDEV
 
 comment "cage needs a toolchain w/ threads, dynamic library"
@@ -11,9 +11,9 @@ config BR2_PACKAGE_CAGE
 	bool "cage"
 	depends on !BR2_STATIC_LIBS # wlroots
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
+	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
+	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # wlroots
-	depends on BR2_PACKAGE_MESA3D_OPENGL_ES # wlroots
 	select BR2_PACKAGE_WLROOTS
 	help
 	  Kiosk compositor for Wayland, which displays a single
-- 
2.25.1
