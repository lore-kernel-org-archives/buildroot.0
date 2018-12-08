From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 23:00:33 +0100
Subject: [Buildroot] [git commit] vte: needs gcc >= 4.8
Message-ID: <20181208215848.B4F448B3CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d076e27238b23a25a2125a423cf42afa288b250
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/6dada849a87b68f6f69e3ed760995e86dfa25ad6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vte/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/vte/Config.in b/package/vte/Config.in
index 7410624c0a..fa29de8c71 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_VTE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
@@ -20,11 +21,12 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a toolchain w/ wchar, threads, C++"
+comment "vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
 	depends on BR2_USE_MMU
