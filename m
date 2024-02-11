Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58A2C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F62B4058D;
	Sun, 11 Feb 2024 15:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31Z8J8l60ZgR; Sun, 11 Feb 2024 15:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF0240492
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EF0240492;
	Sun, 11 Feb 2024 15:12:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B620B1BF403
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1119403CA
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YB9YPm1UnfB for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 798874025D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 798874025D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F8558755A; Sun, 11 Feb 2024 15:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:11:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cee6b6be6524e443012d130e09b0e6983b0ff90
X-Git-Newrev: 74ffd0a4df3f321b5d5ac6b14b52174b3e7ef2de
X-Patchwork-Hint: ignore
Message-Id: <20240211151227.6F8558755A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add jailhouse runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=74ffd0a4df3f321b5d5ac6b14b52174b3e7ef2de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                      |   1 +
 support/testing/tests/package/test_jailhouse.py | 103 ++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c035eeb8f..d7947821e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1792,6 +1792,7 @@ F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iperf3.py
+F:	support/testing/tests/package/test_jailhouse.py
 F:	support/testing/tests/package/test_jq.py
 F:	support/testing/tests/package/test_jq/
 F:	support/testing/tests/package/test_kexec.py
diff --git a/support/testing/tests/package/test_jailhouse.py b/support/testing/tests/package/test_jailhouse.py
new file mode 100644
index 0000000000..4634fc4de2
--- /dev/null
+++ b/support/testing/tests/package/test_jailhouse.py
@@ -0,0 +1,103 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestJailhouse(infra.basetest.BRTest):
+    # This test uses a specific configuration, mainly for matching the
+    # requirements of the Jailhouse Qemu inmate demo. We also use the
+    # Linux kernel from Siemens, which includes patches for
+    # Jailhouse. Finally, we use the kernel config from
+    # board/qemu/aarch64-virt rather than the Kernel defconfig, for
+    # faster build (as it enable less components, but includes
+    # everything needed for this test).
+    kernel_ver = "eb6927f7eea77f823b96c0c22ad9d4a2d7ffdfce"
+    kernel_url = \
+        f"$(call github,siemens,linux,{kernel_ver})/linux-{kernel_ver}.tar.gz"
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+        BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="{kernel_url}"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_JAILHOUSE=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # Qemu option and Kernel args are taken from Jailhouse demo. See:
+        # https://github.com/siemens/jailhouse/blob/master/README.md
+        # We also add oops=panic to improve the test coverage.
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0 mem=768M oops=panic"],
+                           options=["-M", "virt,gic-version=3,virtualization=on,its=off",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "1G",
+                                    "-smp", "16",
+                                    "-drive", f"file={drive},if=none,format=raw,id=hd0",
+                                    "-device", "virtio-blk-device,drive=hd0"])
+        self.emulator.login()
+
+        # Check the program can execute.
+        self.assertRunOk("jailhouse --version")
+
+        # Load the kernel module.
+        self.assertRunOk("modprobe jailhouse")
+
+        # Check the device is present.
+        self.assertRunOk("ls -al /dev/jailhouse")
+
+        # Load the cell config this this qemu test.
+        self.assertRunOk("jailhouse enable /etc/jailhouse/qemu-arm64.cell")
+
+        # Dump the jailhouse console, and check we see its
+        # initialization string.
+        out, ret = self.emulator.run("jailhouse console")
+        self.assertEqual(ret, 0)
+        self.assertIn("Initializing Jailhouse hypervisor", "\n".join(out))
+
+        # Create the cell.
+        cell_cfg = "/etc/jailhouse/qemu-arm64-inmate-demo.cell"
+        cmd = f"jailhouse cell create {cell_cfg}"
+        self.assertRunOk(cmd)
+
+        # Load the demo image.
+        cell_name = "inmate-demo"
+        img = "/usr/libexec/jailhouse/demos/gic-demo.bin"
+        cmd = f"jailhouse cell load {cell_name} {img}"
+        self.assertRunOk(cmd)
+
+        # List Jailhouse cells and check we see the one we loaded.
+        out, ret = self.emulator.run("jailhouse cell list")
+        self.assertEqual(ret, 0)
+        self.assertIn(cell_name, "\n".join(out))
+
+        # We should also see our cell in sysfs.
+        cmd = "cat /sys/devices/jailhouse/cells/1/name"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], cell_name)
+
+        # Start the cell.
+        self.assertRunOk(f"jailhouse cell start {cell_name}")
+
+        # Let the demo cell run for few seconds...
+        time.sleep(3)
+
+        # Stop and unload the cell.
+        self.assertRunOk(f"jailhouse cell shutdown {cell_name}")
+        self.assertRunOk(f"jailhouse cell destroy {cell_name}")
+
+        # Stop and unload jailhouse.
+        self.assertRunOk("jailhouse disable")
+        self.assertRunOk("modprobe -r jailhouse")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
