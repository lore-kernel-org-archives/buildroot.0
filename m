From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 21 May 2021 11:14:04 +0200
Subject: [Buildroot] [PATCH] package/waylandpp: add dependency to
 BR2_INSTALL_LIBSTDCPP
Message-ID: <20210521091403.29209-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/waylandpp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
index 3d7362b3c0..86ca965056 100644
--- a/package/waylandpp/Config.in
+++ b/package/waylandpp/Config.in
@@ -3,14 +3,16 @@ config BR2_PACKAGE_WAYLANDPP
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_WAYLAND
 	help
 	  Wayland C++ bindings
 
 	  https://github.com/NilsBrause/waylandpp
 
-comment "waylandpp needs an OpenGL-EGL/wayland backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
+comment "waylandpp needs an OpenGL-EGL/wayland backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9, C++ support"
 	depends on BR2_PACKAGE_WAYLAND
 	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		!BR2_HOST_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_INSTALL_LIBSTDCPP
-- 
2.30.0
