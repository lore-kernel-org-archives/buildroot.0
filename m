Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A517AC3DA7D
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 13:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33CE681AF3;
	Sat, 31 Dec 2022 13:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33CE681AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3TOcPM8JRzMk; Sat, 31 Dec 2022 13:56:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9041D81A99;
	Sat, 31 Dec 2022 13:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9041D81A99
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75A1E1BF2EF
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 13:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E1E360774
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 13:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E1E360774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Resghyk0hGKC for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 13:56:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ADCB60A99
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ADCB60A99
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 13:56:21 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.133.83])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B68D05FF27;
 Sat, 31 Dec 2022 14:56:14 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 14:55:57 +0100
Message-Id: <20221231135559.34464-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231135559.34464-1-ju.o@free.fr>
References: <20221231135559.34464-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672494979;
 bh=1gDI0QEzJNefmngOACZbBFlvhVfWma0+Pz87kmFItJ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rBBg7brO2xAjVdUGW5VrhJ/F/SU9ImdynQC9xOIKNgiOsQV7N7OLSnGyHFJM2ZmHa
 TILMLNRI4dhYPOh3LQdTxoZYUM/Ium+deXIzoJS6cMuKjOo/VgJtwwSgwRsWURl3J4
 T5psTcnIhbBcH4Vn5vjgbXhFPr8kJhhp/F462c1VYOYCVVrQOuBPbbNDuALTWLY/oL
 40bNNquVgzpD4RP/WWOuXr8zmytWX1L3OXNSz1pCTGam+R/F/gyISGCpsocM5lNQRj
 pT7HvgrYIKBNC4cei/qDWEStsWBUi7Nnia4V2YKf06Mr2Vp0Ncs122X9BFplTW3Doi
 2MTIIHsgu/8vw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rBBg7brO
Subject: [Buildroot] [PATCH 2/4] board/freescale/imx28evk/readme.txt: update
 broken url
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

This commit updates the old Freescale link to the correct nxp.com
location.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/freescale/imx28evk/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/imx28evk/readme.txt b/board/freescale/imx28evk/readme.txt
index 2920cb04cd..3b77634fe1 100644
--- a/board/freescale/imx28evk/readme.txt
+++ b/board/freescale/imx28evk/readme.txt
@@ -54,4 +54,4 @@ Enjoy!
 
 References
 ==========
-[1] http://cache.freescale.com/files/32bit/doc/user_guide/EVK_imx28_QuickStart.pdf
+[1] https://www.nxp.com/docs/en/user-guide/EVK_imx28_QuickStart.pdf
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
