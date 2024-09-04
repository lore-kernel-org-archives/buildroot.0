Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C043CD37AE
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 03:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AC2440332;
	Wed,  4 Sep 2024 03:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgA2sqrAQ5xg; Wed,  4 Sep 2024 03:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3D8340A88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3D8340A88;
	Wed,  4 Sep 2024 03:45:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4BB81BF573
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 03:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D24816082B
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 03:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDnnd78X9vew for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 03:45:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8F8760828
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8F8760828
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8F8760828
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 03:45:39 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 4843jP9W047301
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Wed, 4 Sep 2024 11:45:25 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 11:45:25 +0800
To: <buildroot@buildroot.org>
Date: Wed, 4 Sep 2024 11:45:18 +0800
Message-ID: <20240904034520.2058647-2-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904034520.2058647-1-peterlin@andestech.com>
References: <20240904034520.2058647-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 4843jP9W047301
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=andestech.com
Subject: [Buildroot] [PATCH 1/3] package: andes-spi-burn: new package
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
 package/andes-spi-burn/Config.in.host      | 38 ++++++++++++++++++++++
 package/andes-spi-burn/andes-spi-burn.hash |  2 ++
 package/andes-spi-burn/andes-spi-burn.mk   | 25 ++++++++++++++
 5 files changed, 67 insertions(+)
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
index 0000000000..8acb48d083
--- /dev/null
+++ b/package/andes-spi-burn/Config.in.host
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_HOST_ANDES_SPI_BURN
+	bool "host andes-spi-burn"
+	depends on BR2_riscv
+	help
+		Andes Technology SPI_burn tool to program bootloader and
+		device-tree blob onto flash memory of AE350 platform.
+
+		Ensure you have an ICEman connection set up as follows:
+
+		  Local Host                 Local/Remote Host
+		 .-----------------.          .--------------.
+		 | buildroot images|          |              |
+		 |                 |         ICEman host <IP:PORT>
+		 | .----------.    |          |  .--------.  |
+		 | | SPI_burn |<---+--socket--+->| ICEman |  |
+		 | '----------'    |          |  '--.-----'  |
+		 '-----------------'          '-----|--------'
+		                                    |
+		                                    USB
+		   .--------------.                 |
+		   | target       |           .-----v-----.
+		   | board        <----JTAG---| ICE       |
+		   |              |           '-----------'
+		   '--------------'
+
+		Commands:
+		$ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x0     -i u-boot-spl.bin
+		$ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x10000 -i u-boot.itb
+		$ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0xf0000 -i ae350.dtb
+
+		Note that the --addr option specifies the offset starting from
+		the flash base address 0x80000000 and set by U-Boot configurations.
+		e.g.
+		u-boot-spl.bin: CONFIG_SPL_TEXT_BASE=0x80000000
+		u-boot.itb    : CONFIG_SPL_LOAD_FIT_ADDRESS=0x80010000
+		ae350.dtb     : CONFIG_SYS_FDT_BASE=0x800f0000
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
