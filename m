From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 21:06:12 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8 E741
 ambiguous variable name
Message-ID: <20210518183744.1AFF987C1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2ebfe7d78f999ff2201a4d9b59cc8c0efe85218
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c7e30dfd2b..0cd3674c52 100755
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
