From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:53:56 +0200
Subject: [Buildroot] [git commit] support/testing: remove references to
	host/usr
Message-ID: <20170705145153.06FF881EE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8367d388d4d581f12d33e882aef21af6977a2ef9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tools are now installed in host/bin instead of host/usr/bin.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/fs/test_ext.py      | 2 +-
 support/testing/tests/fs/test_jffs2.py    | 2 +-
 support/testing/tests/fs/test_squashfs.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index ea3d3f1..34321a3 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -13,7 +13,7 @@ RESBLKCNT_PROP = "Reserved block count"
 CHECK_FS_TYPE_CMD = "mount | grep '/dev/root on / type {}'"
 
 def dumpe2fs_run(builddir, image):
-    cmd = ["host/usr/sbin/dumpe2fs", os.path.join("images", image)]
+    cmd = ["host/sbin/dumpe2fs", os.path.join("images", image)]
     ret = subprocess.check_output(cmd,
                                   stderr=open(os.devnull, "w"),
                                   cwd=builddir,
diff --git a/support/testing/tests/fs/test_jffs2.py b/support/testing/tests/fs/test_jffs2.py
index 0d45af2..7185df7 100644
--- a/support/testing/tests/fs/test_jffs2.py
+++ b/support/testing/tests/fs/test_jffs2.py
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x4000000
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.jffs2")
-        out = subprocess.check_output(["host/usr/sbin/jffs2dump", "-c", img],
+        out = subprocess.check_output(["host/sbin/jffs2dump", "-c", img],
                                       cwd=self.builddir,
                                       env={"LANG": "C"})
         out = out.splitlines()
diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index edaa087..b205b6a 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_SQUASHFS4_LZ4=y
 """
 
     def test_run(self):
-        unsquashfs_cmd = ["host/usr/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
+        unsquashfs_cmd = ["host/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
         out = subprocess.check_output(unsquashfs_cmd,
                                       cwd=self.builddir,
                                       env={"LANG": "C"})
