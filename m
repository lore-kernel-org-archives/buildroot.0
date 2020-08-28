From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:42:04 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/scripts/pkg-stats: store pkg dir path
Message-ID: <20200828155253.BCFA4811FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c981078735fb1d0cc0e6a11c97d3f5d71106333
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This value can be used for later processing.

In the buildroot-stats application this is used to create links pointing
to the git repo of buildroot.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d31fadfbf53a4e8c36c3fc4bb4b16c9dfd3e93e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
