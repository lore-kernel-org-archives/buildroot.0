From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon,  2 Mar 2020 15:50:13 +0100
Subject: [Buildroot] [PATCH v4 11/12] support/scripts/pkg-stats: add list of
 status checks to the json output
In-Reply-To: <20200302145013.9574-1-heiko.thiery@gmail.com>
References: <20200302145013.9574-1-heiko.thiery@gmail.com>
Message-ID: <20200302145013.9574-12-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4cf1a919f3..9d058ca67d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -88,6 +88,11 @@ class Package:
     all_license_files = dict()
     all_versions = dict()
     all_ignored_cves = dict()
+    # This is the list of all possible checks. Add new checks to this list so
+    # a tool that post-processeds the json output knows the checks before
+    # iterating over the packages.
+    status_checks = ['cve', 'developers', 'hash', 'hash-license', 'license',
+                     'license-files', 'patches', 'pkg-check', 'url', 'version']
 
     def __init__(self, name, path):
         self.name = name
@@ -981,6 +986,7 @@ def dump_json(packages, defconfigs, stats, date, commit, output):
     final = {'packages': pkgs,
              'stats': statistics,
              'defconfigs': defconfigs,
+             'package_status_checks': Package.status_checks,
              'commit': commit,
              'date': str(date)}
 
-- 
2.20.1
