Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F08C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B71141F08;
	Tue,  6 Feb 2024 10:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B71141F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stUA1VtP1UFX; Tue,  6 Feb 2024 10:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B04041F09;
	Tue,  6 Feb 2024 10:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B04041F09
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E2461BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9920F821AF
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cs1QxURWiaxs for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:53:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8BD0821A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8BD0821A6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8BD0821A6
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:53:51 +0000 (UTC)
Received: from bubutux.localdomain (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A9BBE2C8377C;
 Tue,  6 Feb 2024 11:53:49 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 11:52:40 +0100
Message-ID: <20240206105246.1220945-4-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206105246.1220945-1-buildroot@bubu1.eu>
References: <20240206105246.1220945-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707216829; bh=EncFTw4+kP6SNO4V4G5tc/X1uXzO+G0BSft8j4rBdYs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GSHZkKxon+Cr97eI8wmR4LfBKD9/egDIgcB/TRj1/tULvHfgTPrqxFwRE1vgQq1U6
 PYBLPfOs4nicoRZrZyxnP5WJ03KrpmWWVbHoG4/QI+wP807Q4bz7DeGFVZfPUixWYk
 7CYhQzH/hSRneZcOr2PwiJq62mr42w30uRlkVibr1GbDjDPR8JJHQy+J3F2qqM9QM5
 q+9WnLMfj3X0mHrnCNpkCte7/dmJafpNmTw74Jb35i+QyHF7Sr4/2OMzvYKpm6iDop
 YTuWqyH9eMqG2jB7ZIaVgLfr/drLR5oSj6YKnQhTA0FgK9XRXj6vNWAwVJcETKDXaQ
 6BSYI/KXjWwIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=GSHZkKxo
Subject: [Buildroot] [PATCH 4/6] docs/website/support.html: document irc
 channel permission changes
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The #buildroot IRC channel recently changed from only allowing
registered users to join to allowing anyone to join but only allowing
registered users to talk in the channel. This still avoids the spam
problem on IRC while allowing an exception for users bridged from
matrix.org. These already have a username registered on the matrix side
and thus similar properties as a registered IRC user/nick.

The commands to set these options were:

* Set +q on all unregistered nicks: ~/mode #buildroot +q $~a~ this lets
  people join but they can't talk
* Set exempt on matrix hosts: ~/mode #buildroot +e $x:matrix.org~

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 docs/website/support.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 13d63b13a9..28873c6d76 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -27,8 +27,8 @@
 		    When asking for help on IRC, share relevant logs or pieces of code using a code
 		    sharing website.</p>
 
-		  <p>Note that due to excessive spamming on IRC, the channel can only be
-		    joined if you are a registered user with
+		  <p>Note that due to excessive spamming on IRC, you can only talk in the
+		    channel if you are a registered user with
 		    <a href="https://www.oftc.net/Services/">OFTC NickServ</a>
 		    service. Follow the instructions to register as a user with a password,
 		    and then join the <code>#buildroot</code> channel.</p>
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
