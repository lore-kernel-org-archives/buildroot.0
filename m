Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DA8C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1088D4FD61;
	Fri, 28 Feb 2025 16:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ml8ri8HSqDW; Fri, 28 Feb 2025 16:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BDED40CCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BDED40CCD;
	Fri, 28 Feb 2025 16:48:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 058991DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F9E542E28
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KOXZKQD1mg2 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1FCC424E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1FCC424E2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 947FA86FB9; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 22:31:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eb8384bfbb64b1088bb9dca2d1d7df56e767231b
X-Git-Newrev: e14380b3c4c3d5e037662c45b2cf90056056920a
X-Patchwork-Hint: ignore
Message-Id: <20250228162953.947FA86FB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_xvisor.py: new runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e14380b3c4c3d5e037662c45b2cf90056056920a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is a basic test for Xvisor RISC-V 64bit. It is running few
management and status commands. It does not start a Linux kernel.

RISC-V 64bit was chosen for this test because it was the simplest
solution to run xvisor in a qemu emulator.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |   1 +
 support/testing/tests/package/test_xvisor.py | 131 +++++++++++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 820a216735..3805fe13be 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2002,6 +2002,7 @@ F:	support/testing/tests/package/test_which.py
 F:	support/testing/tests/package/test_wine.py
 F:	support/testing/tests/package/test_xfsprogs.py
 F:	support/testing/tests/package/test_xfsprogs/
+F:	support/testing/tests/package/test_xvisor.py
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
diff --git a/support/testing/tests/package/test_xvisor.py b/support/testing/tests/package/test_xvisor.py
new file mode 100644
index 0000000000..b1b7d1a5e0
--- /dev/null
+++ b/support/testing/tests/package/test_xvisor.py
@@ -0,0 +1,131 @@
+import os
+import re
+
+import infra.basetest
+
+
+class TestXvisor(infra.basetest.BRTest):
+    # RISC-V 64bit is the "simplest" configuration to run
+    # Xvisor into QEmu.
+    config = \
+        """
+        BR2_riscv=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_XVISOR=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_OPENSBI=y
+        BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+        BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.5"
+        BR2_TARGET_OPENSBI_PLAT="generic"
+        BR2_PACKAGE_HOST_QEMU=y
+        BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
+        """
+    xvisor_prompt = "XVisor# "
+
+    def expect_xvisor_prompt(self, timeout=-1):
+        self.emulator.qemu.expect(self.xvisor_prompt, timeout=timeout)
+
+    def run_xvisor_cmd(self, cmd, timeout=-1):
+        exit_code = 0
+        if timeout != -1:
+            timeout *= self.emulator.timeout_multiplier
+        self.emulator.qemu.sendline(cmd)
+        self.expect_xvisor_prompt(timeout)
+        output = self.emulator.qemu.before.replace("\r\r", "\r").splitlines()[1:]
+        # Some Xvisor commands (like "sleep") might not
+        # produce any output
+        if len(output) > 0:
+            last_line = output[-1]
+        else:
+            last_line = ""
+        if last_line.startswith("Error:"):
+            match = re.search(last_line, r"code (-?\d)")
+            if match is None:
+                exit_code = -1
+            else:
+                exit_code = int(match.group(1))
+
+        return output, exit_code
+
+    def assertXvRunOk(self, cmd, timeout=-1):
+        out, exit_code = self.run_xvisor_cmd(cmd, timeout)
+        self.assertEqual(
+            exit_code,
+            0,
+            "\nFailed to run xvisor command: {}\noutput was:\n{}".format(
+                cmd, '  '+'\n  '.join(out))
+        )
+
+    def test_run(self):
+        opensbi = os.path.join(self.builddir, "images", "fw_jump.bin")
+        xvisor = os.path.join(self.builddir, "images", "vmm.bin")
+        initrd = os.path.join(self.builddir, "images", "rootfs.cpio")
+
+        self.emulator.boot(arch="riscv64",
+                           kernel=xvisor,
+                           options=["-M", "virt", "-cpu", "rv64", "-m", "256M",
+                                    "-bios", opensbi, "-initrd", initrd])
+
+        # There is no emulator.login(), since we start directly in
+        # Xvisor prompt.
+        self.expect_xvisor_prompt()
+
+        # Check Xvisor version.
+        output, exit_code = self.run_xvisor_cmd("version")
+        self.assertEqual(exit_code, 0)
+        self.assertTrue(output[0].startswith("Xvisor"))
+
+        # Check a basic echo.
+        test_str = "Hello Buildroot!"
+        output, exit_code = self.run_xvisor_cmd("echo " + test_str)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0].strip(), test_str)
+
+        # Check a nonexisting command fails.
+        _, exit_code = self.run_xvisor_cmd("bad_command")
+        self.assertNotEqual(exit_code, 0)
+
+        # Check an error of a valid command.
+        _, exit_code = self.run_xvisor_cmd("vfs ls /nodir")
+        self.assertNotEqual(exit_code, 0)
+
+        # We mount the initrd...
+        self.assertXvRunOk("vfs mount initrd /")
+
+        # Check we see an existing file/symlink "os-release" in
+        # "/etc", from our mounted initrd.
+        output, exit_code = self.run_xvisor_cmd("vfs ls /etc")
+        self.assertEqual(exit_code, 0)
+        self.assertIn("os-release", "\n".join(output))
+
+        # Check the word "Buildroot" is in the /etc/issue file.
+        output, exit_code = self.run_xvisor_cmd("vfs cat /etc/issue")
+        self.assertEqual(exit_code, 0)
+        self.assertIn("Buildroot", "\n".join(output))
+
+        # Check qemu is seen in host info.
+        output, exit_code = self.run_xvisor_cmd("host info")
+        self.assertEqual(exit_code, 0)
+        self.assertIn("qemu", "\n".join(output))
+
+        # Run a batch of status commands...
+        cmds = [
+            "blockdev list",
+            "rbd list",
+            "module info 0",
+            "wallclock get_time",
+            "heap info",
+            "thread list",
+            "vcpu list",
+            "vcpu dumpreg 0",
+            "devtree node show /",
+            "host cpu info",
+            "host ram info",
+            "host resources",
+            "host bus_list",
+            "host bus_device_list platform"
+        ]
+
+        for cmd in cmds:
+            self.assertXvRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
