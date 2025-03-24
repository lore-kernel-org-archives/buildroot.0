Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253ACC36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 07:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFDEB60B6C;
	Mon, 24 Mar 2025 07:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7Ki_1TT6Off; Mon, 24 Mar 2025 07:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07DD960B63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07DD960B63;
	Mon, 24 Mar 2025 07:13:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 966EF1B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 07:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D45040BD7
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 07:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZEMgmV2J7X0 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 07:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.178;
 helo=send83.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8641403D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8641403D7
Received: from send83.i.mail.ru (send83.i.mail.ru [89.221.237.178])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8641403D7
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 07:12:59 +0000 (UTC)
Received: by exim-smtp-75f69ddc6c-p5h7l with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1twbzU-00000000HPp-0goF; Mon, 24 Mar 2025 10:12:56 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 24 Mar 2025 10:12:54 +0300
Message-ID: <20250324071254.173452-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92A53477891B58793DCF94335131206D40D1B920360E5D1A3182A05F538085040919FE2164478A17C3DE06ABAFEAF6705426C66E3647E2948E9228A36CA3E9D36E41C5801A3FD0B27
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73C055C55FD768EE3EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2283256C990C0A0E22E070BE324C7D3C40FD85589DF08B8B1BB0A4F435E46E6718B35066C979671628AA50765F79006370D8CD50B7E84063A389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0A0DA03275E5C1BCF8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B67071EB8B3FD47F5CCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE74ABCC139FF3F849B731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A526176FDA8DD240BE5002B1117B3ED696824CA7999CA8065AED71F038FC046993823CB91A9FED034534781492E4B8EEADF12279BA039A6965C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFAC0005C066DDBCEE60D5459097920B53134F1AD227BFF14541594BF2A8A26D9486D6DC23143AA0ED556C2DAAA19247FDBEE55A2AC4025976CA531051453EEDBC85A113A855D9CDE111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVRxnlmV4XzQleGZ4p5UZwqo=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA21946F237355348DDA92CBEB5D8CB5B8993EB17F6CA470F47C690DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=9hGJOlBLCiH461IC2ABF6Ixy3XUJo2X2/oEbrfjik/g=; t=1742800380; x=1742890380; 
 b=kb7iYpN4MlJRAWTUlV/vT6Kv76yBFPuTa2mg0Qu+FOWM8kBcQa74PIwE431NA8WxEL2eGaQ6E6D
 c9iwVpo3UV1ttt8D26Q8DbYT873qxpDDeoHqwE5O3bpEHoNVWuL65yjeW2ygfz/SlIjMALe4H03Xq
 lrUrlVQhm4zXRdkDfFfnKCPLoqFiSNSbay5+/KHcr35d5HqIZy0gZ7ZrJ9ivkcbLodMy+U02xy522
 DZCf9uepbMZbQOmuCvjJaL1r8KJ+rZSmq/+tAok18v4wEtweiAvUY2P1pbVhXblGzjw04ziOKyoMz
 47FRhqLVg/omDOj8cmEHh6fiCmlh2wcRyZ/w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=kb7iYpN4
X-Mailman-Original-Authentication-Results: exim-smtp-75f69ddc6c-p5h7l;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.13.1
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/libgeos/geos/releases/tag/3.13.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 36f47cd523..f404b267e2 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  47ec83ff334d672b9e4426695f15da6e6368244214971fabf386ff8ef6df39e4  geos-3.13.0.tar.bz2
+sha256  df2c50503295f325e7c8d7b783aca8ba4773919cde984193850cf9e361dfd28c  geos-3.13.1.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index beb2c077c4..475a54f79f 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.13.0
+LIBGEOS_VERSION = 3.13.1
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
