From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 28 Nov 2015 14:33:42 -0200
Subject: [Buildroot] [PATCH] libtirpc: add dependency on atomic operations
Message-ID: <1448728422-24462-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/9e6c3c701e09007860bf842f1877142ea20cbb55
http://autobuild.buildroot.net/results/dce2b68429734dbd63bab0bf75593b9dc44a5e42
http://autobuild.buildroot.net/results/9a13d40e7cc54a632b1a4063e7e9fcea5402c368

And many more.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/libtirpc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 2e9c939fa815..a7dfaf79db08 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBTIRPC
 	bool "libtirpc"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  Libtirpc is a port of Sun's Transport-Independent RPC
 	  library to Linux.
@@ -8,4 +9,5 @@ config BR2_PACKAGE_LIBTIRPC
 	  http://sourceforge.net/projects/libtirpc/
 
 comment "libtirpc needs a toolchain w/ threads"
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
