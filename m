Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A87FC02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 07:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 246A6614A0;
	Sat, 14 Sep 2024 07:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnwrPVzv5dM5; Sat, 14 Sep 2024 07:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC01661495
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC01661495;
	Sat, 14 Sep 2024 07:20:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70C6A1BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57ED261247
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X30Nz37shaF0 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 07:19:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B26B607E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B26B607E0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B26B607E0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 07:19:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C98E1C0002;
 Sat, 14 Sep 2024 07:19:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1spN4I-004zXq-03;
 Sat, 14 Sep 2024 09:19:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 09:19:22 +0200
Message-Id: <20240914071930.1189715-15-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240914071930.1189715-1-peter@korsgaard.com>
References: <20240914071930.1189715-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 15/23] package/libkrb5: fix deactivate typo
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 08bc74eb34..def627d422 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -36,7 +36,7 @@ LIBKRB5_CONF_OPTS = \
 
 # libkrb5 has some assembly function that is not present in Thumb mode:
 # Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode
-# so, we desactivate Thumb mode
+# so, we deactivate Thumb mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBKRB5_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
