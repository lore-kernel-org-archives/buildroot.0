Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42719C5B549
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 14:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB6C440B3B;
	Wed, 28 May 2025 14:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4Vh7cjdKxPt; Wed, 28 May 2025 14:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C48674087C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C48674087C;
	Wed, 28 May 2025 14:58:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 573CA19D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DC5A4032B
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zShEohQVxW44 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 14:58:13 +0000 (UTC)
X-Greylist: delayed 1759 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 28 May 2025 14:58:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B6B640255
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B6B640255
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B6B640255
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B91D43D64;
 Wed, 28 May 2025 14:58:09 +0000 (UTC)
Date: Wed, 28 May 2025 16:57:58 +0200
MIME-Version: 1.0
Message-Id: <20250528-fix_license_toolchain-v1-1-34295630709b@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeehieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghil
 hdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748444289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBzRuzTG+4cA6ly+6y+BvuSDhR7+LvVCUfnHr2LTOTA=;
 b=MMWMjcSAFfb1X+jLjJjxxPb9U1SVKrSN24s378uN1wcGrZRDcm/+LiGc4ug74xLFYBa3Ol
 ahEUqHS80v98m3Z2as94PqTxsjD5miQhEtfJJkP1LGkbCe6LwpxvlN5OTO9veNOthw0fHP
 hgn5nnnbkPCLfl+NLAz8KBANsiaC4WgtBnubtJhoiIKjbu8CS0MdxUbg2PlXzQdbF/NOnl
 c3paZ0ttYdNdUHcmBGDu/nkYe8Ic1G3vjAQX4cjmYxJnBdtJOdNzuNy7siIdJt7P+cOrIZ
 g/H7h3bgjlgTGrNog8z9O1QCJ+5bpWFtNrgKCmCM4S9aKsqs4YrWHTEWeA89fA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MMWMjcSA
Subject: [Buildroot] [PATCH 1/5] toolchain-external: Fix license file
 management after toolchain move
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

The toolchain move to TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR was
preventing license file management from working properly. Copy license
files back to the original toolchain directory to resolve this issue.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c08bf0a653..13d196a1c9 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -106,6 +106,11 @@ define TOOLCHAIN_EXTERNAL_MOVE
 	rm -rf $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
 	mkdir -p $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
 	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)/
+	# Copy back the license files needed for legal-info generation
+	$(foreach f, $($(PKG)_LICENSE_FILES), \
+		[[ -d $$(dirname $(@D)/$(f)) ]] || mkdir -p $$(dirname $(@D)/$(f))
+		cp $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)/$(f) $(@D)/$(f)
+	)
 endef
 endif
 

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
