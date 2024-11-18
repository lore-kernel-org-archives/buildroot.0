Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4467D10F41
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 03:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 015F5406B8;
	Mon, 18 Nov 2024 03:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOIS6TR8GIcK; Mon, 18 Nov 2024 03:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E9240707
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96E9240707;
	Mon, 18 Nov 2024 03:05:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7543EDB2
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 03:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62EAB4019A
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 03:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDDH8nm09dSE for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 03:05:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=045364c81=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BCC59400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCC59400CE
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCC59400CE
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 03:05:02 +0000 (UTC)
X-CSE-ConnectionGUID: S79pYKlRRk2ZQ4QG1uY3AA==
X-CSE-MsgGUID: ijaMkPAUScyJV5ACnjB6QQ==
X-IronPort-AV: E=Sophos;i="6.12,163,1728921600"; d="scan'208";a="31629655"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Nov 2024 11:05:01 +0800
IronPort-SDR: 673aa04c_UqugypJAPHn8SICb/ogs2vX6Hsbw2Tg3yOYYCoLfzjaDWPf
 BEEyFK3dXXJOchjOvp1mIKX2GZOuCsGBnzIlADw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Nov 2024 18:02:52 -0800
WDCIronportException: Internal
Received: from unknown (HELO fedora.wdc.com) ([10.225.165.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Nov 2024 19:04:58 -0800
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Wilfred Mallawa <wilfred.opensource@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Date: Mon, 18 Nov 2024 12:59:45 +1000
Message-ID: <20241118025944.1068363-2-wilfred.mallawa@wdc.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1731899102; x=1763435102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=onb/4ztuW6478huTPuCDEtgX8FImhQmVEJLhVD054ec=;
 b=cu0sYVnWwl27iMyTqf/rLZwX/hsGW6w5oNFyjmJ0+3X8zGbEkvIItrUj
 C9Fp6PFjV7KVbIvpZYkPPBGVpMQQhCLEbplqmmC7Oeg8/4SwzDFMPR9JE
 pDqAjbDuxVgOZ/xlWXJO1jkyp8bGOF92PI71TEMuF6EqOl/DXGBnR3tS5
 AvOhzVfYWqJGLLpslEMqX6pZZF7tCVCbM6V7z4D6kqa8I9u/8IYsKwWp3
 oqMvpZbGbnJXEs4oZVocNfNHqyWINMrpxQwa5K5qk7X383QGmrQnDZwRI
 aUi3PI+ivVsgIGO4ybLQiF+c1O1mwmKA1BXoCaohzL5SrmwViJabbcNe4
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=cu0sYVnW
Subject: [Buildroot] [PATCH v5 1/1] package/spdm-utils: new package
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
Changes in V4 -> V5:
	- Uses `spdm-utils` release v0.7.1
	- Added `depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS`
	- Merged 'depends' comments into a single comment.
	- Added license hashes and license files.
	- Alphabetically order dependencies.
	- Drop the ruby/gem dependency entirely as`spdm-utils` v0.7.1 makes it
	  optional.

 DEVELOPERS                         |  4 +++
 package/Config.in                  |  1 +
 package/spdm-utils/Config.in       | 23 ++++++++++++++
 package/spdm-utils/spdm-utils.hash |  5 +++
 package/spdm-utils/spdm-utils.mk   | 51 ++++++++++++++++++++++++++++++
 5 files changed, 84 insertions(+)
 create mode 100644 package/spdm-utils/Config.in
 create mode 100644 package/spdm-utils/spdm-utils.hash
 create mode 100644 package/spdm-utils/spdm-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3945803d53..45c0e91150 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -154,6 +154,7 @@ F:	board/sifive/
 F:	boot/opensbi/
 F:	configs/hifive_unleashed_defconfig
 F:	package/libspdm/
+F:	package/spdm-utils/
 F:	package/xen/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
@@ -3341,6 +3342,9 @@ F:	package/uclibc-ng-test/
 F:	package/zabbix/
 F:	support/testing/tests/package/test_ruby.py
 
+N:	Wilfred Mallawa <wilfred.opensource@gmail.com>
+F:	package/spdm-utils/
+
 N:	Will Newton <will.newton@gmail.com>
 F:	package/enchant/
 F:	package/erlang/
diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e020..c39728bca0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2781,6 +2781,7 @@ comment "Utilities"
 	source "package/screen/Config.in"
 	source "package/screenfetch/Config.in"
 	source "package/sexpect/Config.in"
+	source "package/spdm-utils/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
diff --git a/package/spdm-utils/Config.in b/package/spdm-utils/Config.in
new file mode 100644
index 0000000000..ac4fc11003
--- /dev/null
+++ b/package/spdm-utils/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_SPDM_UTILS
+	bool "spdm-utils"
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-clang
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_LIBSPDM
+	help
+	  SPDM-Utils is a Linux application designed to support,
+	  test and develop SPDM requesters and responders.
+	  SPDM-Utils uses libspdm as the backend to perform SPDM
+	  communication. SPDM-Utils currently supports the
+	  PCIe Data Object Exchange (DOE) Capability.
+
+	  https://github.com/westerndigitalcorporation/spdm-utils
+
+comment "spdm-utils needs udev /dev management, host gcc >= 7"
+	depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_UDEV || \
+		!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/spdm-utils/spdm-utils.hash b/package/spdm-utils/spdm-utils.hash
new file mode 100644
index 0000000000..5080c807e3
--- /dev/null
+++ b/package/spdm-utils/spdm-utils.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  04bfe72f56e46272e1ea49a63eb88bacf6416fda5684b7747c5368116c0dc4ef  spdm-utils-0.7.1-cargo2.tar.gz
+sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
+sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
+sha256  b378ca951adc9417548e94792ade613894bb65ca08a01c2d17f4ee40d21fc7e3  NOTICES
diff --git a/package/spdm-utils/spdm-utils.mk b/package/spdm-utils/spdm-utils.mk
new file mode 100644
index 0000000000..0908057d6a
--- /dev/null
+++ b/package/spdm-utils/spdm-utils.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# spdm-utils
+#
+################################################################################
+
+SPDM_UTILS_VERSION = 0.7.1
+SPDM_UTILS_SITE = $(call github,westerndigitalcorporation,spdm-utils,v$(SPDM_UTILS_VERSION))
+SPDM_UTILS_LICENSE = Apache-2.0 or MIT
+SPDM_UTILS_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT NOTICES
+SPDM_UTILS_DEPENDENCIES = host-clang host-ruby libspdm pciutils udev
+
+SPDM_UTILS_ALIAS_CERTS = \
+		openssl.cnf \
+		slot0/immutable.der \
+		slot0/device.cert.der \
+		slot0/device.der \
+		slot0/device.key \
+		slot0/bundle_responder.certchain.der
+
+# Used to generate SPDM Alias certificate model certificates,
+# required by `setup_certs.sh`
+SPDM_UTILS_GENERIC_CERTS = \
+		slot0/param.pem \
+		slot0/end_requester.req \
+		slot0/end_requester.key \
+		slot0/end_responder.key \
+		slot0/end_responder.req
+
+# SPDM-Utils expects the following certificates to be present for SPDM
+# functionality, make sure they are all copied.
+#
+# `setup_certs.sh` shall be used by a responder to regenerate it's mutable
+# certificate chain, typically on start up.
+define SPDM_UTILS_INSTALL_CERTS
+	$(INSTALL) -D -m 0755 $(@D)/certs/setup_certs.sh $(TARGET_DIR)/usr/share/spdm/certs/setup_certs.sh
+	$(INSTALL) -D -m 0644 $(@D)/certs/openssl.cnf $(TARGET_DIR)/usr/share/spdm/certs/openssl.cnf
+
+	$(foreach f,$(SPDM_UTILS_ALIAS_CERTS),
+		$(INSTALL) -D -m 0644 $(@D)/certs/alias/$(f) $(TARGET_DIR)/usr/share/spdm/certs/alias/$(f)
+	)
+
+	$(foreach f,$(SPDM_UTILS_GENERIC_CERTS),
+		$(INSTALL) -D -m 0644 $(@D)/certs/$(f) $(TARGET_DIR)/usr/share/spdm/certs/$(f)
+	)
+	$(INSTALL) -D -m 0644 $(@D)/manifest/manifest.out.cbor $(TARGET_DIR)/usr/share/spdm/manifest/manifest.out.cbor
+endef
+
+SPDM_UTILS_POST_INSTALL_TARGET_HOOKS += SPDM_UTILS_INSTALL_CERTS
+
+$(eval $(cargo-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
