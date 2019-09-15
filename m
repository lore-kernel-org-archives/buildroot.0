From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 16:10:22 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: simplify Git
 commit id retrieval
Message-ID: <20190915141320.E69348E441@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffcd34af079d21f1430efa22faac034d68a3c3ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Baruch Siach, using "git rev-parse HEAD" is a lot
simpler than playing around with "git log" to just retrieve the commit
id corresponding to the current HEAD.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 6cb3a6a038..e477828f7b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -727,8 +727,8 @@ def __main__():
     else:
         package_list = None
     date = datetime.datetime.utcnow()
-    commit = subprocess.check_output(['git', 'log', 'HEAD', '-n', '1',
-                                      '--pretty=format:%H']).splitlines()[0]
+    commit = subprocess.check_output(['git', 'rev-parse',
+                                      'HEAD']).splitlines()[0]
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
     print("Getting package make info ...")
