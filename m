From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Mar 2013 19:59:21 +0100
Subject: [Buildroot] [PATCH] graph-depends: ignore the 'target-post-image'
	target
Message-ID: <1362509961-27574-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the introduction of the post-image mechanism, the graph-depends
script is broken: it tries to call 'make
target-post-image-show-depends', which doesn't exist since
'target-post-image' is not a package.

So we should simply ignore this 'target-post-image'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 1163d79..180c81d 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -168,6 +168,7 @@ TARGET_EXCEPTIONS = [
     "erase-fakeroots",
     "target-generic-hostname",
     "target-root-passwd",
+    "target-post-image",
 ]
 
 # In full mode, start with the result of get_targets() to get the main
-- 
1.7.9.5
