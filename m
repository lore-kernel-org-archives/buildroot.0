Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151D1E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 08:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C2F283D00;
	Sat, 30 Sep 2023 08:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C2F283D00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAE5ZPCvkQYq; Sat, 30 Sep 2023 08:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9627583CB9;
	Sat, 30 Sep 2023 08:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9627583CB9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 718D11BF86B
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4920182347
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4920182347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMDY9s1iJeEG for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 08:25:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A190782131
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A190782131
Received: by mail.gandi.net (Postfix) with ESMTPA id B99F740006;
 Sat, 30 Sep 2023 08:25:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 10:25:03 +0200
Message-ID: <20230930082507.517920-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696062310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hkCqav+DRIXLYqMk3raDWR5/KIGfqyTr9vwvn7oyFFc=;
 b=oRspXuHnAN8ZKEthkdwuTH4fvQVwKmK5dmPYcD8CTxwAPe+X4EexjkpdJLcoYkA8UyZqaK
 59LLg5MgnGvOET4xt8u0ouVdv3zv/FMT6whKDKA3mOV+4397ZVqAL7J8i9zLo3bmpYtkcz
 4mtkvWpnnKRJQh6EQPIVwumkFSpWfVeEDU27fPt38WXuWLHkhgtCH53PZheVpWKYX5hmeY
 Wc6glr0s/VWrxoL3jaiTAbj/iK2KJAZOw68wnFaD7cJ+2ID0l2z8xAR4crMx8oykfFu/vc
 O9+J4AM7KhhX5u0cIFKCdYo44Bxxk3EXgV7YrnWxQO3kAns3zfTd1U7uqY13Zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oRspXuHn
Subject: [Buildroot] [PATCH 1/3] docs/website: move Git repository to Gitlab
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

We're now using Gitlab as our official Git repository, so let's update
the website accordingly. Gitlab only provides https:// access, so drop
the explanation about the Git native protocol being more efficient
than HTTP (also because that's no longer true).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/download.html | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index c1fd38998c..7d7b405a61 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -124,14 +124,14 @@
 	  <div class="panel panel-success">
 	    <div class="panel-heading">Repository</div>
 	    <div class="panel-body">
-	      <P>The buildroot repository can be browsed online through cgit at
-		<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
+	      <P>The buildroot repository can be browsed online at
+		<a href="https://gitlab.com/buildroot.org/buildroot/">https://gitlab.com/buildroot.org/buildroot/</a>.
 		To grab a copy of the repository use</p>
 
 
 	      <div class="input-group" style="width: 100%;">
 		<input class="form-control" style="width: 85%;" id="giturl"
-		       value="git clone git://git.buildroot.net/buildroot" type="text" readonly></input>
+		       value="git clone https://gitlab.com/buildroot.org/buildroot.git" type="text" readonly></input>
 		<span class="input-group-button">
 		  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
 			  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
@@ -140,26 +140,6 @@
 		</span>
 	      </div><br>
 
-	      <p>
-		Or if you're behind a firewall blocking git:
-	      </p>
-
-	      <div class="input-group" style="width: 100%;">
-		<input class="form-control" style="width: 85%;" id="giturlhttps"
-		       value="git clone https://git.buildroot.net/buildroot" type="text" readonly></input>
-		<span class="input-group-button">
-		  <button class="btn pull-right" type="button" data-clipboard-target="#giturlhttps"
-			  data-toggle="tooltip" data-placement="bottom" data-trigger="click" title="Copied!">
-		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
-		  </button>
-		</span>
-	      </div><br>
-
-	      <p>
-
-		Please use the native git protocol if at all possible, as it's a lot
-		more efficient than HTTP.
-
 	      <p>
 
 		If you are not already familiar with using Git, we recommend you visit <a
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
