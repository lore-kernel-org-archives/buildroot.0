From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Jul 2017 17:32:53 +0200
Subject: [Buildroot] [PATCH] support/tests: fix ext4 runtime test
Message-ID: <20170714153253.25551-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current test fails because of a legacy option, renamed during the
recent ext overhaul.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/fs/test_ext.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 34321a3995..0832ba4ce2 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -97,7 +97,7 @@ class TestExt4(infra.basetest.BRTest):
 """
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=16384
+BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
 BR2_TARGET_ROOTFS_EXT2_INODES=3000
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=10
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.11.0
