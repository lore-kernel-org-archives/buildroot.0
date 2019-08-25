From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 Aug 2019 07:30:32 +0300
Subject: [Buildroot] [PATCH] package/strace: disable for riscv32
Message-ID: <a565abc48c0ed293fb0b1fffd6a847408f559528.1566707432.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

strace does not support riscv32 yet.

https://lists.strace.io/pipermail/strace-devel/2019-August/009068.html

Fixes:
http://autobuild.buildroot.net/results/912776cc1da1719806058516a2cc2a47c8dbad9b/

Cc: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 38b4ebe32a4b..5b33dad39245 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_STRACE
 	bool "strace"
 	# needs at least kernel headers 4.0 on nios2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
-	depends on !BR2_nds32
+	depends on !BR2_nds32 && !BR2_RISCV_32
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
-- 
2.23.0.rc1
