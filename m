Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184F2CD37AE
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 05:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EF6881118;
	Wed,  4 Sep 2024 05:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHQCaADy6oIs; Wed,  4 Sep 2024 05:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7795480D09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7795480D09;
	Wed,  4 Sep 2024 05:17:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AA121BF3D5
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 05:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 875DB405FD
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 05:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeSUQS9RassT for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 05:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2BBB4025C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2BBB4025C
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2BBB4025C
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 05:16:55 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 4845GEBZ010664
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Wed, 4 Sep 2024 13:16:14 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 13:16:15 +0800
To: <buildroot@buildroot.org>
Date: Wed, 4 Sep 2024 13:16:06 +0800
Message-ID: <20240904051609.2871616-2-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904051609.2871616-1-peterlin@andestech.com>
References: <20240904051609.2871616-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 4845GEBZ010664
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=andestech.com
Subject: [Buildroot] [PATCH v2 1/4] package: andes-spi-burn: new package
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
From: Yu Chien Peter Lin via buildroot <buildroot@buildroot.org>
Reply-To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: tim609@andestech.com, Yu Chien Peter Lin <peterlin@andestech.com>,
 ycliang@andestech.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a new package for Andes AE350 SPI_burn tool to program
flash memory.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in.host                     |  1 +
 package/andes-spi-burn/Config.in.host      |  8 +++++++
 package/andes-spi-burn/andes-spi-burn.hash |  2 ++
 package/andes-spi-burn/andes-spi-burn.mk   | 25 ++++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/andes-spi-burn/Config.in.host
 create mode 100644 package/andes-spi-burn/andes-spi-burn.hash
 create mode 100644 package/andes-spi-burn/andes-spi-burn.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 069965680b..aab5a6c05f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2487,6 +2487,7 @@ N:	Yu Chien Peter Lin <peterlin@andestech.com>
 F:	board/andes
 F:	configs/andes_ae350_45_defconfig
 F:	package/kmon/
+F:	package/andes-spi-burn/
 
 N:	Olaf Rempel <razzor@kopf-tisch.de>
 F:	package/ctorrent/
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
index 0000000000..fed4f49f5d
--- /dev/null
+++ b/package/andes-spi-burn/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_ANDES_SPI_BURN
+	bool "host andes-spi-burn"
+	depends on BR2_riscv
+	help
+		Andes Technology SPI_burn tool to program bootloader and
+		device-tree blob onto flash memory of AE350 platform.
+
+		https://github.com/andestech/Andes-Development-Kit
diff --git a/package/andes-spi-burn/andes-spi-burn.hash b/package/andes-spi-burn/andes-spi-burn.hash
new file mode 100644
index 0000000000..170f362646
--- /dev/null
+++ b/package/andes-spi-burn/andes-spi-burn.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6632bc0ddd0b6d07bd328758cd9132f48429d144079eb8011af60d95b0bdfd6b  flash.zip
diff --git a/package/andes-spi-burn/andes-spi-burn.mk b/package/andes-spi-burn/andes-spi-burn.mk
new file mode 100644
index 0000000000..2f7387ca2f
--- /dev/null
+++ b/package/andes-spi-burn/andes-spi-burn.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# andes-spi-burn
+#
+################################################################################
+
+ANDES_SPI_BURN_VERSION = 5.3.0
+ANDES_SPI_BURN_SOURCE = flash.zip
+ANDES_SPI_BURN_SITE = https://github.com/andestech/Andes-Development-Kit/releases/download/ast-v5_3_0-release-windows
+ANDES_SPI_BURN_LICENSE = Apache-2.0
+
+define HOST_ANDES_SPI_BURN_EXTRACT_CMDS
+	$(UNZIP) -q $(HOST_ANDES_SPI_BURN_DL_DIR)/$(ANDES_SPI_BURN_SOURCE) -d $(@D)
+endef
+
+define HOST_ANDES_SPI_BURN_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/flash/src-SPI_burn clean
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/flash/src-SPI_burn --makefile=Makefile_SPIburn_linux
+endef
+
+define HOST_ANDES_SPI_BURN_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/flash/src-SPI_burn/SPI_burn $(HOST_DIR)/bin/SPI_burn
+endef
+
+$(eval $(host-generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
