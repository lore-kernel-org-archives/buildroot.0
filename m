From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Sep 2011 21:46:31 +0200
Subject: [Buildroot] [PATCH] rtai: hide the config option.
In-Reply-To: <201109222137.11568.arnout@mind.be>
References: <201109222137.11568.arnout@mind.be>
Message-ID: <1316720791-12031-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
