From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 15 May 2013 16:04:35 +0200
Subject: [Buildroot] [git commit] graph-depends: ignore the
	'target-generic-dont-remount-rw' target
Message-ID: <20130515140651.CC6D09A214@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b193c1264a27f67dffb2a16cef637777cfa1996e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The graph-depends script tries to call 'make target-generic-dont-remount-rw',
which doesn't exist since 'target-generic-dont-remount-rw' is not a package.

See also the comments for commit 72bd61e5b8c2094378.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/graph-depends |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 180c81d..8d81969 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -164,6 +164,7 @@ TARGET_EXCEPTIONS = [
     "target-generic-issue",
     "target-generic-getty-busybox",
     "target-generic-do-remount-rw",
+    "target-generic-dont-remount-rw",
     "target-finalize",
     "erase-fakeroots",
     "target-generic-hostname",
