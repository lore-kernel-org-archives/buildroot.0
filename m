From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 21:36:54 +0100
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats:
 store pkg dir path
Message-ID: <20200307204504.F34038FC5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d31fadfbf53a4e8c36c3fc4bb4b16c9dfd3e93e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This value can be used for later processing.

In the buildroot-stats application this is used to create links pointing
to the git repo of buildroot.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 0e7d60bdbb..016c2322e6 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -64,6 +64,7 @@ class Package:
     def __init__(self, name, path):
         self.name = name
         self.path = path
+        self.pkg_path = os.path.dirname(path)
         self.infras = None
         self.license = None
         self.has_license = False
