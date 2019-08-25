From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Aug 2019 08:51:05 +0200
Subject: [Buildroot] [git commit] package/strace: disable for riscv32
Message-ID: <20190825064839.ED9ED8471C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2604f55093738aed926ecca2ae356db90a47b589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

strace does not support riscv32 yet.

https://lists.strace.io/pipermail/strace-devel/2019-August/009068.html

Fixes:
http://autobuild.buildroot.net/results/912776cc1da1719806058516a2cc2a47c8dbad9b/

Cc: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 38b4ebe32a..5b33dad392 100644
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
