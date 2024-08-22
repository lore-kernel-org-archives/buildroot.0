Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0278C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 14:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D39F40E9E;
	Thu, 22 Aug 2024 14:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGpPslcGOD1T; Thu, 22 Aug 2024 14:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CCCA40EB5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CCCA40EB5;
	Thu, 22 Aug 2024 14:03:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C20CF1BF34C
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 14:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB50E409F1
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 14:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wXTaPWQhVBr for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 14:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97FFA409F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97FFA409F2
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 14:03:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86D3A86284; Thu, 22 Aug 2024 14:03:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 14:37:46 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 38b8112733e51ec23ab33a5b2ab14ca0b780b816
X-Git-Newrev: df596e57b85ea3bb95ab3d04f9e393b23db319fd
X-Patchwork-Hint: ignore
Message-Id: <20240822140319.86D3A86284@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] support/testing: fs: new
 btrfs runtime test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=df596e57b85ea3bb95ab3d04f9e393b23db319fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 009f9106d991c9adbf8e57869d4355e0f71da31b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/fs/test_btrfs.py             | 56 ++++++++++++++++++++++
 .../tests/fs/test_btrfs/linux-btrfs.fragment       |  1 +
 3 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b13a346c5d..297dcd06ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1785,6 +1785,8 @@ F:	package/z3/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/boot/test_optee_os.py
 F:	support/testing/tests/boot/test_optee_os/
+F:	support/testing/tests/fs/test_btrfs.py
+F:	support/testing/tests/fs/test_btrfs/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
diff --git a/support/testing/tests/fs/test_btrfs.py b/support/testing/tests/fs/test_btrfs.py
new file mode 100644
index 0000000000..90b868a955
--- /dev/null
+++ b/support/testing/tests/fs/test_btrfs.py
@@ -0,0 +1,56 @@
+import os
+
+import infra.basetest
+
+
+class TestBtrfs(infra.basetest.BRTest):
+    kern_frag = \
+        infra.filepath("tests/fs/test_btrfs/linux-btrfs.fragment")
+    btrfs_label = "BR_TEST"
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_BTRFS_PROGS=y
+        BR2_TARGET_ROOTFS_BTRFS=y
+        BR2_TARGET_ROOTFS_BTRFS_LABEL="{btrfs_label}"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        disk = os.path.join(self.builddir, "images", "rootfs.btrfs")
+        kern = os.path.join(self.builddir, "images", "Image")
+        bootargs = ["root=/dev/vda", "console=ttyAMA0"]
+        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                     "-drive", f"file={disk},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # We check our root filesystem is in btrfs format.
+        cmd = "mount | grep '/dev/root on / type btrfs'"
+        self.assertRunOk(cmd)
+
+        # We show the root filesystem info with btrfs-progs, using the
+        # target btrfs-progs.
+        self.assertRunOk("btrfs filesystem show /")
+
+        # We query the label and check it is the one from the
+        # Buildroot config.
+        out, ret = self.emulator.run("btrfs filesystem label /")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], self.btrfs_label)
+
+        # We try to write data on the root filesystem.
+        self.assertRunOk("echo 'Hello Buildroot' > /root/file.txt")
+        self.assertRunOk("sync")
diff --git a/support/testing/tests/fs/test_btrfs/linux-btrfs.fragment b/support/testing/tests/fs/test_btrfs/linux-btrfs.fragment
new file mode 100644
index 0000000000..605c1837e1
--- /dev/null
+++ b/support/testing/tests/fs/test_btrfs/linux-btrfs.fragment
@@ -0,0 +1 @@
+CONFIG_BTRFS_FS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
