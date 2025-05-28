Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A35C5B543
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 14:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F6C040B72;
	Wed, 28 May 2025 14:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLRw9XbPbW02; Wed, 28 May 2025 14:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1D540B62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF1D540B62;
	Wed, 28 May 2025 14:57:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CF61B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E07660E7A
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5NKPhn7dmj7 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 14:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D89760E86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D89760E86
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D89760E86
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 7304458172C
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:28:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E154E43A37;
 Wed, 28 May 2025 14:28:51 +0000 (UTC)
Date: Wed, 28 May 2025 16:28:46 +0200
MIME-Version: 1.0
Message-Id: <20250528-fix_license-v1-1-b59a638b0495@bootlin.com>
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
 bh=fvPBse9UNXVClX+B/vi6WpXexlTP6A74ePzQmszG/H4=;
 b=iJ2mLbcUEiXkFMHqEQFMrFFmV/cTVNVugfapH+VNMXYQ0g/1QasHcmmGSmTfqGcAXNYClI
 fHJ7niuepDERW/gAaKOkGdUW01DpsuZ7qexucEKpxQBOWM7FwIWEnYdARtadBwZKvJv2ob
 IcfVTR50rTh/DYRYEARJ24gasm2/Xm/51QSIQrunZ+KwWYlw+N5XXL9+VvMxSCrMbMXNqD
 6e/eGzGAyYXagEZNpzQckfTHVJGiDhrE8sdDME4MxNm5ByniZRuqgeWyP1WhZTQW4BJTMN
 yyJundeK/02Yi2yxO0Y+wD90e4hNM8zIMINR7v+SoSbgKWYWWgOW1FTCUicXXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iJ2mLbcU
Subject: [Buildroot] [PATCH 1/7] linux: Add support for custom license files
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

The Linux package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 linux/Config.in | 7 +++++++
 linux/linux.mk  | 8 ++------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7552aa4d6c..db9785b9c9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -146,6 +146,13 @@ config BR2_LINUX_KERNEL_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
 		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
 
+config BR2_LINUX_LICENSE_FILES
+	string "Kernel license files"
+	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
+	help
+	  A space-separated list of license files related to the Linux
+	  kernel package.
+
 #
 # Patch selection
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 16762ac2e6..7185eb2d44 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -6,12 +6,8 @@
 
 LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPL-2.0
-ifeq ($(BR2_LINUX_KERNEL_LATEST_VERSION),y)
-LINUX_LICENSE_FILES = \
-	COPYING \
-	LICENSES/preferred/GPL-2.0 \
-	LICENSES/exceptions/Linux-syscall-note
-endif
+LINUX_LICENSE_FILES = $(call qstrip,$(BR2_LINUX_LICENSE_FILES))
+
 LINUX_CPE_ID_VENDOR = linux
 LINUX_CPE_ID_PRODUCT = linux_kernel
 LINUX_CPE_ID_PREFIX = cpe:2.3:o

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
