From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 21:26:16 +0200
Subject: [Buildroot] [git commit] support/testing/tests/fs/test_ext: specify
 16 MB as ext filesystem size
Message-ID: <20210626194801.D37C5812F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78c42cdca2679a9237003c27e7018b56e5e8e568
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Qemu 5.1, the SD card size must be a power of two, so the
default size for ext2/3/4 filesystem images of 60 MB is not
suitable. Since 16 MB is used for the Ext4 test, let's use the same
value for the other tests as well (ext2, ext2r1, ext3). Without this
change, the ext2, ext2r1 and ext3 simply fail to run under Qemu >=
5.1.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_ext.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 16b308cf6d..0fe8af7e6d 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -43,6 +43,7 @@ class TestExt2(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_2r0=y
         BR2_TARGET_ROOTFS_EXT2_LABEL="foobaz"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
@@ -62,6 +63,7 @@ class TestExt2r1(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_2r1=y
         BR2_TARGET_ROOTFS_EXT2_LABEL="foobar"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
@@ -81,6 +83,7 @@ class TestExt3(infra.basetest.BRTest):
         """
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_3=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
