From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 21:28:21 +0200
Subject: [Buildroot] [git commit] package/wpewebkit: needs gcc >= 6
Message-ID: <20190518192243.AE9F8887ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34cf14d0da3e4c1bc4664610a2e5213b6c9d551f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc requirement has been bumped from gcc 5 to gcc 6 since
https://trac.webkit.org/browser/webkit/trunk/CMakeLists.txt?rev=231152

Fixes:
 - http://autobuild.buildroot.org/results/304956dda8e580cb39107e57a139cd1ae08ee655

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 04ebe5452b..07a4fa0456 100644
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
 
 comment "wpewebkit needs an OpenGL ES w/ EGL backend"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
@@ -46,7 +46,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_USE_WCHAR # icu, libsoup
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
