From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 16:38:34 +0200
Subject: [Buildroot] [git commit] libgtk3: wayland backend requires headers
	>= 3.17
Message-ID: <20160329143836.A25CB8081F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed89302f9ea55ff71e0e4b79063667a774a4416e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed by Thomas, fixes:
http://autobuild.buildroot.org/results/473/473fb2f416311ee8a8a8719e3fb3689d9226f451/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
