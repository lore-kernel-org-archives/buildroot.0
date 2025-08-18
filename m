Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FBFCA0EEB
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 14:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C631A6112F;
	Mon, 18 Aug 2025 14:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84ppcAB8TiMD; Mon, 18 Aug 2025 14:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFAA660F68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFAA660F68;
	Mon, 18 Aug 2025 14:30:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C47AFE2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6C7E41413
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFI_K7ws9RxZ for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 14:30:34 +0000 (UTC)
X-Greylist: delayed 484 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Aug 2025 14:30:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D6EE4174F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D6EE4174F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.70.43.27;
 helo=mail-4327.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D6EE4174F
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:33 +0000 (UTC)
Date: Mon, 18 Aug 2025 14:22:30 +0000
To: buildroot@buildroot.org
From: Philip Molloy <philip@philipmolloy.com>
Cc: Philip Molloy <philip.molloy@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Philip Molloy <philip@philipmolloy.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20250818142203.421300-2-philip@philipmolloy.com>
In-Reply-To: <20250818142203.421300-1-philip@philipmolloy.com>
References: <20250818142203.421300-1-philip@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: 28d8d760bae5e43e0d4417647febad10d39e92e2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1755526957; x=1755786157;
 bh=ThLA/xx193d92N4c1H4bzEm5aVxEjFeRT5MS9Z04Thg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=q3mIMxdoMmRseUXBWgEwJEpZ6FTBh3MzklsyWGBVzKqOmJ81aYsWAxcpvC8bgKYjk
 8Tf8HSXP9DjBAbX/F4iuyAWSE3n83LTuEbdXlR65inrKvhAP8Qk2ABReBPE5u6AHpH
 43S2+5ow+VFSlunLq3fjxZPuA/M0C0XC7vUVriF6HC3NaOBHWmusuxUmm/2s1ua0hD
 5pni2ueGHUj8BTuLV3xlTuOTH5mDPeVqitooCkdMDhmkuK5XBQHvLYWSY8VRvB598h
 uRW4I0e6qumGjq9nu8YHpBg11bFXwOyMZABFzxflGvuuHIVo1HNjcynhkMPDQk9bKV
 J2S0MEzMmvk1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=q3mIMxdo
Subject: [Buildroot] [PATCH 1/4] package/adsp-ldr: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Philip Molloy <philip.molloy@analog.com>

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
Signed-off-by: Philip Molloy <philip@philipmolloy.com>
---
 package/Config.in              |  1 +
 package/adsp-ldr/Config.in     |  9 +++++++++
 package/adsp-ldr/adsp-ldr.hash |  3 +++
 package/adsp-ldr/adsp-ldr.mk   | 19 +++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/adsp-ldr/Config.in
 create mode 100644 package/adsp-ldr/adsp-ldr.hash
 create mode 100644 package/adsp-ldr/adsp-ldr.mk

diff --git a/package/Config.in b/package/Config.in
index 579b5ffc87..63aee051e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -470,6 +470,7 @@ endmenu
 	source "package/acpica/Config.in"
 	source "package/acpid/Config.in"
 	source "package/acpitool/Config.in"
+	source "package/adsp-ldr/Config.in"
 	source "package/aer-inject/Config.in"
 	source "package/altera-stapl/Config.in"
 	source "package/am335x-pru-package/Config.in"
diff --git a/package/adsp-ldr/Config.in b/package/adsp-ldr/Config.in
new file mode 100644
index 0000000000..a1806df576
--- /dev/null
+++ b/package/adsp-ldr/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ADSP_LDR
+	bool "adsp-ldr"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  adsp-ldr is a tool that generates boot streams to be
+	  loaded and executed by the boot ROM of Analog Devices
+	  ADSP-SCXXX SoCs
+
+	  https://github.com/analogdevicesinc/adsp-ldr
diff --git a/package/adsp-ldr/adsp-ldr.hash b/package/adsp-ldr/adsp-ldr.hash
new file mode 100644
index 0000000000..f437beb90e
--- /dev/null
+++ b/package/adsp-ldr/adsp-ldr.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a1b1b5700b75e47bae7f656cd61f8c635f5d3c82a90e20dfe594e0a3315e4eef  LICENSE
+sha256  a08c28204bfcf18b5ff956b01893b5ea1beb6836f97c94dbfac8ef8f07c91a9c  adsp-ldr-1.0.0.tar.gz
diff --git a/package/adsp-ldr/adsp-ldr.mk b/package/adsp-ldr/adsp-ldr.mk
new file mode 100644
index 0000000000..9fdf3c3c4e
--- /dev/null
+++ b/package/adsp-ldr/adsp-ldr.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# adsp-ldr
+#
+################################################################################
+
+ADSP_LDR_VERSION = 1.0.0
+ADSP_LDR_SITE = $(call github,analogdevicesinc,adsp-ldr,v$(ADSP_LDR_VERSION))
+ADSP_LDR_LICENSE = GPL-3.0
+ADSP_LDR_LICENSE_FILES = LICENSE
+
+ADSP_LDR_SUBDIR = src/ldr
+
+define HOST_ADSP_LDR_INSTALL_CMDS
+	$(INSTALL) -m 755 -D $(@D)/src/ldr/ldr \
+		$(TARGET_CROSS)ldr
+endef
+
+$(eval $(host-autotools-package))
-- 
2.50.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
