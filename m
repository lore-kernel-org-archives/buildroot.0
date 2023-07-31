Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A104BC00528
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 21:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 427AD607F0;
	Mon, 31 Jul 2023 21:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 427AD607F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CU2DVqtKHLQT; Mon, 31 Jul 2023 21:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 205CF61101;
	Mon, 31 Jul 2023 21:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 205CF61101
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26E961BF2B3
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 375AB4013B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 375AB4013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvL2lBQidnR0 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 21:23:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4194A408B0
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 21:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4194A408B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29B8E83E54; Mon, 31 Jul 2023 21:23:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 23:20:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 135bc0b0795eb67b94ca3fd39f211eede17f54e7
X-Git-Newrev: 7b2e5e6550aed4f79461919c6a59e00741eb4b11
X-Patchwork-Hint: ignore
Message-Id: <20230731212351.29B8E83E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: add package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b2e5e6550aed4f79461919c6a59e00741eb4b11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds esp-hosted package that allows to build the Linux
Kernel Driver for Espressif Esp32-* SoCs, that once programmed with
the corresponding firmware behave like a normal Wi-Fi module. Both
SDIO and SPI busses are supported and selectable.

Cc: Jesse Taube <jesse.taube@benettiengineering.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/esp-hosted/Config.in       | 29 +++++++++++++++++++++++++++++
 package/esp-hosted/esp-hosted.hash |  3 +++
 package/esp-hosted/esp-hosted.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 05a8d26988..a1f1cad5e6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1174,6 +1174,7 @@ F:	package/at/
 F:	package/binutils/
 F:	package/cryptsetup/
 F:	package/erlang-jiffy/
+F:	package/esp-hosted/
 F:	package/gcc/
 F:	package/harfbuzz/
 F:	package/libfuse3/
diff --git a/package/Config.in b/package/Config.in
index 1d30465434..5b65ed588f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -496,6 +496,7 @@ endmenu
 	source "package/edid-decode/Config.in"
 	source "package/edk2-non-osi/Config.in"
 	source "package/edk2-platforms/Config.in"
+	source "package/esp-hosted/Config.in"
 	source "package/eudev/Config.in"
 	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
new file mode 100644
index 0000000000..43c802fa44
--- /dev/null
+++ b/package/esp-hosted/Config.in
@@ -0,0 +1,29 @@
+comment "esp-hosted needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_ESP_HOSTED
+	bool "esp-hosted"
+	depends on BR2_LINUX_KERNEL
+	help
+	  This package builds and installs the Linux kernel driver for
+	  the Esp32-* Linux Wi-Fi driver. It supports both SDIO and SPI
+	  busses that is selectable. It is compatible with recent Linux
+	  kernels (>= 5.4).
+
+if BR2_PACKAGE_ESP_HOSTED
+
+choice
+	prompt "HW interface"
+	default BR2_PACKAGE_ESP_HOSTED_SDIO
+	help
+	  Select which bus type esp is attached to
+
+config BR2_PACKAGE_ESP_HOSTED_SDIO
+	bool "SDIO"
+
+config BR2_PACKAGE_ESP_HOSTED_SPI
+	bool "SPI"
+
+endchoice
+
+endif
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
new file mode 100644
index 0000000000..c17fe262a1
--- /dev/null
+++ b/package/esp-hosted/esp-hosted.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3310845b2324bda5774b91bcdd3f47621126f4a0011a0f61e31b0ad4a44db2f5  esp-hosted-11e90f185a5a9922343e73e44032816a0e3ddedb.tar.gz
+sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
new file mode 100644
index 0000000000..dcb0b3bd70
--- /dev/null
+++ b/package/esp-hosted/esp-hosted.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# esp-hosted
+#
+################################################################################
+
+ESP_HOSTED_VERSION = 11e90f185a5a9922343e73e44032816a0e3ddedb
+ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
+ESP_HOSTED_DEPENDENCIES = linux
+ESP_HOSTED_LICENSE = GPL-2.0
+ESP_HOSTED_LICENSE_FILE = LICENSE
+ESP_HOSTED_MODULE_SUBDIRS = esp_hosted_ng/host
+
+define ESP_HOSTED_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BT)
+endef
+
+ifeq ($(BR2_PACKAGE_ESP_HOSTED_SPI),y)
+ESP_HOSTED_MODULE_MAKE_OPTS = target=spi
+else
+ESP_HOSTED_MODULE_MAKE_OPTS = target=sdio
+endif
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
