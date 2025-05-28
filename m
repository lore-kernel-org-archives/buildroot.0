Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF27C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 14:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA03F402C7;
	Wed, 28 May 2025 14:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_8xzZt46gB6; Wed, 28 May 2025 14:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC8584032B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC8584032B;
	Wed, 28 May 2025 14:58:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AFE8B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CA4340F9E
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOcHQY7N3sKe for <buildroot@buildroot.org>;
 Wed, 28 May 2025 14:58:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 438C140EFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 438C140EFD
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 438C140EFD
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3828243D82;
 Wed, 28 May 2025 14:58:10 +0000 (UTC)
Date: Wed, 28 May 2025 16:58:01 +0200
MIME-Version: 1.0
Message-Id: <20250528-fix_license_toolchain-v1-4-34295630709b@bootlin.com>
References: <20250528-fix_license_toolchain-v1-0-34295630709b@bootlin.com>
In-Reply-To: <20250528-fix_license_toolchain-v1-0-34295630709b@bootlin.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeehieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfehhedvhedtudduheehtedvtdeggfduiedthfekuefgfeekudffgfdtgfetgeelnecuffhomhgrihhnpegrrhhmrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehro
 hhmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748444290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lpRpbwmQm3qYLm+ip/w+hUBxL7YEC9jWeh+lGLecfQQ=;
 b=YwA1h2aBGWiDSh3S1+tCTg917SLlu19bKaTrFxcsBLFCjpEGte3foExarPUS41oHz+bSMT
 IlVDl9yvAAOhSl3fyNMKNDoLxx9Ms6g4R5MGAuLcfaz0T4jx2DcvqRPZhWqY5ymIaIowLZ
 ECN6H99DAgfUEwtOPE+CyqM3GpbZbvaMGcChbY7NYsJ5yKzQW6staxzcK/rg8tXMGrHX+o
 ukaDShuBL8IW/48y/ngauN/5DHJEP5+JUE7UAaUZoGrENpM4IVtNJ5JI9sDvkPw6MoeQbp
 nBmFxw0SxwkeAcrJAFBC01i2HZXATDVeKrU1lM/j45+aFmGUnERm4GXLhBNb4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YwA1h2aB
Subject: [Buildroot] [PATCH 4/5] toolchain-external-arm*: Add support for
 license file description
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

Add support for ARM toolchain license description using the
license.txt file as the license metadata. This ensures license compliance
when using external ARM toolchains.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 .../toolchain-external-arm-aarch64-be.hash                              | 1 +
 .../toolchain-external-arm-aarch64-be.mk                                | 2 ++
 .../toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash  | 1 +
 .../toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk    | 2 ++
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.hash          | 1 +
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk            | 2 ++
 6 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index 317fc10a09..96c98c2049 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,2 +1,3 @@
 # From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
 sha256  0ea5d00d0ba4c5d16bc8e140d434c54367516b568a146d724936c589a2f56aaf  arm-gnu-toolchain-14.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
+sha256  9b47c67a1d2421fa5724e2bfd9e2be03f399ade15273b6e38a8f2a3c9bfe31d6  license.txt
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index 381a591932..53ed8f7eec 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -8,5 +8,7 @@ TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 14.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_LICENSE = multiple (license.txt)
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_LICENSE_FILES = license.txt
 
 $(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index 3f9c9cea71..088fef0d52 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -2,3 +2,4 @@
 sha256  47aeefc02b0ee39f6d4d1812110952975542d365872a7474b5306924bca4faa1  arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
 # From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz.sha256asc
 sha256  299c56db1644c135670afabbf801b97a42e5ef6069d73157ab869458cbda2096  arm-gnu-toolchain-14.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz
+sha256  9b47c67a1d2421fa5724e2bfd9e2be03f399ade15273b6e38a8f2a3c9bfe31d6  license.txt
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index cbc923bee5..c394ba808f 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -8,5 +8,7 @@ TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 14.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-$(HOSTARCH)-aarch64-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_LICENSE = multiple (license.txt)
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_LICENSE_FILES = license.txt
 
 $(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index 9a657a5ed4..9772c0bc27 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -2,3 +2,4 @@
 sha256  32301a5a33aab47810837cdab848a5a513ca22804d3168d3ada5833828b07912  arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
 # From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
 sha256  3fe832f9c831323a37ff54bfb5ac7a083acdd473f2c93feaf0cb3c1ac690d739  arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
+sha256  9b47c67a1d2421fa5724e2bfd9e2be03f399ade15273b6e38a8f2a3c9bfe31d6  license.txt
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 86937a7412..4c439b917c 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -8,5 +8,7 @@ TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 14.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_ARM_LICENSE = multiple (license.txt)
+TOOLCHAIN_EXTERNAL_ARM_ARM_LICENSE_FILES = license.txt
 
 $(eval $(toolchain-external-package))

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
