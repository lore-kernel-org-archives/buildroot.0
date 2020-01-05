From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  5 Jan 2020 10:23:26 +0100
Subject: [Buildroot] [PATCH v2 4/8] support/scripts/pkg-stats: store
 licences of package
In-Reply-To: <20200105092329.6288-1-heiko.thiery@gmail.com>
References: <20200105092329.6288-1-heiko.thiery@gmail.com>
Message-ID: <20200105092329.6288-5-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 43d14785a1..c10eb79a08 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -48,7 +48,7 @@ http_pool = None
 
 
 class Package:
-    all_licenses = list()
+    all_licenses = dict()
     all_license_files = list()
     all_versions = dict()
 
@@ -56,6 +56,7 @@ class Package:
         self.name = name
         self.path = path
         self.infras = None
+        self.license = None
         self.has_license = False
         self.has_license_files = False
         self.has_hash = False
@@ -112,6 +113,7 @@ class Package:
         var = self.pkgvar()
         if var in self.all_licenses:
             self.has_license = True
+            self.license = self.all_licenses[var]
         if var in self.all_license_files:
             self.has_license_files = True
 
@@ -261,7 +263,7 @@ def package_init_make_info():
             if value == "unknown":
                 continue
             pkgvar = pkgvar[:-8]
-            Package.all_licenses.append(pkgvar)
+            Package.all_licenses[pkgvar] = value
 
         elif pkgvar.endswith("_LICENSE_FILES"):
             if pkgvar.endswith("_MANIFEST_LICENSE_FILES"):
-- 
2.20.1
