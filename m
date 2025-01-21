Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BB6C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF85070824;
	Fri, 28 Feb 2025 17:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fewumMHX3S8; Fri, 28 Feb 2025 17:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F22D970829
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22D970829;
	Fri, 28 Feb 2025 17:01:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19610711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5947642479
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujO2waXJ0IZm for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A58542E61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A58542E61
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43A2F83AB0; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 21 Jan 2025 22:10:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fbc4d5215f1094eda3f109e8ac755d2a8a119594
X-Git-Newrev: 16adbd4df05e5692c92ad015c1ec54d64d91dfa5
X-Patchwork-Hint: ignore
Message-Id: <20250228163016.43A2F83AB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: replace
 x86-64 with aarch64 for ZFS tests
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
Content-Type: multipart/mixed; boundary="===============1562253827533177242=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1562253827533177242==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=16adbd4df05e5692c92ad015c1ec54d64d91dfa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Previously, ZFS tests were limited to x86-64 due to lack of cross-platform support.
However, upstream efforts have improved cross-platform compatibility.
Update the ZFS test platform from x86-64 to aarch64, aligning it with other tests.

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_zfs.py | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 967da098e1..1b907ac4de 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -7,15 +7,16 @@ class TestZfsBase(infra.basetest.BRTest):
     timeout = 60 * 3
     config = \
         """
-        BR2_x86_64=y
-        BR2_x86_corei7=y
+        BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
         BR2_PACKAGE_ZFS=y
         BR2_PACKAGE_PYTHON3=y
@@ -28,13 +29,14 @@ class TestZfsBase(infra.basetest.BRTest):
         """
 
     def base_test_run(self):
-        kernel = os.path.join(self.builddir, "images", "bzImage")
+        kernel = os.path.join(self.builddir, "images", "Image")
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
         self.emulator.boot(
-            arch="x86_64",
+            arch="aarch64",
             kernel=kernel,
-            kernel_cmdline=["console=ttyS0"],
-            options=["-cpu", "Nehalem", "-m", "320", "-initrd", cpio_file],
+            kernel_cmdline=["console=ttyAMA0"],
+            options=["-M", "virt", "-cpu", "cortex-a57", "-m", "320M",
+                     "-initrd", cpio_file],
         )
         self.emulator.login()
 
@@ -64,7 +66,7 @@ class TestZfsBase(infra.basetest.BRTest):
 class TestZfsGlibc(TestZfsBase):
     config = TestZfsBase.config + \
         """
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
         """
 
     def test_run(self):
@@ -74,7 +76,7 @@ class TestZfsGlibc(TestZfsBase):
 class TestZfsUclibc(TestZfsBase):
     config = TestZfsBase.config + \
         """
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE=y
         """
 
     def test_run(self):
@@ -84,7 +86,7 @@ class TestZfsUclibc(TestZfsBase):
 class TestZfsMusl(TestZfsBase):
     config = TestZfsBase.config + \
         """
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE=y
         """
 
     def test_run(self):

--===============1562253827533177242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1562253827533177242==--
