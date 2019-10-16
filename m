From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 22:27:49 +0200
Subject: [Buildroot] [git commit] package/proj: needs wchar
Message-ID: <20191016202147.E8E8581401@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe3cbba5ba20bf5f9e75dd8b8a4fa993c939c39e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Propagate dependency also to libgeotiff

Fixes:
http://autobuild.buildroot.net/results/f8e/f8e261dd64346caeff568a23621b3dd15ac3967c/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgeotiff/Config.in | 6 ++++--
 package/proj/Config.in       | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
index 6ac8a51f7c..7ed296fb25 100644
--- a/package/libgeotiff/Config.in
+++ b/package/libgeotiff/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGEOTIFF
 	depends on BR2_INSTALL_LIBSTDCPP # proj
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # proj
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_PROJ
 	select BR2_PACKAGE_TIFF
 	help
@@ -11,6 +12,7 @@ config BR2_PACKAGE_LIBGEOTIFF
 
 	  https://github.com/OSGeo/libgeotiff
 
-comment "libgeotiff needs a toolchain w/ C++, gcc >= 4.7, threads"
+comment "libgeotiff needs a toolchain w/ C++, gcc >= 4.7, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/proj/Config.in b/package/proj/Config.in
index ced386f465..1952fc7d9a 100644
--- a/package/proj/Config.in
+++ b/package/proj/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PROJ
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_SQLITE
 	help
 	  proj.4 is a standard UNIX filter function which converts
@@ -13,6 +14,7 @@ config BR2_PACKAGE_PROJ
 
 	  http://proj4.org/
 
-comment "proj needs a toolchain w/ C++, gcc >= 4.7, threads"
+comment "proj needs a toolchain w/ C++, gcc >= 4.7, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
