From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Mar 2019 11:22:04 +0200
Subject: [Buildroot] [PATCH] package/nodejs: requires gcc 4.9
Message-ID: <73ae9f7e151366504087d518dbef2e357eb0606b.1552641724.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BUILDING.md lists gcc 4.9.4 or newer as build prerequisite. This is
needed for full C++11 support.

  https://github.com/nodejs/node/commit/d13a65ad68c429884434cdcd94c52b79a6d69717

Cc: Daniel Price <daniel.price@gmail.com>
Reported-by: Boris-Ben Shapiro <erectcrested@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nodejs/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index d2846f8d579d..ed6225b08efb 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -7,19 +7,19 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	# libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.8, wchar"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.9, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
+		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
-- 
2.20.1
