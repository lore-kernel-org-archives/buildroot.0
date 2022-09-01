Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3232EECAAD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 04:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C77E404A6;
	Thu,  1 Sep 2022 04:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C77E404A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjBSeDNqVatR; Thu,  1 Sep 2022 04:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DC6440217;
	Thu,  1 Sep 2022 04:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DC6440217
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EEC11BF5A4
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 04:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0384482923
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 04:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0384482923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pxQ2H5l0i3t2 for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 04:46:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D4A1825E6
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D4A1825E6
 for <buildroot@busybox.net>; Thu,  1 Sep 2022 04:46:06 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id B0E31440BF7;
 Thu,  1 Sep 2022 07:44:50 +0300 (IDT)
To: buildroot@busybox.net
Date: Thu,  1 Sep 2022 07:45:55 +0300
Message-Id: <c4193508bfb3de595c8cb3652d6f3dd69acd7fb9.1662007555.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <a8ea0d5fc6b7f447cbfab2426e1fe3687ee7e0d1.1662007555.git.baruch@tkos.co.il>
References: <a8ea0d5fc6b7f447cbfab2426e1fe3687ee7e0d1.1662007555.git.baruch@tkos.co.il>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1662007490;
 bh=YyyRqLanXG/gw2tLPkqOVOIPpQoAN47/C75HZxYu8Ek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kiefUMdrZ/ElPTYgbi+F/SJMfX2Ukpv3Q7dsNf8jzoYgUm+UDt5CZOzRX39FlfWOm
 L5fO4Hwi64ifKAQG1A8VFBgP40LZH5p1mzzXaUiXiBVuDFUuFLJcjSNE69enf/OpeC
 j4gpT7HH3xCZGhNm5ZO69rrn2A2fJhlOfUIOfzSKjT38cr6XI02x8XLSi4mqMsnCMU
 FK09cdyBNqHi3EWBOUPGRK4s4/i+bH2b/xUa+vwlUrWWHqglwzktJAm+tPVrXh+7SV
 KBZWeoteF78S5uUvKiD80/XFILuEtU6HnyKjkIbPNoscC1Yye08Wm+qN8BwN5KKshq
 WCH/A06SCt8Vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=kiefUMdr
Subject: [Buildroot] [PATCH 2/2] board/solidrun/macchiatobin: update BSP
 components version
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the listed versions to match current status since commit
b4d9b515088d ("configs/solidrun_macchiatobin: bump BSP components").

All components are now from upstream so no need to state that for each
one.

Cc: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 board/solidrun/macchiatobin/readme.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/solidrun/macchiatobin/readme.txt b/board/solidrun/macchiatobin/readme.txt
index 7412951aabd6..ef5a6cba6bdf 100644
--- a/board/solidrun/macchiatobin/readme.txt
+++ b/board/solidrun/macchiatobin/readme.txt
@@ -13,9 +13,9 @@ How to build
 ============
 
 Default configuration provides the following BSP versions:
- - Linux v5.6.3 (mainline)
- - U-Boot v2020.01 (mainline)
- - ATF v1.5-18.12.2 (Marvell)
+ - Linux v5.10.5
+ - U-Boot v2020.10
+ - ATF v2.4
 
 To build images run the following commands:
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
