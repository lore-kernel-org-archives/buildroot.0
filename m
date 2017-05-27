From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 27 May 2017 23:58:46 +0200
Subject: [Buildroot] [PATH 1/2] support/testing: rename variables for
	readability
Message-ID: <1495922327-16174-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'lines' variable is overwritten with its own fields. Thus it
contains a line first, and then a list of fields -- it never contains
'lines'.

Use two different variables named 'line' and 'fields' to make the code
more readable.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/testing/tests/fs/test_ext.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index f7e2e85055e1..d35eea8bb5fa 100644
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
-- 
2.7.4
