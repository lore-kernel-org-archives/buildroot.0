Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4370CD98F2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 21:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A395D606ED;
	Mon, 22 Jun 2026 21:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrskybPN9o74; Mon, 22 Jun 2026 21:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E5D3606F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782164444;
	bh=kI0sG4k+Zl3r97oY15h2xqWf3ZzrmmXdjc5pGWQ2tZs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Eeug922maqAwy1RSCD1s58BQ1xjFLGtl21xTvziDjH5YooptTJfAdohv0DHhj0/Un
	 MsPcLIXTeTs5C7wbY7n1mP0seJ1vL3NLz12HNQYVkrP1irkPYN0RIZhcxyJeEfy5aM
	 QVnv84Q7p5AiDD3vzZxpl0tJKTJwqS/PbwVnQm4CmVjt9tEgEpLtX5Yb6kOMPqitC1
	 JBko1Qhes/Mmm9zyzohF8yWyiy6PjX1xOP4S01S5IZ1FPR7ZAbCc20nrWPw24B7T+u
	 zoYrDXArT0oYaWsK5sl+7N614vcVPQCGk10wlg1V6YTSwsSaBOIv7uL8EwAeq+YGrQ
	 xlspC/2fNPQXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E5D3606F6;
	Mon, 22 Jun 2026 21:40:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FEA1367
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1207C80E7F
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qz-gzGCQ4LbD for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 21:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF7280E92
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AF7280E92
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD6368401E; Mon, 22 Jun 2026 21:40:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jun 2026 23:21:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 899918c53bf7cbc4c4f2cf9b08ee44b854a273f4
X-Git-Newrev: 8b165e728e2b538e8beb4c629f993885c51630fe
X-Patchwork-Hint: ignore
Message-Id: <20260622214015.DD6368401E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add virglrenderer test
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b165e728e2b538e8beb4c629f993885c51630fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add basic smoke test for glmark2 running in a nested qemu guest with
virtio-gpu-gl-pci.

The outer machine uses the Mesa softpipe driver for GLES support with
minimal dependencies. Just test virgl for now, as lavapipe
(software Vulkan driver) requires LLVM, and this validates
virglrenderer.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
[Romain: add gitlab-runner "2xlarge" tag]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                         |   1 +
 .../testing/tests/package/test_virglrenderer.py    | 160 +++++++++++++++++++++
 .../test_virglrenderer/linux-inner.fragment        |   4 +
 .../test_virglrenderer/linux-outer.fragment        |   6 +
 .../rootfs-overlay/etc/profile.d/stty-raw.sh       |   3 +
 5 files changed, 174 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 850978181c..5a09be9bff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1764,6 +1764,7 @@ F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
 F:	package/virglrenderer/
+F:	support/testing/tests/package/test_virglrenderer.py
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/support/testing/tests/package/test_virglrenderer.py b/support/testing/tests/package/test_virglrenderer.py
new file mode 100644
index 0000000000..5db9f32614
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer.py
@@ -0,0 +1,160 @@
+import os
+
+import infra
+import infra.basetest
+from infra.builder import Builder
+
+
+# gitlab-runner: 2xlarge
+class TestVirglrendererNestedQemu(infra.basetest.BRTest):
+    outer_kern_frag = \
+        infra.filepath("tests/package/test_virglrenderer/linux-outer.fragment")
+    inner_kern_frag = \
+        infra.filepath("tests/package/test_virglrenderer/linux-inner.fragment")
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_virglrenderer/rootfs-overlay")
+
+    # Softpipe has no hardware dependencies and does not pull LLVM into the
+    # outer build, unlike llvmpipe/lavapipe.
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{outer_kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_LIBGLVND=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_QEMU=y
+        BR2_PACKAGE_QEMU_SYSTEM=y
+        # BR2_PACKAGE_QEMU_SYSTEM_KVM is not set
+        BR2_PACKAGE_QEMU_SYSTEM_TCG=y
+        # BR2_PACKAGE_QEMU_BLOBS is not set
+        BR2_PACKAGE_QEMU_CHOOSE_TARGETS=y
+        BR2_PACKAGE_QEMU_TARGET_AARCH64=y
+        BR2_PACKAGE_QEMU_VIRGLRENDERER=y
+        BR2_TARGET_ROOTFS_INITRAMFS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    inner_config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{inner_kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_KMSCUBE=y
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_LIBGLVND=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def setUp(self):
+        self.inner_builder = None
+        super().setUp()
+
+        self.inner_builddir = os.path.join(self.outputdir,
+                                           f"{self.testname}-inner")
+        config = self.inner_config
+        config += f'\nBR2_DL_DIR="{self.downloaddir}"\n'
+        config += f"\nBR2_JLEVEL={self.jlevel}\n"
+        self.inner_builder = Builder(config, self.inner_builddir,
+                                     self.logtofile, self.jlevel)
+
+        if not self.keepbuilds:
+            self.inner_builder.delete()
+
+        if not self.inner_builder.is_finished():
+            self.show_msg("Building inner")
+            self.inner_builder.configure(
+                make_extra_opts=[f"BR2_EXTERNAL={':'.join(self.br2_external)}"])
+            self.inner_builder.build()
+            self.show_msg("Building inner done")
+
+    def tearDown(self):
+        try:
+            super().tearDown()
+        finally:
+            if self.inner_builder and not self.keepbuilds:
+                self.inner_builder.delete()
+
+    def boot_outer(self):
+        kern = os.path.join(self.builddir, "images", "Image")
+        inner_img_dir = os.path.join(self.inner_builddir, "images")
+        virtfs_tag = "br-inner"
+        virtfs_opts = [
+            f"local,path={inner_img_dir}",
+            f"mount_tag={virtfs_tag}",
+            "security_model=mapped-xattr",
+            "readonly=on"
+        ]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "1536M",
+                                    "-smp", "4",
+                                    "-vga", "none",
+                                    "-virtfs", ",".join(virtfs_opts)])
+        self.emulator.login()
+        self.assertRunOk(f"mount -t 9p {virtfs_tag} /mnt/")
+
+    def boot_inner(self):
+        qemu_cmd = "env LIBGL_ALWAYS_SOFTWARE=1 GALLIUM_DRIVER=softpipe"
+        qemu_cmd += " qemu-system-aarch64"
+        qemu_cmd += " -M virt,accel=tcg"
+        qemu_cmd += " -cpu cortex-a57"
+        qemu_cmd += " -m 512M"
+        qemu_cmd += " -nodefaults"
+        qemu_cmd += " -display egl-headless,gl=on"
+        qemu_cmd += " -device virtio-gpu-gl-pci"
+        qemu_cmd += " -serial stdio"
+        qemu_cmd += " -kernel /mnt/Image"
+        qemu_cmd += " -initrd /mnt/rootfs.cpio"
+        qemu_cmd += " -append 'console=ttyAMA0 br-inner-virgl'"
+
+        # qemu runs in the foreground on the current serial console. Once it
+        # starts, the next login prompt belongs to the inner guest.
+        self.emulator.qemu.sendline(qemu_cmd)
+        self.emulator.login(timeout=180)
+
+    def test_run(self):
+        self.boot_outer()
+        self.assertRunOk("while [ ! -e /dev/dri/renderD128 ]; do sleep 1; done",
+                         timeout=30)
+
+        self.boot_inner()
+
+        out, ret = self.emulator.run("cat /proc/cmdline")
+        self.assertEqual(ret, 0)
+        self.assertIn("br-inner-virgl", out[0])
+
+        cmd = "env MESA_LOADER_DRIVER_OVERRIDE=virtio_gpu"
+        cmd += " kmscube --vmode=640x480 --count=10"
+        out, ret = self.emulator.run(cmd, timeout=60)
+        self.assertEqual(ret, 0)
+
+        renderer = "\n".join([line for line in out
+                              if line.strip().startswith("renderer:")])
+        self.assertRegex(renderer, r'(?i)renderer:\s*"virgl \(softpipe\)"')
diff --git a/support/testing/tests/package/test_virglrenderer/linux-inner.fragment b/support/testing/tests/package/test_virglrenderer/linux-inner.fragment
new file mode 100644
index 0000000000..f2a6b539f7
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer/linux-inner.fragment
@@ -0,0 +1,4 @@
+CONFIG_BLK_DEV_INITRD=y
+# The inner guest runs kmscube against the virgl renderer exposed by QEMU.
+CONFIG_DRM=y
+CONFIG_DRM_VIRTIO_GPU=y
diff --git a/support/testing/tests/package/test_virglrenderer/linux-outer.fragment b/support/testing/tests/package/test_virglrenderer/linux-outer.fragment
new file mode 100644
index 0000000000..1023aedc6f
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer/linux-outer.fragment
@@ -0,0 +1,6 @@
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_DRM_VGEM=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_9P_FS=y
+CONFIG_9P_FS_POSIX_ACL=y
diff --git a/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh b/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh
new file mode 100644
index 0000000000..4427e5a143
--- /dev/null
+++ b/support/testing/tests/package/test_virglrenderer/rootfs-overlay/etc/profile.d/stty-raw.sh
@@ -0,0 +1,3 @@
+# Avoid double-cooking the inner serial console, otherwise the test
+# infrastructure cannot reliably retrieve return codes.
+grep -Fq br-inner-virgl /proc/cmdline && stty raw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
