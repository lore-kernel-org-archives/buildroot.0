Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E950CA0EC0
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D30F4038E;
	Thu,  7 Aug 2025 17:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94O9fMwmRt7H; Thu,  7 Aug 2025 17:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 242A840410
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 242A840410;
	Thu,  7 Aug 2025 17:01:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 036A331
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88A0580BFD
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYaXNqaFZ38s for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAE5A80BD8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAE5A80BD8
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C813882AE0; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5de1dce0169bb16c9982a526dd554f2b774d0eff
X-Git-Newrev: 4ba6742ef4284ea8fadf094ddcc7ce907a84662f
X-Patchwork-Hint: ignore
Message-Id: <20250807170021.C813882AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_xen: add a base class
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3769935799860684545=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3769935799860684545==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4ba6742ef4284ea8fadf094ddcc7ce907a84662f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

In preparation of adding a test for Xen on 32-bit Arm v7:
- Introduce an architecture-agnostic TestXenBase class where we move
  most of the Xen test scenario and bits of the configuration.
- Re-organise the test_xen/ folder with the architecture-agnostic files
  under common/ and the 64-bit Arm specific files under aarch64/.

Make the 64-bit Arm TestXen class inherit from the base class and leave
in there only the architecture-specific parts:
- The 64-bit Arm configuration bits.
- The test function, which passes the proper 64-bit Arm simulator
  options to the generic test function.

No functional change intended.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a6f0d33c878b33b4706032381e3c24521e7fd0d4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_xen.py          | 85 +++++++++++++---------
 .../package/test_xen/{ => aarch64}/genimage.cfg    |  0
 .../package/test_xen/{ => aarch64}/linux.config    |  0
 .../{ => aarch64}/overlay/etc/xen/dom1.cfg         |  0
 .../package/test_xen/{ => aarch64}/post-image.sh   |  0
 .../tests/package/test_xen/{ => aarch64}/xen.cfg   |  0
 .../{ => common}/overlay/etc/init.d/S99custom      |  0
 .../{ => common}/overlay/etc/profile.d/stty-raw.sh |  0
 .../package/test_xen/{ => common}/post-build.sh    |  0
 9 files changed, 52 insertions(+), 33 deletions(-)

diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
index e5eaf3c115..44425a1f26 100644
--- a/support/testing/tests/package/test_xen.py
+++ b/support/testing/tests/package/test_xen.py
@@ -3,25 +3,19 @@ import pexpect
 import infra.basetest
 
 
-class TestXen(infra.basetest.BRTest):
-    # We have a custom kernel config to reduce build time.
-    # Our genimage.cfg is inspired from qemu_aarch64_ebbr_defconfig as we boot
-    # Xen with UEFI. We run only in the initramfs; this allows to use a single
-    # ramdisk image for both the host and the guest.
-    # The Xen startup scripts need bash.
-    config = \
+class TestXenBase(infra.basetest.BRTest):
+    """A class to test Xen for multiple architectures."""
+
+    # We run only in the initramfs; this allows to use a single ramdisk image
+    # for both the host and the guest.
+    base_config = \
         """
-        BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_ROOTFS_OVERLAY="support/testing/tests/package/test_xen/overlay"
-        BR2_ROOTFS_POST_BUILD_SCRIPT="support/testing/tests/package/test_xen/post-build.sh"
-        BR2_ROOTFS_POST_IMAGE_SCRIPT="support/testing/tests/package/test_xen/post-image.sh support/scripts/genimage.sh"
-        BR2_ROOTFS_POST_SCRIPT_ARGS="-c support/testing/tests/package/test_xen/genimage.cfg"
+        BR2_ROOTFS_POST_BUILD_SCRIPT="support/testing/tests/package/test_xen/common/post-build.sh"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="support/testing/tests/package/test_xen/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_XEN=y
         BR2_PACKAGE_XEN_HYPERVISOR=y
@@ -32,7 +26,6 @@ class TestXen(infra.basetest.BRTest):
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
         BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
-        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm64"
         BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
         BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -51,26 +44,14 @@ class TestXen(infra.basetest.BRTest):
         num_vm = len(out) - 1
         self.assertEqual(num_vm, x, f"Expected {x} VM(s) but found {num_vm}")
 
-    def test_run(self):
-        uboot_bin = os.path.join(self.builddir, "images", "u-boot.bin")
-        disk_img = os.path.join(self.builddir, "images", "disk.img")
-
-        # We need to run Qemu with virtualization to run Xen.
-        qemu_opts = [
-            "-bios", uboot_bin,
-            "-cpu", "cortex-a53",
-            "-device", "virtio-blk-device,drive=hd0",
-            "-drive", f"file={disk_img},if=none,format=raw,id=hd0",
-            "-m", "1G",
-            "-machine", "virt,gic-version=3,virtualization=on,acpi=off",
-            "-smp", "2"
-        ]
+    def run_xen_test(self, arch: str, options: list[str]) -> None:
+        """This functions tests Xen for multiple architectures.
+        The arch and options parameters are passed to the emulator.
+        """
 
-        # Boot the emulator:
-        # Qemu Devicetree -> U-Boot -> Xen UEFI -> Linux
-        # We need to boot Xen in UEFI to read xen.cfg; we use U-Boot as our
-        # UEFI firmware.
-        self.emulator.boot(arch="aarch64", options=qemu_opts)
+        # Boot the emulator.
+        # The system should automatically boot Xen and a Dom0.
+        self.emulator.boot(arch=arch, options=options)
         self.emulator.login()
 
         # Verify that we are indeed running under Xen.
@@ -106,3 +87,41 @@ class TestXen(infra.basetest.BRTest):
 
         # Check that we have two VMs running.
         self.assertNumVM(2)
+
+
+class TestXen(TestXenBase):
+    # Test Xen on 64b Arm.
+    # Boot flow: Qemu Devicetree -> U-Boot -> Xen UEFI -> Linux
+    # We need to boot Xen in UEFI to read xen.cfg.
+    # We use U-Boot as our UEFI firmware.
+    # We have a custom kernel config to reduce build time.
+    # Our genimage.cfg is inspired from qemu_aarch64_ebbr_defconfig as we boot
+    # Xen with UEFI.
+    config = TestXenBase.base_config + \
+        """
+        BR2_aarch64=y
+        BR2_ROOTFS_OVERLAY="support/testing/tests/package/test_xen/common/overlay \
+                            support/testing/tests/package/test_xen/aarch64/overlay"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="support/testing/tests/package/test_xen/aarch64/post-image.sh support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c support/testing/tests/package/test_xen/aarch64/genimage.cfg"
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="support/testing/tests/package/test_xen/aarch64/linux.config"
+        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm64"
+        """
+
+    def test_run(self):
+        uboot_bin = os.path.join(self.builddir, "images", "u-boot.bin")
+        disk_img = os.path.join(self.builddir, "images", "disk.img")
+
+        # We need to run Qemu with virtualization to run Xen.
+        qemu_opts = [
+            "-bios", uboot_bin,
+            "-cpu", "cortex-a53",
+            "-device", "virtio-blk-device,drive=hd0",
+            "-drive", f"file={disk_img},if=none,format=raw,id=hd0",
+            "-m", "1G",
+            "-machine", "virt,gic-version=3,virtualization=on,acpi=off",
+            "-smp", "2"
+        ]
+
+        # Run Xen test.
+        self.run_xen_test(arch="aarch64", options=qemu_opts)
diff --git a/support/testing/tests/package/test_xen/genimage.cfg b/support/testing/tests/package/test_xen/aarch64/genimage.cfg
similarity index 100%
rename from support/testing/tests/package/test_xen/genimage.cfg
rename to support/testing/tests/package/test_xen/aarch64/genimage.cfg
diff --git a/support/testing/tests/package/test_xen/linux.config b/support/testing/tests/package/test_xen/aarch64/linux.config
similarity index 100%
rename from support/testing/tests/package/test_xen/linux.config
rename to support/testing/tests/package/test_xen/aarch64/linux.config
diff --git a/support/testing/tests/package/test_xen/overlay/etc/xen/dom1.cfg b/support/testing/tests/package/test_xen/aarch64/overlay/etc/xen/dom1.cfg
similarity index 100%
rename from support/testing/tests/package/test_xen/overlay/etc/xen/dom1.cfg
rename to support/testing/tests/package/test_xen/aarch64/overlay/etc/xen/dom1.cfg
diff --git a/support/testing/tests/package/test_xen/post-image.sh b/support/testing/tests/package/test_xen/aarch64/post-image.sh
similarity index 100%
rename from support/testing/tests/package/test_xen/post-image.sh
rename to support/testing/tests/package/test_xen/aarch64/post-image.sh
diff --git a/support/testing/tests/package/test_xen/xen.cfg b/support/testing/tests/package/test_xen/aarch64/xen.cfg
similarity index 100%
rename from support/testing/tests/package/test_xen/xen.cfg
rename to support/testing/tests/package/test_xen/aarch64/xen.cfg
diff --git a/support/testing/tests/package/test_xen/overlay/etc/init.d/S99custom b/support/testing/tests/package/test_xen/common/overlay/etc/init.d/S99custom
similarity index 100%
rename from support/testing/tests/package/test_xen/overlay/etc/init.d/S99custom
rename to support/testing/tests/package/test_xen/common/overlay/etc/init.d/S99custom
diff --git a/support/testing/tests/package/test_xen/overlay/etc/profile.d/stty-raw.sh b/support/testing/tests/package/test_xen/common/overlay/etc/profile.d/stty-raw.sh
similarity index 100%
rename from support/testing/tests/package/test_xen/overlay/etc/profile.d/stty-raw.sh
rename to support/testing/tests/package/test_xen/common/overlay/etc/profile.d/stty-raw.sh
diff --git a/support/testing/tests/package/test_xen/post-build.sh b/support/testing/tests/package/test_xen/common/post-build.sh
similarity index 100%
rename from support/testing/tests/package/test_xen/post-build.sh
rename to support/testing/tests/package/test_xen/common/post-build.sh

--===============3769935799860684545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3769935799860684545==--
