Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BDDC4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 09:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4546F82D49;
	Tue, 31 Oct 2023 09:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4546F82D49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yh9RoJ4slilk; Tue, 31 Oct 2023 09:01:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C51682D2F;
	Tue, 31 Oct 2023 09:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C51682D2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 575671BF329
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 09:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C3D441552
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 09:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C3D441552
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysfO-j-mPajx for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 09:01:19 +0000 (UTC)
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8449340466
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 09:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8449340466
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xkcdq7eTycfkCxkcdqKxNs; Tue, 31 Oct 2023 10:01:15 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 10:01:14 +0100
Message-Id: <20231031090114.618913-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGYqUeNF6l3mWVyLQfgLlja+u6AeiBKN/Bh6QWLwmYJ26c1USdRco5OkSZ7DQcrjWLDXL4w5n2dlU3xBlnSbuqfKAgXLGBDVU8Q9hiP0BlJDeTXrasVN
 g+viCzHAky7H/R9EctS1WNlZQw198pzDrnxevb6uFQQuDMqX0tIVvIaoRzKzULOWgJI26REr9EX17INEy/FfqNAOXalxKtWQP7JV9rwV5t5h97FGO4YgV0OB
 D5mdYfZBKOubrk727DRpSCA9XZMx7706iG/y4I0t/hjl0dIacyB4pUdfgFFpFQudiZIUlKl7hbyFtMjfQceRsPlHVD3NGYIw0o2DwpmUk1t2Ps11ZO3RzJaU
 SC5YDnjtlg+LbjBReplHms2BkYW6QLsWlwYLlSpU8bv/KIYmnCkVrd4xp4TXpwbVynjMxIGH
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698742875; bh=OJhiR+5IG5HTvucBvymq3vAzruw0D40UDWBUdMVAIrg=;
 h=From:To:Subject:Date:MIME-Version;
 b=KBPw535UW5Zuz9nlr/6z1b5bHwoC8hWR67WcqJtDEGTpyw6RV9B5pc2ZP9sQJ6WQD
 I6LxtsHqmXtI4e6Q/EeqdJjIVawneYp8HIxI/CVpYwkPRMBUBmvd9Hkj2GkcP6IblK
 EY1rhYZf1+Kxng2brSJuNEUNYDjrqMTlg59JnTSIFf38r3Jie2JFVxSa0+q0qYI6Ys
 G5Q2CNmwoIBh789SFvr9/eph1n1+Zgcx13wCksbEVwYvbWmj8BUyQSGoDQg2FO7lD9
 pjBw2uklt7r9wpLIT4vdiDlu1NHHIc0qfltH5i1X9JvR5BO2AMwuOy/jyJf0QruyvP
 sVIvKp46L4Ang==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=KBPw535U
Subject: [Buildroot] [PATCH] package/nodejs: fix additional modules
 installation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At the moment the npm_config_nodedir is set to the build directory but
npm nodedir must be the one on target to find the expected files. So let's
set npm_config_nodedir to $(TARGET_DIR)/usr.

Fixes:
https://bugs.busybox.net/show_bug.cgi?id=15826

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/nodejs/nodejs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 2a8c570932..8f86413049 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -20,7 +20,7 @@ NODEJS_BIN_ENV = $(TARGET_CONFIGURE_OPTS) \
 	npm_config_arch=$(NODEJS_CPU) \
 	npm_config_target_arch=$(NODEJS_CPU) \
 	npm_config_build_from_source=true \
-	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
+	npm_config_nodedir=$(TARGET_DIR)/usr \
 	npm_config_prefix=$(TARGET_DIR)/usr \
 	npm_config_cache=$(BUILD_DIR)/.npm-cache
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
