Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A881C54E60
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 21:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E041F402D7;
	Thu, 14 Mar 2024 21:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2tHl1DK1UNNg; Thu, 14 Mar 2024 21:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A164032A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2A164032A;
	Thu, 14 Mar 2024 21:39:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B30F1BF3E9
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25B65408C9
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2X4tl92f5-oD for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 21:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=7968e6bc0=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6CD9407AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6CD9407AC
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6CD9407AC
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 21:39:42 +0000 (UTC)
X-CSE-ConnectionGUID: sRNEA3dIRfuN2CXHIG2/1Q==
X-CSE-MsgGUID: SZc7/cJxTT6258TNEfGWhA==
X-IronPort-AV: E=Sophos;i="6.07,126,1708358400"; d="scan'208";a="11153600"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2024 05:39:41 +0800
IronPort-SDR: +73GMX+VvihpL5KKBbGod7bTelHZHIOhWvReKsUlfGw4YgMoWVnNsnHtBD1cVTAzO4irGhBO7B
 AEVwrayhEdZA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2024 13:48:40 -0700
IronPort-SDR: 2lUn2oU29qe/ABnsRIEiIyIGk7tChvZX7YHe/LtNY/1qf56iya9ucg8M80STHUYt9gm+Z0wc5I
 SqUQYiy9t7Bg==
WDCIronportException: Internal
Received: from unknown (HELO fedora.wdc.com) ([10.225.165.69])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Mar 2024 14:39:40 -0700
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 07:39:14 +1000
Message-ID: <20240314213913.535911-2-wilfred.mallawa@wdc.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1710452382; x=1741988382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pIlvzraepwmYBRBbhU9MYQ0eCMoW+0nWmJ9UXoDJh7I=;
 b=ZTKDsTXNPfWo5jrO/e6kjQinzjRdbEc5DldBD/WmFb66f/UIdsWd4Wvd
 v06++a51q7X+MTPp6hFmEKPhHpIl85X8yxuFxxyj5qEtcwRoC920Kuir8
 ncB6PDYObNGkutlsb0lOhyfUARtA0mcB1Q7RPwr9UKiGGKd/jVEe04fnF
 4Hxp0G/Gjny5u61/+wxUcFdShTFCXtZxZz6BZPxH/Em2IanY/EwCGzNQ+
 FuYLSxDXA+G2SGjuADtUq6ayr+dd2tSCsdz1+WZbvQKjkvl5zRkN+xuPe
 TFYYjfpJNwpXvTlcUwXlI84SF/hI4qLl47ZM8X1D7grKeul4oW1ibKl76
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=ZTKDsTXN
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
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 package/Config.in                  |  1 +
 package/spdm-utils/Config.in       | 20 ++++++++++++++
 package/spdm-utils/spdm-utils.hash |  2 ++
 package/spdm-utils/spdm-utils.mk   | 43 ++++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 package/spdm-utils/Config.in
 create mode 100644 package/spdm-utils/spdm-utils.hash
 create mode 100644 package/spdm-utils/spdm-utils.mk

diff --git a/package/Config.in b/package/Config.in
index c677c3ff4a..1a31d40a0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2697,6 +2697,7 @@ comment "Utilities"
 	source "package/screen/Config.in"
 	source "package/screenfetch/Config.in"
 	source "package/sexpect/Config.in"
+	source "package/spdm-utils/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
diff --git a/package/spdm-utils/Config.in b/package/spdm-utils/Config.in
new file mode 100644
index 0000000000..97dbc51c6d
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
diff --git a/package/spdm-utils/spdm-utils.hash b/package/spdm-utils/spdm-utils.hash
new file mode 100644
index 0000000000..aaa243315e
--- /dev/null
+++ b/package/spdm-utils/spdm-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3f06f087220b126262a2becf68c9e06a59d8d613816f82a168c81093de087d1a  spdm-utils-0.3.0.tar.gz
diff --git a/package/spdm-utils/spdm-utils.mk b/package/spdm-utils/spdm-utils.mk
new file mode 100644
index 0000000000..5129635b06
--- /dev/null
+++ b/package/spdm-utils/spdm-utils.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# spdm-utils
+#
+################################################################################
+
+SPDM_UTILS_VERSION = 0.3.0
+SPDM_UTILS_SITE = $(call github,westerndigitalcorporation,spdm-utils,v$(SPDM_UTILS_VERSION))
+SPDM_UTILS_LICENSE = Apache-2.0 or MIT
+SPDM_UTILS_POST_PATCH_HOOKS += SPDM_UTILS_FETCH_CRATES
+SPDM_UTILS_POST_INSTALL_TARGET_HOOKS += SPDM_UTILS_INSTALL_CERTS
+SPDM_UTILS_DEPENDENCIES += pciutils libspdm openssl
+
+# We want to run the cargo-post-process script which is
+# manually run in dl-wrapper after downloading the tarball.
+# This will re-vendor in the crates, which needs to be done
+# after we patch in our extra dependencies.
+define SPDM_UTILS_FETCH_CRATES
+	cd $(SPDM_UTILS_SRCDIR) && \
+	cargo vendor \
+	    --manifest-path Cargo.toml \
+		--locked VENDOR
+endef
+
+define SPDM_UTILS_INSTALL_CERTS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/root/certs
+	cp -r $(@D)/certs/generate_certs.sh $(TARGET_DIR)/root/certs/
+	cp -r $(@D)/certs/openssl.cnf $(TARGET_DIR)/root/certs/
+	cp -r $(@D)/certs/setup_certs.sh $(TARGET_DIR)/root/certs/
+
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/root/certs/slot0
+	cp $(@D)/certs/slot0/immutable.der $(TARGET_DIR)/root/certs/slot0
+	cp $(@D)/certs/slot0/device.cert.der $(TARGET_DIR)/root/certs/slot0
+	cp $(@D)/certs/slot0/device.der $(TARGET_DIR)/root/certs/slot0
+	cp $(@D)/certs/slot0/device.key $(TARGET_DIR)/root/certs/slot0
+	cp $(@D)/certs/slot0/param.pem $(TARGET_DIR)/root/certs/slot0
+	cp $(@D)/certs/slot0/bundle_responder.certchain.der $(TARGET_DIR)/root/certs/slot0
+
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/root/manifest
+	cp $(@D)/manifest/manifest.out.cbor $(TARGET_DIR)/root/manifest
+endef
+
+$(eval $(cargo-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
