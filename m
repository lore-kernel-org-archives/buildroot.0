Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D969C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCB2F41E08;
	Tue,  6 Feb 2024 22:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Li48VbIQvkQq; Tue,  6 Feb 2024 22:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97C8C41E8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97C8C41E8C;
	Tue,  6 Feb 2024 22:26:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AD3A1BF276
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 541494031E
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbB0yk1HBA3v for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06A9D4031F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06A9D4031F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:26:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E52587494; Tue,  6 Feb 2024 22:26:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 23:26:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89e67a96383f1a0d8f44a9385637798f8c31ef3f
X-Git-Newrev: 22f9ce63a30200696dbcbe6ae3a6cc417f007979
X-Patchwork-Hint: ignore
Message-Id: <20240206222624.6E52587494@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add libcamera runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=22f9ce63a30200696dbcbe6ae3a6cc417f007979
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_libcamera.py    | 79 ++++++++++++++++++++++
 .../package/test_libcamera/linux-vimc.fragment     |  4 ++
 3 files changed, 85 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3e0b2e5c9c..fc47c51d33 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1797,6 +1797,8 @@ F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_kmscube.py
 F:	support/testing/tests/package/test_kmscube/
 F:	support/testing/tests/package/test_less.py
+F:	support/testing/tests/package/test_libcamera.py
+F:	support/testing/tests/package/test_libcamera/
 F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lrzip.py
diff --git a/support/testing/tests/package/test_libcamera.py b/support/testing/tests/package/test_libcamera.py
new file mode 100644
index 0000000000..8953021b82
--- /dev/null
+++ b/support/testing/tests/package/test_libcamera.py
@@ -0,0 +1,79 @@
+import os
+
+import infra.basetest
+
+
+class TestLibCamera(infra.basetest.BRTest):
+    # A specific configuration is needed for testing libcamera:
+    # a kernel config fragment enables v4l2 vimc driver.
+    # The libevent package is also enabled to have the libcamera "cam"
+    # test application.
+    kernel_fragment = \
+        infra.filepath("tests/package/test_libcamera/linux-vimc.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.76"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_LIBCAMERA=y
+        BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC=y
+        BR2_PACKAGE_LIBEVENT=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # The Kernel config of this test has only one v4l2 vimc
+        # driver. The camera index is expected to be #1.
+        cam_idx = 1
+
+        # We test libcamera with its simple "cam" application, by
+        # requesting a list of available cameras.
+        cmd = "cam --list"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        # libcamera generates info messages. We filter only the
+        # line(s) starting with our camera index.
+        cam_line = [ln for ln in out if ln.startswith(f"{cam_idx}:")]
+        # We should have the vimc camera in this line.
+        self.assertIn("platform/vimc.0", cam_line[0])
+
+        # List the camera information.
+        cmd = f"cam --camera {cam_idx} --info"
+        self.assertRunOk(cmd)
+
+        # List the camera controls and check we have a brightness
+        # control.
+        cmd = f"cam --camera {cam_idx} --list-controls"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn("Control: Brightness:", "\n".join(out))
+
+        # List the camera properties and check we have a camera
+        # "Model" property.
+        cmd = f"cam --camera {cam_idx} --list-properties"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn("Property: Model = ", "\n".join(out))
+
+        # Capture few frames.
+        cmd = f"cam --camera {cam_idx} --capture=5"
+        cmd += " --stream width=160,height=120,role=video,pixelformat=RGB888"
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/package/test_libcamera/linux-vimc.fragment b/support/testing/tests/package/test_libcamera/linux-vimc.fragment
new file mode 100644
index 0000000000..04436e7518
--- /dev/null
+++ b/support/testing/tests/package/test_libcamera/linux-vimc.fragment
@@ -0,0 +1,4 @@
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_TEST_SUPPORT=y
+CONFIG_V4L_TEST_DRIVERS=y
+CONFIG_VIDEO_VIMC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
