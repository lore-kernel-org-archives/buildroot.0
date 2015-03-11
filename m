From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 11 Mar 2015 10:53:17 +0300
Subject: [Buildroot] [PATCH] graph-depends: remove absent targets from
	TARGET_EXCEPTIONS
Message-ID: <1426060397-4458-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most of targets listed in TARGET_EXCEPTIONS these days are long
gone, so why still keep them?

Most of those targets were removed in this commit:
http://git.buildroot.net/buildroot/commit/?id=02b88600312554bf166f6cfd71f7f2ede783096a

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/graph-depends | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 28fe2f0..5b9b195 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -186,17 +186,8 @@ def pkg_node_name(pkg):
     return pkg.replace("-","")
 
 TARGET_EXCEPTIONS = [
-    "target-generic-securetty",
-    "target-generic-issue",
-    "target-generic-getty-busybox",
-    "target-generic-do-remount-rw",
-    "target-generic-dont-remount-rw",
     "target-finalize",
-    "erase-fakeroots",
-    "target-generic-hostname",
-    "target-root-passwd",
     "target-post-image",
-    "target-purgelocales",
 ]
 
 # In full mode, start with the result of get_targets() to get the main
-- 
2.1.0
