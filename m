Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE8EC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BE624012F;
	Mon,  5 Feb 2024 21:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BE624012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7Dd7oRFxT4s; Mon,  5 Feb 2024 21:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D815040160;
	Mon,  5 Feb 2024 21:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D815040160
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A6B91BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21E3E41953
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E3E41953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uKvOUHgE-PAB for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:37:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19FA841951
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19FA841951
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F24DD86E17; Mon,  5 Feb 2024 21:37:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 22:36:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc125743d4e984ac4d0b1c07bafc99d075fc9686
X-Git-Newrev: 1dd39dcf12d97637c4b343d49fcddae2ba29774b
X-Patchwork-Hint: ignore
Message-Id: <20240205213718.F24DD86E17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add cryptsetup runtime
 test
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

commit: https://git.buildroot.net/buildroot/commit/?id=1dd39dcf12d97637c4b343d49fcddae2ba29774b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_cryptsetup.py   | 137 +++++++++++++++++++++
 .../test_cryptsetup/linux-cryptsetup.fragment      |   5 +
 3 files changed, 144 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 31496cbcc6..f8737621b3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1764,6 +1764,8 @@ F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_coremark.py
+F:	support/testing/tests/package/test_cryptsetup.py
+F:	support/testing/tests/package/test_cryptsetup/
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
diff --git a/support/testing/tests/package/test_cryptsetup.py b/support/testing/tests/package/test_cryptsetup.py
new file mode 100644
index 0000000000..759dfd7c5f
--- /dev/null
+++ b/support/testing/tests/package/test_cryptsetup.py
@@ -0,0 +1,137 @@
+import os
+import subprocess
+
+import infra.basetest
+
+
+class TestCryptSetup(infra.basetest.BRTest):
+    # A specific configuration is needed for using cryptsetup:
+    # - A kernel config fragment enables all the parts needed for
+    #   mounting a LUKS2 volume,
+    # - Enable OpenSSL for cryptsetup crypto backend library,
+    # - Enable e2fsprog for formatting a ext4 filesystem.
+    kern_frag = \
+        infra.filepath("tests/package/test_cryptsetup/linux-cryptsetup.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.75"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_CRYPTSETUP=y
+        BR2_PACKAGE_E2FSPROGS=y
+        BR2_PACKAGE_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        disk_file = os.path.join(self.builddir, "images", "disk.img")
+        self.emulator.logfile.write(f"Creating disk image: {disk_file}")
+        subprocess.check_call(
+            ["dd", "if=/dev/urandom", f"of={disk_file}", "bs=1M", "count=20"],
+            stdout=self.emulator.logfile,
+            stderr=self.emulator.logfile)
+
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+
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
+        # Check the program can execute.
+        self.assertRunOk("cryptsetup --version")
+
+        passkey = "ThisIsAPassKey."
+        dev = "/dev/vda"
+        dm_name = "luks-vol"
+        dm_dev = f"/dev/mapper/{dm_name}"
+        mnt_pt = "/mnt/secure-volume"
+
+        # Check the device is NOT detected as a LUKS volume, because
+        # it is not formatted yet.
+        is_luks_cmd = f"cryptsetup isLuks {dev}"
+        _, ret = self.emulator.run(is_luks_cmd)
+        self.assertNotEqual(ret, 0)
+
+        # Format the LUKS volume.
+        cmd = f"echo {passkey} | cryptsetup luksFormat {dev}"
+        self.assertRunOk(cmd, timeout=30)
+
+        # Check the device is now detected as a LUKS device.
+        self.assertRunOk(is_luks_cmd)
+
+        # Dump LUKS device header information.
+        self.assertRunOk(f"cryptsetup luksDump {dev}")
+
+        # Open the LUKS device
+        luks_open_cmd = f"echo {passkey} | "
+        luks_open_cmd += f"cryptsetup open --type luks {dev} {dm_name}"
+        self.assertRunOk(luks_open_cmd, timeout=10)
+
+        # Create an ext4 filesystem.
+        self.assertRunOk(f"mke2fs -T ext4 {dm_dev}", timeout=10)
+
+        # Create the mount point directory.
+        self.assertRunOk(f"mkdir {mnt_pt}")
+
+        # Mount the LUKS device.
+        mount_cmd = f"mount {dm_dev} {mnt_pt}"
+        self.assertRunOk(mount_cmd)
+
+        # Create a plain text file in the mounted filesystem.
+        msg = "This is a plain text message"
+        plain_file = f"{mnt_pt}/file.txt"
+        self.assertRunOk(f"echo '{msg}' > {plain_file}")
+
+        # Unmount.
+        self.assertRunOk(f"umount {mnt_pt}")
+
+        # We are supposed to see our plain text message on the
+        # dm-crypt device.
+        self.assertRunOk(f"grep -Fq '{msg}' {dm_dev}", timeout=10)
+
+        # Close the LUKS device
+        self.assertRunOk(f"cryptsetup close {dm_name}")
+
+        # We are NOT supposed to find our plain text message on the
+        # crypted storage device.
+        _, ret = self.emulator.run(f"grep -Fq '{msg}' {dev}", timeout=10)
+        self.assertNotEqual(ret, 0)
+
+        # Try to open LUKS volume with a wrong password. This is
+        # expected to fail.
+        cmd = f"echo 'Wrong{passkey}' | "
+        cmd += f"cryptsetup open --type luks {dev} {dm_name}"
+        _, ret = self.emulator.run(cmd, timeout=10)
+        self.assertNotEqual(ret, 0)
+
+        # Check the device-mapper device was NOT created (since we
+        # tried to open it with a wrong password).
+        self.assertRunOk(f"test ! -e {dm_dev}")
+
+        # Reopen the LUKS device, with the good passkey this time...
+        self.assertRunOk(luks_open_cmd, timeout=10)
+
+        # ...remount...
+        self.assertRunOk(mount_cmd)
+
+        # ...and read back our plain text file. We check we get back
+        # our original message.
+        out, ret = self.emulator.run(f"cat {plain_file}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
diff --git a/support/testing/tests/package/test_cryptsetup/linux-cryptsetup.fragment b/support/testing/tests/package/test_cryptsetup/linux-cryptsetup.fragment
new file mode 100644
index 0000000000..37d5494fc2
--- /dev/null
+++ b/support/testing/tests/package/test_cryptsetup/linux-cryptsetup.fragment
@@ -0,0 +1,5 @@
+CONFIG_BLK_DEV_DM=y
+CONFIG_CRYPTO_AES=y
+CONFIG_CRYPTO_XTS=y
+CONFIG_DM_CRYPT=y
+CONFIG_MD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
