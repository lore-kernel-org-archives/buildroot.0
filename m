From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 4 Jun 2016 22:53:47 +0200
Subject: [Buildroot] [PATCH] uclibc: the internal toolchain only uses
	uClibc-ng
Message-ID: <20160604205347.GA13841@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Point to the right website and tell the user the right name.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 toolchain/toolchain-buildroot/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 2b0ebc1..0cf632f 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -27,7 +27,7 @@ choice
 		|| BR2_microblaze || BR2_powerpc64
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
-	bool "uClibc"
+	bool "uClibc-ng"
 	select BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
 		   BR2_bfin    || BR2_i386   || BR2_m68k   || \
@@ -37,10 +37,10 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	# Unsupported for MIPS R6
 	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	help
-	  This option selects uClibc as the C library for the
+	  This option selects uClibc-ng as the C library for the
 	  cross-compilation toolchain.
 
-	  http://uclibc.org
+	  http://uclibc-ng.org
 
 config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	bool "glibc"
-- 
2.1.4
