From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 18 May 2018 08:05:00 -0500
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: flake8 print()
 cleanup
Message-ID: <1526648700-15130-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 support/scripts/pkg-stats | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 43f7e8d..b7b00e8 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -499,17 +499,17 @@ def parse_args():
 def __main__():
     args = parse_args()
     if args.npackages and args.packages:
-        print "ERROR: -n and -p are mutually exclusive"
+        print("ERROR: -n and -p are mutually exclusive")
         sys.exit(1)
     if args.packages:
         package_list = args.packages.split(",")
     else:
         package_list = None
-    print "Build package list ..."
+    print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
-    print "Getting package make info ..."
+    print("Getting package make info ...")
     package_init_make_info()
-    print "Getting package details ..."
+    print("Getting package details ...")
     for pkg in packages:
         pkg.set_infra()
         pkg.set_license()
@@ -517,9 +517,9 @@ def __main__():
         pkg.set_patch_count()
         pkg.set_check_package_warnings()
         pkg.set_current_version()
-    print "Calculate stats"
+    print("Calculate stats")
     stats = calculate_stats(packages)
-    print "Write HTML"
+    print("Write HTML")
     dump_html(packages, stats, args.output)
 
 
-- 
1.9.1
