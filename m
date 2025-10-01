Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F11CCCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 15:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BBB461348;
	Wed,  1 Oct 2025 15:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qBV8NuQfPVK; Wed,  1 Oct 2025 15:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FAB66136F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FAB66136F;
	Wed,  1 Oct 2025 15:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0A4D2A6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91A7040B34
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFghfLiSkA0o for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 15:06:21 +0000 (UTC)
X-Greylist: delayed 452 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 01 Oct 2025 15:06:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A20940B07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A20940B07
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A20940B07
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:06:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AB45DC0246D
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8502B606BF;
 Wed,  1 Oct 2025 14:58:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3505B102F1A41; 
 Wed,  1 Oct 2025 16:58:49 +0200 (CEST)
Date: Wed, 01 Oct 2025 14:58:27 +0000
MIME-Version: 1.0
Message-Id: <20251001-fix_license-v2-5-bf18911c835d@bootlin.com>
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
 t=1759330730; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pk6Bs7sm1HapPr1yhJATUBmiZJjjgnX2/IuGr7SJTJk=;
 b=CBfHWUNjK4wcvYHzkuI5U5fyPNIft+JN037Kw2g/0h/v1w7BtDLuM4INu/B3LK8PQCyeoS
 WpsV0NujiAxBg1BwN42dImL1n65Z1V58hXwKzgfhvOsaHkMf2i6tVJ4B/riNq5NfOVb2xO
 zCHmJeb8lr5g2hpv71glWhbL9rxYSF94mwGF3Jzu9E186KbOgJLD4r4UITIosV9E+50fCC
 xI9Bi71zIkE8bDz2FgAN/DXm8Lgsm6SSy7pR6pM0W82mvKOK+U6cpcQ2KNehS3LTUbtBS+
 iPx5Wq3tOGYBhxYFvjBcL1D/0AcMLDfveWx16IEuJNO0GdyKDr0ps4KzBQZFYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=CBfHWUNj
Subject: [Buildroot] [PATCH v2 5/7] barebox: Add support for custom license
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

The Barebox package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- Do not show license option if it is not a custom repo
---
 boot/barebox/Config.in  | 16 ++++++++++++++++
 boot/barebox/barebox.mk |  4 +---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index c3cb0b33325328415349408f5be01a4a32dfcf12..469497aff6833ebdfd61b95cc938c9380a0374fb 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -45,6 +45,22 @@ config BR2_TARGET_BAREBOX_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
+config BR2_TARGET_BAREBOX_CUSTOM_LICENSE_FILES
+	string "Barebox license files"
+	default "COPYING"
+	depends on BR2_TARGET_BAREBOX_CUSTOM_TARBALL || \
+		   BR2_TARGET_BAREBOX_CUSTOM_GIT
+	help
+	  A space-separated list of license files related to the Barebox
+	  package.
+
+config BR2_TARGET_BAREBOX_LICENSE_FILES
+	string
+	default BR2_TARGET_BAREBOX_CUSTOM_LICENSE_FILES \
+		if BR2_TARGET_BAREBOX_CUSTOM_TARBALL || \
+		   BR2_TARGET_BAREBOX_CUSTOM_GIT
+	default "COPYING"
+
 config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 929ed48ada8321c7b42a615501fb90645556a37b..cbd6f9313c8012de809d4b0d82f3ffd5d39f680b 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -39,9 +39,7 @@ $(1)_DL_SUBDIR = barebox
 
 $(1)_DEPENDENCIES = host-lzop
 $(1)_LICENSE = GPL-2.0 with exceptions
-ifeq ($(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
-$(1)_LICENSE_FILES = COPYING
-endif
+$(1)_LICENSE_FILES = $$(call qstrip,$$(BR2_TARGET_BAREBOX_LICENSE_FILES))
 
 ifeq ($(BR2_TARGET_BAREBOX_NEEDS_OPENSSL),y)
 BAREBOX_DEPENDENCIES += host-openssl host-pkgconf

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
