Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C943CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7701841100;
	Thu, 30 Oct 2025 21:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftsOR-HWGERX; Thu, 30 Oct 2025 21:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FFA341695
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FFA341695;
	Thu, 30 Oct 2025 21:02:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00F172A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C95E1843AD
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPlAaTGPibTi for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0446F843AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0446F843AF
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02E028292F; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:16:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49a81c77d79fabd27e893566a32778b08074a594
X-Git-Newrev: bf4e1ec19f7714b03243afaa29b15f8b29ba8fea
X-Patchwork-Hint: ignore
Message-Id: <20251030210243.02E028292F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snagboot: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bf4e1ec19f7714b03243afaa29b15f8b29ba8fea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a package for Snagboot, the open-source
vendor-neutral recover and reflashing tool for embedded targets. We
install the dependencies needed for snagrecover and snagflash, but we
don't bother installing the dependencies of the GUI-based snagfactory,
as that would require Kivy on the host, which is Qt based.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                     |  2 ++
 package/Config.in.host                         |  1 +
 package/snagboot/Config.in.host                |  8 +++++++
 package/snagboot/snagboot.hash                 |  3 +++
 package/snagboot/snagboot.mk                   | 29 ++++++++++++++++++++++++++
 support/testing/tests/package/test_snagboot.py | 16 ++++++++++++++
 6 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fa9fe7bbe2..7c2967f41d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3271,6 +3271,7 @@ F:	package/rt-tests/
 F:	package/rtc-tools/
 F:	package/sam-ba/
 F:	package/scons/
+F:	package/snagboot/
 F:	package/squashfs/
 F:	package/tinifier/
 F:	package/wayland/
@@ -3295,6 +3296,7 @@ F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_pyfatfs.py
 F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
+F:	support/testing/tests/package/test_snagboot.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 F:	support/testing/tests/package/test_python_xmodem.py
 F:	support/testing/tests/toolchain/test_external_arm.py
diff --git a/package/Config.in.host b/package/Config.in.host
index b0f7529a13..d0088364d0 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -112,6 +112,7 @@ menu "Host utilities"
 	source "package/sentry-cli/Config.in.host"
 	source "package/skopeo/Config.in.host"
 	source "package/sloci-image/Config.in.host"
+	source "package/snagboot/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/starfive-spltool/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/snagboot/Config.in.host b/package/snagboot/Config.in.host
new file mode 100644
index 0000000000..3087348a87
--- /dev/null
+++ b/package/snagboot/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_SNAGBOOT
+	bool "host snagboot"
+	help
+	  Snagboot intends to be an open-source and generic
+	  replacement to the vendor-specific, sometimes proprietary,
+	  tools used to recover and/or reflash embedded platforms.
+
+	  https://github.com/bootlin/snagboot/
diff --git a/package/snagboot/snagboot.hash b/package/snagboot/snagboot.hash
new file mode 100644
index 0000000000..e5978617aa
--- /dev/null
+++ b/package/snagboot/snagboot.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a3ace4245472141c0cdcd8e095530652ce95d804f7515a29613ddb07d2c32033  snagboot-2.4.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/snagboot/snagboot.mk b/package/snagboot/snagboot.mk
new file mode 100644
index 0000000000..12f77c0b14
--- /dev/null
+++ b/package/snagboot/snagboot.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# snagboot
+#
+################################################################################
+
+SNAGBOOT_VERSION = 2.4
+SNAGBOOT_SITE = $(call github,bootlin,snagboot,v$(SNAGBOOT_VERSION))
+SNAGBOOT_LICENSE = GPL-2.0
+SNAGBOOT_LICENSE_FILES = LICENSE
+SNAGBOOT_SETUP_TYPE = setuptools
+HOST_SNAGBOOT_DEPENDENCIES = \
+	host-python-pyyaml \
+	host-python-pyusb \
+	host-python-serial \
+	host-python-xmodem \
+	host-python-tftpy \
+	host-python-crccheck \
+	host-python-pylibfdt \
+	host-python-packaging \
+	host-python-pyfatfs
+
+# We do not install the dependencies for the snagfactory GUI
+define SNAGBOOT_REMOVE_SNAGFACTORY
+	$(RM) $(HOST_DIR)/bin/snagfactory
+endef
+HOST_SNAGBOOT_POST_INSTALL_HOOKS += SNAGBOOT_REMOVE_SNAGFACTORY
+
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_snagboot.py b/support/testing/tests/package/test_snagboot.py
new file mode 100644
index 0000000000..65fe196520
--- /dev/null
+++ b/support/testing/tests/package/test_snagboot.py
@@ -0,0 +1,16 @@
+import infra.basetest
+
+
+class TestHostSnagboot(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-snagboot"]
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_HOST_SNAGBOOT=y
+        """
+
+    def test_run(self):
+        cmd = ["host/bin/snagrecover", "--help"]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        cmd = ["host/bin/snagflash", "--help"]
+        infra.run_cmd_on_host(self.builddir, cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
