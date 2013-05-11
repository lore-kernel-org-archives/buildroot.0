From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 May 2013 09:18:19 -0300
Subject: [Buildroot] [PATCH] strace: unavailable for AArch64 and ARC
Message-ID: <1368274699-417-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

strace isn't available for the AArch64 and ARC architectures.
The patchset for AArch64 is somewhat big and complicated (needs updates
to other bits) so it'd probably be better to use a git version of strace
or wait for a new release.
http://autobuild.buildroot.net/results/506f4adec348f0b616ad09bddbcbc242e38253b8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/strace/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 4b20377..153bcf6 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
-	depends on !BR2_xtensa
+	depends on !(BR2_xtensa || BR2_aarch64 || BR2_arc)
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
-- 
1.8.1.5
