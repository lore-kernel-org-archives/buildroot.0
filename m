Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCDAC4829A
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 00:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB82540AE2;
	Mon, 12 Feb 2024 00:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2T2T7h_eqQy7; Mon, 12 Feb 2024 00:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 675F840B02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 675F840B02;
	Mon, 12 Feb 2024 00:21:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBC1C1BF861
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A929B84115
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0KZm2dx6XXLc for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 00:21:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 890FC8400C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 890FC8400C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 890FC8400C
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 00:21:44 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 8250D2C83901
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 01:21:42 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 01:21:26 +0100
Message-ID: <20240212002128.3002289-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707697302; bh=VF9W8a7pegxgQvsgEMyY260FvZWFMsf8AuL891N9W28=;
 h=From:To:Subject:Date;
 b=e/XxcW/8FVtZLQazLJNjr0m2zwdUEzoCvKREyw7lLfGI7IMyiTIYKSY/PL8XJjwIi
 Kr8tXIOjrLT3TvhssxFbK/3fIO7jzr6k/4seVyxeD5Ci+ucJOyGtI3+hZBPwYXSDwp
 a8QzXtfRFkCOnWLZMy4oeNZLu46r41zJ7ddS4tGZ7LT/6bPlCDOn9gH8AKfaoWFYFd
 EAlHAF9MGnVZ/OnJdK6vg3pu3zPk/4C5uRiyqi/+qDvWepCPQLYPW1UWmusc3RjDOv
 pPH0RHlZlV6THizf0IcKDXVdmeZw7D94cEwfplpqTDWUw9uG19PUTW1QB+mwyElEQJ
 8R3D6X205yH4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=e/XxcW/8
Subject: [Buildroot] [PATCH] Revert "docs/website/support.html: document irc
 channel permission changes"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This didn't work out as planned, neither the restriction of muting
unregistered users, nor the exception for matrix users worked as planned.

The channel mode has been reverted to +R (meaning only registered users
are allowed to join) and an exception for *that* has been introduced for
matrix users via +e. The channel modes are documented in [1].

[1] https://www.oftc.net/ChannelModes/

This reverts commit d1e6d7845b0f3b450709b84a6e4fc4527f12b196.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 docs/website/support.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 28873c6d76..13d63b13a9 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -27,8 +27,8 @@
 		    When asking for help on IRC, share relevant logs or pieces of code using a code
 		    sharing website.</p>
 
-		  <p>Note that due to excessive spamming on IRC, you can only talk in the
-		    channel if you are a registered user with
+		  <p>Note that due to excessive spamming on IRC, the channel can only be
+		    joined if you are a registered user with
 		    <a href="https://www.oftc.net/Services/">OFTC NickServ</a>
 		    service. Follow the instructions to register as a user with a password,
 		    and then join the <code>#buildroot</code> channel.</p>
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
