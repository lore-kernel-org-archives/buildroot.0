From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  1 Dec 2013 09:49:36 +0200
Subject: [Buildroot] [PATCH] strace: disable unsupported nios2 arch
Message-ID: <5d91abd4fbf94f38c58dc1788636e04682df632e.1385884176.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/88f330254a83fbc105a74e76df586672d2c369c4/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 0959ec5..ded51ba 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
-	depends on !BR2_arc
+	depends on !BR2_arc && !BR2_nios2
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
-- 
1.8.4.3
