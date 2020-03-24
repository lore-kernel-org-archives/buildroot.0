From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 15:27:53 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8 E402
 warning
Message-ID: <20200324144153.05E708805D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=769f98c18c94d6d684bb2efc00239ce07a02d522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flake8 complains with:

pkg-stats:38:1: E402 module level import not at top of file

This is due to sys.path.append() being before the import from
getdeveloperlib, but we really need this sys.path.append() to be
before, so let's ignore this flake8 warning.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9cfb43928b..7b144a5ba6 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -36,7 +36,7 @@ from urllib3.exceptions import HTTPError
 from multiprocessing import Pool
 
 sys.path.append('utils/')
-from getdeveloperlib import parse_developers
+from getdeveloperlib import parse_developers  # noqa: E402
 
 NVD_START_YEAR = 2002
 NVD_JSON_VERSION = "1.0"
