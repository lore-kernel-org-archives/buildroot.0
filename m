Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D201C3ABB2
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 14:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A231740B3B;
	Wed, 28 May 2025 14:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_8QQCp5AUSY; Wed, 28 May 2025 14:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C1340B3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5C1340B3C;
	Wed, 28 May 2025 14:57:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23836DCA
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 153DD40BEC
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PL45rKw4nfij for <buildroot@buildroot.org>;
 Wed, 28 May 2025 14:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F04F4056D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F04F4056D
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F04F4056D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 9D7AB585CBC
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:28:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4756441CFD;
 Wed, 28 May 2025 14:28:54 +0000 (UTC)
Date: Wed, 28 May 2025 16:28:51 +0200
MIME-Version: 1.0
Message-Id: <20250528-fix_license-v1-6-b59a638b0495@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeehtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffgteekgeelheefueevhedvfedufeeuteegieejfffhfeeufefgleehheekieefnecuffhomhgrihhnpehtrhhushhtvggufhhirhhmfigrrhgvrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvohhmrghtshhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlihhsthgri
 hhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtohepvghtihgvnhhnvgdrtggrrhhrihgvrhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehsphgurgifshhonhesghhmrghilhdrtghomhdprhgtphhtthhopehhihesshgvnhiiihhllhgrrdhioh
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748442534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ri+dWolabWFV3QCUlYikZQKtS6GRimXuCH8ag+Zl85I=;
 b=mb+Ap6pDcBPWbfAQ++LQcnTWHxYrg5HsM/k8+nvnxle8N2blXI2QH6vEgVAeSOFHC3uk1R
 BbzP7wTLnx43HBAAh1nVA1ZTcZAOkHRECqlp636WXgZ2MRbCkXLwpLDf8ytA1acPt+NnAM
 d4HgmxdUBNWXUfmf32Ov6OQORExNUANoClzDRhgU8OV1F+3ufv/wYHwXyXsPbzd47tGtA8
 fjtcrsyfPMEK7tmE1404XNJBXJyt0y95wM+6LxofM/PbZAW5CttSZM+0T80jwYQNS3qsE2
 zLv5HcsXuoEcYgtWsL2bDI2fFu/9z2fRaIJiQ4UMNqbvncavk6nW36XZncnNWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mb+Ap6pD
Subject: [Buildroot] [PATCH 6/7] arm-trusted-firmware: Add support for
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
 boot/arm-trusted-firmware/Config.in               | 7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 ++------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 72684e5974..b8b941b806 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -80,6 +80,13 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION
 
 endif
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LICENSE_FILES
+	string "ATF license files"
+	default "docs/license.rst"
+	help
+	  A space-separated list of license files related to the ATF
+	  package.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
 	string "ATF platform"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index dca16d3960..9ea0a50b18 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -18,13 +18,9 @@ else
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
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE):$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y:y)
 BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
