From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 21 Sep 2018 23:45:10 +0200
Subject: [Buildroot] [PATCH 1/1] blktrace: drop NPTL dependency
Message-ID: <20180921214510.29090-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
for non NPTL configurations.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/blktrace/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index d40c968243..86700fc0eb 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_BLKTRACE
 	bool "blktrace"
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	depends on BR2_USE_MMU # system()
 	select BR2_PACKAGE_LIBAIO
 	help
@@ -9,7 +8,3 @@ config BR2_PACKAGE_BLKTRACE
 	  up to user space.
 
 	  http://git.kernel.dk/?p=blktrace.git;a=summary
-
-comment "blktrace needs a toolchain w/ NPTL"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.17.1
