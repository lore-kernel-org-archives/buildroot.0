Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C2FC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39A704FC52;
	Fri, 28 Feb 2025 16:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8_U05cRKEON; Fri, 28 Feb 2025 16:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 940C94FEB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 940C94FEB3;
	Fri, 28 Feb 2025 16:49:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06B821DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6CCE42E79
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMRf4l1EHsje for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E78B426CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E78B426CD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44B1687C51; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 2 Jan 2025 19:36:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9c2947ff1e8c244a09ac4a71b818297b877c35f5
X-Git-Newrev: 566e9afac4eb2f2d3d4c61988033a8d9340cd967
X-Patchwork-Hint: ignore
Message-Id: <20250228162956.44B1687C51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: new usbip
 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=566e9afac4eb2f2d3d4c61988033a8d9340cd967
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit [1] introduced the usbip package. This commit adds a new runtime
test to check this functionality.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f05f2c1ad717b7cda065ee06fc1daa80cd09d859

Cc: Yann E. MORIN <yann.morin@orange.com>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_usbip.py        | 100 +++++++++++++++++++++
 .../tests/package/test_usbip/linux-usbip.fragment  |   5 ++
 3 files changed, 107 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 381bc9f490..dd496db795 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1993,6 +1993,8 @@ F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
 F:	support/testing/tests/package/test_unbound.py
 F:	support/testing/tests/package/test_unbound/
+F:	support/testing/tests/package/test_usbip.py
+F:	support/testing/tests/package/test_usbip/
 F:	support/testing/tests/package/test_usbutils.py
 F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_vorbis_tools.py
diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
new file mode 100644
index 0000000000..da94d6f92c
--- /dev/null
+++ b/support/testing/tests/package/test_usbip.py
@@ -0,0 +1,100 @@
+import os
+
+import infra.basetest
+
+
+class TestUsbIp(infra.basetest.BRTest):
+    # A specific configuration is needed for testing usbip, to
+    # enable USB 2.0 and USBIP support in the Kernel.
+    linux_fragment = \
+        infra.filepath("tests/package/test_usbip/linux-usbip.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.6"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EUDEV=y
+        BR2_PACKAGE_HWDATA=y
+        BR2_PACKAGE_HWDATA_USB_IDS=y
+        BR2_PACKAGE_USBIP=y
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
+        # We check the program can execute.
+        self.assertRunOk("usbipd --version")
+
+        # We check "lsusb" sees exactly one QEMU USB Keyboard.
+        out, ret = self.emulator.run("lsusb")
+        self.assertEqual(ret, 0)
+        kbd_count = "\n".join(out).count("QEMU USB Keyboard")
+        self.assertEqual(kbd_count, 1)
+
+        # The daemon is not running yet. Listing remote devices is
+        # expected to fail.
+        _, ret = self.emulator.run("usbip list --remote=127.0.0.1")
+        self.assertNotEqual(ret, 0)
+
+        # We start the USBIP daemon.
+        self.assertRunOk("usbipd -D")
+
+        # The daemon is started. Listing remote devices is now
+        # expected to succeed, but with an empty list (since we did
+        # not exported any device yet).
+        out, ret = self.emulator.run("usbip list --remote=127.0.0.1")
+        self.assertEqual(ret, 0)
+        self.assertIn("no exportable devices found", "\n".join(out))
+
+        # We list the local devices seen by usbip. We check we can see
+        # our local USB keyboard device in it.
+        out, ret = self.emulator.run("usbip list --local")
+        self.assertEqual(ret, 0)
+        self.assertIn("busid 1-1", "\n".join(out))
+
+        # We bind the first device (USB Keyboard)
+        self.assertRunOk("usbip bind --busid=1-1")
+
+        # We list the remote devices. We should see our exported
+        # keyboard: we check we have the list header, and the device
+        # ID in the output.
+        out, ret = self.emulator.run("usbip list --remote=127.0.0.1")
+        self.assertEqual(ret, 0)
+        out_str = "\n".join(out)
+        self.assertNotIn("no exportable devices found", out_str)
+        self.assertIn("Exportable USB devices", out_str)
+        self.assertIn("(0627:0001)", out_str)
+
+        # We attach the keyboard. This should create a second USB
+        # keyboard.
+        self.assertRunOk("usbip attach --remote=127.0.0.1 --busid=1-1")
+
+        # We check "lsusb" now sees exactly two QEMU USB Keyboards
+        # (the original one, and a second one created by usbip).
+        out, ret = self.emulator.run("lsusb")
+        self.assertEqual(ret, 0)
+        kbd_count = "\n".join(out).count("QEMU USB Keyboard")
+        self.assertEqual(kbd_count, 2)
diff --git a/support/testing/tests/package/test_usbip/linux-usbip.fragment b/support/testing/tests/package/test_usbip/linux-usbip.fragment
new file mode 100644
index 0000000000..592f461145
--- /dev/null
+++ b/support/testing/tests/package/test_usbip/linux-usbip.fragment
@@ -0,0 +1,5 @@
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USBIP_CORE=y
+CONFIG_USBIP_HOST=y
+CONFIG_USBIP_VHCI_HCD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
