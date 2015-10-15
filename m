From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Oct 2015 21:13:58 +0300
Subject: [Buildroot] [PATCH] ltp-testsuite: don't select libtirpc
Message-ID: <fb405c0a598411e1b44331de25bee78cc353a401.1444932838.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 8f1c4c49a2a (ltp-testsuite: don't link with libtirpc)
ltp-testsuite does not need libtirpc. Don't select it.

Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ltp-testsuite/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 91b09ce3fab3..978b8e3cbae1 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	# does not build, cachectl.h issue
 	depends on !BR2_nios2
 	help
-- 
2.6.1
