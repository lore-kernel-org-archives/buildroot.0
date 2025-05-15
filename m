Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CF1C3ABC9
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 13:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3B9B415E7;
	Thu, 15 May 2025 13:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJPMSBD9erxq; Thu, 15 May 2025 13:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F910415D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F910415D1;
	Thu, 15 May 2025 13:13:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46DF8153
 for <buildroot@buildroot.org>; Thu, 15 May 2025 13:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D0DD607C8
 for <buildroot@buildroot.org>; Thu, 15 May 2025 13:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8pJPRHlQSgc for <buildroot@buildroot.org>;
 Thu, 15 May 2025 13:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=olivier.benjamin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F253D60701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F253D60701
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F253D60701
 for <buildroot@buildroot.org>; Thu, 15 May 2025 13:13:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id D909E5845B9
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:36:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 261C34399A;
 Thu, 15 May 2025 12:35:58 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Thu, 15 May 2025 14:35:47 +0200
Message-ID: <20250515123547.571910-1-olivier.benjamin@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefqlhhivhhivghruceuvghnjhgrmhhinhcuoeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeejueefffdvgeegkefhueeujefhtdelffeuleekgeehudeiveehhfetkeduffeinecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeijeeijeemiegsiegvmeejheektgemhegrfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeijeeijeemiegsiegvmeejheektgemhegrfhgupdhhvghlohepphgtqddujedrhhhomhgvpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehphhhilhdrvghitghhihhnghgvrhesghhmrghilhdrtghomhdprhgtphhtt
 hhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomh
X-GND-Sasl: olivier.benjamin@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747312558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hoj4iuuICWTubKxi2aLZzj7tDkv4fTwGZW2Eg1sFTew=;
 b=kUxgVyFpegu+vwS+iTtR67OAt2eZWwAST1Tfq17+NsZWn0jPM4oK+dZpdX2sqGYkM1F3k6
 htsrnT85LPDwtwkTZKdIUOwx0ak7dyGfGNCaryob7RfHtwA9tRfybps6NWIrlDyFiIOfGK
 8mVsoFec7qjh2ozX8NJTI1kw5fE3v6enPxXwnEojJagjMXNqoYoeerjNV8ki/Hsxene+ev
 yuh8sdGKE6pnpO7OyD1D/sSRSEzlvTLCeO0SIo+DK4oiYavYDbA4V7uQgLvuKbVPEnk6nB
 N8lqm3DZT1Wyk4QdYW1ABsby4705QOKL3wyX/RZqdGS8FwiP9zgcCyDc7Sq7eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kUxgVyFp
Subject: [Buildroot] [PATCH 1/1] package/psplash: bump to revision 53ae74a
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

This includes the following changes:

53ae74a configure.ac: fix autoconf code for img_fullscreen
ec1ed35 configure.ac: standardize default-enabled options
1f64c65 README: Update mailing list to point to yocto-patches ml
b1a75fd psplash: Only define bool if using C standard older than C23
5a32cf6 psplash.c: fix crash from length becoming negative
ecc1913 SECURITY.md: Add file

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 package/psplash/psplash.hash | 2 +-
 package/psplash/psplash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 61514f57c0..e28f35b4f3 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06def825088f44422fad8a885077d917db6f47688457d4a0953c2ff6f6036378  psplash-44afb7506d43cca15582b4c5b90ba5580344d75d-git4.tar.gz
+sha256  18efa5f56e5b2ff4e8916b7632e7da59122e33f79bb514a8e225e12931e3ef20  psplash-53ae74a36bf17675228552abb927d2f981940a6a-git4.tar.gz
 sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index bb249e7de8..ea57d884d5 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSPLASH_VERSION = 44afb7506d43cca15582b4c5b90ba5580344d75d
+PSPLASH_VERSION = 53ae74a36bf17675228552abb927d2f981940a6a
 PSPLASH_SITE = https://git.yoctoproject.org/psplash
 PSPLASH_SITE_METHOD = git
 PSPLASH_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
