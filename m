Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EC6C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 13:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A815A40025;
	Sun, 12 Mar 2023 13:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A815A40025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqS1ghWjrrlV; Sun, 12 Mar 2023 13:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAA5F40283;
	Sun, 12 Mar 2023 13:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAA5F40283
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66CA31BF339
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 13:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E5DF81518
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 13:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E5DF81518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCzaseuMOtRd for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 13:13:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 558A281467
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 13:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 558A281467
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E6E486EE9; Sun, 12 Mar 2023 13:13:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 14:13:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: af9769ad23c67f9bd4d1b038709d41230501efef
X-Git-Newrev: f69c972ae613719c0ebc5395ba3084c408023102
X-Patchwork-Hint: ignore
Message-Id: <20230312131333.3E6E486EE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_kexec.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=f69c972ae613719c0ebc5395ba3084c408023102
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_kexec.py        | 93 ++++++++++++++++++++++
 .../tests/package/test_kexec/linux-kexec.fragment  |  5 ++
 3 files changed, 100 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7733d5a04e..f6e120d92b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1718,6 +1718,8 @@ F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_kexec.py
+F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_ncdu.py
diff --git a/support/testing/tests/package/test_kexec.py b/support/testing/tests/package/test_kexec.py
new file mode 100644
index 0000000000..77e383373e
--- /dev/null
+++ b/support/testing/tests/package/test_kexec.py
@@ -0,0 +1,93 @@
+import os
+
+import infra.basetest
+
+
+class TestKexec(infra.basetest.BRTest):
+
+    # A specific configuration is needed for using kexec:
+    # - We use Aarch64 since it is well supported for kexec,
+    # - A kernel config fragment enables all the kexec parts,
+    # - The kernel Image is installed on target filesystem to be
+    #   reloaded through kexec,
+    # - We use a ext4 rootfs image exposed as a virtio storage (rather
+    #   than cpio initrd). This avoids needing to install the initrd
+    #   inside the rootfs.
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
+        BR2_LINUX_KERNEL_INSTALL_TARGET=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_KEXEC=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            infra.filepath("tests/package/test_kexec/linux-kexec.fragment")
+        )
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # Notes:
+        # Sufficient memory is needed to load the kernel: having at
+        # least 512MB works. kexec could silently fail if not enough
+        # memory is present. KASLR needs to be disabled for the test:
+        # we pass "nokaslr" to kernel bootargs, and also pass
+        # "dtb-kaslr-seed=off" to qemu virt machine.
+        bootargs = ["root=/dev/vda console=ttyAMA0 nokaslr"]
+        qemu_opts = ["-M", "virt,dtb-kaslr-seed=off", "-cpu", "cortex-a57", "-m", "512M",
+                     "-drive", f"file={hda},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # Test the program can execute
+        self.assertRunOk("kexec --version")
+
+        # Check the kexec kernel is NOT loaded:
+        self.assertRunOk("test \"$(cat /sys/kernel/kexec_loaded)\" -eq 0")
+
+        # Load the Kernel:
+        # "--append br-test" adds a dummy kernel args we'll be able to
+        # check in the second executed kernel.
+        # We use the dtb image from /sys/firmware/fdt (since we don't
+        # have the dtb file in the system)
+        self.assertRunOk("kexec -d -l --dtb=/sys/firmware/fdt --reuse-cmdline --serial=ttyAMA0 --append=br-test /boot/Image")
+
+        # Check the kexec kernel IS loaded:
+        self.assertRunOk("test \"$(cat /sys/kernel/kexec_loaded)\" -eq 1")
+
+        # Create a marker file in tmpfs which is supposed to disappear
+        # after kexec kernel restart.
+        self.assertRunOk("touch /dev/shm/br-kexec-marker")
+
+        # Execute the loaded kernel (i.e perform a kexec reboot)
+        # qemu.sendline() is used here because no exit code nor
+        # program return is expected, since kexec is like a
+        # reboot. The login is expected to be reached after the
+        # command is issued.
+        self.emulator.qemu.sendline("kexec -d -e")
+
+        # Wait for the login, and log again
+        self.emulator.login()
+
+        # Check the "br-test" dummy kernel arg is present
+        self.assertRunOk("grep br-test /proc/cmdline")
+
+        # Check the test marker file is no longer here
+        self.assertRunOk("test ! -e /dev/shm/br-kexec-marker")
+
+        # After restart, the kernel is not supposed to have a kexec
+        # loaded image:
+        self.assertRunOk("test \"$(cat /sys/kernel/kexec_loaded)\" -eq 0")
diff --git a/support/testing/tests/package/test_kexec/linux-kexec.fragment b/support/testing/tests/package/test_kexec/linux-kexec.fragment
new file mode 100644
index 0000000000..04c65f5cae
--- /dev/null
+++ b/support/testing/tests/package/test_kexec/linux-kexec.fragment
@@ -0,0 +1,5 @@
+CONFIG_KEXEC=y
+CONFIG_KEXEC_FILE=y
+CONFIG_PROC_KCORE=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_KALLSYMS_ALL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
