From: Lothar Felten <lothar.felten@gmail.com>
Date: Fri, 20 Oct 2017 13:19:17 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in: fix help comment for gcc
	optimization
Message-ID: <1508498357-4257-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default for is set to BR2_OPTIMIZE_S, the help comment designated
BR2_OPTIMIZE_0 as default.
Changed the help comment to show that BR2_OPTIMIZE_S is the default.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 814dc02..9bdb0b8 100644
--- a/Config.in
+++ b/Config.in
@@ -458,7 +458,7 @@ choice
 config BR2_OPTIMIZE_0
 	bool "optimization level 0"
 	help
-	  Do not optimize. This is the default.
+	  Do not optimize.
 
 config BR2_OPTIMIZE_1
 	bool "optimization level 1"
@@ -525,6 +525,7 @@ config BR2_OPTIMIZE_S
 	  -falign-loops -falign-labels -freorder-blocks
 	  -freorder-blocks-and-partition -fprefetch-loop-arrays
 	  -ftree-vect-loop-version
+	  This is the default.
 
 endchoice
 
-- 
1.9.1
