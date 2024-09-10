Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F63DECE582
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 06:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8908404E0;
	Tue, 10 Sep 2024 06:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUDbt7ZHBu56; Tue, 10 Sep 2024 06:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76A3E4098B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76A3E4098B;
	Tue, 10 Sep 2024 06:26:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3D8A1BF303
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 06:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9206880ADF
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 06:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZwSSjthn4wa for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 06:26:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3990680AD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3990680AD9
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3990680AD9
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 06:26:50 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 48A6QdtP086353
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Tue, 10 Sep 2024 14:26:39 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Sep
 2024 14:26:39 +0800
To: <buildroot@buildroot.org>
Date: Tue, 10 Sep 2024 14:26:32 +0800
Message-ID: <20240910062635.4193650-2-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910062635.4193650-1-peterlin@andestech.com>
References: <20240910062635.4193650-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 48A6QdtP086353
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=andestech.com
Subject: [Buildroot] [PATCH v3 1/4] package/andes-spi-burn: new package
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
 package/andes-spi-burn/andes-spi-burn.hash |  3 +++
 package/andes-spi-burn/andes-spi-burn.mk   | 27 ++++++++++++++++++++++
 5 files changed, 40 insertions(+)
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
index 0000000000..cd92b448bf
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
+	  https://github.com/andestech/Andes-Development-Kit
diff --git a/package/andes-spi-burn/andes-spi-burn.hash b/package/andes-spi-burn/andes-spi-burn.hash
new file mode 100644
index 0000000000..5e4b4c8c97
--- /dev/null
+++ b/package/andes-spi-burn/andes-spi-burn.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  d354611540a553fe59ea5a1660426d13c43fb29c378734fe455af2ea6e85b728  flash_v5.3.0.zip
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/andes-spi-burn/andes-spi-burn.mk b/package/andes-spi-burn/andes-spi-burn.mk
new file mode 100644
index 0000000000..45f9638d27
--- /dev/null
+++ b/package/andes-spi-burn/andes-spi-burn.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# andes-spi-burn
+#
+################################################################################
+
+ANDES_SPI_BURN_VERSION = 5.3.0
+ANDES_SPI_BURN_SOURCE = flash_v$(ANDES_SPI_BURN_VERSION).zip
+ANDES_SPI_BURN_SITE = https://github.com/andestech/meta-andes/releases/download/ast-v5_3_0-release
+ANDES_SPI_BURN_LICENSE = Apache-2.0
+ANDES_SPI_BURN_FILES = LICENSE
+
+define HOST_ANDES_SPI_BURN_EXTRACT_CMDS
+	$(UNZIP) $(HOST_ANDES_SPI_BURN_DL_DIR)/$(ANDES_SPI_BURN_SOURCE) -d $(@D)
+	mv $(@D)/flash/* $(@D)
+	rmdir $(@D)/flash
+endef
+
+define HOST_ANDES_SPI_BURN_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/src-SPI_burn --makefile=Makefile_SPIburn_linux
+endef
+
+define HOST_ANDES_SPI_BURN_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src-SPI_burn/SPI_burn $(HOST_DIR)/bin/SPI_burn
+endef
+
+$(eval $(host-generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
