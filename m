Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC97CC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62EAA418AA;
	Mon,  5 Feb 2024 22:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62EAA418AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6Izv3Nf4Jto; Mon,  5 Feb 2024 22:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77684418AC;
	Mon,  5 Feb 2024 22:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77684418AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 777AB1BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F50481FEA
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F50481FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZtGZDN8D7xb for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:21:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65A2781FEC
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A2781FEC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5383186E72; Mon,  5 Feb 2024 22:21:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 23:20:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b342b77938622d89fbe6eca20ed5d251a884569
X-Git-Newrev: 9ce02d84ada4fdf6fbf45a60a7934a5edae05c8f
X-Patchwork-Hint: ignore
Message-Id: <20240205222152.5383186E72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add usbutils runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ce02d84ada4fdf6fbf45a60a7934a5edae05c8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Peter: add comment about USB keyboard/mouse]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_usbutils.py     | 61 ++++++++++++++++++++++
 .../package/test_usbutils/linux-usbutils.fragment  |  2 +
 3 files changed, 65 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 12df3bef13..f7a10c364d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1832,6 +1832,8 @@ F:	support/testing/tests/package/test_tcpdump.py
 F:	support/testing/tests/package/test_tesseract_ocr.py
 F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
+F:	support/testing/tests/package/test_usbutils.py
+F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_xz.py
diff --git a/support/testing/tests/package/test_usbutils.py b/support/testing/tests/package/test_usbutils.py
new file mode 100644
index 0000000000..83c3f7f920
--- /dev/null
+++ b/support/testing/tests/package/test_usbutils.py
@@ -0,0 +1,61 @@
+import os
+
+import infra.basetest
+
+
+class TestUsbUtils(infra.basetest.BRTest):
+    # A specific configuration is needed for testing usbutils, to
+    # enable USB 2.0 support in the Kernel.
+    linux_fragment = \
+        infra.filepath("tests/package/test_usbutils/linux-usbutils.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.73"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EUDEV=y
+        BR2_PACKAGE_USBUTILS=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # We add a USB keyboard and mouse devices for the test.
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                                    "-initrd", img,
+                                    "-device", "usb-ehci,id=ehci",
+                                    "-device", "usb-kbd,bus=ehci.0",
+                                    "-device", "usb-mouse,bus=ehci.0"])
+        self.emulator.login()
+
+        # Check the program can execute. We also check the version
+        # string to make sure we have the usbutils version. The
+        # BusyBox lsusb ignores arguments.
+        output, exit_code = self.emulator.run("lsusb --version")
+        self.assertEqual(exit_code, 0)
+        self.assertTrue(output[0].startswith("lsusb (usbutils)"))
+
+        # Test few simple and common invocations
+        self.assertRunOk("lsusb")
+        self.assertRunOk("lsusb --tree")
+        self.assertRunOk("lsusb --verbose")
+        # 1d6b:0002 is Linux Foundation 2.0 root hub
+        # it should be present. lsusb return an error if no device
+        # is found.
+        self.assertRunOk("lsusb -d 1d6b:0002")
+        # we emulate a USB keyboard and mouse, so usbhid-dump should find them
+        self.assertRunOk("usbhid-dump")
diff --git a/support/testing/tests/package/test_usbutils/linux-usbutils.fragment b/support/testing/tests/package/test_usbutils/linux-usbutils.fragment
new file mode 100644
index 0000000000..d9abd2821e
--- /dev/null
+++ b/support/testing/tests/package/test_usbutils/linux-usbutils.fragment
@@ -0,0 +1,2 @@
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
