From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:50:30 +0200
Subject: [Buildroot] [git commit] package/vte: needs host gcc >= 4.8
Message-ID: <20190811210019.EDC397FFAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5cb3cceeb43419a474be6667494618dc1051e97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 we need host gcc >= 4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vte/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/vte/Config.in b/package/vte/Config.in
index fa29de8c71..5710ee9e0f 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_VTE
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # libgtk3 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
@@ -21,11 +22,12 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
