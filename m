Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D170C369DC
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 06:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A20DF60764;
	Wed,  7 May 2025 06:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gezxP3K3YlNE; Wed,  7 May 2025 06:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E14E760EAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E14E760EAC;
	Wed,  7 May 2025 06:53:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53418CD
 for <buildroot@buildroot.org>; Wed,  7 May 2025 06:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4535440BE5
 for <buildroot@buildroot.org>; Wed,  7 May 2025 06:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXvglkaHyCsU for <buildroot@buildroot.org>;
 Wed,  7 May 2025 06:52:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16ED940BC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16ED940BC2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16ED940BC2
 for <buildroot@buildroot.org>; Wed,  7 May 2025 06:52:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A67C43B4A;
 Wed,  7 May 2025 06:52:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uCYeE-00Eefs-0Z;
 Wed, 07 May 2025 08:52:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  7 May 2025 08:52:52 +0200
Message-Id: <20250507065253.3492905-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeiudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpedtteegkeekjedugeegleelueeuheetuddvvdejkefghefgtdeileehffdviedttdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/jo: bump version to 1.9
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

Mainly bugfixes (1.8 was deleted):

https://github.com/jpmens/jo/releases/tag/1.9
https://github.com/jpmens/jo/releases/tag/1.7

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jo/jo.hash | 2 +-
 package/jo/jo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jo/jo.hash b/package/jo/jo.hash
index efad8228a7..82cb212a83 100644
--- a/package/jo/jo.hash
+++ b/package/jo/jo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb15592f1ba6d5a77468a1438a20e3d21c3d63bb7d045fb3544f223340fcd1a1  jo-1.6.tar.gz
+sha256  0195cd6f2a41103c21544e99cd9517b0bce2d2dc8cde31a34867977f8a19c79f  jo-1.9.tar.gz
 sha256  41d8b23dc6e76731f4920b9ce42d0d4a248d243a510319e2441d174a115f35cf  COPYING
diff --git a/package/jo/jo.mk b/package/jo/jo.mk
index dd5dd03ddb..911d3e5f3d 100644
--- a/package/jo/jo.mk
+++ b/package/jo/jo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JO_VERSION = 1.6
+JO_VERSION = 1.9
 JO_SITE = https://github.com/jpmens/jo/releases/download/$(JO_VERSION)
 JO_LICENSE = MIT (json.[ch]), GPL-2.0+ (rest)
 JO_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
