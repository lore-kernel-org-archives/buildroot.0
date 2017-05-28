From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 14:54:43 +0200
Subject: [Buildroot] [git commit] support/testing: rename variables for
	readability
Message-ID: <20170528125452.461B58266F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad79bb50858aebd5296fbac981abd8b50b682ddf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'lines' variable is overwritten with its own fields. Thus it
contains a line first, and then a list of fields -- it never contains
'lines'.

Use two different variables named 'line' and 'fields' to make the code
more readable.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/fs/test_ext.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 545bf1e..ea3d3f1 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -21,10 +21,10 @@ def dumpe2fs_run(builddir, image):
     return ret.strip().splitlines()
 
 def dumpe2fs_getprop(out, prop):
-    for lines in out:
-        lines = lines.split(": ")
-        if lines[0] == prop:
-            return lines[1].strip()
+    for line in out:
+        fields = line.split(": ")
+        if fields[0] == prop:
+            return fields[1].strip()
 
 def boot_img_and_check_fs_type(emulator, builddir, fs_type):
     img = os.path.join(builddir, "images", "rootfs.{}".format(fs_type))
