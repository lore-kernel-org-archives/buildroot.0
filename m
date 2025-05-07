Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4EAC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 12:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4DE082342;
	Wed,  7 May 2025 12:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDCz2MH7BKg9; Wed,  7 May 2025 12:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC69982131
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC69982131;
	Wed,  7 May 2025 12:02:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEC18950
 for <buildroot@buildroot.org>; Wed,  7 May 2025 12:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B32B981D67
 for <buildroot@buildroot.org>; Wed,  7 May 2025 12:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IdeN7ynwrzzz for <buildroot@buildroot.org>;
 Wed,  7 May 2025 12:02:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=olivier.benjamin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE72781D2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE72781D2D
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE72781D2D
 for <buildroot@buildroot.org>; Wed,  7 May 2025 12:02:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 7DB4B5876F8
 for <buildroot@buildroot.org>; Wed,  7 May 2025 11:40:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40A3F43A05;
 Wed,  7 May 2025 11:40:53 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Wed,  7 May 2025 13:40:41 +0200
Message-ID: <20250507114042.96291-1-olivier.benjamin@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeijeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefqlhhivhhivghruceuvghnjhgrmhhinhcuoeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfehvdegffettdffieelgeeikeehhfduteejudeiffdutdduhfekudekfefggeelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieejieejmeeisgeivgemjeehkegtmeehrghfugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieejieejmeeisgeivgemjeehkegtmeehrghfugdphhgvlhhopehptgdqvdelrdhhohhmvgdpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphhhihhlrdgvihgthhhinhhgvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhli
 hhnrdgtohhmpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhm
X-GND-Sasl: olivier.benjamin@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746618053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=U8EX6P6rQ75jOUlnuIipKmNVnp+mY5LzyxUjv3uGcjA=;
 b=HoVDStls2prlZif00aKSicTnYeDEApRPnpS7s8zlTSFYr7qWXOC2nlJOaxSv8V9uzapxkY
 jQPo/xor2WaTDHceaynYpSuys3gy5NhDXyRxffFixXsaq6OTB2jsDqjnRYDoJioh9r9Okr
 BzCPmLGnR/TDUBnJ3XlQ5Lkv+jlgUQJztYtHBKnBk4DGVpN1eWeARES6SkPFQ1MLetO8pI
 cGsk3q4DUkez/qP9wH87zue5y2btxT6ii5OkUQXEUu+liw5mg/zGT3Z12dy+5WAqn/wxM6
 PZKzw8bMdTpz3oGHFU74ZGtW7dJJ0oz2XTRKB5/h0Tazer6KED5t/ZvemRRv2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HoVDStls
Subject: [Buildroot] [PATCH 1/1] package/psplash: add support for fullscreen
 config option
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
From: Olivier Benjamin via buildroot <buildroot@buildroot.org>
Reply-To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for a psplash configure option:
  --enable-img-fullscreen, via BR2_PACKAGE_PSPLASH_FULL_SCREEN

The Buildroot option will default to 'n' to be compatible with
the previous behaviour, as it was disabled by default in psplash.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 package/psplash/Config.in  | 6 ++++++
 package/psplash/psplash.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index 61162fa583..ca39cd0ee3 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -47,6 +47,12 @@ config BR2_PACKAGE_PSPLASH_STARTUP_MSG
 	help
 	  Enable text banner output on startup.
 
+config BR2_PACKAGE_PSPLASH_FULL_SCREEN
+	bool "use fullscreen mode"
+	default n
+	help
+	  Enable displaying the psplash image in fullscreen mode.
+
 endif
 
 comment "psplash needs a toolchain w/ wchar"
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 62268e778b..bb249e7de8 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -31,6 +31,12 @@ else
 PSPLASH_CONF_OPTS += --disable-startup-msg
 endif
 
+ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
+PSPLASH_CONF_OPTS += --enable-img-fullscreen
+else
+PSPLASH_CONF_OPTS += --disable-img-fullscreen
+endif
+
 PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
 
 ifneq ($(PSPLASH_IMAGE),)
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
