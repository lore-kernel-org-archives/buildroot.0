Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B73CEACF3
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 438FE60772;
	Wed,  2 Oct 2024 19:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50dZ5UmEB3gu; Wed,  2 Oct 2024 19:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A95660775
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A95660775;
	Wed,  2 Oct 2024 19:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B52A1BF2EF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A0426114E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUmg8EWOKFMd for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 19:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A922961148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A922961148
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A922961148
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 19:37:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 044B71BF203;
 Wed,  2 Oct 2024 19:37:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  2 Oct 2024 21:36:46 +0200
Message-ID: <20241002193648.2910408-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727897823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xiw9gnMnfEcdKhbo3yyYvlfuOKoFIQDo27RF9HPQT88=;
 b=XgAcKOlmd9JuI9qxkkB3RE+zsksWpaRXsKLPzoJQ5YgoIa9XCh4vnUfiuDnpuTwfVL7b0P
 eBt9Dp74Efd+uP8A19/BbvGSy5gyQ1QZoVG0WCp3XLZiG0IeK508Ee0rPjWIyGe6qD5m1c
 FMKlFOsLTCz9C9TvL2B0uE8QAsyTKxw5rRFU03teppr9LsvB8B1XeR5q/rkcWkBBVRFJal
 FB0V2qFGh9FnWH7icUzipK9/nB/IkvbfK7riRMVSCswGvlUd5AOe+H0P+gpqKPk60QpmyG
 UlsBHMXsFeoYZYHaIDSV5suP7j/h5Bc4LgvbSGEf67Dfj5DtMPyjvwRJCHWvAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XgAcKOlm
Subject: [Buildroot] [PATCH 1/2] docs/website/sponsors.html: fix page layout
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

The LTS block was glued with the next block, add missing </div>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/sponsors.html | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index bfb83663c6..af691779f8 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -13,6 +13,7 @@
          Program</a>.</p>
       <p>When the Buildroot LTS Sponsoring program will be operational
          later in 2024, those sponsors will be mentioned here.</p>
+      </div>
     </div>
 
     <div class="panel panel-primary">
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
