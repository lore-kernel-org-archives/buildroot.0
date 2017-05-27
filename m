From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 27 May 2017 23:58:47 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: fs/ext: add a negative
	test for the "extent" feature
In-Reply-To: <1495922327-16174-1-git-send-email-luca@lucaceresoli.net>
References: <1495922327-16174-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1495922327-16174-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We only have a positive test for it, in ext4. Let's have a negative
one as well.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/testing/tests/fs/test_ext.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index d35eea8bb5fa..ea3d3f11d7e7 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -86,6 +86,7 @@ BR2_TARGET_ROOTFS_EXT2_3=y
         out = dumpe2fs_run(self.builddir, "rootfs.ext3")
         self.assertEqual(dumpe2fs_getprop(out, REVISION_PROP), "1 (dynamic)")
         self.assertIn("has_journal", dumpe2fs_getprop(out, FEATURES_PROP))
+        self.assertNotIn("extent", dumpe2fs_getprop(out, FEATURES_PROP))
 
         exit_code = boot_img_and_check_fs_type(self.emulator,
                                                self.builddir, "ext3")
-- 
2.7.4
