Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D68C4829C
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6B5741E9D;
	Tue,  6 Feb 2024 10:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6B5741E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F1Y5yp5y7v96; Tue,  6 Feb 2024 10:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E765241EC4;
	Tue,  6 Feb 2024 10:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E765241EC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DED541BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B74B36112A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B74B36112A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3SCKuAMQdkf for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:53:51 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC12761129
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC12761129
Received: from bubutux.localdomain (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5F6D62C80CED;
 Tue,  6 Feb 2024 11:53:48 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 11:52:39 +0100
Message-ID: <20240206105246.1220945-3-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206105246.1220945-1-buildroot@bubu1.eu>
References: <20240206105246.1220945-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707216828; bh=UtzGN7FGmZK10mkVOU4GWavrgV9CJljiY7Cz7ekvVK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=eT5hO3ZiANqNFlKA1TJEIvmLd6bx52TqngGWrcxlZSNHs2U+CIBtx3uc7ATHNil+F
 VOIO8vsZxXwTKj51azDuedMrvcZ/AZPVIbFVIrWyZh5IamdoXklDAKOzUIne/RQlGN
 5MPzHZM8CFY9n3nUnAbjJ3lQkMmE1mJiVfxQ2MCILBp31KNbJRhXmLPRooVmB8wPp9
 BLqPgiiQAygoQxbj/WM3avtNqZ6qcqXYLPQxJf1vEsv1rCrFGXK0o5rfhwVjHzgXC9
 I0hsxArTchL4f9CGIrH+H7Pgxdjyum/O78MqSuqvwY4GysngIObqanz3Dibz5yn9F9
 LhJTwldVxR9VA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=eT5hO3Zi
Subject: [Buildroot] [PATCH 3/6] docs/website/support.html: document how to
 join irc channel from matrix
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

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 docs/website/support.html | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 9be816f836..13d63b13a9 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -21,7 +21,9 @@
 		<div class="col-sm-11">
 		  <p>The Buildroot IRC channel is <a href="irc://irc.oftc.net/#buildroot">
 		      #buildroot</a>, hosted on OFTC. If you do not have an IRC client, you can
-		    use the <a href="https://www.oftc.net/WebChat/">OFTC web interface</a>.
+		    use the <a href="https://www.oftc.net/WebChat/">OFTC web interface</a>. The
+		    channel is also bridged to matrix as <a href="https://matrix.to/#/#_oftc_#buildroot:matrix.org">
+		      #_oftc_#buildroot:matrix.org</a>.
 		    When asking for help on IRC, share relevant logs or pieces of code using a code
 		    sharing website.</p>
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
