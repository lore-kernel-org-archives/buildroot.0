Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56257EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDF8141E4C;
	Tue, 11 Jul 2023 21:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDF8141E4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzmiQ1GpgKWG; Tue, 11 Jul 2023 21:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C962141E50;
	Tue, 11 Jul 2023 21:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C962141E50
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 232881BF32D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0CDC83A4D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0CDC83A4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4AzKJlPSiAK9 for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:55:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E871883A4C
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E871883A4C
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:55:06 +0000 (UTC)
Received: from localhost.localdomain ([146.241.40.132])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JLK3q5g1uLSVYJLK3qiPhX; Tue, 11 Jul 2023 23:55:03 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 23:55:02 +0200
Message-Id: <20230711215502.3638293-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKvv4YuEKnztxBHoGjLZbecp/B6r1UvSIuCtNOZ2w6zs+VnKS7IDi5mZl4X6y0UBQAeOt4/M94+8AddPkbe0s2gFrrd4t4FTjPx4qaSc4rTOhSBJ1WAL
 Ia+j5wT879HqpE8mPdAQ9Zv0Mq48MdCaQUNlvVQS8ZWY67TbUVrA6XndagOMrRNBgbc2Vs3VX5PyXNRGG89U7PK2NOjd+wEX24M3hd10K2QW0qsZqXasPMcU
 QYd5iHVYqBYCBsyVZGsAmY9VYCyB6Pcllo+4IzSwDQQMsi+Z5lXZO/9pv2Z1yN+p935Y5WgDIWgBPE/tCK7tNYu0MbOEBBUnRyCiabmPJutYrV5JJ9bQaT0S
 hz7KjH9z6tDMAlMdURp9n4KiR7w3bQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689112503; bh=6eBpNIG2YwGi2Wer/ocuTxXIKTuhLOfuRyNJ6K6oBi8=;
 h=From:To:Subject:Date:MIME-Version;
 b=S9qnr9KYDoxvxt78kOfsVIRTv+Flm0SuoEXNYVp+DaTiF5uZWZUzlTZbXPgPu1eDZ
 81FmbmHt53BZV/8CFbokc2qjmccOFFgPYe6zijkW0gHwztAWRJRWaTGWZAmaD888hA
 WZn9x/es31lvFT8TMc/sxeqsNq0oXotYSgTh+0QqHoUU1Qq2LQwmQ/MDCZe+mcqCEg
 8PQX7j0StF8klYDcdLaeFATAZDnW/zmLAZAxwD50NawNtxUpQr4IsGG3xN5tlmNZVU
 Co5W3K2pUI++xTPf0TUBwkKRjfxsbhsSJ6Fu9UhzPnPoXVdfTOUB4+cNzn8BxHAOqt
 9MQAjFJDWXLdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=S9qnr9KY
Subject: [Buildroot] [PATCH v2] package/esp-hosted-ng: add package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Taube <jesse.taube@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds esp-hosted-ng package that allows to build Linux Kernel
Driver for Espressif Esp32-* SoCs, that once programmed with the
corresponding firmware behave like a normal Wi-Fi module. Both SDIO and
SPI busses are supported and selectable.

Cc: Jesse Taube <jesse.taube@benettiengineering.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* bump to version 2023-07-11 to support latest Linux versions and ESP32-C6
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/esp-hosted-ng/Config.in          | 29 ++++++++++++++++++++++++
 package/esp-hosted-ng/esp-hosted-ng.hash |  3 +++
 package/esp-hosted-ng/esp-hosted-ng.mk   | 29 ++++++++++++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 package/esp-hosted-ng/Config.in
 create mode 100644 package/esp-hosted-ng/esp-hosted-ng.hash
 create mode 100644 package/esp-hosted-ng/esp-hosted-ng.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bf5cad0b04..f281d72b69 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1169,6 +1169,7 @@ F:	package/at/
 F:	package/binutils/
 F:	package/cryptsetup/
 F:	package/erlang-jiffy/
+F:	package/esp-hosted-ng/
 F:	package/gcc/
 F:	package/harfbuzz/
 F:	package/libfuse3/
diff --git a/package/Config.in b/package/Config.in
index 80c0840592..3ae62c7212 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -495,6 +495,7 @@ endmenu
 	source "package/edid-decode/Config.in"
 	source "package/edk2-non-osi/Config.in"
 	source "package/edk2-platforms/Config.in"
+	source "package/esp-hosted-ng/Config.in"
 	source "package/eudev/Config.in"
 	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
diff --git a/package/esp-hosted-ng/Config.in b/package/esp-hosted-ng/Config.in
new file mode 100644
index 0000000000..60f153d4dc
--- /dev/null
+++ b/package/esp-hosted-ng/Config.in
@@ -0,0 +1,29 @@
+comment "esp-hosted needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_ESP_HOSTED_NG
+	bool "esp-hosted-ng"
+	depends on BR2_LINUX_KERNEL
+	help
+	  This package builds and installs the Linux kernel driver for
+	  the Esp32-* Linux Wi-Fi driver. It supports both SDIO and SPI
+	  busses that is selectable. It is compatible with recent Linux
+	  kernels (>= 5.4).
+
+if BR2_PACKAGE_ESP_HOSTED_NG
+
+choice
+	prompt "esp-hosted-ng bus"
+	default BR2_PACKAGE_ESP_HOSTED_NG_SDIO
+	help
+	  Select which bus type esp is attached to
+
+config BR2_PACKAGE_ESP_HOSTED_NG_SDIO
+	bool "SDIO"
+
+config BR2_PACKAGE_ESP_HOSTED_NG_SPI
+	bool "SPI"
+
+endchoice
+
+endif
diff --git a/package/esp-hosted-ng/esp-hosted-ng.hash b/package/esp-hosted-ng/esp-hosted-ng.hash
new file mode 100644
index 0000000000..7412cb849e
--- /dev/null
+++ b/package/esp-hosted-ng/esp-hosted-ng.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3310845b2324bda5774b91bcdd3f47621126f4a0011a0f61e31b0ad4a44db2f5  esp-hosted-ng-11e90f185a5a9922343e73e44032816a0e3ddedb.tar.gz
+sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted-ng/esp-hosted-ng.mk b/package/esp-hosted-ng/esp-hosted-ng.mk
new file mode 100644
index 0000000000..7040693e8c
--- /dev/null
+++ b/package/esp-hosted-ng/esp-hosted-ng.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# esp-hosted-ng
+#
+################################################################################
+
+ESP_HOSTED_NG_VERSION = 11e90f185a5a9922343e73e44032816a0e3ddedb
+ESP_HOSTED_NG_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_NG_VERSION))
+ESP_HOSTED_NG_DEPENDENCIES = linux
+ESP_HOSTED_NG_LICENSE = GPL-2.0
+ESP_HOSTED_NG_LICENSE_FILE = LICENSE
+ESP_HOSTED_NG_MODULE_SUBDIRS = esp_hosted_ng/host
+
+define ESP_HOSTED_NG_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BT)
+endef
+
+ifeq ($(BR2_PACKAGE_ESP_HOSTED_NG_SPI),y)
+ESP_HOSTED_NG_MODULE_MAKE_OPTS = target=spi
+else
+ESP_HOSTED_NG_MODULE_MAKE_OPTS = target=sdio
+endif
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
