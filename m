Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D47CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 14:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE2C083DA2;
	Wed,  1 Oct 2025 14:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aHHVYq5TvS99; Wed,  1 Oct 2025 14:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC55283E8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC55283E8D;
	Wed,  1 Oct 2025 14:58:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 188912A6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AD5A61348
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ZDBTj58kXPE for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 14:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 112AB61131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 112AB61131
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 112AB61131
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 753A41A1082;
 Wed,  1 Oct 2025 14:58:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4C51D606BF;
 Wed,  1 Oct 2025 14:58:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 03191102F1A46; 
 Wed,  1 Oct 2025 16:58:47 +0200 (CEST)
Date: Wed, 01 Oct 2025 14:58:26 +0000
MIME-Version: 1.0
Message-Id: <20251001-fix_license-v2-4-bf18911c835d@bootlin.com>
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
 t=1759330728; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=plP3fOTYRpxnkXczJDxybJ/zZNNl3V37tGGWYcSaG34=;
 b=MezJqouiLgmwokLnpW/Wl3MBg0acAem8RSr1h7lGnJl7MlHDyDFn0bS4V4Y1pS8Pucnkhs
 LRcTcJXnMU+/HrMUzbx36u90R78LuR3j6ZvbnP4TgT+vxGbWB6hflSuXkvUKxIv/Z0NX5o
 uE/3W8NFmuQE38YncmOn3/upZgJcR02M+w9jE7YE0swyrnzpoDxV452dveVlsM95eLxrCX
 6CQMIt/Q8ffeM37O5sgBjn4WFgnZC4YyKFFf5EOT7nZNVyyn/iWntIbYCzHOMavH2tlVk3
 whim889uES2sD4HlWnvO0TWwVxZa9MPo8a+ggbU8FRzfHSNMwFapL6jdqf0zEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=MezJqoui
Subject: [Buildroot] [PATCH v2 4/7] opensbi: Add support for custom license
 files
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

The OpenSBI package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- Do not show license option if it is not a custom repo version
---
 boot/opensbi/Config.in  | 16 ++++++++++++++++
 boot/opensbi/opensbi.mk |  4 +---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 9c6047df5e66f67e077f8b613b760f073301654e..86cccb1003b813076581f7eff3aa4c1eb530ebe0 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -64,6 +64,22 @@ config BR2_TARGET_OPENSBI_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_OPENSBI_CUSTOM_GIT
 
+config BR2_TARGET_OPENSBI_CUSTOM_LICENSE_FILES
+	string "OpenSBI license files"
+	default "COPYING.BSD"
+	depends on BR2_TARGET_OPENSBI_CUSTOM_GIT || \
+		   BR2_TARGET_OPENSBI_CUSTOM_TARBALL
+	help
+	  A space-separated list of license files related to the OpenSBI
+	  package.
+
+config BR2_TARGET_OPENSBI_LICENSE_FILES
+	string
+	default BR2_TARGET_OPENSBI_CUSTOM_LICENSE_FILES \
+		if BR2_TARGET_OPENSBI_CUSTOM_GIT || \
+		   BR2_TARGET_OPENSBI_CUSTOM_TARBALL
+	default "COPYING.BSD"
+
 config BR2_TARGET_OPENSBI_PLAT
 	string "OpenSBI Platform"
 	default ""
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 0142769a1276175ff9ababfb4d40ac9b7054c3e8..f9f550176f925cdec8193e0fe2891338f69a71b3 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -20,9 +20,7 @@ OPENSBI_SITE = $(call github,riscv-software-src,opensbi,v$(OPENSBI_VERSION))
 endif
 
 OPENSBI_LICENSE = BSD-2-Clause
-ifeq ($(BR2_TARGET_OPENSBI_LATEST_VERSION),y)
-OPENSBI_LICENSE_FILES = COPYING.BSD
-endif
+OPENSBI_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_OPENSBI_LICENSE_FILES))
 OPENSBI_INSTALL_TARGET = NO
 OPENSBI_INSTALL_STAGING = YES
 

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
