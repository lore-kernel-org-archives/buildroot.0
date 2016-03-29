From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 10:12:46 -0300
Subject: [Buildroot] [PATCH] libgtk3: wayland backend requires headers >=
	3.17
Message-ID: <1459257166-21672-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed by Thomas, fixes:
http://autobuild.buildroot.org/results/473/473fb2f416311ee8a8a8719e3fb3689d9226f451/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk3/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 77ea394..39105ac 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -58,13 +58,15 @@ config BR2_PACKAGE_LIBGTK3_BROADWAY
 	  Then open a web browser at address http://192.168.0.1:8080.
 	  Javascript and web sockets should be enabled.
 
-comment "Wayland GDK backend needs an OpenGL EGL backend provided by mesa3d"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+comment "Wayland GDK backend needs an OpenGL EGL backend provided by mesa3d w/ headers >= 3.17"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 config BR2_PACKAGE_LIBGTK3_WAYLAND
 	bool "Wayland GDK backend"
 	default y
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_LIBXKBCOMMON
-- 
2.7.3
