From: Atharva Lele <itsatharva@gmail.com>
Date: Sun,  7 Jul 2019 10:58:29 +0530
Subject: [Buildroot] [PATCH v3 29/31] autobuild-run: define different output
 directory for reproducible builds
In-Reply-To: <20190707052831.9469-1-itsatharva@gmail.com>
References: <20190707052831.9469-1-itsatharva@gmail.com>
Message-ID: <20190707052831.9469-29-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having different output directories will increase variance. Subsequent
patches will modify other parts of the scripts to use this directory.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 522421e..84212c6 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -278,6 +278,10 @@ class Builder:
         self.outputdir = os.path.abspath(os.path.join(self.idir, "output"))
         self.resultdir = os.path.join(self.outputdir, "results")
 
+        # We use a different output directory for more variance in reproducibility
+        # testing.
+        self.outputdir_1 = os.path.abspath(os.path.join(self.idir, "output-1"))
+
         if self.debug:
             self.log = sys.stdout
         else:
-- 
2.22.0
