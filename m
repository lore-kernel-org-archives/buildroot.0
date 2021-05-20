From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 May 2021 11:24:54 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 support/scripts/pkg-stats: fix flake8 E741 ambiguous variable name
Message-ID: <20210520090953.A589A886C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec2b44efbfc4b6945145e6e34cefddcef0248bcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c2ebfe7d78f999ff2201a4d9b59cc8c0efe85218)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 6f3ddc561f..44ed44482d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -375,9 +375,9 @@ def package_init_make_info():
     variable_list = [x[5:] for x in variable_list if x.startswith("HOST_")] + \
                     [x for x in variable_list if not x.startswith("HOST_")]
 
-    for l in variable_list:
+    for item in variable_list:
         # Get variable name and value
-        pkgvar, value = l.split("=")
+        pkgvar, value = item.split("=")
 
         # Strip the suffix according to the variable
         if pkgvar.endswith("_LICENSE"):
