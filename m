From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  1 Aug 2019 08:16:41 +0530
Subject: [Buildroot] [PATCH v4 28/30] autobuild-run: define different output
 directory for reproducible builds
In-Reply-To: <20190801024643.11024-1-itsatharva@gmail.com>
References: <20190801024643.11024-1-itsatharva@gmail.com>
Message-ID: <20190801024643.11024-29-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having different output directories will increase variance. Subsequent
patches will modify other parts of the scripts to use this directory.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v3:
  - New patch
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 7c05234..a96840f 100755
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
