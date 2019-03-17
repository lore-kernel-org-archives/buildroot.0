From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Mar 2019 08:58:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/stella: needs gcc >= 5
Message-ID: <20190317075807.11337-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

std::put_time needs gcc 5.x:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54354

Fixes:
 - http://autobuild.buildroot.org/results/cf5bd2f262b108e4b90b6e31e46c5f82b9aef0a0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stella/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stella/Config.in b/package/stella/Config.in
index 639b9e4ae7..326b3f75eb 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_STELLA
 	depends on !BR2_STATIC_LIBS # sdl2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_ZLIB
@@ -12,7 +12,7 @@ config BR2_PACKAGE_STELLA
 
 	  https://stella-emu.github.io/
 
-comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 4.9"
+comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 5"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-- 
2.14.1
