Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F346CF34B0
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 15:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90EEC607DB;
	Thu,  3 Oct 2024 15:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlRHIMdlKGzT; Thu,  3 Oct 2024 15:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97CFD607E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97CFD607E1;
	Thu,  3 Oct 2024 15:46:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46F751BF5A4
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 15:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 424A040B77
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 15:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B59r1ZcKDkGX for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 15:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2279D400FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2279D400FB
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 15:46:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E39984E5F; Thu,  3 Oct 2024 15:46:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Oct 2024 16:57:13 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 77206b822084c2345854372d3fd26703c0ce80bb
X-Git-Newrev: 0746a50e01901677e056ff504b3b4087bf06550c
X-Patchwork-Hint: ignore
Message-Id: <20241003154622.8E39984E5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] support/testing: add
 exfatprogs runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=0746a50e01901677e056ff504b3b4087bf06550c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f36652898770d92a90ba6240f96cab679457b33e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_exfatprogs.py   | 99 ++++++++++++++++++++++
 .../package/test_exfatprogs/linux-exfat.fragment   |  1 +
 3 files changed, 102 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d954fdc7ff..68bc8843e6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1856,6 +1856,8 @@ F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_ed.py
 F:	support/testing/tests/package/test_ethtool.py
 F:	support/testing/tests/package/test_ethtool/
+F:	support/testing/tests/package/test_exfatprogs.py
+F:	support/testing/tests/package/test_exfatprogs/
 F:	support/testing/tests/package/test_file.py
 F:	support/testing/tests/package/test_file/
 F:	support/testing/tests/package/test_fluidsynth.py
diff --git a/support/testing/tests/package/test_exfatprogs.py b/support/testing/tests/package/test_exfatprogs.py
new file mode 100644
index 0000000000..1b0b117b00
--- /dev/null
+++ b/support/testing/tests/package/test_exfatprogs.py
@@ -0,0 +1,99 @@
+import os
+import subprocess
+
+import infra.basetest
+
+
+class TestExfatProgs(infra.basetest.BRTest):
+    # This test needs a Kernel with exfat support.
+    kern_frag = \
+        infra.filepath("tests/package/test_exfatprogs/linux-exfat.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EXFATPROGS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        # Prepare the disk image.
+        disk_file = os.path.join(self.builddir, "images", "disk.img")
+        self.emulator.logfile.write(f"Creating disk image: {disk_file}")
+        self.emulator.logfile.flush()
+        subprocess.check_call(
+            ["dd", "if=/dev/zero", f"of={disk_file}", "bs=1M", "count=256"],
+            stdout=self.emulator.logfile,
+            stderr=self.emulator.logfile)
+
+        # Run the emulator with a blank drive.
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        bootargs = ["console=ttyAMA0"]
+        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                     "-initrd", img,
+                     "-drive", f"file={disk_file},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # Variables for this test.
+        dev = "/dev/vda"
+        label = "BR_TEST"
+        mnt_pt = "/tmp/exfat"
+        data_file = f"{mnt_pt}/data.bin"
+
+        # We create the exfat filesystem on our device.
+        self.assertRunOk(f"mkfs.exfat {dev}")
+
+        # We set a label on this filesystem.
+        self.assertRunOk(f"exfatlabel {dev} '{label}'")
+
+        # We create a mount point and mount this filesystem.
+        self.assertRunOk(f"mkdir -p {mnt_pt}")
+        self.assertRunOk(f"mount {dev} {mnt_pt}")
+
+        # We create a file with random data, to use this new
+        # filesystem a bit.
+        self.assertRunOk(f"dd if=/dev/urandom of={data_file} bs=1M count=10")
+
+        # We compute the sha256 hash and save it for later.
+        hash_cmd = f"sha256sum {data_file}"
+        out, ret = self.emulator.run(hash_cmd)
+        self.assertEqual(ret, 0)
+        data_sha256 = out[0]
+
+        # We unmount the filesystem.
+        self.assertRunOk(f"umount {mnt_pt}")
+
+        # We run a filesystem check. Since we cleanly unmounted the
+        # filesystem, we are not expecting any repair. This is just to
+        # test the program works correctly.
+        self.assertRunOk(f"fsck.exfat -v {dev}")
+
+        # We query the label and check it is the one we set at the
+        # beginning.
+        out, ret = self.emulator.run(f"exfatlabel {dev}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[1], f"label: {label}")
+
+        # We remount our filesystem.
+        self.assertRunOk(f"mount {dev} {mnt_pt}")
+
+        # We should recompute the same sha256 hash as before, on the
+        # first data file we created at the beginning.
+        out, ret = self.emulator.run(hash_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], data_sha256)
diff --git a/support/testing/tests/package/test_exfatprogs/linux-exfat.fragment b/support/testing/tests/package/test_exfatprogs/linux-exfat.fragment
new file mode 100644
index 0000000000..e0332e3d37
--- /dev/null
+++ b/support/testing/tests/package/test_exfatprogs/linux-exfat.fragment
@@ -0,0 +1 @@
+CONFIG_EXFAT_FS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
