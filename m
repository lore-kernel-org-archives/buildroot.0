Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4807FC0218F
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 16:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0694E426C6;
	Thu, 30 Jan 2025 16:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dMwu_wryoK3; Thu, 30 Jan 2025 16:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D505A426C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D505A426C7;
	Thu, 30 Jan 2025 16:11:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB6FC129
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 16:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA8A884814
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 16:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W38qm9nLOsIz for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 16:11:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=olivier.benjamin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D829684811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D829684811
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D829684811
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 16:11:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D96544419E;
 Thu, 30 Jan 2025 16:11:50 +0000 (UTC)
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
To: buildroot@buildroot.org
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Thu, 30 Jan 2025 17:07:39 +0100
Message-ID: <20250130161119.83312-2-olivier.benjamin@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250130161119.83312-1-olivier.benjamin@bootlin.com>
References: <f6a5318b-2939-4517-a74b-112c39c0194b@bootlin.com>
 <20250130161119.83312-1-olivier.benjamin@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeivdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefqlhhivhhivghruceuvghnjhgrmhhinhcuoeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeejgeefieeuheeljeejfffhjeetkeehfedvvdffffelhfefvdetjefgvdfgiedvnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopehfvgguohhrrgdrrddpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphhhihhlrdgvihgthhhinhhgvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhm
X-GND-Sasl: olivier.benjamin@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738253511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hM6TLje6DI2tqvBara0+TdaX9GivW3NMLc929kpfNIw=;
 b=ZJbdnZ8zaOTWffBVE6QeJV3j6bjLZ8AL3/B6ACJNCoikJPomNFPWqZrB36/Y1WHE0WC3hU
 mm56BkMi9L1RXAeQbjUV9xrC9aGNrHnpuXEmRlRPGKWrmjHhNuICchEDhdhRXK9y3+7gZ9
 2QRJuISAVF5umNi2AlrvuZ88VzXdeqW2bmeFRBhA5NfxV/Ks5kjLzq3c2L5R7hAMiWFYI0
 1yKMKfesHbw71HO+JOBOiSoXk5ZlugphQPk9Sy1fqM5BYykiPV3JCj6LoG1e2hRaKiJMFL
 PCykneuelDQwDs2GGYwmKdHBor/kyr76vIc/oxEkivh6loI0GSMjMAeIdUChiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZJbdnZ8z
Subject: [Buildroot] [PATCH 1/1] package/psplash: add support for two
 configure options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for two configure options:
  --disable-progress-bar, via BR2_PACKAGE_PSPLAH_PROGRESS_BAR
  --disable-startup-msg, via BR2_PACKAGE_PSPLASH_STARTUP_MSG

Both buildroot options will default to 'y' to be compatible with
the previous behaviour, since those were enable by default by
not specifying the disable config flag.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 package/psplash/Config.in  | 12 ++++++++++++
 package/psplash/psplash.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index da99b264e0..61162fa583 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -35,6 +35,18 @@ config BR2_PACKAGE_PSPLASH_IMAGE
 	  Use a personalized png image as boot splash.
 	  Let it empty if you want to keep the psplash default image.
 
+config BR2_PACKAGE_PSPLASH_PROGRESS_BAR
+	bool "enable progress bar"
+	default y
+	help
+	  Enable progress bar management via the "PROGRESS" command.
+
+config BR2_PACKAGE_PSPLASH_STARTUP_MSG
+	bool "enable startup message"
+	default y
+	help
+	  Enable text banner output on startup.
+
 endif
 
 comment "psplash needs a toolchain w/ wchar"
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 69f9bf386d..f13f92d587 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -19,6 +19,18 @@ else
 PSPLASH_CONF_OPTS += --without-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR), y)
+PSPLASH_CONF_OPTS +=
+else
+PSPLASH_CONF_OPTS += --disable-progress-bar
+endif
+
+ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG), y)
+PSPLASH_CONF_OPTS +=
+else
+PSPLASH_CONF_OPTS += --disable-startup-msg
+endif
+
 PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
 
 ifneq ($(PSPLASH_IMAGE),)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
