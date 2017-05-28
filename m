From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 14:48:08 +0200
Subject: [Buildroot] [git commit] support/testing: fs/ext: add a negative
	test for the "extent" feature
Message-ID: <20170528124817.BB59782765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfecdfadc1c980e3bb6dc86101b3b932a0969017
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We only have a positive test for it, in ext4. Let's have a negative
one as well.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/fs/test_ext.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index f7e2e85..545bf1e 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -86,6 +86,7 @@ BR2_TARGET_ROOTFS_EXT2_3=y
         out = dumpe2fs_run(self.builddir, "rootfs.ext3")
         self.assertEqual(dumpe2fs_getprop(out, REVISION_PROP), "1 (dynamic)")
         self.assertIn("has_journal", dumpe2fs_getprop(out, FEATURES_PROP))
+        self.assertNotIn("extent", dumpe2fs_getprop(out, FEATURES_PROP))
 
         exit_code = boot_img_and_check_fs_type(self.emulator,
                                                self.builddir, "ext3")
