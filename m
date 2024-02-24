Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BD2C5478C
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 00:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D71AE40999;
	Sat, 24 Feb 2024 00:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3oPK85fxe76b; Sat, 24 Feb 2024 00:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD5BC409AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD5BC409AB;
	Sat, 24 Feb 2024 00:36:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 076EE1BF41D
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 00:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7B5940999
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 00:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28TN1jB03KBn for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 00:36:32 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 24 Feb 2024 00:36:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7E3D4094C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7E3D4094C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=777eb98c4=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7E3D4094C
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 00:36:31 +0000 (UTC)
X-CSE-ConnectionGUID: W8Mj9za8TS23EVJosMdDvw==
X-CSE-MsgGUID: u0uhWYU0TiCyyx0a4MI1FA==
X-IronPort-AV: E=Sophos;i="6.06,180,1705334400"; d="scan'208";a="10047448"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Feb 2024 08:29:21 +0800
IronPort-SDR: UwOEAfNbqXEem3Xt6TEHNFamb50/rmXWk4rLtlyaykGXUPWQ9f9icKDIJWNSB5tk1U/TelTbet
 HYJ77Yfu+IIA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Feb 2024 15:33:04 -0800
IronPort-SDR: qHHTNmST8T+32XKOg4I7qJwzaYqh08baxQdMj+Kgf+wDiSbaqnaR67NH/UZT2tXPWBkimd45bU
 GnXUc+JzcvIw==
WDCIronportException: Internal
Received: from unknown (HELO fedora.wdc.com) ([10.225.165.26])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Feb 2024 16:29:19 -0800
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 10:28:44 +1000
Message-ID: <20240224002843.16382-2-wilfred.mallawa@wdc.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1708734991; x=1740270991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qMMQR2sBVG5kJKhnHReFof8y12sJJGvQz9DChrasopM=;
 b=WRXfYzGrOq2GsZtEDkntUPlYVjzyhwp4eKgnq95dBb91qhrdIXzrF6eN
 RWOpiiL1lW5ewuy5EWctnpx0zSLYOW7PRiPTpq+GLdzwIXJyfV5mkJA0D
 xvEzGJT1deXzO3qz8c7SCVJopYlD2+osqenGHBep7uQyovHJP0iB3AtCZ
 MJSCHqOXrWJIq3qmitnyKorX8jITT+3G5rClxLhdXsu1QzpRqEPQocJP0
 FN+QDENJz5lqvFaKY9TJJqvAf3Fly5C0F2Mxybx7if3EsUATJULXoy7i4
 zr9dBPXTtETN4d12QnilsuIwkkwyGn5335hKqnbTpEb58xvDR1ggco1wx
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=WRXfYzGr
Subject: [Buildroot] [PATCH 1/1] package/spdm-utils: new package
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>, alistair.francis@wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 package/Config.in                  |  1 +
 package/spdm-utils/Config.in       | 20 ++++++++++++++++++
 package/spdm-utils/spdm-utils.hash |  2 ++
 package/spdm-utils/spdm-utils.mk   | 34 ++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+)
 create mode 100644 package/spdm-utils/Config.in
 create mode 100644 package/spdm-utils/spdm-utils.hash
 create mode 100644 package/spdm-utils/spdm-utils.mk

diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..11075d08c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2697,6 +2697,7 @@ comment "Utilities"
 	source "package/screenfetch/Config.in"
 	source "package/sexpect/Config.in"
 	source "package/sudo/Config.in"
+	source "package/spdm-utils/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
 	source "package/tini/Config.in"
diff --git a/package/spdm-utils/Config.in b/package/spdm-utils/Config.in
new file mode 100644
index 0000000000..6729cbde90
--- /dev/null
+++ b/package/spdm-utils/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SPDM_UTILS
+	bool "spdm-utils"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # eudev
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # eudev
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_EUDEV
+	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_LIBSPDM
+	help
+	  SPDM-Utils is a Linux application designed to support,
+	  test and develop SPDM requesters and responders.
+	  SPDM-Utils uses libspdm as the backend to perform SPDM
+	  communication. SPDM-Utils currently supports the
+	  PCIe Data Object Exchange (DOE) Capability.
+
+	  https://github.com/westerndigitalcorporation/spdm-utils
\ No newline at end of file
diff --git a/package/spdm-utils/spdm-utils.hash b/package/spdm-utils/spdm-utils.hash
new file mode 100644
index 0000000000..0b4e5d2eea
--- /dev/null
+++ b/package/spdm-utils/spdm-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4bb5ac80ccac3928a6b6d15266e260bbc103d07c543b054664aac42a5472b7a6  spdm-utils-0.1.1.tar.gz
diff --git a/package/spdm-utils/spdm-utils.mk b/package/spdm-utils/spdm-utils.mk
new file mode 100644
index 0000000000..7574ea9b11
--- /dev/null
+++ b/package/spdm-utils/spdm-utils.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# spdm-utils
+#
+################################################################################
+
+SPDM_UTILS_VERSION = 0.1.1
+SPDM_UTILS_SITE = $(call github,westerndigitalcorporation,spdm-utils,v$(SPDM_UTILS_VERSION))
+SPDM_UTILS_LICENSE = Apache-2.0 or MIT
+SPDM_UTILS_POST_INSTALL_TARGET_HOOKS += SPDM_UTILS_INSTALL_CERTS
+SPDM_UTILS_DEPENDENCIES += pciutils libspdm openssl
+
+# Force PyO3 to configure as a cross-compilation
+export PYO3_CROSS=1
+
+define SPDM_UTILS_INSTALL_CERTS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/root/certs
+	cp -r $(@D)/certs/generate_certs.sh $(TARGET_DIR)/root/certs/
+	cp -r $(@D)/certs/openssl-alias.cnf $(TARGET_DIR)/root/certs/
+	cp -r $(@D)/certs/openssl.cnf $(TARGET_DIR)/root/certs/
+	cp -r $(@D)/certs/setup_certs.sh $(TARGET_DIR)/root/certs/
+
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/root/certs/slot0
+	cp $(@D)/certs/slot0/immutable.der $(TARGET_DIR)/root/certs/slot0
+	cp $(@D)/certs/slot0/device.cert.der $(TARGET_DIR)/root/certs/slot0
+	cp $(@D)/certs/slot0/device.der $(TARGET_DIR)/root/certs/slot0
+	cp $(@D)/certs/slot0/device.key $(TARGET_DIR)/root/certs/slot0
+	cp $(@D)/certs/slot0/param.pem $(TARGET_DIR)/root/certs/slot0
+
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/root/manifest
+	cp $(@D)/manifest/manifest.out.cbor $(TARGET_DIR)/root/manifest
+endef
+
+$(eval $(cargo-package))
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
