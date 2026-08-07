Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5238CC5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1571080D36;
	Fri,  7 Aug 2026 09:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGPTZuTEsDy6; Fri,  7 Aug 2026 09:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C278122B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095353;
	bh=y4wig6WKzKEK9/P6CXV9UGkdhX8OVMz/ctfitVjVF94=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AECNvFXjF3nbtYaC3BZ0AM5lMmR9LBGoN5d+4FAwIICSiKnESGBbCZ1La3AmXOHD+
	 zJ6TE4jmZvFqEELWnsHYnkiasA5jgAxzU7SGsw1dNIDGc1RnNYWhtx+tX1hwhPyWHs
	 YZWAN+OYyZmlPbbkOkkwbfuPnZ3eO7ikPG+TEIFlpgb88SN0X0R3hdALZ/XBsacMDs
	 90u3p1GzYSrxiuQNgQkNNl6yc7aeSV2MFOVh6DvsDZgPYUKpPOcgoPIA4Jt+kEtuDq
	 FbWIXdSmRcxIiVhsCgKUV3QRLhs0SL/hLRYDWb3dqI4mTM7OrVwaoaZ0kdg+vPFCrL
	 0kknG7WMfoKUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C278122B;
	Fri,  7 Aug 2026 09:35:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38E93282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EF04409FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O65vGbLHm81e for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1518B40A24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1518B40A24
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EE1E8CA40; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 156a50683a8cf4dfeb159cd31273d8bdc04f3e8a
X-Git-Newrev: 2a53b3b6bbc88a00b7efa67afc4224b625252570
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.9EE1E8CA40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 libgpiod2: new runtime test
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a53b3b6bbc88a00b7efa67afc4224b625252570
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b1571cab599a53bb1891f26f0226d64a185d7de8)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_libgpiod2.py    | 127 +++++++++++++++++++++
 .../package/test_libgpiod2/linux-gpio-sim.fragment |   1 +
 3 files changed, 130 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d0484cd84d..ed7f0bc523 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1930,6 +1930,8 @@ F:	support/testing/tests/package/test_libcamera.py
 F:	support/testing/tests/package/test_libcamera/
 F:	support/testing/tests/package/test_libcurl.py
 F:	support/testing/tests/package/test_libgpgme.py
+F:	support/testing/tests/package/test_libgpiod2.py
+F:	support/testing/tests/package/test_libgpiod2/
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lighttpd.py
 F:	support/testing/tests/package/test_links.py
diff --git a/support/testing/tests/package/test_libgpiod2.py b/support/testing/tests/package/test_libgpiod2.py
new file mode 100644
index 0000000000..8bf471d516
--- /dev/null
+++ b/support/testing/tests/package/test_libgpiod2.py
@@ -0,0 +1,127 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestLibGpiod2(infra.basetest.BRTest):
+    # This test needs a Kernel with the GPIO simulator module.
+    kern_frag = \
+        infra.filepath("tests/package/test_libgpiod2/linux-gpio-sim.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_PACKAGE_LIBGPIOD2=y
+        BR2_PACKAGE_LIBGPIOD2_TOOLS=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=[
+                "root=/dev/vda",
+                "console=ttyAMA0"],
+            options=[
+                "-M", "virt",
+                "-cpu", "cortex-a57",
+                "-m", "512",
+                "-drive", f"file={img},if=virtio,format=raw"
+            ]
+        )
+        self.emulator.login()
+
+    def setup_gpio_sim(self):
+        cfgfsdir = "/sys/kernel/config"
+        gpiodir = f"{cfgfsdir}/gpio-sim"
+        devname = "br-gpio"
+        devdir = f"{gpiodir}/{devname}"
+        banks = 2
+        lines = 2
+
+        # We need configfs mounted to use the gpio-sim module
+        self.assertRunOk(f"mount -t configfs none {cfgfsdir}")
+
+        # We setup a gpio device, with few banks and lines
+        self.assertRunOk(f"mkdir {devdir}")
+        for bank in range(banks):
+            bankdir = f"{devdir}/bank{bank}"
+            self.assertRunOk(f"mkdir {bankdir}")
+            for line in range(lines):
+                linedir = f"{devdir}/bank{bank}/line{line}"
+                cmd = f"mkdir {linedir}"
+                self.assertRunOk(cmd)
+
+                # Set a name to the line
+                name = f"br-b{bank}-l{line}"
+                cmd = f"echo {name} > {linedir}/name"
+                self.assertRunOk(cmd)
+
+            # We set the total number of lines
+            cmd = f"echo {lines} > {bankdir}/num_lines"
+            self.assertRunOk(cmd)
+
+        # Now our test device is configured, we can enable it.
+        self.assertRunOk(f"echo 1 > {devdir}/live")
+
+    def run_input_gpio_test(self):
+        # We get the gpio input value. We expect an inactive state.
+        gpioget_cmd = "gpioget --numeric br-b0-l0"
+        out, ret = self.emulator.run(gpioget_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(int(out[0]), 0)
+
+        # We pull up the line.
+        cmd = "echo pull-up > /sys/devices/platform/gpio-sim.0/gpiochip0/sim_gpio0/pull"
+        self.assertRunOk(cmd)
+
+        # We query again the gpio. We now expect an active state.
+        out, ret = self.emulator.run(gpioget_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(int(out[0]), 1)
+
+    def run_output_gpio_test(self):
+        # We query the output state, we expect an inactive state.
+        get_gpio1_cmd = "cat /sys/devices/platform/gpio-sim.0/gpiochip0/sim_gpio1/value"
+        out, ret = self.emulator.run(get_gpio1_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(int(out[0]), 0)
+
+        # We run gpioset in background, so we are sure the gpio state
+        # is held to the desired state.
+        self.assertRunOk("gpioset br-b0-l1=1 &")
+        time.sleep(2)
+
+        # We query the output state again, we now expect an active state.
+        out, ret = self.emulator.run(get_gpio1_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(int(out[0]), 1)
+
+    def test_run(self):
+        self.login()
+
+        # We check a binary can execute.
+        self.assertRunOk("gpiodetect --version")
+
+        self.setup_gpio_sim()
+
+        # We show the basic info reported by tools.
+        self.assertRunOk("gpiodetect")
+        self.assertRunOk("gpioinfo")
+
+        self.run_input_gpio_test()
+        self.run_output_gpio_test()
diff --git a/support/testing/tests/package/test_libgpiod2/linux-gpio-sim.fragment b/support/testing/tests/package/test_libgpiod2/linux-gpio-sim.fragment
new file mode 100644
index 0000000000..e7171af743
--- /dev/null
+++ b/support/testing/tests/package/test_libgpiod2/linux-gpio-sim.fragment
@@ -0,0 +1 @@
+CONFIG_GPIO_SIM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
