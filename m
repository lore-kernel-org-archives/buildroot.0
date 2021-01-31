From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 12:03:00 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: drop unused
 cpeid_name() function
Message-ID: <20210131104322.9BC5481025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cad5a69f8326c00b10f24872e4616a5238644d1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cpeid_name() function is not used anywhere, drop it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ef181a8813..66d612ee7b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1059,13 +1059,6 @@ def parse_args():
     return args
 
 
-def cpeid_name(pkg):
-    try:
-        return pkg.cpeid.split(':')[1]
-    except Exception:  # cpeid may be None, or improperly formatted
-        return ''
-
-
 def __main__():
     global cvecheck
 
