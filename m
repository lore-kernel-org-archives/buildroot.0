From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  2 Oct 2011 00:32:37 +0200
Subject: [Buildroot] [PATCH] rtai: hide the config option.
Message-ID: <1317508357-9989-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle <arnout@mind.be>

The package is always selected by the RTAI kernel extension and it
also depends on it, so there is no point in allowing the user to
configure it.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/rtai/Config.in |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/package/rtai/Config.in b/package/rtai/Config.in
index ecbff38..68c06d4 100644
--- a/package/rtai/Config.in
+++ b/package/rtai/Config.in
@@ -1,7 +1,3 @@
 config BR2_PACKAGE_RTAI
-	bool "rtai"
+	bool
 	depends on BR2_LINUX_KERNEL_EXT_RTAI
-	help
-	  RTAI - the RealTime Application Interface for Linux.
-
-	  http://www.rtai.org
-- 
1.7.6.3
