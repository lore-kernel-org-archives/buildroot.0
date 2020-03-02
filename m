From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon,  2 Mar 2020 15:50:06 +0100
Subject: [Buildroot] [PATCH v4 04/12] support/scripts/pkg-stats: store
 licences of package
In-Reply-To: <20200302145013.9574-1-heiko.thiery@gmail.com>
References: <20200302145013.9574-1-heiko.thiery@gmail.com>
Message-ID: <20200302145013.9574-5-heiko.thiery@gmail.com>
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
index c40fe61d9e..b0ee4f3bac 100755
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
-- 
2.20.1
