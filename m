Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079C8C25B4F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C85AD417E1;
	Wed,  1 May 2024 20:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0B8XTQ8WldV; Wed,  1 May 2024 20:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9678741869
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9678741869;
	Wed,  1 May 2024 20:46:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 682671BF400
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D97A40580
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pq5XdJ2mYN5p for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E796405FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E796405FD
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:46:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26036864D0; Wed,  1 May 2024 20:46:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 22:06:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6317f6c9a4107d3409530b653c5900bff17ffb6e
X-Git-Newrev: 7c1faf997f868586a40a9cb6f03166d85a67b8f8
X-Patchwork-Hint: ignore
Message-Id: <20240501204617.26036864D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add fwts runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c1faf997f868586a40a9cb6f03166d85a67b8f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_fwts.py | 67 ++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6bfad23442..726641b513 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1787,6 +1787,7 @@ F:	support/testing/tests/package/test_file/
 F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_fping.py
+F:	support/testing/tests/package/test_fwts.py
 F:	support/testing/tests/package/test_gawk.py
 F:	support/testing/tests/package/test_ghostscript.py
 F:	support/testing/tests/package/test_ghostscript/
diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
new file mode 100644
index 0000000000..ef792136c2
--- /dev/null
+++ b/support/testing/tests/package/test_fwts.py
@@ -0,0 +1,67 @@
+import os
+
+import infra.basetest
+
+
+class TestFwts(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.28"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+        BR2_TARGET_EDK2=y
+        BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_ARM64_EFI=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+        BR2_PACKAGE_FWTS=y
+        BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        """
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "disk.img")
+        flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
+        flash1 = os.path.join(self.builddir, "images", "SBSA_FLASH1.fd")
+        self.emulator.boot(arch="aarch64",
+                           options=["-M", "sbsa-ref",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "512M",
+                                    "-pflash", flash0,
+                                    "-pflash", flash1,
+                                    "-hda", hda])
+        self.emulator.login()
+
+        # Check the program can execute.
+        self.assertRunOk("fwts --version")
+
+        # We run a simple UEFI runtime service variable interface test
+        # suite. Those tests are using the fwts efi_runtime kernel
+        # module.
+        self.assertRunOk("fwts -q uefirtvariable", timeout=30)
+
+        # The previous fwts invocation is expected to have created a
+        # "results.log" report. We check the file exists and contains
+        # a known header string.
+        expected_str = "Results generated by fwts:"
+        cmd = f"grep -F '{expected_str}' results.log"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertTrue(out[0].startswith(expected_str))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
