Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FA1C0219E
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 15:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5832812FE;
	Sat,  8 Feb 2025 15:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kzryae1bnGU; Sat,  8 Feb 2025 15:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01F738130F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01F738130F;
	Sat,  8 Feb 2025 15:06:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7815CF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D495040649
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PR93BoXOeNgO for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 15:05:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D108C4065E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D108C4065E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D108C4065E
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:04:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 5A772204A8;
 Sat,  8 Feb 2025 15:04:15 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sat,  8 Feb 2025 16:04:12 +0100
Message-ID: <20250208150413.172911-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208150413.172911-1-thomas.petazzoni@bootlin.com>
References: <20250208150413.172911-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeigeelhffggfeitdefjeejgeegieejieetleffvedvhfethfduvdfhgeeutddtgeenucffohhmrghinhepghhnuhdrohhrghdpsghuihhlughrohhothdrnhgvthenucfkphepvdgrtddumegtsgduleemkeelgegsmeehhedttdemvddutggvmegsvgehieemrggsfedvmegtrggrvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekleegsgemheehtddtmedvudgtvgemsggvheeimegrsgefvdemtggrrggvpdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhmpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1739027055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8GH3OJorRL4171bVGlxaTHkiCPsW3CJihswpi+ufIg=;
 b=pmEUcSNkUJ22tJZSFWp9srS5/AW56EyVi/csPBw5MkWanJwGiJ3muuJLbAvstMpBxn4Kqi
 7pV12k18MvDMZ5dq4Sdz5BGGuxf/HERAozxgsXoukAoKRToiJQoYedSwu0LmOJTT6QjRjH
 METffMQ0rONJy6vulhw+CC8kpswC/b+NUsDk5oiwPwmnkbU65Q82Tyo93kOSfyRcLmVZ4g
 A4pP4yY7w0G/FAHDAqKKdSDFLRwe+3iPlFiPVBWLXfgy+aICR/X4rFmIVWbvgbhXyt+vcG
 d7D2hNhTvIJ9ORHbbG6Q+tpyjYcI/FHnky7P3FVSsVimjHS/cXFL5z/ksXl6yQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pmEUcSNk
Subject: [Buildroot] [PATCH 2/2] package/gcc: disable GCC 14.x on Microblaze
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC 14.x is badly broken on Microblaze, with important functions
missing from libatomic, causing build failures in a huge number of
packages. The issue has been reported upstream at
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280 but still isn't
fixed. For the time being, let's disable GCC 14.x on Microblaze.

Fixes:

  http://autobuild.buildroot.net/results/6fea0ecaa90b24da4e5575565b88018ea95e72c0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 911bc2f4de..10fe4bf609 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -44,6 +44,9 @@ config BR2_GCC_VERSION_14_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
+	# Severely broken on Microblaze
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
+	depends on !BR2_microblaze
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
 endchoice
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
