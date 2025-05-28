Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFCFC5B543
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 14:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 571F540B44;
	Wed, 28 May 2025 14:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D49IQPa2p_t4; Wed, 28 May 2025 14:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FA3640B2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FA3640B2D;
	Wed, 28 May 2025 14:56:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 113BA19D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A549440860
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffD6_AaiIG77 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 14:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8CEF74085C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CEF74085C
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CEF74085C
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 59067585C99
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:28:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5762143A35;
 Wed, 28 May 2025 14:28:53 +0000 (UTC)
Date: Wed, 28 May 2025 16:28:49 +0200
MIME-Version: 1.0
Message-Id: <20250528-fix_license-v1-4-b59a638b0495@bootlin.com>
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
 bh=95zYTAAFnVTp/RRWRyuP3nA3XAPb5HhIIo+5qouT74k=;
 b=oEswXK0LLSrw+9Lr2OswepaGAAJNF62/LB0OBU2JPvH47k+QQMKiFUUg8SSDicUf+XIZ/0
 a5wsqM2FmOFxb4YKFPHMsjMsaRdK4woAl4snG3HKdb29Q73FQnXBVLF0uXuCC1WIRf9jhJ
 IjT+T6w2q8Zmt+pU9lGoUv1sMu9C25SbicaKVc0/l3P608QkMYcltauT/bQiLXavS1SNVG
 m/KUg7zIVfyIGVYFsWWDgn7UBRXngdYH4sWN5E3f0QfJu1ht9IogrPwXWOiKavww6wtjLm
 TXa/6PNlOIh9xUUVmulmpQfWJcwV3L/d9/KyGH9ianIrEgG0n8ZWWXrRtdt/4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oEswXK0L
Subject: [Buildroot] [PATCH 4/7] opensbi: Add support for custom license
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
 boot/opensbi/Config.in  | 7 +++++++
 boot/opensbi/opensbi.mk | 4 +---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 37f06cd99d..7f79fe3fb7 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -64,6 +64,13 @@ config BR2_TARGET_OPENSBI_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_OPENSBI_CUSTOM_GIT
 
+config BR2_TARGET_OPENSBI_LICENSE_FILES
+	string "OpenSBI license files"
+	default "COPYING.BSD"
+	help
+	  A space-separated list of license files related to the OpenSBI
+	  package.
+
 config BR2_TARGET_OPENSBI_PLAT
 	string "OpenSBI Platform"
 	default ""
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 0142769a12..f9f550176f 100644
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
