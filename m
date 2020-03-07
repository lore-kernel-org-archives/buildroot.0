From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 21:38:26 +0100
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats: add
 list of status checks to the json output
Message-ID: <20200307204505.1BE0A8F5F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=759521dae60122771dd65e7ace9eb56d1eafc78e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 59b6f388bd..c0e2fbf413 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -88,6 +88,11 @@ class Package:
     all_license_files = list()
     all_versions = dict()
     all_ignored_cves = dict()
+    # This is the list of all possible checks. Add new checks to this list so
+    # a tool that post-processeds the json output knows the checks before
+    # iterating over the packages.
+    status_checks = ['cve', 'developers', 'hash', 'license',
+                     'license-files', 'patches', 'pkg-check', 'url', 'version']
 
     def __init__(self, name, path):
         self.name = name
@@ -972,6 +977,7 @@ def dump_json(packages, defconfigs, stats, date, commit, output):
     final = {'packages': pkgs,
              'stats': statistics,
              'defconfigs': defconfigs,
+             'package_status_checks': Package.status_checks,
              'commit': commit,
              'date': str(date)}
 
