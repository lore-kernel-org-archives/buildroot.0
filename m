Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5534DC3DA7A
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 13:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04E6960AE6;
	Sat, 31 Dec 2022 13:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04E6960AE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mgJFHnJQBtmT; Sat, 31 Dec 2022 13:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A80D60D73;
	Sat, 31 Dec 2022 13:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A80D60D73
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31BBB1BF2EF
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 13:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DCAF60ACF
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 13:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DCAF60ACF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Em_h9pdUC2z for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 13:56:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F2C160AAD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F2C160AAD
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 13:56:32 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.133.83])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EE9925FFAB;
 Sat, 31 Dec 2022 14:56:24 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 14:55:59 +0100
Message-Id: <20221231135559.34464-4-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231135559.34464-1-ju.o@free.fr>
References: <20221231135559.34464-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672494990;
 bh=xo7NnPOv0nfowL1kLcjITyFqBH/UiyAotOQKw0GE/Zs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YeCyXcvPlYIf6eVxMZGIQCbgMVObv3OD1dawbygtwkZDbuXzPMojnGkdYGKMzUiLl
 /OvVbqfE3s3ZAwvCjNc3/EUMRblvo6I8T+iEPt/yF7Z0pbKe86uI0lrmr0pZpxtllq
 n12QQPc9uqWIcXhHnc8a4X+2UJuXQHFFiS9gsb88oD6WvolOh4Xl5VFLmWoD19eV4p
 5GluULU1euv7kHGXy6KojAeAgELRg0tk/JB2GlU9j7Lh+N7k9c+7SvKsxI0ghOuOKS
 DyfogmFrCqOjqHFbVjgjPYYFgTQqm55br+rfTHrI3u+1SkX0bITBGUHEDwu4gqfLpS
 Rk+PobYKxbRxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YeCyXcvP
Subject: [Buildroot] [PATCH 4/4] board/freescale/imx6ulevk/readme.txt:
 update broken url
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

http://freescale.com/ urls are all redirected to the NXP homepage
https://www.nxp.com/

Even if the link is not broken in the sense of a 404 http error, the
pointed resource is not found.

This commit updates the old freescale link to the correct nxp.com
location.

Note: the link now requires a free registration to be accessed.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/freescale/imx6ulevk/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
index 5bc03771f2..5a5b4ae5a3 100644
--- a/board/freescale/imx6ulevk/readme.txt
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -71,4 +71,4 @@ Enjoy!
 
 References
 ==========
-[1] http://cache.freescale.com/files/32bit/doc/quick_start_guide/IMX6ULTRALITEQSG.pdf
+[1] https://www.nxp.com/webapp/Download?colCode=IMX6ULTRALITEQSG
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
