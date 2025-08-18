Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC2ECA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 14:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2028684897;
	Mon, 18 Aug 2025 14:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWzJ7UPJi3aZ; Mon, 18 Aug 2025 14:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C7E584898
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C7E584898;
	Mon, 18 Aug 2025 14:30:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7EF1196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEB2B8489B
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7wQMdMhsqM45 for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 14:30:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.70.43.21;
 helo=mail-4321.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B7C284898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B7C284898
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B7C284898
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:39 +0000 (UTC)
Date: Mon, 18 Aug 2025 14:22:49 +0000
To: buildroot@buildroot.org
From: Philip Molloy <philip@philipmolloy.com>
Cc: Philip Molloy <philip.molloy@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Philip Molloy <philip@philipmolloy.com>
Message-ID: <20250818142203.421300-4-philip@philipmolloy.com>
In-Reply-To: <20250818142203.421300-1-philip@philipmolloy.com>
References: <20250818142203.421300-1-philip@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: bb9750ba22504621525bc141a96bc71fdb520c07
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1755526976; x=1755786176;
 bh=XR7W4bhOLdoZcpodC9Ru30S0vu9g50AetzNL2IdDCcY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Pbav7r+OdJ3vIX3fzN1XYWgOXhjv0iPtIGNsyJJjygBLlGjwzUDXe/HDnPOkbM604
 riGXD6zKENK+WFSXIkymef4sBuhnWSbgWKDFirjAW50Qm+ejn1OnK6G+3fb1fWblGL
 L8KjjzrNyWb5BIi7EWdwVOjpKH5GEqG47+NYIdXZ4Bcs0bXZ5i8aGXmhdjAdQOgOfW
 qFD4F38DqR5tEnppdqpVhhbyg8NORGO0Nh13Jj635AJ3xA2Gb8VKLHfPuw2IQgx7mi
 r0CuG5GG3mOMsmxF7mYv/tQizwR/mIstXZV/io595GKl1HvlYqlpavNrUZSoGEM6gI
 88pPWb4bAxW+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=Pbav7r+O
Subject: [Buildroot] [PATCH 3/4] boot/uboot: add ADSP LDR binary format
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
 boot/uboot/Config.in | 4 ++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f29f2173fa..f388be5d64 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -487,6 +487,10 @@ config BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
 	  file for flashing by combining the spl/boot.bin and
 	  u-boot.itb files into a unified binary.
 
+config BR2_TARGET_UBOOT_FORMAT_ADSP_LDR
+	bool "u-boot.ldr"
+	depends on BR2_arm || BR2_aarch64
+
 config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cc7714c324..eea76edaf9 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -144,6 +144,10 @@ UBOOT_MAKE_TARGET += u-boot.stm32
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_ADSP_LDR),y)
+UBOOT_BINS += u-boot.ldr
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_INITIAL_ENV),y)
 UBOOT_MAKE_TARGET += u-boot-initial-env
 define UBOOT_INSTALL_UBOOT_INITIAL_ENV
-- 
2.50.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
