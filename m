Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F41C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F11F4288E;
	Mon,  8 May 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F11F4288E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VjSE_6EIYKT; Mon,  8 May 2023 20:52:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D7CC41EE8;
	Mon,  8 May 2023 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D7CC41EE8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2B771BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9635440571
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9635440571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDgd4G02Ipse for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:52:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21C114049F
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21C114049F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10C8F86242; Mon,  8 May 2023 20:52:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 22:47:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0484b888f8d1e30590758d8a8f6730e3a2890fa
X-Git-Newrev: 3686e16b5213431ee44d6599486d05d9c07854d1
X-Patchwork-Hint: ignore
Message-Id: <20230508205243.10C8F86242@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_openblas.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=3686e16b5213431ee44d6599486d05d9c07854d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_openblas.py | 56 ++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index efb2907d1b..37c1f06ec1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1748,6 +1748,7 @@ F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
+F:	support/testing/tests/package/test_openblas.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
diff --git a/support/testing/tests/package/test_openblas.py b/support/testing/tests/package/test_openblas.py
new file mode 100644
index 0000000000..9cfe08ef2c
--- /dev/null
+++ b/support/testing/tests/package/test_openblas.py
@@ -0,0 +1,56 @@
+import os
+
+import infra.basetest
+
+
+class TestOpenBLAS(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.27"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_OPENBLAS=y
+        BR2_PACKAGE_OPENBLAS_INSTALL_TESTS=y
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-smp", "2", "-m", "512M", "-initrd", img])
+        self.emulator.login()
+
+        test_prefix = "/usr/libexec/openblas/tests"
+
+        # BLAS data types:
+        blas_data_types = [
+            "s",  # Single precision (32bit) float
+            "d",  # Double precision (64bit) double
+            "c",  # Single precision (32bit) complex
+            "z"   # Double precision (64bit) complex
+        ]
+
+        # BLAS routine levels:
+        # Level 1: Vector operations,
+        # Level 2: Matrix-Vector operations,
+        # Level 3: Matrix-Matrix operations.
+        for blas_level in range(1, 4):
+            for blas_data_type in blas_data_types:
+                test_name = f"x{blas_data_type}cblat{blas_level}"
+                cmd = test_prefix + "/" + test_name
+
+                if blas_level > 1:
+                    cmd += f" < {test_prefix}/{blas_data_type}in{blas_level}"
+
+                self.assertRunOk(cmd, timeout=30)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
