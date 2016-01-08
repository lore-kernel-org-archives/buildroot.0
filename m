From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Fri,  8 Jan 2016 11:24:48 +0100
Subject: [Buildroot] [PATCH] netsniff-ng: check if linux-headers are v3.0 or
	higher
Message-ID: <1452248688-31458-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/netsniff-ng/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index b39ec96..a2494a9 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_NETSNIFF_NG
 	# Build with uClibc fails due to missing ceill()
 	# Build with musl fails due to various header issues
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
@@ -17,9 +18,10 @@ config BR2_PACKAGE_NETSNIFF_NG
 	  networking toolkit. If you will, the Swiss army knife for
 	  network packets.
 
-comment "netsniff-ng needs an (e)glibc toolchain w/ threads"
+comment "netsniff-ng needs an (e)glibc toolchain w/ threads, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854
 
 comment "netsniff-ng needs a toolchain not affected by GCC bug 58854"
-- 
1.8.3.1
