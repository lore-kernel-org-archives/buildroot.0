Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E29D10C04
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 19:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6107E403A8;
	Sat, 26 Oct 2024 19:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCy6eNDs9UnZ; Sat, 26 Oct 2024 19:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 264864047D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 264864047D;
	Sat, 26 Oct 2024 19:14:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 296542318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90FB9400D7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0xEcd4KRWe2 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F1DE40003
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F1DE40003
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B389840F0; Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 21:12:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab3fb12c79e3edd809923f762cafcedd29b9df29
X-Git-Newrev: ee9d6414d1a27eaf6a5909e746190239c2982740
X-Patchwork-Hint: ignore
Message-Id: <20241026191437.4B389840F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/andes-spi-burn: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ee9d6414d1a27eaf6a5909e746190239c2982740
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new package for Andes AE350 SPI_burn tool to program
flash memory.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in.host                     |  1 +
 package/andes-spi-burn/Config.in.host      |  8 ++++++++
 package/andes-spi-burn/andes-spi-burn.hash |  3 +++
 package/andes-spi-burn/andes-spi-burn.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c7a968b6c2..7f9a60b1b9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2516,6 +2516,7 @@ F:	package/tcf-agent/
 N:	Yu Chien Peter Lin <peterlin@andestech.com>
 F:	board/andes
 F:	configs/andes_ae350_45_defconfig
+F:	package/andes-spi-burn/
 F:	package/kmon/
 
 N:	Olaf Rempel <razzor@kopf-tisch.de>
diff --git a/package/Config.in.host b/package/Config.in.host
index e4fbee4f2a..191833d94d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -4,6 +4,7 @@ menu "Host utilities"
 	source "package/aespipe/Config.in.host"
 	source "package/agent-proxy/Config.in.host"
 	source "package/amlogic-boot-fip/Config.in.host"
+	source "package/andes-spi-burn/Config.in.host"
 	source "package/android-tools/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
diff --git a/package/andes-spi-burn/Config.in.host b/package/andes-spi-burn/Config.in.host
new file mode 100644
index 0000000000..09d5ddb2b4
--- /dev/null
+++ b/package/andes-spi-burn/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_ANDES_SPI_BURN
+	bool "host andes-spi-burn"
+	depends on BR2_riscv
+	help
+	  Andes Technology SPI_burn tool to program bootloader and
+	  device-tree blob onto flash memory of AE350 platform.
+
+	  https://github.com/andestech/IntelJ3
diff --git a/package/andes-spi-burn/andes-spi-burn.hash b/package/andes-spi-burn/andes-spi-burn.hash
new file mode 100644
index 0000000000..5022f0fc1b
--- /dev/null
+++ b/package/andes-spi-burn/andes-spi-burn.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  72a5b016ebe0da77662a10edb8078c29cfcbedd8c0ff523d299248e0b1fb84dd  andes-spi-burn-5b8193c35360febd8445cfa32adc6b13a861616d.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/andes-spi-burn/andes-spi-burn.mk b/package/andes-spi-burn/andes-spi-burn.mk
new file mode 100644
index 0000000000..8ee5fb2897
--- /dev/null
+++ b/package/andes-spi-burn/andes-spi-burn.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# andes-spi-burn
+#
+################################################################################
+
+ANDES_SPI_BURN_VERSION = 5b8193c35360febd8445cfa32adc6b13a861616d
+ANDES_SPI_BURN_SITE = $(call github,andestech,IntelJ3,$(ANDES_SPI_BURN_VERSION))
+ANDES_SPI_BURN_LICENSE = Apache-2.0
+ANDES_SPI_BURN_FILES = LICENSE
+
+define HOST_ANDES_SPI_BURN_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) -f Makefile_SPIburn
+endef
+
+define HOST_ANDES_SPI_BURN_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/SPI_burn $(HOST_DIR)/bin/SPI_burn
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
