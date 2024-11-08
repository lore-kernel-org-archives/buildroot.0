Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A124D5E12D
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 05:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C9360606;
	Fri,  8 Nov 2024 05:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nA_TSC96Wpoo; Fri,  8 Nov 2024 05:04:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B6F961186
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B6F961186;
	Fri,  8 Nov 2024 05:04:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA315C2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 05:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6B4140A62
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 05:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rc_K_hCdtP1u for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 05:04:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.65;
 helo=smtp42.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17FE540128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17FE540128
Received: from smtp42.i.mail.ru (smtp42.i.mail.ru [95.163.41.65])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17FE540128
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 05:04:50 +0000 (UTC)
Received: by exim-smtp-7b5dc99f9b-2x6k2 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1t9HAs-00000000A87-42te; Fri, 08 Nov 2024 08:04:47 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri,  8 Nov 2024 08:04:42 +0300
Message-ID: <20241108050442.191767-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9F2D031640BDD7D54A572F3D7D0EE51D489390029C8CF4510182A05F538085040248C5C927AB54B8D3DE06ABAFEAF6705D616375EBA4137DB7235A189264288F78F3BE6377274225A
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7444CB0504BAF4550EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374D4854EC7C9372F88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8560BC1EFC4501941E2BD3F49788A84B23751E953FBC4883C20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0A3E989B1926288338941B15DA834481FA18204E546F3947CB81C09904DE36E56F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637574B803CF37E38CD389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B2FFDA4F57982C5F435872C767BF85DA227C277FBC8AE2E8B08F9A42B2210255C75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A54EDC072FFE59E81A5002B1117B3ED696408C410AA48DA24C14DB8790748E3E77823CB91A9FED034534781492E4B8EEADF1165EFABA1780A6C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3037A41BAA8E2D6427132DF5B374E9386470E946E6987CE01A26C241CD134758CCDF2CE9FE05F2E7E32EED3DD60FC9D8C5ACF5743B607A181D991521B92BEDC15985F9E8A8C6B5BC111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojg6cA0Mix+HnLGnBsR3zjXQ==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA21989B12A443E2E05A1BDAAC74A643645865D790C9FE1222D5690DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=gN/8TMSoTfa4sFq/nGNz5bPCt1epOs/U5lYzrJUkql4=; t=1731042291; x=1731132291; 
 b=VYlHu2T/KyaUvwbW5aYuTLN6ZbvOG44iW5+jQYdbdhtMJvo0006KaZpOZiMSKfxsVnNtB5zxcyX
 Nd09HcF/ru+ULg2jNkh1hIxGGWKBY8wTTNqIRyKGUzHeagJBNMtV19LhUXc2jJEJneKauGB63cYJ1
 yoogmHNIl/7bbYRe0/ZbdgqyuZB0Z1+y+vS4bTiiLTn3hWThgdp43mFNCZnlTMAPX6YiH9AZZLvB8
 CNW1LIvp+4j9g7T0MZusbgGhyJMiiQselO5kcyKSUOvBGxEnTEZy1tArivAXtZ8rZXGQNAmHzLsrr
 hZV5UpT5NryJBFjQ+XS5NH71EwtKpUJWVk2w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=VYlHu2T/
X-Mailman-Original-Authentication-Results: exim-smtp-7b5dc99f9b-2x6k2;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.5.0
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

Changelog: https://github.com/postgis/postgis/blob/3.4.2/NEWS

Licenses updates:
- extensions/address_goecoder is released under MIT License
 https://github.com/postgis/postgis/commit/12b699aebaa4cb817adacfba8ea48dba2d5204f5

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 4 ++--
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 7e62e8e168..9e283f5ac7 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c8c874c00ba4a984a87030af6bf9544821502060ad473d5c96f1d4d0835c5892  postgis-3.4.2.tar.gz
-sha256  2a3bde0a77224496ea6d8efa686da7e29ab0dd6b1a8f90ba12beaf7ae28e878a  LICENSE.TXT
+sha256  ca698a22cc2b2b3467ac4e063b43a28413f3004ddd505bdccdd74c56a647f510  postgis-3.5.0.tar.gz
+sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 867aa4caea..a2b121e6f5 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.4.2
+POSTGIS_VERSION = 3.5.0
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
