From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 18 May 2021 13:21:53 -0500
Subject: [Buildroot] [PATCH 1/3] support/scripts/pkg-stats: fix flake8 E741
 ambiguous variable name
Message-ID: <20210518182155.47055-1-matthew.weber@collins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
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
-- 
2.17.1
