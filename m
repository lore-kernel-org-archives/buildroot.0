Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD8DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4488A60F54;
	Fri, 22 Jul 2022 20:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4488A60F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BG9hfPQt_TuG; Fri, 22 Jul 2022 20:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC7B60F09;
	Fri, 22 Jul 2022 20:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EC7B60F09
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42D661BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA18840A89
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA18840A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMY5ME4fp35E for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:21:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F415E40104
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F415E40104
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:21:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 322AD240003;
 Fri, 22 Jul 2022 20:21:55 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 22 Jul 2022 22:21:43 +0200
Message-Id: <20220722202151.76235-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
References: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658521316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3mtA7g5FOjQ7lbIHuHMrme8n3HJosf7RryI03J4a94=;
 b=gllki7aiqcrDNRSnwJ2ps1uEHJ4KBwbiw++SHU5BE0Iisfcy4g9TajEYJc7NGcnr45Cmch
 Lf7XLP0JT18pCT8BOKDO9ooeG1gb3uzPmEHQ/vgrrtPk/mKPHg6kzoXhz6IjnAv1NlVHgw
 vZ18lpZGpB2alFhLoKefHmz1Owr5rvTrEe3LQBf+n28d6rc0lrYclVHRCXdVMOm7wwVPmh
 8SsG7bj58krEympa58PAdSuZITbr9rnwRh4jotO4cPOr7orI5SWXRbopN9iXxYcpmCOPB7
 IfZCWHRM1HDHIJvgqtOWD9JLH+XdUcE0G1DdM8D8xN4fnbQJIG7RnptOcO5r3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gllki7ai
Subject: [Buildroot] [PATCH 1/8] board/orangepi/common/genimage.cfg: use
 quotes around "gpt"
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Like we do in all other genimage configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/orangepi/common/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/common/genimage.cfg b/board/orangepi/common/genimage.cfg
index a61c4a039f..c748108ca0 100644
--- a/board/orangepi/common/genimage.cfg
+++ b/board/orangepi/common/genimage.cfg
@@ -7,7 +7,7 @@ image sdcard.img {
 	}
 
 	hdimage {
-		partition-table-type = gpt
+		partition-table-type = "gpt"
 		gpt-location = 1008K # 1MB - 16KB(GPT)
 		gpt-no-backup = true
 	}
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
