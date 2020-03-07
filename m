From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 21:36:17 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: store licences
 of package
Message-ID: <20200309140909.AD5258894D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b7278e5f14f2bae4e120a42a7608723c1309a7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index e34841fc7c..9529ad5c6a 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -56,7 +56,7 @@ http_pool = None
 
 
 class Package:
-    all_licenses = list()
+    all_licenses = dict()
     all_license_files = list()
     all_versions = dict()
     all_ignored_cves = dict()
@@ -65,6 +65,7 @@ class Package:
         self.name = name
         self.path = path
         self.infras = None
+        self.license = None
         self.has_license = False
         self.has_license_files = False
         self.has_hash = False
@@ -125,6 +126,7 @@ class Package:
         var = self.pkgvar()
         if var in self.all_licenses:
             self.has_license = True
+            self.license = self.all_licenses[var]
         if var in self.all_license_files:
             self.has_license_files = True
 
@@ -387,7 +389,7 @@ def package_init_make_info():
             if value == "unknown":
                 continue
             pkgvar = pkgvar[:-8]
-            Package.all_licenses.append(pkgvar)
+            Package.all_licenses[pkgvar] = value
 
         elif pkgvar.endswith("_LICENSE_FILES"):
             if pkgvar.endswith("_MANIFEST_LICENSE_FILES"):
