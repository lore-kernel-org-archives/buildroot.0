Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F80C7EE25
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57E9A83495;
	Wed,  7 Jun 2023 20:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57E9A83495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYZLG-qA5N1J; Wed,  7 Jun 2023 20:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 112B383415;
	Wed,  7 Jun 2023 20:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 112B383415
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B459A1BF3D0
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 20:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E2EF40C10
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 20:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E2EF40C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pkOFix8Ma4hR for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 20:24:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1FEC40558
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1FEC40558
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 20:24:54 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.165.27])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7B2B619F72F;
 Wed,  7 Jun 2023 22:24:50 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  7 Jun 2023 22:24:39 +0200
Message-Id: <20230607202439.188050-2-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607202439.188050-1-ju.o@free.fr>
References: <20230607202439.188050-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1686169492;
 bh=bvhUww/rvx4WLYp4ze1IiiA/WYWDmZlbxs76HzAlRJI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bTQgtYqh0NyedWeWkWVhkRrhYqx6wYDn8AnIlc997EEr5rpXL3nttRam6d7B6HLBE
 X7dPy1lN1txE56LTUMqJB3RFMc2hjtVaNApHvaIz1JrI5zB6Qa4cuQ7lWemk9NvMM5
 41z7F5Ggl5/3f4+urh5BUfpOggeFXvV8s8fZqgIwMeIfh1Q2pNtM+RW6tP/BqBGElk
 QX0m9VuYEVPbN2ZVvnXbCBchj9efTAOr5/JC+6ECLx89ATZIUZpMC/xYL8oKrfWU7h
 DdUw3sQE2+XVFo7IGRu6qa/vt3t5XmXI1YTYPzCA3oP+wasTZ1eXOWYJn7BtMqQq6i
 /YtU9VH5SpDpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bTQgtYqh
Subject: [Buildroot] [PATCH 2/2]
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch series tested on branch master at commit a4fec34 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_glslsandbox_player
    ...
    OK
---
 DEVELOPERS                                    |  2 +
 .../tests/package/test_glslsandbox_player.py  | 50 +++++++++++++++++++
 .../linux-vkms.fragment                       |  1 +
 3 files changed, 53 insertions(+)
 create mode 100644 support/testing/tests/package/test_glslsandbox_player.py
 create mode 100644 support/testing/tests/package/test_glslsandbox_player/linux-vkms.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 7aa5980df7..d2730f0cef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1737,6 +1737,8 @@ F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
+F:	support/testing/tests/package/test_glslsandbox_player.py
+F:	support/testing/tests/package/test_glslsandbox_player/
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
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
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
