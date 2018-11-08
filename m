From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 22:41:53 +0100
Subject: [Buildroot] [git commit] support/testing/tests/fs/test_f2fs: fix
 flake8 warning
Message-ID: <20181108213927.17B2B81E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bff6b61adf36e7b96f0d775f94d963789f57c3a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the following flake8 warnings:

support/testing/tests/fs/test_f2fs.py:6:1: E302 expected 2 blank lines, found 1
support/testing/tests/fs/test_f2fs.py:12:1: E302 expected 2 blank lines, found 1
support/testing/tests/fs/test_f2fs.py:38:23: E225 missing whitespace around operator

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/fs/test_f2fs.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index 9f7c393cdc..819c619a36 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -3,12 +3,14 @@ import subprocess
 
 import infra.basetest
 
+
 def dumpf2fs_getprop(out, prop):
     for line in out:
         fields = line.split(" = ")
         if fields[0] == prop:
             return fields[1].strip()
 
+
 class TestF2FS(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -35,8 +37,8 @@ class TestF2FS(infra.basetest.BRTest):
         self.assertEqual(prop, "262144 (128 MB)")
 
         kernel = os.path.join(self.builddir, "images", "zImage")
-        kernel_cmdline=["root=/dev/mmcblk0", "rootfstype=f2fs",
-                        "console=ttyAMA0"]
+        kernel_cmdline = ["root=/dev/mmcblk0", "rootfstype=f2fs",
+                          "console=ttyAMA0"]
         dtb = infra.download(self.downloaddir, "vexpress-v2p-ca9.dtb")
         options = ["-M", "vexpress-a9", "-dtb", dtb,
                    "-drive", "file={},if=sd,format=raw".format(img)]
