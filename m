From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Sep 2015 13:41:21 +0300
Subject: [Buildroot] [PATCH] ipmiutil: needs dynamic library support
Message-ID: <83a0afc5c996ee536aaae2e182eeae4393fd83e2.1443523281.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ipmiutil builds libipmiutil.so unconditionally.

Fixes:
http://autobuild.buildroot.net/results/e31/e31d94847cad9216aad839c2fbb312e9ea0ae75e/
http://autobuild.buildroot.net/results/5f3/5f3f32473186e6fa3a165b263f682047af8e291e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ipmiutil/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ipmiutil/Config.in b/package/ipmiutil/Config.in
index a2a898b5c5eb..9eb5452b6ce3 100644
--- a/package/ipmiutil/Config.in
+++ b/package/ipmiutil/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IPMIUTIL
 	bool "ipmiutil"
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_x86_64 || BR2_i386
 	help
@@ -11,7 +12,7 @@ config BR2_PACKAGE_IPMIUTIL
 
 	  http://ipmiutil.sourceforge.net/
 
-comment "ipmiutil needs a toolchain w/ threads"
+comment "ipmiutil needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_x86_64 || BR2_i386
-- 
2.5.3
