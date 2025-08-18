Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B55CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 14:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7AC384888;
	Mon, 18 Aug 2025 14:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3VlkDHjDFOI; Mon, 18 Aug 2025 14:30:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFC758488E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFC758488E;
	Mon, 18 Aug 2025 14:30:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55DA0196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4740160FBA
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjzgKEqOKiB1 for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 14:30:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.70.43.27;
 helo=mail-4327.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F1A460F68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F1A460F68
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F1A460F68
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:33 +0000 (UTC)
Date: Mon, 18 Aug 2025 14:22:39 +0000
To: buildroot@buildroot.org
From: Philip Molloy <philip@philipmolloy.com>
Cc: Philip Molloy <philip.molloy@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Philip Molloy <philip@philipmolloy.com>
Message-ID: <20250818142203.421300-3-philip@philipmolloy.com>
In-Reply-To: <20250818142203.421300-1-philip@philipmolloy.com>
References: <20250818142203.421300-1-philip@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: d1c59c0f524ffbe3b0bcabb33ad71d8c17502851
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1755526965; x=1755786165;
 bh=fEjvO9gggpdAhN6Kqze7QScIeiazRn6rs6d3goV+UNU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=R9LFTSx4ovJGmcSeTn6rj53PXBealy91IJluY3lN7Sp9tfOsw1fg6vO6fYoSl2oGF
 T2iGEwPMuZKFAtfwjCy6otediFbX5FiSXShLY7ybdwlwGDpNKdsza3zKNXxok0bBhS
 rZm7d+mta2DQ6jlhxFv/UdC10byYYhi2kikD2ezFwru4UpH8HEpPWikmLNJyiA1DdE
 oKsInqtOPKp4iqixbqFY2mTDtlRwGo1hLzIIDP+DA9Q8nQy9Uc2nuj8PRG4LdKY8qM
 Bta1cVuO4hjy/piIBmoqBADqGYR+uR+iJl7trwhulRmHMn8kM1qL9Z6tOeM2jwzF0X
 IdPeJmRbXhJDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=R9LFTSx4
Subject: [Buildroot] [PATCH 2/4] boot/uboot: depend on adsp-ldr if needed
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
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a2301b7747..f29f2173fa 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -332,6 +332,14 @@ config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
 	  This option makes sure that the needed binary blobs are copied
 	  into the U-Boot source directory.
 
+config BR2_TARGET_UBOOT_NEEDS_ADSP_LDR
+	bool "U-Boot needs adsp-ldr"
+	depends on BR2_PACKAGE_ADSP_LDR
+	help
+	  For ADSP-SCXXX Analog Devices SoCs U-Boot binaries must be
+	  correctly formatted so that they can be loaded and executed by
+	  the boot ROM
+
 config BR2_TARGET_UBOOT_USE_BINMAN
 	bool "U-Boot use binman"
 	select BR2_TARGET_UBOOT_NEEDS_PYTHON3
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a310..cc7714c324 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -257,6 +257,10 @@ UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/$(notdir $(ROCKCHIP_RKBIN_TEE_FILENAME))
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ADSP_LDR),y)
+UBOOT_DEPENDENCIES += host-adsp-ldr
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
-- 
2.50.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
