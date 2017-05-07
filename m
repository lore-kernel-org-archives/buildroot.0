From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  7 May 2017 14:23:24 +0200
Subject: [Buildroot] [PATCH] package/ltp-testsuite: needs threads NPTL
Message-ID: <20170507122324.31452-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/3e0/3e0bbf41e339e62422463773bf07945f048a9501

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/ltp-testsuite/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 5309107..a7d3e58 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	# does not build, cachectl.h issue
 	depends on !BR2_nios2
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://linux-test-project.github.io
 
-comment "ltp-testsuite needs a glibc or uClibc toolchain w/ threads"
+comment "ltp-testsuite needs a glibc or uClibc toolchain w/ NPTL"
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_USES_MUSL
-- 
2.9.3
