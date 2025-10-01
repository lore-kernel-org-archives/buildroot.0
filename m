Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B338ECCA474
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 15:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88F2F83EBC;
	Wed,  1 Oct 2025 15:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J701wZxQawlB; Wed,  1 Oct 2025 15:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C95283EB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C95283EB5;
	Wed,  1 Oct 2025 15:16:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 498EC93C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3A8040CE8
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79-k3BTfLqZL for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 15:16:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7C8040D2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7C8040D2D
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7C8040D2D
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:16:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E8E54C02468;
 Wed,  1 Oct 2025 14:58:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C26D5606BF;
 Wed,  1 Oct 2025 14:58:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7063F102F1A4C; 
 Wed,  1 Oct 2025 16:58:50 +0200 (CEST)
Date: Wed, 01 Oct 2025 14:58:28 +0000
MIME-Version: 1.0
Message-Id: <20251001-fix_license-v2-6-bf18911c835d@bootlin.com>
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
 t=1759330731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=051p/djh9bw2acaYnOYoy4J4Vb1P22bb3ZOtRtWRAIE=;
 b=OYYDag7ePNA39IlXIaSOr6b2uv5o929plK2+wmlgb42YvOJJb8KzoY6W2bbnd1TC0WcF9o
 ICbNPuG4L47InWQ16BErCsatpv26CIsxvRUZPl3MCUzf5CMyKB7sJTmumrbp900B8qTsEa
 zyqrHC/rQFGQctI1faWpNCYl+vUnRXDaNuD+U/ya3RMYv/CSEO0fN8bsYzH4hdi1cOJ6Y3
 GPgLc7datJaSVDICKdQunY9GsgKKAGtMcLiDFd294SpTWHbqvt0mVugjlj3WrmRx+JR9ue
 tfsn4U5YlTXejhaPApi0zRjwwltwfqQfPKtreTj5ryZEuhIkS8rhJNL4i6YhSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=OYYDag7e
Subject: [Buildroot] [PATCH v2 6/7] arm-trusted-firmware: Add support for
 custom license files
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

The ATF package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- Do not show license option if it is not a custom repo
---
 boot/arm-trusted-firmware/Config.in               | 16 ++++++++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  9 +++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 72684e5974c1c0c9f8f3453254c5699a0a5d7106..1bc6cac831247a1fdcc4b2cb7f9846eaa472a62b 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -80,6 +80,22 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION
 
 endif
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_LICENSE_FILES
+	string "ATF license files"
+	default "docs/license.rst"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT || \
+		   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
+	help
+	  A space-separated list of license files related to the ATF
+	  package.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LICENSE_FILES
+	string
+	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_LICENSE_FILES \
+		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT || \
+		   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
+	default "docs/license.rst"
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
 	string "ATF platform"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index dca16d396044c5004480fdfb4cf15df6837b4413..303fd2cb09bc1bf59b8ccd2e0865f43099318154 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -18,14 +18,11 @@ else
 # Handle stable official ATF versions
 ARM_TRUSTED_FIRMWARE_SITE = https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
 ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
-# The licensing of custom or from-git versions is unknown.
-# This is valid only for the latest (i.e. known) version.
-ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION),y)
-ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
-ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
-endif
 endif
 
+ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
+ARM_TRUSTED_FIRMWARE_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LICENSE_FILES))
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE):$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y:y)
 BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
 endif

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
