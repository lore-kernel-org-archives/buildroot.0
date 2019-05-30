From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 30 May 2019 12:03:45 +0200
Subject: [Buildroot] [buildroot-test] autobuild-run: fix copy_if_exists()
Message-ID: <20190530100345.8275-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Under copy_if_exists() 'dir' variable is referenced as 'd' leading to
exception.

Substitute 'd' with 'dir' in copy_if_exists().

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 scripts/autobuild-run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 56bab25..5687ebd 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -489,8 +489,8 @@ def send_results(result, **kwargs):
                     os.path.join(resultdir, "branch"))
 
     def copy_if_exists(dir, src, dst=None):
-        if os.path.exists(os.path.join(outputdir, d, src)):
-            shutil.copyfile(os.path.join(outputdir, d, src),
+        if os.path.exists(os.path.join(outputdir, dir, src)):
+            shutil.copyfile(os.path.join(outputdir, dir, src),
                             os.path.join(resultdir, src if dst is None else dst))
 
     copy_if_exists("build", "build-time.log")
-- 
2.17.1
