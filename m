From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  6 Dec 2020 07:39:26 +0100
Subject: [Buildroot] [PATCH] package/quickjs: depends on gcc 4.9 at least
Message-ID: <20201206063926.625756-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix build http://autobuild.buildroot.org/results/d45/d456eefffd138a714e367f9520adb662f5e0f57e/
missing include <stdatomic.h>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/quickjs/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index ee53744bd..886cbd4db 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QUICKJS
 	depends on !BR2_STATIC_LIBS
 	# No way to check for fenv support.
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_USE_MMU # fork()
 	help
 	  QuickJS is a small and embeddable Javascript engine.
@@ -11,6 +12,6 @@ config BR2_PACKAGE_QUICKJS
 
 	  https://bellard.org/quickjs/
 
-comment "quickjs needs a glibc or musl toolchain w/ dynamic library"
+comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.27.0
