Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E59FD0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E5C40A7D;
	Wed,  7 Jan 2026 17:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cttJ4j0UNew1; Wed,  7 Jan 2026 17:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B25B40A5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808049;
	bh=sUqtt9/iWHYfUtsJuoeN6E9c8dY687Fo0SG6N2xX/bI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XHaCn4diA/QqXgHm+yy+b13KRgIXNBzlp1Zdy/Vfqa+PLtdvWvdzTXBOavGXyOBlu
	 VCJJzcGxR5GpCYxxVCfwXzLUpXA62f6yzHZfLS675tGbJ+G1HAql9GFeykVhf4iDDB
	 WClbJXh6/CXKZC2WM7eNXVNfyHLJ7GkD6pYvls9zHzCoNigPB8vhtFjwNvuWo6QSnd
	 nWjmObshjL2nJsA2EbOMI8JtlO0hwyEIzDTt94m8jo77a3OgBZqB1slOl02TnwHdop
	 aocy3Fhj8BGu5Ryb4ZN/R1mEM//1SAsN/1TMd4qyVCXGt8H3vb+0mtj1glFTerndko
	 y7W133bLFaLQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B25B40A5E;
	Wed,  7 Jan 2026 17:47:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 102299ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFA1E408A5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYjyFI8I5Emi for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E0F40889
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26E0F40889
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2606588367; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:14 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 50c14b41fc74f65cacbb4931bf6580af3d3f3bb2
X-Git-Newrev: c24744dcbc5c5b4e12cb7c7b79713fcb4c4e1a69
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.2606588367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: new
 kvmtool runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c24744dcbc5c5b4e12cb7c7b79713fcb4c4e1a69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 577a2a32af0ef88321cf147b88cfecdbe17c9b4f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_kvmtool.py      | 97 ++++++++++++++++++++++
 .../tests/package/test_kvmtool/linux-kvm.fragment  |  6 ++
 .../rootfs-overlay/etc/profile.d/stty-raw.sh       |  3 +
 4 files changed, 108 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5f125e85ea..f70c91d27f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1896,6 +1896,8 @@ F:	support/testing/tests/package/test_kmod.py
 F:	support/testing/tests/package/test_kmod/
 F:	support/testing/tests/package/test_kmscube.py
 F:	support/testing/tests/package/test_kmscube/
+F:	support/testing/tests/package/test_kvmtool.py
+F:	support/testing/tests/package/test_kvmtool/
 F:	support/testing/tests/package/test_lame.py
 F:	support/testing/tests/package/test_less.py
 F:	support/testing/tests/package/test_libcamera.py
diff --git a/support/testing/tests/package/test_kvmtool.py b/support/testing/tests/package/test_kvmtool.py
new file mode 100644
index 0000000000..d6859172bd
--- /dev/null
+++ b/support/testing/tests/package/test_kvmtool.py
@@ -0,0 +1,97 @@
+import os
+
+import infra.basetest
+
+
+class TestKvmTool(infra.basetest.BRTest):
+    # This test passes the Buildroot image directory to the emulated
+    # guest using the 9p virtiofs. This guest enables the
+    # virtualization support. It will start a nested KVM virtual
+    # machine, using the same Kernel/initramfs images. For these
+    # reasons, we need a specific kernel configuration that enables
+    # KVM and 9P.
+    kern_frag = \
+        infra.filepath("tests/package/test_kvmtool/linux-kvm.fragment")
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_kvmtool/rootfs-overlay")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_KVMTOOL=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kern = os.path.join(self.builddir, "images", "Image")
+        img_dir = os.path.join(self.builddir, "images")
+        virtfs_tag = "br-imgs"
+        virtfs_opts = [
+            f"local,path={img_dir}",
+            f"mount_tag={virtfs_tag}",
+            "security_model=mapped-xattr",
+            "readonly"
+        ]
+        qemu_opts = ["-M", "virt,gic-version=3,virtualization=on",
+                     "-cpu", "cortex-a57",
+                     "-smp", "4",
+                     "-m", "1G",
+                     "-virtfs", ','.join(virtfs_opts),
+                     "-initrd", img]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # Test the program can execute.
+        self.assertRunOk("lkvm --version")
+
+        # We mount the virtfs to get the Kernel and initramfs from the
+        # test host.
+        self.assertRunOk(f"mount -t 9p {virtfs_tag} /mnt/")
+
+        # We define an arbitrary kernel command line argument that we
+        # will use to detect we are in our virtual machine.
+        kvm_karg = "br-kvm"
+
+        # The number of CPU of our virtual machine
+        kvm_nproc = 2
+
+        # We run the KVM virtual machine
+        cmd = "lkvm run"
+        cmd += " --kernel /mnt/Image"
+        cmd += " --initrd /mnt/rootfs.cpio"
+        cmd += f" --cpus {kvm_nproc}"
+        cmd += " --mem 320M"
+        cmd += " --console virtio"
+        cmd += " --irqchip gicv3"
+        cmd += f" --params {kvm_karg}"
+
+        # We use qemu.sendline() to run the command because the
+        # program will not return an exit code. The command "lkvm run"
+        # will spawn the new virtual machine console. The login is
+        # expected to be reached after the command is issued.
+        self.emulator.qemu.sendline(cmd)
+
+        # We login in the virtual machine.
+        self.emulator.login()
+
+        # We check we can see our kernel argument.
+        out, ret = self.emulator.run("cat /proc/cmdline")
+        self.assertEqual(ret, 0)
+        self.assertIn(kvm_karg, out[0])
+
+        # We check the virtual machine has the expected number of CPU.
+        out, ret = self.emulator.run("nproc")
+        self.assertEqual(ret, 0)
+        self.assertEqual(int(out[0]), kvm_nproc)
diff --git a/support/testing/tests/package/test_kvmtool/linux-kvm.fragment b/support/testing/tests/package/test_kvmtool/linux-kvm.fragment
new file mode 100644
index 0000000000..8058ac41c3
--- /dev/null
+++ b/support/testing/tests/package/test_kvmtool/linux-kvm.fragment
@@ -0,0 +1,6 @@
+CONFIG_VIRTUALIZATION=y
+CONFIG_KVM=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_9P_FS=y
+CONFIG_9P_FS_POSIX_ACL=y
diff --git a/support/testing/tests/package/test_kvmtool/rootfs-overlay/etc/profile.d/stty-raw.sh b/support/testing/tests/package/test_kvmtool/rootfs-overlay/etc/profile.d/stty-raw.sh
new file mode 100644
index 0000000000..24d72995e6
--- /dev/null
+++ b/support/testing/tests/package/test_kvmtool/rootfs-overlay/etc/profile.d/stty-raw.sh
@@ -0,0 +1,3 @@
+# Avoid double-cooking the terminal, otherwise the test infrastructure
+# would not be able to retrieve return codes properly.
+grep -Fq br-kvm /proc/cmdline && stty raw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
