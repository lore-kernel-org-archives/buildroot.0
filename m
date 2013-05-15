From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 15 May 2013 10:11:02 +0200
Subject: [Buildroot] [PATCH 1/2] graph-depends: ignore the
	'target-generic-dont-remount-rw' target
Message-ID: <1368605463-20677-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The graph-depends script tries to call 'make target-generic-dont-remount-rw',
which doesn't exist since 'target-generic-dont-remount-rw' is not a package.

See also the comments for commit 72bd61e5b8c2094378.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---

I guess we could compute the TARGET_EXCEPTIONS automatically and avoid the
need to update it every time. But it would be a longer work, so for now I
would just fix it manually.

 support/scripts/graph-depends |    1 +
 1 file changed, 1 insertion(+)

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
-- 
1.7.10.4
