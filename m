Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80D1C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAB3B40432;
	Wed, 19 Apr 2023 19:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAB3B40432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDCoc2lEEe6s; Wed, 19 Apr 2023 19:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 188804035D;
	Wed, 19 Apr 2023 19:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 188804035D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7EC1C43BF
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 19:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0929F60DFE
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 19:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0929F60DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8r44xnC5ZkT for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 19:20:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23CC560C0F
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23CC560C0F
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 19:20:03 +0000 (UTC)
Received: from localhost.localdomain ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pDLUpSAY5S4PfpDLUpHaIs; Wed, 19 Apr 2023 21:20:00 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 21:19:56 +0200
Message-Id: <20230419191956.161587-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHxErARhvUJQwx+TdA9weC816N3irZ96QGBlcpMI9rsIj3oxBR1OKp2GHPsSztemM/O6mpqgCan4m4PHyOZ6lROtuM7Mm6IWLGy108efHWYy/3cr8cIj
 xIlqfe+0A0QtsKNJHgzlQOmdPIjDkASuVWUKu8O7oIHGlckyLpjlf1wI26afC0wZXUO2dvUU4G+nav9KfHP1agJW16ilBOIIdz/ZXCGzXAbe3Sb3XEVb2WPw
 IbhVFqPhpMNDDbq9L9flQsy7mwTztSbROXpfSmygTNPxQIJTDRKjoGD1Q3Cjq/e5eKca0crRl1qED5bdY77100e51ta0bxlW7lG/FZGEXAB5+W4ZbMope07g
 KzA+WNxNWj79fwVphYl9eoOJYvwYSQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1681932000; bh=p/tFZfDp7qe2hEmvPRTnQ9THywkqYayPY+ssQNIRsOw=;
 h=From:To:Subject:Date:MIME-Version;
 b=TaYNolwz+CFUXwvRgWNdxNlXSc0gmFtvUyX1uq0WunA0zhMz8e6SBW581QnZCoJ7W
 6WA8jNgZkuQuVUW1QxIXRhX+5ESh+YCdMRg5KS1ctJxXZ+zs0vEjgrGGPiOoLnIrRq
 MyTVkXn6roO09LFF4DOGCgwjqUTaUKbIjp6PdXmzvbaVKtGrJ7CTjOJLgtSmamTkIg
 RV1H3kC6PMe49tkr2lh5Or38jkx3/zAuDzNCWRAncn926NmcSxDCujm+/kBG4JU1fh
 RA0fXv8S3oukRkYAildUNOLCtF5KuXEHiEZp+e5+QnY2gbBzg1kEkQZUn5dXTYi/+n
 1EhrXJL44oubQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TaYNolwz
Subject: [Buildroot] [PATCH] package/esp-hosted-ng: add package
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
index 5cd882b579..643a90bdb5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1162,6 +1162,7 @@ F:	package/at/
 F:	package/binutils/
 F:	package/cryptsetup/
 F:	package/erlang-jiffy/
+F:	package/esp-hosted-ng/
 F:	package/gcc/
 F:	package/harfbuzz/
 F:	package/libfuse3/
diff --git a/package/Config.in b/package/Config.in
index eaac32a01a..4b2016c1bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -494,6 +494,7 @@ endmenu
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
index 0000000000..20bd290c52
--- /dev/null
+++ b/package/esp-hosted-ng/esp-hosted-ng.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  51e6881d95689f4146469cb23182e03481e9a5572f6272bbb4594559c4fd719d  esp-hosted-ng-cf871bbaef0906b34812a1e920c745fe101d855e.tar.gz
+sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted-ng/esp-hosted-ng.mk b/package/esp-hosted-ng/esp-hosted-ng.mk
new file mode 100644
index 0000000000..1fef6ff1bb
--- /dev/null
+++ b/package/esp-hosted-ng/esp-hosted-ng.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# esp-hosted-ng
+#
+################################################################################
+
+ESP_HOSTED_NG_VERSION = cf871bbaef0906b34812a1e920c745fe101d855e
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
