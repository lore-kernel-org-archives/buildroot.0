Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C4CC001E0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 19:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F7140221;
	Thu, 10 Aug 2023 19:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F7140221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id troJi7zsb0TA; Thu, 10 Aug 2023 19:49:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E15EB41E32;
	Thu, 10 Aug 2023 19:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E15EB41E32
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB2DD1BF982
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A54EA611B5
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A54EA611B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNlfJYDAU9Ce for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 19:49:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B61AF61037
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 19:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B61AF61037
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4AF18568A; Thu, 10 Aug 2023 19:49:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 21:48:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6d35e63653b508a7d1a717436eb408c75cc85d35
X-Git-Newrev: 83671f395c68b5f0f6c7553c23649c34c8743255
X-Patchwork-Hint: ignore
Message-Id: <20230810194923.A4AF18568A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_kmscube: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=83671f395c68b5f0f6c7553c23649c34c8743255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_kmscube.py      | 45 ++++++++++++++++++++++
 .../tests/package/test_kmscube/linux-vkms.fragment |  1 +
 3 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d41e717b45..0bed35fd8e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1787,6 +1787,8 @@ F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
+F:	support/testing/tests/package/test_kmscube.py
+F:	support/testing/tests/package/test_kmscube/
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_lzip.py
diff --git a/support/testing/tests/package/test_kmscube.py b/support/testing/tests/package/test_kmscube.py
new file mode 100644
index 0000000000..0ddeb67939
--- /dev/null
+++ b/support/testing/tests/package/test_kmscube.py
@@ -0,0 +1,45 @@
+import os
+
+import infra.basetest
+
+
+class TestKmsCube(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_PACKAGE_KMSCUBE=y
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_LLVM=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            infra.filepath("tests/package/test_kmscube/linux-vkms.fragment"))
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-smp", "4",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        cmd = "kmscube --vmode=640x480 --count=10"
+        self.assertRunOk(cmd, timeout=30)
diff --git a/support/testing/tests/package/test_kmscube/linux-vkms.fragment b/support/testing/tests/package/test_kmscube/linux-vkms.fragment
new file mode 100644
index 0000000000..ec2ed4460c
--- /dev/null
+++ b/support/testing/tests/package/test_kmscube/linux-vkms.fragment
@@ -0,0 +1 @@
+CONFIG_DRM_VKMS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
