Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4736AC4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0454F6129F;
	Mon,  6 Nov 2023 19:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0454F6129F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SaDurhsoTNtR; Mon,  6 Nov 2023 19:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A4761288;
	Mon,  6 Nov 2023 19:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25A4761288
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD0F51BF29F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86787829FD
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86787829FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTn84ijhRvGX for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81E95829B6
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81E95829B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64A96869A6; Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 20:43:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a81c7a7a4629cc009b05195c9b4e37a582287ea
X-Git-Newrev: 49db37ae5aa5dff53aeea74803970d758a8a0daa
X-Patchwork-Hint: ignore
Message-Id: <20231106194413.64A96869A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_firewalld.py: new test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49db37ae5aa5dff53aeea74803970d758a8a0daa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test case runs firewalld using both system and sysvinit.

run `firewalld-cmd --state` and ensure the output is "running" with a return
code of 0.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                      |   1 +
 support/testing/tests/package/test_firewalld.py | 102 ++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ac277423a1..145e73199c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
new file mode 100644
index 0000000000..700337f637
--- /dev/null
+++ b/support/testing/tests/package/test_firewalld.py
@@ -0,0 +1,102 @@
+"""Test firewalld for both systemd and sysvinit."""
+import os
+import time
+import infra.basetest
+
+
+class TestFirewalldSystemd(infra.basetest.BRTest):
+    """Build the kernel as firewalld requires several the nftable options."""
+
+    config = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_INIT_SYSTEMD=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.61"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_FIREWALLD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7",
+                           kernel=kernel_file,
+                           kernel_cmdline=["console=ttyAMA0,115200"],
+                           options=[
+                               "-initrd", cpio_file,
+                               "-dtb", dtb_file,
+                               "-M", "vexpress-a9"
+                           ])
+        # It takes quite some time for the system to boot with firewalld,
+        self.emulator.login(timeout=120)
+
+        # It may take some time for firewalld to finish startup.
+        # Give it at least 15 seconds.
+        is_active = False
+        for i in range(15):
+            output, _ = self.emulator.run("systemctl is-active firewalld")
+            if output[0] == "active":
+                is_active = True
+                break
+            time.sleep(1)
+        if not is_active:
+            self.fail("firewalld failed to activate!")
+
+        cmd = "firewall-cmd --state"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertIn("running", output[0])
+        self.assertEqual(exit_code, 0)
+
+
+class TestFirewalldSysVInit(infra.basetest.BRTest):
+    """Build the kernel as firewalld requires several nftable options."""
+
+    config = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.61"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_FIREWALLD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7",
+                           kernel=kernel_file,
+                           kernel_cmdline=["console=ttyAMA0,115200"],
+                           options=[
+                               "-initrd", cpio_file,
+                               "-dtb", dtb_file,
+                               "-M", "vexpress-a9"
+                           ])
+        # It takes quite some time for the system to boot with firewalld.
+        self.emulator.login(timeout=120)
+        cmd = "firewall-cmd --state"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertIn("running", output[0])
+        self.assertEqual(exit_code, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
