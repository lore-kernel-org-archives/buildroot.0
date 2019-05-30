From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 30 May 2019 12:33:05 +0200
Subject: [Buildroot] [PATCH v2] autobuild-run: fix copy_if_exists()
Message-ID: <20190530103305.37919-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Under copy_if_exists() 'dir' variable is referenced as 'd' leading to
exception.

Substitute 'd' and 'dir' with 'directory' in copy_if_exists(), since
'dir' is a keyword in Python.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes:
V1->V2: change 'dir' and 'd' into 'directory'

 scripts/autobuild-run | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 56bab25..8d58a83 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -488,9 +488,9 @@ def send_results(result, **kwargs):
     shutil.copyfile(os.path.join(outputdir, "branch"),
                     os.path.join(resultdir, "branch"))
 
-    def copy_if_exists(dir, src, dst=None):
-        if os.path.exists(os.path.join(outputdir, d, src)):
-            shutil.copyfile(os.path.join(outputdir, d, src),
+    def copy_if_exists(directory, src, dst=None):
+        if os.path.exists(os.path.join(outputdir, directory, src)):
+            shutil.copyfile(os.path.join(outputdir, directory, src),
                             os.path.join(resultdir, src if dst is None else dst))
 
     copy_if_exists("build", "build-time.log")
-- 
2.17.1
