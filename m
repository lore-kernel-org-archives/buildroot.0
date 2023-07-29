Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC341C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71E8780B33;
	Sat, 29 Jul 2023 21:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71E8780B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blL41MhnRoVj; Sat, 29 Jul 2023 21:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98D9980AF2;
	Sat, 29 Jul 2023 21:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98D9980AF2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEDE61BF3C1
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8669605E3
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8669605E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4uTPFSwSa6MU for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:38:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD82A605B7
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD82A605B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A914783B51; Sat, 29 Jul 2023 21:38:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 23:37:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c43f9d4a14f311ee1cad334401d84135af4807e
X-Git-Newrev: 1367f3e465500129998631419cf645c0180c71a1
X-Patchwork-Hint: ignore
Message-Id: <20230729213828.A914783B51@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_glslsandbox_player.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=1367f3e465500129998631419cf645c0180c71a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 .../tests/package/test_glslsandbox_player.py       | 50 ++++++++++++++++++++++
 .../test_glslsandbox_player/linux-vkms.fragment    |  1 +
 3 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4488364458..8dbe16b467 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1744,6 +1744,8 @@ F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_gawk.py
+F:	support/testing/tests/package/test_glslsandbox_player.py
+F:	support/testing/tests/package/test_glslsandbox_player/
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_gnuradio.py
 F:	support/testing/tests/package/test_gnuradio/
diff --git a/support/testing/tests/package/test_glslsandbox_player.py b/support/testing/tests/package/test_glslsandbox_player.py
new file mode 100644
index 0000000000..3b0dd60395
--- /dev/null
+++ b/support/testing/tests/package/test_glslsandbox_player.py
@@ -0,0 +1,50 @@
+import os
+
+import infra.basetest
+
+
+class TestGlslsandboxPlayer(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.32"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_LLVM=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_GLSLSANDBOX_PLAYER=y
+        BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            infra.filepath("tests/package/test_glslsandbox_player/linux-vkms.fragment"))
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M", "-initrd", img])
+        self.emulator.login()
+
+        # We force a small resolution in order to keep a relatively
+        # fast software rendering
+        cmd = "GSP_DRM_MODE=640x480 "
+        # We run 3 frames of a reduced resolution of SimpleMandel
+        cmd += "glslsandbox-player -S SimpleMandel -w0 -f3 -R8 -N -vv -r1 -D"
+        self.assertRunOk(cmd, timeout=30)
+
+        # Since we render 3 frames and request a dump of the last one,
+        # a ppm image file is expected to be present
+        self.assertRunOk("test -s SimpleMandel-00002.ppm")
diff --git a/support/testing/tests/package/test_glslsandbox_player/linux-vkms.fragment b/support/testing/tests/package/test_glslsandbox_player/linux-vkms.fragment
new file mode 100644
index 0000000000..ec2ed4460c
--- /dev/null
+++ b/support/testing/tests/package/test_glslsandbox_player/linux-vkms.fragment
@@ -0,0 +1 @@
+CONFIG_DRM_VKMS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
