Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5085CC3ABB2
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 14:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29EB4087C;
	Wed, 28 May 2025 14:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpUeVsM8C2IP; Wed, 28 May 2025 14:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33EDE4085D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33EDE4085D;
	Wed, 28 May 2025 14:56:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6B09B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C82A840851
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbD6TJHFulvJ for <buildroot@buildroot.org>;
 Wed, 28 May 2025 14:56:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D02AE40850
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D02AE40850
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D02AE40850
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 04C37580D6A
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:28:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7EDD43A23;
 Wed, 28 May 2025 14:28:52 +0000 (UTC)
Date: Wed, 28 May 2025 16:28:48 +0200
MIME-Version: 1.0
Message-Id: <20250528-fix_license-v1-3-b59a638b0495@bootlin.com>
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
 d=bootlin.com; s=gm1; t=1748442533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmBfPv6CaGGe2s5OesmPULwnuFiFM5ogJ7QzxRBGESw=;
 b=FHq14pNNu84TVqI0Tu2jNTTYWSI6+h7yJwDPn87f4EUSEaB9kCGRY+0dZgv/xWEhARQk31
 ntDs4N3UJrpALOPZlD87H3qwpHzfx71zMLBAxi1edTx9POh+3X0LASJhEw7oGSxLWL6kCH
 9eYdjy6eawg4hv7lqIT0CSBh0a7r58aoFFFdC3BD/oJjxtPCmDWydbqH4mPV3dq7lZuf1B
 xosovxaUoiZIkQitNcaFRsqsb0ZhuSjEJq1nRRKusQOJ6rfiaX8GaOxgH/Ys+hVLdoPS9x
 mw4TtZkZ7CuXwY2INSZYpn+3Z2YIxLRgidVWHkFq3wSzPm+qVCtOZr7h2HyMLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FHq14pNN
Subject: [Buildroot] [PATCH 3/7] optee-os: Add support for custom license
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
 boot/optee-os/Config.in   | 7 +++++++
 boot/optee-os/optee-os.mk | 4 +---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 433dae90d8..c3fc61d8cd 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -86,6 +86,13 @@ config BR2_TARGET_OPTEE_OS_VERSION
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
+config BR2_TARGET_OPTEE_OS_LICENSE_FILES
+	string "OP-TEE OS license files"
+	default "LICENSE"
+	help
+	  A space-separated list of license files related to the OP-TEE OS
+	  package.
+
 config BR2_TARGET_OPTEE_OS_NEEDS_DTC
 	bool "OP-TEE OS needs dtc"
 	select BR2_PACKAGE_HOST_DTC
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 25c917e2fc..1639597407 100644
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
