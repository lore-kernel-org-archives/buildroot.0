From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jul 2017 19:37:14 +0200
Subject: [Buildroot] [git commit] support/tests: fix ext4 runtime test
Message-ID: <20170714173307.8D2618214E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3268968cccb5caa91849089a5ad3d15bbec59580
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current test fails because of a legacy option, renamed during the
recent ext overhaul.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/fs/test_ext.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 34321a3..0832ba4 100644
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
