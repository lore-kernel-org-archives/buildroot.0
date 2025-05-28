Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AC3C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 14:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2372F4085D;
	Wed, 28 May 2025 14:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGhD_JaxkHZL; Wed, 28 May 2025 14:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED7C040AFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED7C040AFF;
	Wed, 28 May 2025 14:56:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D52219D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7F0B4085D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ig9QIzG5xNnl for <buildroot@buildroot.org>;
 Wed, 28 May 2025 14:56:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F17BF40850
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17BF40850
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F17BF40850
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 06A60585C68
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:28:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F4EC43A34;
 Wed, 28 May 2025 14:28:52 +0000 (UTC)
Date: Wed, 28 May 2025 16:28:47 +0200
MIME-Version: 1.0
Message-Id: <20250528-fix_license-v1-2-b59a638b0495@bootlin.com>
References: <20250528-fix_license-v1-0-b59a638b0495@bootlin.com>
In-Reply-To: <20250528-fix_license-v1-0-b59a638b0495@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alistair Francis <alistair@alistair23.me>, Dick Olsson <hi@senzilla.io>, 
 Etienne Carriere <etienne.carriere@foss.st.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Simon Dawson <spdawson@gmail.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeehtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvohhmrghtshhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtohepvghtihgvn
 hhnvgdrtggrrhhrihgvrhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehsphgurgifshhonhesghhmrghilhdrtghomhdprhgtphhtthhopehhihesshgvnhiiihhllhgrrdhioh
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748442532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tEPsFSbfVAOkcNLgxHre4JmSkOH2stTGHLsJjExUB8M=;
 b=IN9/1rWs+QyR6VHTkc+dnhNLP4fqofz5z6UtBbctW3x4PCvdYHnKVbKm0KH2HYxk31dai2
 JgTH7J6DH01FphKgEl3bZcCrc7sOMlGEDVOpm4NQX9JeqgVHPOy2dEeNny8G4+S0nAGN4c
 bUMc1HOKr57iZmmnUwqqI8oBdfqaTNUh5UaeKx/USkgTDYgQSyUrz/VfauA2WQno1cUCRH
 dxV4CFbCXiJb/zwL8jzfq6SEMafexNzO8facWi9Pq38kSd69ocZ+Bc2h1LktAITO2MVQCi
 YJCMYn5evDKUgqlaHmQdrLVU9/ovbfa2fMljwaoD6RqRvHDtuJqjlnMbuNBKQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IN9/1rWs
Subject: [Buildroot] [PATCH 2/7] uboot: Add support for custom license files
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

The U-Boot package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/uboot/Config.in | 7 +++++++
 boot/uboot/uboot.mk  | 4 +---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a2301b7747..53743dd7cc 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -92,6 +92,13 @@ config BR2_TARGET_UBOOT_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
 
+config BR2_TARGET_UBOOT_LICENSE_FILES
+	string "U-boot license files"
+	default "Licenses/gpl-2.0.txt"
+	help
+	  A space-separated list of license files related to U-Boot
+	  package.
+
 config BR2_TARGET_UBOOT_PATCH
 	string "Custom U-Boot patches"
 	default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR != ""  # legacy
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a310..977e6eca8b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -8,9 +8,7 @@ UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
 UBOOT_LICENSE = GPL-2.0+
-ifeq ($(BR2_TARGET_UBOOT_LATEST_VERSION),y)
-UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
-endif
+UBOOT_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_UBOOT_LICENSE_FILES))
 UBOOT_CPE_ID_VENDOR = denx
 UBOOT_CPE_ID_PRODUCT = u-boot
 

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
