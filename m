Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DA7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:59:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3132860F3A
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3132860F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ED38402C1;
	Mon, 11 Oct 2021 20:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qjZKTUCx9km; Mon, 11 Oct 2021 20:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 660D64026B;
	Mon, 11 Oct 2021 20:59:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 903941BF279
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EAC84036A
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXvSnMZaTEwb for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 20:58:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64C4F40243
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 271C695442; Mon, 11 Oct 2021 20:55:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 22:50:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20de0f5bf64ba66e568a828d70e0cf8385edd785
X-Git-Newrev: 9fc7b49ab193da55b0a72d27b5e0ea33245b4df0
X-Patchwork-Hint: ignore
Message-Id: <20211011205559.271C695442@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dtbocfg: new package
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
Content-Type: multipart/mixed; boundary="===============3160957916419983258=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3160957916419983258==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9fc7b49ab193da55b0a72d27b5e0ea33245b4df0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dtbocfg, which stands for Device Tree Blob Overlay Configuration
File System, was developed to serve as a userspace API of Device
Tree Overlay.

https://github.com/ikwzm/dtbocfg

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                    |  4 +++
 package/Config.in                             |  1 +
 package/dtbocfg/Config.in                     |  8 ++++++
 package/dtbocfg/dtbocfg.hash                  |  3 +++
 package/dtbocfg/dtbocfg.mk                    | 18 +++++++++++++
 support/testing/tests/package/test_dtbocfg.py | 37 +++++++++++++++++++++++++++
 6 files changed, 71 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7ebfc9234b..b23dab7aeb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1149,6 +1149,10 @@ F:	package/sysrepo/
 N:	Henrique Camargo <henrique@henriquecamargo.com>
 F:	package/json-glib/
 
+N:	Hervé Codina <herve.codina@bootlin.com>
+F:	package/dtbocfg/
+F:	support/testing/tests/package/test_dtbocfg.py
+
 N:	Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
 F:	package/gauche/
 F:	package/gmrender-resurrect/
diff --git a/package/Config.in b/package/Config.in
index 9fed0ab4cb..ba1ee4005c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,6 +460,7 @@ endmenu
 	source "package/dmidecode/Config.in"
 	source "package/dmraid/Config.in"
 	source "package/dt-utils/Config.in"
+	source "package/dtbocfg/Config.in"
 	source "package/dtv-scan-tables/Config.in"
 	source "package/dump1090/Config.in"
 	source "package/dvb-apps/Config.in"
diff --git a/package/dtbocfg/Config.in b/package/dtbocfg/Config.in
new file mode 100644
index 0000000000..c1e8318e5c
--- /dev/null
+++ b/package/dtbocfg/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DTBOCFG
+	bool "dtbocfg"
+	help
+	  dtbocfg, which stands for Device Tree Blob Overlay
+	  Configuration File System, was developed to serve
+	  as a userspace API of Device Tree Overlay.
+
+	  https://github.com/ikwzm/dtbocfg
diff --git a/package/dtbocfg/dtbocfg.hash b/package/dtbocfg/dtbocfg.hash
new file mode 100644
index 0000000000..7db69f9e59
--- /dev/null
+++ b/package/dtbocfg/dtbocfg.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  faa53aefd7f7636c65e2b56bec223d2bc7676354e3ad9b5c1691aca349b9bbb8  dtbocfg-0.0.9.tar.gz
+sha256  e57cb9f2ed607cd95bf1b64371325c505c1ac8fe640a8c9933e7fe7637a38567  LICENSE
diff --git a/package/dtbocfg/dtbocfg.mk b/package/dtbocfg/dtbocfg.mk
new file mode 100644
index 0000000000..68beb1a45e
--- /dev/null
+++ b/package/dtbocfg/dtbocfg.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# dtbocfg
+#
+################################################################################
+
+DTBOCFG_VERSION = 0.0.9
+DTBOCFG_SITE = $(call github,ikwzm,dtbocfg,v$(DTBOCFG_VERSION))
+DTBOCFG_LICENSE = BSD-2-Clause
+DTBOCFG_LICENSE_FILES = LICENSE
+
+define DTBOCFG_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_OF_OVERLAY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CONFIGFS_FS)
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_dtbocfg.py b/support/testing/tests/package/test_dtbocfg.py
new file mode 100644
index 0000000000..d25b1692b4
--- /dev/null
+++ b/support/testing/tests/package/test_dtbocfg.py
@@ -0,0 +1,37 @@
+import os
+
+import infra.basetest
+
+
+class TestDtbocfg(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+        BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_PACKAGE_DTBOCFG=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel = os.path.join(self.builddir, "images", "zImage")
+        kernel_cmdline = ["console=ttyAMA0"]
+        dtb = infra.download(self.downloaddir, "vexpress-v2p-ca9.dtb")
+        options = ["-M", "vexpress-a9", "-dtb", dtb, "-initrd", img]
+
+        self.emulator.boot(arch="armv7", kernel=kernel,
+                           kernel_cmdline=kernel_cmdline,
+                           options=options)
+        self.emulator.login()
+        self.assertRunOk("modprobe dtbocfg.ko")
+        self.assertRunOk("mkdir /tmp/config && mount -t configfs none /tmp/config")
+
+        # Check that overlays directory is present.
+        # From dtbocfg site (https://github.com/ikwzm/dtbocfg):
+        #   If /config/device-tree/overlays is created, it is ready to use
+        #   dtbocfg
+        self.assertRunOk("ls /tmp/config/device-tree/overlays/")

--===============3160957916419983258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3160957916419983258==--
