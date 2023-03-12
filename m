Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F35C74A4B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C406E409A4;
	Sun, 12 Mar 2023 22:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C406E409A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9zlssJ-RSOVM; Sun, 12 Mar 2023 22:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDEA84098D;
	Sun, 12 Mar 2023 22:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDEA84098D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A67EA1BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FF8540106
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FF8540106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yeI3-Icm4Mz5 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:11:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CC6A40522
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CC6A40522
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59D8B87031; Sun, 12 Mar 2023 22:11:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 23:11:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebb464a7d5809f7bc52fd7b21efcf441e7920f43
X-Git-Newrev: 44b3aadffaaf26ec9c404dae8b6a8f231870fc63
X-Patchwork-Hint: ignore
Message-Id: <20230312221112.59D8B87031@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_ddrescue.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=44b3aadffaaf26ec9c404dae8b6a8f231870fc63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_ddrescue.py     | 94 ++++++++++++++++++++++
 .../package/test_ddrescue/linux-ddrescue.fragment  |  4 +
 3 files changed, 100 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9aa26418b5..6c3498484f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1729,6 +1729,8 @@ F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/test_ddrescue.py
+F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
new file mode 100644
index 0000000000..2206971421
--- /dev/null
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -0,0 +1,94 @@
+import os
+
+import infra.basetest
+
+
+class TestDdrescue(infra.basetest.BRTest):
+
+    # A specific configuration is needed for testing ddrescue:
+    # - A kernel config fragment enables loop blk dev and device
+    #   mapper dm-dust, which are used to simulate a failing storage
+    #   block device.
+    # - dmraid user space package is needed to configure dm-dust
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.15"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_DDRESCUE=y
+        BR2_PACKAGE_DMRAID=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            infra.filepath("tests/package/test_ddrescue/linux-ddrescue.fragment")
+        )
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M", "-initrd", img])
+        self.emulator.login()
+
+        # Test variables:
+        dev_img = "/tmp/dev.img"
+        lo_dev = "/dev/loop0"
+        dm_dev_name = "dust0"
+        dm_dev = f"/dev/mapper/{dm_dev_name}"
+        ddrescue_img = "/tmp/ddrescue.img"
+
+        # Test the program can execute
+        self.assertRunOk("ddrescue --version")
+
+        # Create a 1MB file of zeroes for initial loopback block device
+        self.assertRunOk(f"dd if=/dev/zero of={dev_img} bs=1M count=1")
+
+        # Setup lookback block device
+        self.assertRunOk(f"losetup {lo_dev} {dev_img}")
+
+        # Create and setup dm-dust to simulate a failing block device
+        # The dev_img file is 1MB: 2048 blocks of 512 bytes each
+        self.assertRunOk(f"dmsetup create {dm_dev_name} --table '0 2048 dust {lo_dev} 0 512'")
+
+        # Add few bad blocks and enable I/O error emulation
+        for badblock in [30, 40, 50, 60]:
+            self.assertRunOk(f"dmsetup message {dm_dev_name} 0 addbadblock {badblock}")
+        self.assertRunOk(f"dmsetup message {dm_dev_name} 0 enable")
+
+        # Show device mapper status, to make debugging easier
+        self.assertRunOk(f"dmsetup status {dm_dev_name}")
+
+        # A normal 'dd' is expected to fail with I/O error
+        cmd = f"dd if={dm_dev} of=/dev/null bs=512"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # Where a normal 'dd' fails, 'ddrescue' is expected to succeed
+        self.assertRunOk(f"ddrescue {dm_dev} {ddrescue_img}")
+
+        # ddrescue does not normaly write any output data when there
+        # is I/O error on the input. The intent is to preserve any
+        # data that could have been read in a previous pass. There is
+        # one exception, when the output is a non-existing regular
+        # file, ddrescue will initialize it with zeroes the first
+        # time. Since the original image file was also including
+        # zeroes, the recovered image is expected to be the same as
+        # the original one. See ddrescue manual:
+        # https://www.gnu.org/software/ddrescue/manual/ddrescue_manual.html#Introduction
+        # "Ddrescue does not write zeros to the output when it finds
+        # bad sectors in the input, and does not truncate the output
+        # file if not asked to."
+        # https://www.gnu.org/software/ddrescue/manual/ddrescue_manual.html#Algorithm
+        # "If the output file is a regular file created by ddrescue,
+        # the areas marked as bad-sector will contain zeros."
+        self.assertRunOk(f"cmp {dev_img} {ddrescue_img}")
diff --git a/support/testing/tests/package/test_ddrescue/linux-ddrescue.fragment b/support/testing/tests/package/test_ddrescue/linux-ddrescue.fragment
new file mode 100644
index 0000000000..5cbe18a89f
--- /dev/null
+++ b/support/testing/tests/package/test_ddrescue/linux-ddrescue.fragment
@@ -0,0 +1,4 @@
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_DUST=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
