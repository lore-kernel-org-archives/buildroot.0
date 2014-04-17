From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 18:04:18 +0200
Subject: [Buildroot] [PATCH 06/14] package/mesa3d: add comment for when
	OpenGL EGL is not available
In-Reply-To: <cover.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <ab1521643e86676427c7021cfb10178eb7a3df3e.1397750571.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

OpenGL EGL needs udev support, so add a comment stating so.

Also, reword the OpenGL EGL prompt to be in the same format as the
OpenGL ES prompt (and like the full OpenGL prompt that will shortly
be added, too.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/mesa3d/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 3a2766b..bd7a853 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -92,8 +92,11 @@ if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "Additional API Support"
 
+comment "OpenGL EGL needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
-	bool "EGL"
+	bool "OpenGL EGL"
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_HAS_LIBEGL
 	help
-- 
1.8.3.2
