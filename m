From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  5 Jan 2020 10:23:24 +0100
Subject: [Buildroot] [PATCH v2 2/8] support/scripts/pkg-stats: store patch
 files for the package
In-Reply-To: <20200105092329.6288-1-heiko.thiery@gmail.com>
References: <20200105092329.6288-1-heiko.thiery@gmail.com>
Message-ID: <20200105092329.6288-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 support/scripts/pkg-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8c64993aaf..6e250556e9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -56,6 +56,7 @@ class Package:
         self.has_license_files = False
         self.has_hash = False
         self.patch_count = 0
+        self.patch_files = []
         self.warnings = 0
         self.current_version = None
         self.url = None
@@ -121,10 +122,10 @@ class Package:
         """
         Fills in the .patch_count field
         """
-        self.patch_count = 0
         pkgdir = os.path.dirname(self.path)
         for subdir, _, _ in os.walk(pkgdir):
-            self.patch_count += len(fnmatch.filter(os.listdir(subdir), '*.patch'))
+            self.patch_files = fnmatch.filter(os.listdir(subdir), '*.patch')
+            self.patch_count = len(self.patch_files)
 
     def set_current_version(self):
         """
-- 
2.20.1
