Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D6AC001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD73E400DC;
	Thu, 10 Aug 2023 20:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD73E400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UyhAzHLf6IyK; Thu, 10 Aug 2023 20:59:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7A204052B;
	Thu, 10 Aug 2023 20:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7A204052B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E0051BF28A
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17ED6821A7
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17ED6821A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ex7yUR7SVMkb for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:59:30 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1F6C8219E
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1F6C8219E
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9723913F87E;
 Thu, 10 Aug 2023 22:59:25 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 22:59:17 +0200
Message-ID: <20230810205917.359505-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691701166;
 bh=Em1uGzhrUMeo5Tk2aLO4Q7XlfawzAEkjMpvB02SNnCY=;
 h=From:To:Cc:Subject:Date:From;
 b=fyFLaBGoLC8V/6MwY16XkcLym7LNaPTsF+p6SjPvnlYH7KIfNn7IQay1FRYCNvIBD
 xfrjGPHfxMEw13aZhYYszFGe9wRTm+BrJm2hCrwsdm+wLowqKMeHoamPPDS0Tdmt+6
 edpI4rLRZKldSpBYJnC76zXCcNYAV6DZCtCoNYjoSFlfepO6MV59G6PQg3tQfquDMh
 nEH3Y/sn1CzvQvQylc4S9hcgKHO0qOJCgHhbvpC5qndPRlW0RDgVU5MIDg3UdXeVGO
 30MxVM2GPDU8EmVOPazw/zbE200dk8NXE85EsdUS7D2X2OqaK38JXpm6pFsxEgYZ/F
 lz5FPR5LZTEZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fyFLaBGo
Subject: [Buildroot] [PATCH next 1/1]
 support/testing/tests/package/test_weston.py: new runtime test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This test is a followup of the discussion at:
https://lists.buildroot.org/pipermail/buildroot/2023-July/671639.html

It provides an example of a runtime tests using standard Linux graphic
components (Kernel, DRM, Mesa3D, weston).

Signed-off-by: Julien Olivain <ju.o@free.fr>
---

Note:
This runtime test uses BR2_PACKAGE_WESTON_SIMPLE_CLIENTS=y which was
proposed in a separate series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=367218

---
 DEVELOPERS                                    |   2 +
 support/testing/tests/package/test_weston.py  | 191 ++++++++++++++++++
 .../package/test_weston/linux-vkms.fragment   |   2 +
 3 files changed, 195 insertions(+)
 create mode 100644 support/testing/tests/package/test_weston.py
 create mode 100644 support/testing/tests/package/test_weston/linux-vkms.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 0bed35fd8e..b7c8aed502 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1814,6 +1814,8 @@ F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_stress_ng.py
+F:	support/testing/tests/package/test_weston.py
+F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
new file mode 100644
index 0000000000..616a23bb56
--- /dev/null
+++ b/support/testing/tests/package/test_weston.py
@@ -0,0 +1,191 @@
+import os
+
+import infra.basetest
+
+
+class TestWeston(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_LLVM=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_WAYLAND_UTILS=y
+        BR2_PACKAGE_WESTON=y
+        BR2_PACKAGE_WESTON_SIMPLE_CLIENTS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            infra.filepath("tests/package/test_weston/linux-vkms.fragment"))
+
+    weston_ini_path = "/tmp/weston.ini"
+
+    def gen_read_disp_crcs_cmd(self, count=1):
+        # DRM CRCs are exposed through a sysfs pseudo file, one mesure
+        # per line. The first column is the frame number, the second
+        # column is the CRC measure. We use "head" to get the needed
+        # CRC count.
+        disp_crc_path = "/sys/kernel/debug/dri/0/crtc-0/crc/data"
+        cmd = f"head -{count} {disp_crc_path}"
+
+        # The DRM CRC sysfs pseudo file lines are terminated by '\n'
+        # and '\0'. We remove the '\0' to have a text-only output.
+        cmd += " | tr -d '\\000'"
+
+        # Finally, we drop the frame counter, and keep only the second
+        # column (CRC values)
+        cmd += " | cut -f 2 -d ' '"
+
+        return cmd
+
+    def gen_count_unique_disp_crcs_cmd(self, count=10):
+        # We get the command generating one CRC per line...
+        cmd = self.gen_read_disp_crcs_cmd(count)
+        # ...then count the number of unique values
+        cmd += " | uniq | wc -l"
+        return cmd
+
+    def create_weston_ini(self):
+        # The shell "clock-format" is set to "none", in order to have
+        # stable display output, independant from the time. The
+        # display output can then be reliably checked with VKMS CRC.
+        # "startup-animation" and "close-animation" are set to "none"
+        # for faster transitions (fade animations with a software GLES
+        # implementation tend to be slow). Finally, we force the
+        # smallest standard display output mode resolution, again for
+        # faster test execution.
+        weston_ini = "[shell]\n"
+        weston_ini += "clock-format=none\n"
+        weston_ini += "startup-animation=none\n"
+        weston_ini += "close-animation=none\n"
+        weston_ini += "[output]\n"
+        weston_ini += "name=Virtual-1\n"
+        weston_ini += "mode=640x480"
+
+        self.assertRunOk(f"cat >{self.weston_ini_path} <<EOF\n{weston_ini}\nEOF")
+
+    def start_weston(self):
+        self.assertRunOk("export XDG_RUNTIME_DIR=/tmp")
+
+        cmd = "weston"
+        cmd += f" --config={self.weston_ini_path}"
+        cmd += " --continue-without-input"
+        cmd += " --log=/tmp/weston.log"
+        cmd += " &> /dev/null &"
+        self.assertRunOk(cmd)
+
+        self.assertRunOk("export WAYLAND_DISPLAY=wayland-1")
+
+    def wait_for_weston(self):
+        # We wait for the wayland socket to appear...
+        wayland_socket = "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}"
+        cmd = f"while [ ! -e \"{wayland_socket}\" ] ; do sleep 1 ; done"
+        self.assertRunOk(cmd, timeout=10)
+
+    def stop_weston(self):
+        cmd = "killall weston && sleep 3"
+        self.assertRunOk(cmd)
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
+        # Check the weston binary can execute
+        self.assertRunOk("weston --version")
+
+        self.create_weston_ini()
+        self.start_weston()
+        self.wait_for_weston()
+
+        # Check a simple info client can communicate with the compositor
+        self.assertRunOk("wayland-info", timeout=10)
+
+        # This test will use the Kernel VKMS DRM Display CRC support,
+        # which is exposed in debugfs. See:
+        # https://docs.kernel.org/gpu/drm-uapi.html#display-crc-support
+        self.assertRunOk("mount -t debugfs none /sys/kernel/debug/")
+
+        # We get 10 consecutive DRM frame CRCs and count how many
+        # unique CRCs we have. Since weston is supposed to run idle,
+        # we should have 10 times the same display CRC.
+        cmd = self.gen_count_unique_disp_crcs_cmd()
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0]), 1)
+
+        # We save the CRC value of an empty weston desktop for
+        # later...
+        cmd = self.gen_read_disp_crcs_cmd()
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        weston_desktop_crc = int(output[0], 16)
+
+        # We start the weston-simple-egl in background...  Every
+        # rendered frame is supposed to be different (as the triangle
+        # animation is derived from the system time). Since all the
+        # rendering (client application and compositor) is in
+        # software, we sleep a bit to let those program to settle.
+        cmd = "weston-simple-egl >/dev/null 2>&1 & sleep 4"
+        self.assertRunOk(cmd, timeout=8)
+
+        # Since the weston-simple-egl client is supposed to run and
+        # display something, we are now supposed to measure a
+        # different display CRC than the one we measured when the
+        # desktop was empty.
+        cmd = self.gen_read_disp_crcs_cmd()
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertNotEqual(int(output[0], 16), weston_desktop_crc)
+
+        # While weston-simple-egl is running, we check the VKMS DRM
+        # CRCs are now changing. We get many CRCs, one per display
+        # driver refresh (at ~60Hz). Since all the rendering is in
+        # software, we can expect a slow frame rate. In 120 captured
+        # CRCs, we expect at least 4 different values (i.e. 2 fps).
+        # This guarantees the rendering pipeline is working, while we
+        # remain very permissive to slow emulation situations.
+        cmd = self.gen_count_unique_disp_crcs_cmd(120)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertGreaterEqual(int(output[0]), 4)
+
+        # We stop weston-simple-egl, and sleep a bit to let Weston do
+        # its cleanup and desktop repaint refresh...
+        self.assertRunOk("killall weston-simple-egl && sleep 4", timeout=8)
+
+        # After we stopped the application, we should have the initial
+        # weston desktop background. The CRC we measure now should be
+        # the same as the one we saved earlier.
+        cmd = self.gen_read_disp_crcs_cmd()
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0], 16), weston_desktop_crc)
+
+        self.stop_weston()
+
+        # Now weston is supposed to be stopped,
+        # a simple client is expected to fail.
+        _, exit_code = self.emulator.run("wayland-info")
+        self.assertNotEqual(exit_code, 0)
diff --git a/support/testing/tests/package/test_weston/linux-vkms.fragment b/support/testing/tests/package/test_weston/linux-vkms.fragment
new file mode 100644
index 0000000000..3fc7a5dded
--- /dev/null
+++ b/support/testing/tests/package/test_weston/linux-vkms.fragment
@@ -0,0 +1,2 @@
+CONFIG_DEBUG_FS=y
+CONFIG_DRM_VKMS=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
