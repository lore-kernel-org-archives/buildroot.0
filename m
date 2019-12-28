From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Dec 2019 12:29:38 +0100
Subject: [Buildroot] [git commit] package/strace: drop default in Config.in
Message-ID: <20191228112021.B44588E474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29e464a1ea6bb683c3a0acc2999ffeb54aff158b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d52e98655fb6b00606ffe5294051ff0581c464bf wrongly sets a default
value for strace so drop it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
