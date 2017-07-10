From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jul 2017 23:45:31 +0200
Subject: [Buildroot] [PATCH] support/testing: fix TestExt4 after ext2fs
	refactoring
Message-ID: <20170710214531.15758-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit bee9e881a2d3addd6880b39f3e33a7180d0b1eb4 removed the
BR2_TARGET_ROOTFS_EXT2_BLOCKS but didn't update TestExt4 that uses
(tests) that option.

Convert it to BR2_TARGET_ROOTFS_EXT2_SIZE, using 16M so the M gets
tested as well.

Fixes: https://gitlab.com/arnout/buildroot/-/jobs/21910153

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/fs/test_ext.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 34321a3995..733c7469f2 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -97,7 +97,7 @@ class TestExt4(infra.basetest.BRTest):
 """
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=16384
+BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
 BR2_TARGET_ROOTFS_EXT2_INODES=3000
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=10
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.13.2
