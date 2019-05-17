From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 17 May 2019 15:25:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: needs gcc >= 6
Message-ID: <20190517132528.13269-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc requirement has been bumped from gcc 5 to gcc 6 since
https://trac.webkit.org/browser/webkit/trunk/CMakeLists.txt?rev=231152

Fixes:
 - http://autobuild.buildroot.org/results/304956dda8e580cb39107e57a139cd1ae08ee655

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wpewebkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 15db924829..39f64c4e54 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -28,12 +28,12 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS_JIT
 	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R2
 	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R5
 
-comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.8, host gcc >= 4.8"
+comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 6, host gcc >= 4.8"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_6 || !BR2_HOST_GCC_AT_LEAST_4_8
 
 comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
@@ -47,7 +47,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_USE_WCHAR # icu, libsoup
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
-- 
2.20.1
