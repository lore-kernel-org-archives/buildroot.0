From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  5 Dec 2020 07:44:42 +0100
Subject: [Buildroot] [PATCH 2/2] package/quickjs: depends on glibc
In-Reply-To: <20201205064442.606683-1-francois.perrad@gadz.org>
References: <20201205064442.606683-1-francois.perrad@gadz.org>
Message-ID: <20201205064442.606683-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix build http://autobuild.buildroot.org/results/d45/d456eefffd138a714e367f9520adb662f5e0f57e/
missing include <stdatomic.h>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/quickjs/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index ee53744bd..91b8bf8dd 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_QUICKJS
 	bool "quickjs"
 	depends on !BR2_STATIC_LIBS
 	# No way to check for fenv support.
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_USE_MMU # fork()
 	help
 	  QuickJS is a small and embeddable Javascript engine.
@@ -11,6 +11,6 @@ config BR2_PACKAGE_QUICKJS
 
 	  https://bellard.org/quickjs/
 
-comment "quickjs needs a glibc or musl toolchain w/ dynamic library"
+comment "quickjs needs a glibc toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.27.0
