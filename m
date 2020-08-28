From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:42:26 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/scripts/pkg-stats: add list of status checks to the json output
Message-ID: <20200828155253.E3224811FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c87a94ef873f1baaf9851298b8d27033ad42ef7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 759521dae60122771dd65e7ace9eb56d1eafc78e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
