From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Dec 2019 23:37:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/strace: move default in Config.in
Message-ID: <20191226223726.265446-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d52e98655fb6b00606ffe5294051ff0581c464bf set a default after
"depends on", move it before to fix make check-package

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strace/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index d286ec0793..a7db186a40 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
+	default n
 	# needs at least kernel headers 4.0 on nios2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
 	depends on !BR2_nds32 && !BR2_RISCV_32
-	default n
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
-- 
2.24.0
