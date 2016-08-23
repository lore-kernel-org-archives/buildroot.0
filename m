From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Aug 2016 18:26:33 +0200
Subject: [Buildroot] [PATCH 2/4] package/mesa3d: also implements the EGL
	wayland extensions
In-Reply-To: <cover.1471968455.git.yann.morin.1998@free.fr>
References: <cover.1471968455.git.yann.morin.1998@free.fr>
Message-ID: <a6dd254fa13434e0efa98ddc1679db306549be98.1471968455.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d implements the EGL extensions for wayland. State so.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 45ca69c..6f60ee1 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -150,6 +150,7 @@ comment "Additional API Support"
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
 	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	help
 	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL applications
 	  similar to GLX, for X, and WGL, for Windows.
-- 
2.7.4
