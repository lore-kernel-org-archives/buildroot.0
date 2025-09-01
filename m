Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7496CA1005
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 13:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 899BE40C26;
	Mon,  1 Sep 2025 13:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKFcgFNfOzmz; Mon,  1 Sep 2025 13:05:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAC5040C5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC5040C5C;
	Mon,  1 Sep 2025 13:05:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9906A169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88D0581219
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3vc6qqBHYtU for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 13:05:00 +0000 (UTC)
X-Greylist: delayed 505 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Sep 2025 13:05:00 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D40B81215
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D40B81215
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D40B81215
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:05:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2FB811814B9; Mon,  1 Sep 2025 14:56:28 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 14:55:55 +0200
Message-ID: <20250901125608.664523-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1756731388; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=t2pNKA0dKIkmqcnmjPFB5x7uBcfajsffRW4MxyA5zOQ=;
 b=YRe0qXbYg7oFZ6LRpGka6T5U5mjWtMURGJxCiM+fipjKuK+62ouwF+Q9a83CVpxXs2cPbX
 cLvYH6MEh7mUrNafsQFMR2aYXk4UdtUbDweP2WrMzmxDgHw2hUb/fbikKzNNJ1rTnY0ocq
 uUrm+qHf4yyRh0WB5YMEoBA74QE/0Qg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=YRe0qXbY
Subject: [Buildroot] [PATCH] package/catch2: bump to version 3.10.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:

v3.10.0: https://github.com/catchorg/Catch2/releases/tag/v3.10.0
v3.9.1: https://github.com/catchorg/Catch2/releases/tag/v3.9.1
v3.9.0: https://github.com/catchorg/Catch2/releases/tag/v3.9.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 30ff1f43b3..8776009945 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  18b3f70ac80fccc340d8c6ff0f339b2ae64944782f8d2fca2bd705cf47cadb79  catch2-3.8.1.tar.gz
+sha256  fc4303a5c2738beaa727066e126b5a28837a812230a3c5826caa38e7ab99ca48  catch2-3.10.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index 00d6e5bfdc..76fb852464 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.8.1
+CATCH2_VERSION = 3.10.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
