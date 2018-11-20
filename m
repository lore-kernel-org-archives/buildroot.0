From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Nov 2018 09:01:08 +0100
Subject: [Buildroot] [git commit] support/testing/test_rust: use standard
 defconfig fragment style
Message-ID: <20181202071556.C29958843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adec30e4f0abc12ec5ca0b2710e4b0e3be867e83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit "2927f412be support/testing: standardize defconfig
fragments style" all other test cases use the same style for defconfig
fragments:
 - start after a backslash;
 - be declared as a multi-line string literal;
 - be indented one level more than the variable that contains it.

Do the same here for consistency.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_rust.py | 78 +++++++++++++++---------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 2dc814f99d..9854c3692e 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -57,25 +57,25 @@ class TestRustBase(infra.basetest.BRTest):
 
 class TestRustBin(TestRustBase):
     config = \
-             """
-             BR2_arm=y
-             BR2_cortex_a9=y
-             BR2_ARM_ENABLE_NEON=y
-             BR2_ARM_ENABLE_VFP=y
-             BR2_TOOLCHAIN_EXTERNAL=y
-             BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-             BR2_SYSTEM_DHCP="eth0"
-             BR2_LINUX_KERNEL=y
-             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-             BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
-             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-             BR2_LINUX_KERNEL_DTS_SUPPORT=y
-             BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
-             BR2_TARGET_ROOTFS_CPIO=y
-             # BR2_TARGET_ROOTFS_TAR is not set
-             BR2_PACKAGE_HOST_CARGO=y
-             BR2_PACKAGE_HOST_RUSTC=y
-             """
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_HOST_CARGO=y
+        BR2_PACKAGE_HOST_RUSTC=y
+        """
 
     def test_run(self):
         self.build_test_prog()
@@ -86,26 +86,26 @@ class TestRustBin(TestRustBase):
 
 class TestRust(TestRustBase):
     config = \
-             """
-             BR2_arm=y
-             BR2_cortex_a9=y
-             BR2_ARM_ENABLE_NEON=y
-             BR2_ARM_ENABLE_VFP=y
-             BR2_TOOLCHAIN_EXTERNAL=y
-             BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-             BR2_SYSTEM_DHCP="eth0"
-             BR2_LINUX_KERNEL=y
-             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-             BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
-             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-             BR2_LINUX_KERNEL_DTS_SUPPORT=y
-             BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
-             BR2_TARGET_ROOTFS_CPIO=y
-             # BR2_TARGET_ROOTFS_TAR is not set
-             BR2_PACKAGE_HOST_CARGO=y
-             BR2_PACKAGE_HOST_RUSTC=y
-             BR2_PACKAGE_HOST_RUST=y
-             """
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_HOST_CARGO=y
+        BR2_PACKAGE_HOST_RUSTC=y
+        BR2_PACKAGE_HOST_RUST=y
+        """
 
     def test_run(self):
         self.build_test_prog()
