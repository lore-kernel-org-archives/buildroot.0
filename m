From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu,  1 Aug 2019 17:12:43 +0200
Subject: [Buildroot] [PATCH v3] support/scripts/pkg-stats: fix flake8 issues
Message-ID: <20190801151244.32281-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - blank space before ':'
 - unused 'o' variable left from a previous patch
 - bad continuous alignment

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 support/scripts/pkg-stats | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index f759d2de7b..225c19e1ab 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -248,7 +248,7 @@ def package_init_make_info():
             pkgvar = pkgvar[:-8]
             Package.all_licenses.append(pkgvar)
 
-        elif pkgvar.endswith("_LICENSE_FILES") :
+        elif pkgvar.endswith("_LICENSE_FILES"):
             if pkgvar.endswith("_MANIFEST_LICENSE_FILES"):
                 continue
             pkgvar = pkgvar[:-14]
@@ -691,7 +691,6 @@ def dump_json(packages, stats, date, commit, output):
     }
     statistics['infra'] = {k[6:]: v for k, v in stats.items() if k.startswith('infra-')}
     # The actual structure to dump, add commit and date to it
-    o = subprocess.check_output(["git", "log", "master", "-n", "1", "--pretty=format:%H"])
     final = {'packages': pkgs,
              'stats': statistics,
              'commit': commit,
@@ -711,9 +710,9 @@ def parse_args():
                         help='JSON output file')
     packages = parser.add_mutually_exclusive_group()
     packages.add_argument('-n', dest='npackages', type=int, action='store',
-                        help='Number of packages')
+                          help='Number of packages')
     packages.add_argument('-p', dest='packages', action='store',
-                        help='List of packages (comma separated)')
+                          help='List of packages (comma separated)')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
-- 
2.21.0
