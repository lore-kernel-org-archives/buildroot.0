From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 13:48:21 +0200
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats: use
 parenthesis for print
Message-ID: <20180519114829.C5DAC883DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb04235783abe58a6a7f8ecc8f9ab46a6d03b543
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use Python 3 style print calls, in order to make pkg-stats Python 3
compliant.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 43f7e8d543..b7b00e8634 100755
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
 
 
