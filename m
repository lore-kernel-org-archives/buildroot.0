Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD77CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 14:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E70104121D;
	Wed,  1 Oct 2025 14:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cc5ZQhwcUhIf; Wed,  1 Oct 2025 14:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF24141220
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF24141220;
	Wed,  1 Oct 2025 14:58:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3946493C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E57083DA6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yWQ1Vaq_6CO for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 14:58:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B4AC8242D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B4AC8242D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B4AC8242D
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4B5D04E40D17;
 Wed,  1 Oct 2025 14:58:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 216CD606BF;
 Wed,  1 Oct 2025 14:58:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A0ABF102F1A4D; 
 Wed,  1 Oct 2025 16:58:46 +0200 (CEST)
Date: Wed, 01 Oct 2025 14:58:25 +0000
MIME-Version: 1.0
Message-Id: <20251001-fix_license-v2-3-bf18911c835d@bootlin.com>
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
 t=1759330727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=y7kwlLIue1p51Jw/BaL8GjBB18xYjkRTE+rolYI2FME=;
 b=ugOkwbxgmaVbb2eY/7dZ3mJBNRhJ3sHHZkF34Jt0bBTckEnW++yV5S9Jd2kmkKZ4cLKbhs
 fMx+1epiXprRsfwHpQgGTLNch5dSZ3MwQd9RJ+KkYN6JBBcZr5vgTbj/jjvkKwsbvd4XZy
 Q1aBWWea25OTnQ+PxLUnQjEbRxL7tsmO/IxG+aPpfNZcJ7jIwFYyO1Cg0f8dzFsBV7bZQu
 IVmET3Pu/6Eo42i8CX5DScdtPOyVEm8udain/7N+Ax36/LxakfCEZ6KqmkjEocHpRhI0Xk
 fSZeOoivLUUyRnFs/1YvCQdr9h1XBwpGJXL2RD71A7Dp0/9A+INEfBa3Ve4TDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ugOkwbxg
Subject: [Buildroot] [PATCH v2 3/7] optee-os: Add support for custom license
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

The OP-TEE OS package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- Do not show license option if it is not a custom repo version
---
 boot/optee-os/Config.in   | 16 ++++++++++++++++
 boot/optee-os/optee-os.mk |  4 +---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index e737d2a0acd7ecc335a9b00cf9b1daa98d866e92..22e63c0265595e272c49ea368026ebc13e8b8838 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -86,6 +86,22 @@ config BR2_TARGET_OPTEE_OS_VERSION
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
+config BR2_TARGET_OPTEE_OS_CUSTOM_LICENSE_FILES
+	string "OP-TEE OS license files"
+	default "LICENSE"
+	depends on BR2_TARGET_OPTEE_OS_CUSTOM_GIT || \
+		   BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
+	help
+	  A space-separated list of license files related to the
+	  OPTEE-OS package.
+
+config BR2_TARGET_OPTEE_OS_LICENSE_FILES
+	string
+	default BR2_TARGET_OPTEE_OS_CUSTOM_LICENSE_FILES \
+		if BR2_TARGET_OPTEE_OS_CUSTOM_GIT || \
+		   BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
+	default "LICENSE"
+
 config BR2_TARGET_OPTEE_OS_NEEDS_DTC
 	bool "OP-TEE OS needs dtc"
 	select BR2_PACKAGE_HOST_DTC
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 25c917e2fce7af850521111681dd8ecd66efe554..16395974079298a8d33da3fbcc06371c2ca051b4 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -6,9 +6,7 @@
 
 OPTEE_OS_VERSION = $(call qstrip,$(BR2_TARGET_OPTEE_OS_VERSION))
 OPTEE_OS_LICENSE = BSD-2-Clause
-ifeq ($(BR2_TARGET_OPTEE_OS_LATEST),y)
-OPTEE_OS_LICENSE_FILES = LICENSE
-endif
+OPTEE_OS_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_OPTEE_OS_LICENSE_FILES))
 
 OPTEE_OS_CPE_ID_PREFIX = cpe:2.3:o
 OPTEE_OS_CPE_ID_VENDOR = linaro

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
