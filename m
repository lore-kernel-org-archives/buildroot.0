From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 27 Dec 2019 14:17:04 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/strace: drop default in Config.in
Message-ID: <20191227131704.540027-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d52e98655fb6b00606ffe5294051ff0581c464bf wrongly sets a default
value for strace so drop it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Drop default

 package/strace/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index d286ec0793..5b33dad392 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_STRACE
 	# needs at least kernel headers 4.0 on nios2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
 	depends on !BR2_nds32 && !BR2_RISCV_32
-	default n
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
-- 
2.24.0
