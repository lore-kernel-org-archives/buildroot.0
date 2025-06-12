Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5958C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 09:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5684A8146D;
	Thu, 12 Jun 2025 09:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEkGJyrs5c2w; Thu, 12 Jun 2025 09:42:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7863A81455
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7863A81455;
	Thu, 12 Jun 2025 09:42:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89490183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 09:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AA5F404E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 09:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_VyfRyd0Fht for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 09:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D7A940077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D7A940077
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D7A940077
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 09:42:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.170]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mj8qj-1v4VZo0lBl-00mjUA; Thu, 12
 Jun 2025 11:42:05 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Jun 2025 11:41:57 +0200
Message-ID: <20250612094157.680899-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612094157.680899-1-ps.report@gmx.net>
References: <20250612094157.680899-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZNDZNePLOUnrTpfoJH2SSH6WCtVCIF3k3CMkER0XjjJA90/zT18
 LHjRHtRoEIwditnH988YfZEa4pBtcM8aQGPxjHSfGykamY6yDkThIdbPjsZvlXcnbealb1W
 KnnVU7davx6QKwrukK0pX/BkiBnjdqKoS+SvBqqV0006zPy2u1xp1KZjUK0kB5DQVlt3JyY
 bRgC5L8+zIAOlZHyIgqzA==
UI-OutboundReport: notjunk:1;M01:P0:TVDFDJoHBIM=;4fwrEfclwMaysomRDk7J5VfB9sQ
 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
 f1nCCYleff33h/pK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1749721325; x=1750326125; i=ps.report@gmx.net;
 bh=e09dEINllTqKbb/CWsBNtNL9J8PYQjv9C6BOUzpKQhQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=s16ETBAPUugQsmbJ0q6p/UNaxpndcDKvjcj5GW1O6xaOqsiSby4xto+xmc9dBTPN
 oyPTSmmGZzwNOKJHdLQ0FNO8Al8nXwXpnf9oc1spjcfAa5ZZAdh9nMchTCxgXtnon
 +B1aOznCEW8UhlToJkCDXPNrADxen+J3S0DxUVq38gC0kUmEgaWDq7J+ewxGCwW3a
 JgooQOGJyZ3PSw1UIXZcJsbGv9Dc5iDx1bRPriT31hpzlyHkzoZuML+gF/s4eoAuG
 wB6jy2IGo7rOhRDj1mg/4IgDsFmlLF15/SGcwIFDFnZlmSTS+tYZm1fMewgmk4BIA
 wF4gSihRPDFsJj3YDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=s16ETBAP
Subject: [Buildroot] [PATCH v1 2/2] package/mongoose: add builtin/wolfssl
 TLS support
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change from implicit none/mbedtls/openssl support to explicit none/builtin/
mbedtls/openssl/wolfssl support via choice menu.

- add MG_TLS_BUILTIN support (available since 7.13, upstream commit [1])
- add MG_TLS_WOLFSSL support (available since 7.14, upstream commit [2] and [3])

[1] https://github.com/cesanta/mongoose/commit/a0e66fb9e6c5c174ecf556bce9ef38e49d1abc30
[2] https://github.com/cesanta/mongoose/commit/dc09851ac824e578bdb5fa751a31ddbba1e70adc
[3] https://github.com/cesanta/mongoose/commit/9dc3d0998129f8dadd0ff7b7981e725e9e620b21

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mongoose/Config.in   | 40 ++++++++++++++++++++++++++++++++++++
 package/mongoose/mongoose.mk | 17 +++++++++------
 2 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
index 22b385d457..5ca5b0b150 100644
--- a/package/mongoose/Config.in
+++ b/package/mongoose/Config.in
@@ -8,6 +8,46 @@ config BR2_PACKAGE_MONGOOSE
 
 	  https://github.com/cesanta/mongoose
 
+if BR2_PACKAGE_MONGOOSE
+
+choice
+	prompt "TLS support"
+	help
+	  Select none, builtin, mbedtls or openssl.
+
+config BR2_PACKAGE_MONGOOSE_TLS_NONE
+	bool "none"
+	help
+	  Disable mongoose TLS support.
+
+config BR2_PACKAGE_MONGOOSE_TLS_BUILTIN
+	bool "builtin"
+	help
+	  Enable mongoose builtin TLS support.
+
+config BR2_PACKAGE_MONGOOSE_TLS_MBEDTLS
+	bool "mbedtls"
+	select BR2_PACKAGE_MBEDTLS
+	help
+	  Enable mongoose mbedtls TLS support.
+
+config BR2_PACKAGE_MONGOOSE_TLS_OPENSSL
+	bool "openssl"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable mongoose openssl TLS support.
+
+config BR2_PACKAGE_MONGOOSE_TLS_WOLFSSL
+	bool "wolfssl"
+	depends on BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS
+	select BR2_PACKAGE_WOLFSSL
+	help
+	  Enable mongoose wolfssl TLS support.
+
+endchoice
+
+endif
+
 comment "mongoose needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 02dd04f327..d9d0e8f669 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -15,14 +15,19 @@ MONGOOSE_INSTALL_TARGET = NO
 
 MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99 -DMG_ENABLE_IPV6=1
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MONGOOSE_DEPENDENCIES += openssl
-MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_OPENSSL
-else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+ifeq ($(BR2_PACKAGE_MONGOOSE_TLS_NONE),y)
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_NONE
+else ifeq ($(BR2_PACKAGE_MONGOOSE_TLS_BUILTIN),y)
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_BUILTIN
+else ifeq ($(BR2_PACKAGE_MONGOOSE_TLS_MBEDTLS),y)
 MONGOOSE_DEPENDENCIES += mbedtls
 MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_MBED
-else
-MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_NONE
+else ifeq ($(BR2_PACKAGE_MONGOOSE_TLS_OPENSSL),y)
+MONGOOSE_DEPENDENCIES += openssl
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_OPENSSL
+else ifeq ($(BR2_PACKAGE_MONGOOSE_TLS_WOLFSSL),y)
+MONGOOSE_DEPENDENCIES += wolfssl
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_WOLFSSL
 endif
 
 define MONGOOSE_BUILD_CMDS
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
