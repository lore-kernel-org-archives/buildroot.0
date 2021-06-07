From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 23:18:55 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/waylandpp: add
 dependency to BR2_INSTALL_LIBSTDCPP
Message-ID: <20210607205546.6B20C8BE9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9aa474f25b752cc8cc6bbadfe433dba05dea6a8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998 at free.fr: propagate the dependency to kodi]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ac16bb646fb8790654d9ae35bda39b4946d552d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in      | 1 +
 package/waylandpp/Config.in | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ecc5a05324..72cdbabf89 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -35,6 +35,7 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GL
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
+	depends on BR2_INSTALL_LIBSTDCPP # waylandpp
 	depends on BR2_PACKAGE_WAYLAND # waylandpp
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
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
