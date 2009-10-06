From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Oct 2009 22:43:06 +0200
Subject: [Buildroot] [git commit master] default to EABI on arm
Message-ID: <20091006204458.3B80A77788@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=15a85fce2ac08df62ec02a48e36cb8bf37aece61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use of OABI is strongly discouraged since years now.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index e63fc02..e82c8f4 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -116,14 +116,17 @@ config BR2_ARM_TYPE
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
-	default BR2_ARM_OABI
+	default BR2_ARM_EABI
 	help
 	  Application Binary Interface to use
 
-config BR2_ARM_OABI
-	bool "OABI"
+	  Note:
+	    Using OABI is discouraged.
+
 config BR2_ARM_EABI
 	bool "EABI"
+config BR2_ARM_OABI
+	bool "OABI"
 endchoice
 
 choice
-- 
1.6.3.3
