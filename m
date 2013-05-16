From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 16 May 2013 04:46:04 -0400
Subject: [Buildroot] [PATCH] graph-depends: ignore the 'target-purgelocales'
	target (v2)
Message-ID: <1368693964-5410-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise, graph-depends tries to call 'make target-purgelocales-show-depends',
which does not exist, as 'target-purgelocales' is not an actual package.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---
v2: Fix misspelling in commit log
---
 support/scripts/graph-depends |    1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 790e24e..50b8670 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -170,6 +170,7 @@ TARGET_EXCEPTIONS = [
     "target-generic-hostname",
     "target-root-passwd",
     "target-post-image",
+    "target-purgelocales",
 ]
 
 # In full mode, start with the result of get_targets() to get the main
-- 
1.7.9.5
