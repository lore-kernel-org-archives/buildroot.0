From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jun 2021 15:13:03 +0200
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.0.5
Message-ID: <20210626124228.F1B0B7FD27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78f477d1367a3f1a557d5d780051e4163c4aa3e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As this version brings support for kernel up to 5.12, we update the
test cases to use the 5.12 kernel.

Signed-off-by: Jos?? Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zfs/zfs.hash                      | 4 ++--
 package/zfs/zfs.mk                        | 2 +-
 support/testing/tests/package/test_zfs.py | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 5a0c43d366..7f4f5a59f8 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# Locally calculated
-sha256  7d1344c5433b91823f02c2e40b33d181fa6faf286bea5591f4b1965f23d45f6c  zfs-2.0.4.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.0.5/zfs-2.0.5.sha256.asc
+sha256  3a17498d704ebf4c5d7231660f6fb44ae07a1545519f567452a4270851a86ec9  zfs-2.0.5.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index c8e33a7b1a..3b1afb419a 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.0.4
+ZFS_VERSION = 2.0.5
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_LICENSE = CDDL
 ZFS_LICENSE_FILES = LICENSE COPYRIGHT
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index e5f5526faf..772a66c1e4 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -13,7 +13,7 @@ class TestZfsGlibc(infra.basetest.BRTest):
         BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.23"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.13"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_PACKAGE_ZFS=y
@@ -70,7 +70,7 @@ class TestZfsUclibc(infra.basetest.BRTest):
         BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.23"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.13"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_PACKAGE_ZFS=y
