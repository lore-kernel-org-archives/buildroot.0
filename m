Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDECC5AC80
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64FB68126D;
	Fri,  7 Aug 2026 09:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJAvG7r1YdNg; Fri,  7 Aug 2026 09:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B89B81274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095248;
	bh=5cXAftElYU/0GhRsTaHlzkC0xdObI5FnuG6lENnvUnc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D6ZpS3KER84kmqxXxBc1hLW9BsDPIpEsfKWMNcE2U1thg3SdDgAH26axh54i9lt+E
	 c/3pn+aw0HU4WNUWZA3ZO0CBdHGOXQh9vNvBcO4ZeFu5csq8WkWg8IOpkRN/9LjCOY
	 ZilPzSkV/Hu3DRUOnm6oom0kvkfqKrJ5FY99+7gzC62y8S/RBI9Fer+KfZN5ayp75m
	 7UH+Xy+fiauIP31yQ1lYNjndcwMS+bLFabKPIU8KVkOL07Deoq51zFgknfo2rQPupe
	 eCpWzpw0WvLdx4QZeZ5aG6DNE1Is0hzjjkG1qtRF4gecF4QpTL858Dz7IAYVvOU/sI
	 AzMh5a/iAEJfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B89B81274;
	Fri,  7 Aug 2026 09:34:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 956FC282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8798C40A07
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqtA1EIpE7XD for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 129B440A00
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 129B440A00
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CC938CA40; Fri,  7 Aug 2026 09:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:08:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1a7c4e86d98c762448a5c682e6700fe50bb6ae6c
X-Git-Newrev: 8c12556150603c52474c897556443200151762f9
X-Patchwork-Hint: ignore
Message-Id: <20260807093259.9CC938CA40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c12556150603c52474c897556443200151762f9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b1571cab599a53bb1891f26f0226d64a185d7de8)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_libgpiod2.py    | 127 +++++++++++++++++++++
 .../package/test_libgpiod2/linux-gpio-sim.fragment |   1 +
 3 files changed, 130 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f135f2c2f7..a0111b631f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1879,6 +1879,8 @@ F:	support/testing/tests/package/test_libcamera.py
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
