Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9689CE7717D
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 08:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 601DD80AB3;
	Mon,  9 Dec 2024 08:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juNAdzkV9lL6; Mon,  9 Dec 2024 08:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 772B080AD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 772B080AD5;
	Mon,  9 Dec 2024 08:28:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BADDED2
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EAE740604
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j06jk4WDIXjZ for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 08:27:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F084408C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F084408C3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F084408C3
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FC9BE000D;
 Mon,  9 Dec 2024 08:27:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tKZ78-00CnST-01;
 Mon, 09 Dec 2024 09:27:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  9 Dec 2024 09:27:19 +0100
Message-Id: <20241209082722.3049825-21-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209082722.3049825-1-peter@korsgaard.com>
References: <20241209082722.3049825-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 21/23] package/wilc-firmware: fix 'acceptable'
 typo
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wilc-firmware/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wilc-firmware/Config.in b/package/wilc-firmware/Config.in
index 72a9c73206..813a75ecf2 100644
--- a/package/wilc-firmware/Config.in
+++ b/package/wilc-firmware/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_WILC1000_FIRMWARE
 
 	  These binary blobs are provided directly from Microchip.
 	  Ideally, the firmware version should match driver version.
-	  Generally, the latest firmware would be acceptible regardless
+	  Generally, the latest firmware would be acceptable regardless
 	  of driver version.
 
 	  These will be installed to /lib/firmware/mchp/
@@ -26,7 +26,7 @@ config BR2_PACKAGE_WILC3000_FIRMWARE
 
 	  These binary blobs are provided directly from Microchip.
 	  Ideally, the firmware version should match driver version.
-	  Generally, the latest firmware would be acceptible regardless
+	  Generally, the latest firmware would be acceptable regardless
 	  of driver version.
 
 	  These will be installed to /lib/firmware/mchp/
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
