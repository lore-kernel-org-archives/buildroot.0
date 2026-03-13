Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEB9107BCEC
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 22:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F289E40F27;
	Fri, 13 Mar 2026 22:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwjKaGqw4cfI; Fri, 13 Mar 2026 22:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15E4240F2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773442251;
	bh=HkafPTgiHJ8A8VLoqZ8vUTCH6/0Wka66IHhfB1fZbc4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=if7IhGfg4NqB1N9fyTz96SjMl+0TFJZFzvBr+UCkwacg3pYBiWkSVq3XPlTpTD1NN
	 XiaYeX9+N655nlVNst0wf9rYAa0H9UxUdwNsJVBN/5ussmqAm0U9jpHCVuvcli6oWX
	 VrMmD3VjxdK6o6T0eOhQItp8I1MTrDWwlbPxUfSOFnTMoJgHldFhvQz1PTWuZPbxif
	 bMQHj6c3P2Bcv13dLRvEI68PMrTmXWUkhPYCkm/hLQ301BbaHZr8Wtris4NqIAsimh
	 Jx/rKE7uOq5smm74CedHWEbn7i1I6uWv62KqUePrMqAckuDZvcIuMwhHUpo+ben4ci
	 Pq7FCghkJfhoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15E4240F2C;
	Fri, 13 Mar 2026 22:50:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FF711B4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 627544005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9fh2RSkPJ0h for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F9140656
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0F9140656
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9B7987396; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 23:30:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffaccc4cccb57ee7a34a5c1288e2ca76da944aaa
X-Git-Newrev: c1bc1a7a617b31b997ed113b57cdc72faa04046c
X-Patchwork-Hint: ignore
Message-Id: <20260313225044.D9B7987396@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fs: new xfs runtime test
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1bc1a7a617b31b997ed113b57cdc72faa04046c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/fs/test_xfs.py               | 55 ++++++++++++++++++++++
 .../testing/tests/fs/test_xfs/linux-xfs.fragment   |  1 +
 3 files changed, 58 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ba6ba6b221..5293d94649 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1849,6 +1849,8 @@ F:	support/testing/tests/fs/test_btrfs.py
 F:	support/testing/tests/fs/test_btrfs/
 F:	support/testing/tests/fs/test_erofs.py
 F:	support/testing/tests/fs/test_erofs/
+F:	support/testing/tests/fs/test_xfs.py
+F:	support/testing/tests/fs/test_xfs/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
diff --git a/support/testing/tests/fs/test_xfs.py b/support/testing/tests/fs/test_xfs.py
new file mode 100644
index 0000000000..7e4a617baf
--- /dev/null
+++ b/support/testing/tests/fs/test_xfs.py
@@ -0,0 +1,55 @@
+import os
+
+import infra.basetest
+
+
+class TestXfs(infra.basetest.BRTest):
+    kern_frag = \
+        infra.filepath("tests/fs/test_xfs/linux-xfs.fragment")
+    xfs_label = "BR_TEST"
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_XFS=y
+        BR2_TARGET_ROOTFS_XFS_LABEL="{xfs_label}"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        disk = os.path.join(self.builddir, "images", "rootfs.xfs")
+        kern = os.path.join(self.builddir, "images", "Image")
+        bootargs = ["root=/dev/vda"]
+        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "512M",
+                     "-drive", f"file={disk},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # We check our root filesystem is in xfs format.
+        cmd = "mount | grep '/dev/root on / type xfs'"
+        self.assertRunOk(cmd)
+
+        # We try to write data on the root filesystem.
+        msg = "Hello Buildroot"
+        fname = "/root/file.txt"
+        self.assertRunOk(f"echo '{msg}' > {fname}")
+
+        # We sync and drop all caches, to make sure we will read back
+        # from the filsystem.
+        self.assertRunOk("sync")
+        self.assertRunOk("echo 3 > /proc/sys/vm/drop_caches")
+
+        # We check we can read back out data.
+        out, ret = self.emulator.run(f"cat {fname}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
diff --git a/support/testing/tests/fs/test_xfs/linux-xfs.fragment b/support/testing/tests/fs/test_xfs/linux-xfs.fragment
new file mode 100644
index 0000000000..32f7f6d872
--- /dev/null
+++ b/support/testing/tests/fs/test_xfs/linux-xfs.fragment
@@ -0,0 +1 @@
+CONFIG_XFS_FS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
