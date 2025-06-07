Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB55C5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 22:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33E2760EBC;
	Sat,  7 Jun 2025 22:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDAOVXx_ELgs; Sat,  7 Jun 2025 22:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5150E6083E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5150E6083E;
	Sat,  7 Jun 2025 22:08:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21DC5C8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B87A60B24
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzbDstywPnK7 for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 22:08:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7474E6083E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7474E6083E
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:08:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 631B9879F6; Sat,  7 Jun 2025 22:08:04 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Jun 2025 22:47:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fc7c7d74aa619fa22608436f26b706e83af8d9fc
X-Git-Newrev: 22798b5978de5fc32a1111da6d8f321fae95282d
X-Patchwork-Hint: ignore
Message-Id: <20250607220804.631B9879F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: add runtime
 test for Mesa3D Rusticl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=22798b5978de5fc32a1111da6d8f321fae95282d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This test verifies that clinfo correctly detects the rustiCL platform
and llvmpipe as device.

We check:
  - exit code,
  - Platform name matches rusticl,
  - Device name matches llvmpipe.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
[Julien:
 - rename file to test_mesa3d.py
 - add Medhi in DEVELOPERS for this test file
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_mesa3d.py | 53 ++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7031087157..9e31f6b515 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -914,6 +914,7 @@ F:	package/docopt-cpp/
 N:	El Mehdi YOUNES <elmehdi.younes@smile.fr>
 F:	package/opencl-headers/
 F:	package/opencl-icd-loader/
+F:	support/testing/tests/package/test_mesa3d.py
 
 N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
 F:	package/bayer2rgb-neon/
diff --git a/support/testing/tests/package/test_mesa3d.py b/support/testing/tests/package/test_mesa3d.py
new file mode 100644
index 0000000000..f5133c2eef
--- /dev/null
+++ b/support/testing/tests/package/test_mesa3d.py
@@ -0,0 +1,53 @@
+import os
+import infra.basetest
+
+RUSTICL_TIMEOUT = 180
+
+
+class TestMesa3DRusticl(infra.basetest.BRTest):
+    config = """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.31"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_LLVM=y
+        BR2_PACKAGE_MESA3D_OPENCL=y
+        BR2_PACKAGE_MESA3D_RUSTICL=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE=y
+        BR2_PACKAGE_CLINFO=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+    """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+            options=[
+                "-M", "virt",
+                "-cpu", "cortex-a57",
+                "-m", "512",
+                "-drive", f"file={img},if=virtio,format=raw"
+            ]
+        )
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+
+        # check the output exit code
+        output, exit_code = self.emulator.run("RUSTICL_ENABLE=llvmpipe clinfo", RUSTICL_TIMEOUT)
+        self.assertEqual(exit_code, 0)
+        # also check if platform name is rusticl and device name is llvmpipe
+        self.assertRegex("\n".join(output), r"Platform Name\s+rusticl")
+        self.assertRegex("\n".join(output), r"Device Name\s+llvmpipe")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
