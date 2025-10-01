Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110C2CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 15:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5087613CC;
	Wed,  1 Oct 2025 15:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LB43DH0cEoX; Wed,  1 Oct 2025 15:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA1BE613C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA1BE613C7;
	Wed,  1 Oct 2025 15:16:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A3A93C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78BA840CE8
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsG_0u8EQAA6 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 15:16:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7BE440D27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7BE440D27
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7BE440D27
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:16:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 31BD2C01F90;
 Wed,  1 Oct 2025 14:58:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0CD85606BF;
 Wed,  1 Oct 2025 14:58:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A8AB5102F1A4D; 
 Wed,  1 Oct 2025 16:58:51 +0200 (CEST)
Date: Wed, 01 Oct 2025 14:58:29 +0000
MIME-Version: 1.0
Message-Id: <20251001-fix_license-v2-7-bf18911c835d@bootlin.com>
References: <20251001-fix_license-v2-0-bf18911c835d@bootlin.com>
In-Reply-To: <20251001-fix_license-v2-0-bf18911c835d@bootlin.com>
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>, 
 Alistair Francis <alistair@alistair23.me>, Dick Olsson <hi@senzilla.io>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Simon Dawson <spdawson@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1759330732; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QlLvnqMA79mLlXiYLqB1c1r7/XvUkPO5A2k3JhlqWko=;
 b=c2H1SC6JovmS8mvAi3elmzqj4juBtOetpwfJ92tRT+sXlnyz4IwlTIb5ew+3H6Lo9/CPvZ
 xQKiUfOvgzuB+h287Nm+JoMtiL2ZmtrhzugWFeRXrEZAKaAaF7PALpCv9n0oZYym4tDPOL
 h9UrwMBMNTno2NyqvEgb0NVmK3UyFlKEFOxLQbkKzjIzh0EPyzI0kbCxnjQZf9e5NWNiZL
 m5q3qf8qKRF9IX8MiYHhasKvsw9g+rRIw8lYMkNK65ZhH2Uy3WwU9PBNQPzhHFAeTJlaWI
 LMkhfSXh2gmj45LUpc3sdTmwA1zf0n8Hal7fQBFvs3ERhZWtUegXUJwnvYuCCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=c2H1SC6J
Subject: [Buildroot] [PATCH v2 7/7] at91bootstrap3: Add support for custom
 license files
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The AT91Bootstrap3 package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- Do not show license option if it is not a custom repo
---
 boot/at91bootstrap3/Config.in         | 19 +++++++++++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk |  3 ++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 35bdb28162beda956ff4ffd17772b491bf5f5ca0..987b5eb7efd3d845865d34afaca4f35ae5e88f80 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -66,6 +66,25 @@ config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_LICENSE_FILES
+	string "AT91Bootstrap3 license files"
+	default "LICENSES/MIT.txt"
+	depends on BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || \
+		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN || \
+		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
+	help
+	  A space-separated list of license files related to the
+	  AT91Bootstrap3 kernel package.
+
+config BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES
+	string
+	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_LICENSE_FILES \
+		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || \
+		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN || \
+		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
+	default "" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
+	default "LICENSES/MIT.txt"
+
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 4bbe7cc71819bb5841deac0ca9b513e7189796f4..2ed34f3de4d7285f9b14386fe3c21241b65aa4b1 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -25,11 +25,12 @@ endif
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
 AT91BOOTSTRAP3_LICENSE = MIT
-AT91BOOTSTRAP3_LICENSE_FILES = LICENSES/MIT.txt
 else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X),y)
 AT91BOOTSTRAP3_LICENSE = Atmel License
 endif
 
+AT91BOOTSTRAP3_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES))
+
 AT91BOOTSTRAP3_CPE_ID_VENDOR = linux4sam
 AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
 

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
