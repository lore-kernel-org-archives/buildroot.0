From: Atharva Lele <itsatharva@gmail.com>
Date: Sun,  7 Jul 2019 10:58:31 +0530
Subject: [Buildroot] [PATCH v3 31/31] autobuild-run: make prepare_build()
 clean the output directory used for reproducibility testing
In-Reply-To: <20190707052831.9469-1-itsatharva@gmail.com>
References: <20190707052831.9469-1-itsatharva@gmail.com>
Message-ID: <20190707052831.9469-31-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index cdf013c..3156e9d 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -380,6 +380,10 @@ class Builder:
             # shutil.rmtree doesn't remove write-protected files
             subprocess.call(["rm", "-rf", self.outputdir])
         os.mkdir(self.outputdir)
+
+        # If it exists, remove the other output directory used for reproducibility testing
+        if os.path.exists(self.outputdir_1):
+            subprocess.call(["rm", "-rf", self.outputdir_1])
         with open(os.path.join(self.outputdir, "branch"), "w") as branchf:
             branchf.write(branch)
 
-- 
2.22.0
