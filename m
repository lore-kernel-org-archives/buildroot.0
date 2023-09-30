Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54815E732D6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5DDB41BE6;
	Sat, 30 Sep 2023 19:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5DDB41BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QlXbAiqr_-vG; Sat, 30 Sep 2023 19:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8FC441E2C;
	Sat, 30 Sep 2023 19:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8FC441E2C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89A531BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F6CC60F8E
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F6CC60F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJb8BMNG5TcH for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:39:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E27860F8D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E27860F8D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19C8283CDB; Sat, 30 Sep 2023 19:39:33 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 21:38:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ea2a27f9047696ce1c463ad55fb4a78df136954
X-Git-Newrev: 5ca8e5a4a771ed540245ee3a277ac8127c92c008
X-Patchwork-Hint: ignore
Message-Id: <20230930193933.19C8283CDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/amlogic-boot-fip: new host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ca8e5a4a771ed540245ee3a277ac8127c92c008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This tool is needed by some SoCs to sign the bootloader.

See the list of supported SoCs:
https://github.com/LibreELEC/amlogic-boot-fip

The variable BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE is used to specify
for which device this package needs to be used.

This tool uses pre-compiled binaries in order to sign the bootloader.
These binaries are provided under a proprietary license that prohibits
any redistribution of the resulting images.

A similar tool was tried to be added in the past:
http://patchwork.ozlabs.org/project/buildroot/patch/1533545408-11248-2-git-send-email-narmstrong@baylibre.com/
This time however a license file is present which can be used by
make legal-info. Additionally, acs_tool.pyc was replaced by acs_tool.py
and is therefore not compiled anymore.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
[Romain:
  add AMLOGIC_BOOT_FIP_REDISTRIBUTE = NO
  add qstrip for BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE
  remove build-fip-all.sh copy, not needed
  factorize file copy in HOST_AMLOGIC_BOOT_FIP_INSTALL_CMDS
  update commit log with the github url where we can find the list of supported SoCs.
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                     |  1 +
 package/Config.in.host                         |  1 +
 package/amlogic-boot-fip/Config.in.host        | 17 +++++++++++++
 package/amlogic-boot-fip/amlogic-boot-fip.hash |  3 +++
 package/amlogic-boot-fip/amlogic-boot-fip.mk   | 34 ++++++++++++++++++++++++++
 5 files changed, 56 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9c1e84fb4b..420d7cf15f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2644,6 +2644,7 @@ N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
 N:	Sebastian Weyer <sebastian.weyer@smile.fr>
+F:      package/amlogic-boot-fip/
 F:	package/nushell/
 F:	support/testing/tests/package/sample_nu.nu
 F:	support/testing/tests/package/test_nu.py
diff --git a/package/Config.in.host b/package/Config.in.host
index 09dbf8308d..c80842c33a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -3,6 +3,7 @@ menu "Host utilities"
 	source "package/abootimg/Config.in.host"
 	source "package/aespipe/Config.in.host"
 	source "package/agent-proxy/Config.in.host"
+	source "package/amlogic-boot-fip/Config.in.host"
 	source "package/android-tools/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
diff --git a/package/amlogic-boot-fip/Config.in.host b/package/amlogic-boot-fip/Config.in.host
new file mode 100644
index 0000000000..d72bac568e
--- /dev/null
+++ b/package/amlogic-boot-fip/Config.in.host
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP
+	bool "host amlogic-boot-fip"
+	depends on BR2_HOSTARCH = "x86_64"
+	help
+	  Firmware Image Pacakge (FIP) sources used to sign Amlogic
+	  u-boot binaries in LibreELEC images
+
+	  https://github.com/LibreELEC/amlogic-boot-fip
+
+config BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE
+	string "fip device"
+	default "khadas-vim3"
+	depends on BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP
+	help
+	  Device for which you want to use this package.
+	  See the list of supported SoCs:
+	  https://github.com/LibreELEC/amlogic-boot-fip
diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.hash b/package/amlogic-boot-fip/amlogic-boot-fip.hash
new file mode 100644
index 0000000000..1a08341532
--- /dev/null
+++ b/package/amlogic-boot-fip/amlogic-boot-fip.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2cc06bc7d5647fd8c0025181fa42c4a8ef0ed16b918a1fa2060ea83c22e47b20  amlogic-boot-fip-e96b6a694380ff07d5a9e4be644ffe254bd18512.tar.gz
+sha256  4255537f71b1cd0d487de0fa2b8eddf1eb96ed96d119507336dde8b3782b86e6  LICENSE
diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.mk b/package/amlogic-boot-fip/amlogic-boot-fip.mk
new file mode 100644
index 0000000000..f98887cfcd
--- /dev/null
+++ b/package/amlogic-boot-fip/amlogic-boot-fip.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# amlogic-boot-fip
+#
+################################################################################
+
+AMLOGIC_BOOT_FIP_VERSION = e96b6a694380ff07d5a9e4be644ffe254bd18512
+AMLOGIC_BOOT_FIP_SITE = $(call github,LibreELEC,amlogic-boot-fip,$(AMLOGIC_BOOT_FIP_VERSION))
+AMLOGIC_BOOT_FIP_LICENSE = PROPRIETARY
+AMLOGIC_BOOT_FIP_LICENSE_FILES = LICENSE
+AMLOGIC_BOOT_FIP_REDISTRIBUTE = NO
+
+AMLOGIC_BOOT_FIP_INSTALL_DIR = $(BINARIES_DIR)/amlogic-boot-fip
+
+AMLOGIC_BOOT_FIP_DEVICE = $(call qstrip,$(BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE))
+
+AMLOGIC_BOOT_FIP_FILES_TO_INSTALL = build-fip.sh axg.inc g12a.inc gxbb.inc gxl.inc
+
+define HOST_AMLOGIC_BOOT_FIP_INSTALL_CMDS
+	mkdir -p $(AMLOGIC_BOOT_FIP_INSTALL_DIR)/$(AMLOGIC_BOOT_FIP_DEVICE)
+	$(foreach f,$(AMLOGIC_BOOT_FIP_FILES_TO_INSTALL),\
+		$(INSTALL) -D -m 0755 $(@D)/$(f) $(AMLOGIC_BOOT_FIP_INSTALL_DIR)/$(f)
+	)
+	cp -rf $(@D)/$(AMLOGIC_BOOT_FIP_DEVICE) $(AMLOGIC_BOOT_FIP_INSTALL_DIR)
+endef
+
+# check for empty device string when we're building
+ifeq ($(BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP)$(BR_BUILDING),yy)
+ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE)),)
+$(error No device specified for amlogic-boot-fip, please check your BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE setting)
+endif
+endif
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
