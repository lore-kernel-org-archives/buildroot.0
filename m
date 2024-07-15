Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE0DC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 09:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C4F1811E8;
	Mon, 15 Jul 2024 09:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qeBRZGp2I2vx; Mon, 15 Jul 2024 09:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B90B3811EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B90B3811EC;
	Mon, 15 Jul 2024 09:28:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1051BF969
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96B3E40500
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id so_JimHndUtT for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 09:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B56DC40466
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B56DC40466
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 09:28:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9B6686B46; Mon, 15 Jul 2024 09:28:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 11:22:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3847a145c23234b3bddae3a9ceb9d2d4e6a90fc5
X-Git-Newrev: 9d0bb0e67bb878858d359101dfdc0aebe8fd2179
X-Patchwork-Hint: ignore
Message-Id: <20240715092811.A9B6686B46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: new dmidecode runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9d0bb0e67bb878858d359101dfdc0aebe8fd2179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note: this test was not working in Buildroot test infrastructure
before commit [1] was merged, because dmidecode has the string "# "
in its output.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/0cad947b964be5612a182413da136fcf0dc5a1f2

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                      |  1 +
 support/testing/tests/package/test_dmidecode.py | 67 +++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2650fb7f48..552f02e515 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1837,6 +1837,7 @@ F:	support/testing/tests/package/test_cryptsetup.py
 F:	support/testing/tests/package/test_cryptsetup/
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
+F:	support/testing/tests/package/test_dmidecode.py
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_ed.py
 F:	support/testing/tests/package/test_ethtool.py
diff --git a/support/testing/tests/package/test_dmidecode.py b/support/testing/tests/package/test_dmidecode.py
new file mode 100644
index 0000000000..33c19f0d96
--- /dev/null
+++ b/support/testing/tests/package/test_dmidecode.py
@@ -0,0 +1,67 @@
+import os
+
+import infra.basetest
+
+
+class TestDmidecode(infra.basetest.BRTest):
+    # We use a x86_64 arch for this dmidecode test because aarch64
+    # SMBIOS is not supported in non-UEFI use-cases (and using a UEFI
+    # aarch64 would make the test longer).
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_DMIDECODE=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+
+        # An arbitrary SMBIOS OEM string for the test
+        oem_string = "Hello Buildroot SMBIOS"
+
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kernel,
+            kernel_cmdline=["console=ttyS0"],
+            options=["-cpu", "Nehalem", "-m", "256", "-initrd", cpio_file,
+                     "-smbios", f"type=11,value={oem_string}"],
+        )
+        self.emulator.login()
+
+        # Check the program can run
+        cmd = "dmidecode --version"
+        self.assertRunOk(cmd)
+
+        # Check a simple invocation of "dmidecode"
+        self.assertRunOk("dmidecode")
+
+        # Check a simple invocation of "biosdecode"
+        self.assertRunOk("biosdecode")
+
+        # Check dmidecode detects SMBIOS
+        cmd = "dmidecode | grep -E '^SMBIOS .* present\\.$'"
+        self.assertRunOk(cmd)
+
+        # Check the system-manufacturer is QEMU
+        cmd = "dmidecode -s system-manufacturer"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "QEMU")
+
+        # Check we read back our OEM string
+        cmd = "dmidecode --oem-string 1"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], oem_string)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
