Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C069D3B9BD
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 04:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C435B84B0C;
	Thu, 28 Nov 2024 04:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DoEvZP1QPTDj; Thu, 28 Nov 2024 04:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C51A684B13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C51A684B13;
	Thu, 28 Nov 2024 04:32:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46916712
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 04:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27A35610B2
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 04:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gUgx3u4HpOb for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 04:32:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.101;
 helo=send262.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FBBF610FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FBBF610FD
Received: from send262.i.mail.ru (send262.i.mail.ru [95.163.59.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FBBF610FD
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 04:32:11 +0000 (UTC)
Received: from [10.113.5.48] (port=60070 helo=send59.i.mail.ru)
 by exim-fallback-8c87c6976-48rms with esmtps (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (envelope-from <fido_max@inbox.ru>)
 id 1tGWCH-000000007A8-0Icj
 for buildroot@buildroot.org; Thu, 28 Nov 2024 07:32:09 +0300
Received: by exim-smtp-78d78789c6-s5xtc with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tGWC5-00000000EF5-3kAF; Thu, 28 Nov 2024 07:31:58 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 28 Nov 2024 07:31:55 +0300
Message-ID: <20241128043155.875006-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD97DF634AB044F3A906031D9526404E613A7456936FD4472AA00894C459B0CD1B9BFDAB43B477F25B803ED270C30F246C5FA741336AFBBB087A8988E0B3108F962AB5D286C5C76880D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CE4525FFB91B9BBCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374F638C8F0F4AA0FB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D815D3DD3735E2D051046DBF79DA67536E417DC7278685E00520879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F7900637CBA2F893EF2800639FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3BD2EDBEAC172B1CC117882F4460429728AD0CFFFB425014E868A13BD56FB6657E2021AF6380DFAD18AA50765F7900637F09814068C508CC822CA9DD8327EE4930A3850AC1BE2E735F43AACC0BCEB2632C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A522CA76D11230DE035002B1117B3ED696F40E831D919A01EFED71F038FC046993823CB91A9FED034534781492E4B8EEAD5E26F3260102D3FBC79554A2A72441328621D336A7BC284946AD531847A6065AE478A468B35FE767BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFEC21DC9DEA1AB234A33767E26CC94C844DAF3ECAF8A0BBF395DBF53D04C8AF03DDCE95BB4BF576A6BDCC763D930D6EFA4A4DBE38416D0A65938D606465D5D653F72FE4DAD5C37F8E111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojA97iaBGbkJ0v8k0XNK3FfA==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219D0EB34E00AD7AE8E25A1C5212F8D2C35A7854651A13D478D90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4935A4DD83856F5F2FB468968E2A11138EB0C3BD87BBE9718049FFFDB7839CE9EA045B0A3CAF751E2CD6CA4A3ACA6BB2B37AC8F272FA380AF3FB9569541FF7CC43C2B9E734F16FE92
X-7FA49CB5: 0D63561A33F958A58B48C5A9A12562805002B1117B3ED6969E500E1A0226668E4565145407275D2102ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-87b9d050: 1
X-B7AD71C0: F8D540627A99B4FB867EB741D88614C39E1EDCCE5F689890E95A8571C251E4FC4CB82E7164205FE9355D89D7DBCDD132
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSq2vwlqrYJuuTqYQ0PEDyTA
X-Mailru-MI: 20001000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=aZW2OxlkWSo8heeNtcMX5kONfqffd3TE7sPH01EPr1s=; t=1732768332; x=1732858332; 
 b=Jg4kkNm9KThj+1QQPCP2dYmKMSflTpiGLFKNHLUV9J+gzP3nG0L3LP04Y1EF6X418/npKdpIC3C
 nODqcgJqk4ZjxcP34XpjifZpQu7NqW1CdZfMSQAzZlXzqEZ6G5BMTboZ4oudoOqapUHGH2Lal09bq
 eUPWbXwuUDwWmZ9KcaFajNFEGKqHuzjavmauodHpaBzg5ZZRWsxNxaQcwBajrFZb+n1bQSrXpa4dN
 NiFbsk1kZ88T63k6BGm/15c5rk4FS3pHtwmJFRPFtPSwuix2KiSn4reLEf/ss6KRo78tGSDYSpj5E
 tFVPIYfwDBiXu7jgXVmsDohn/OP9mao2wdsA==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=aZW2OxlkWSo8heeNtcMX5kONfqffd3TE7sPH01EPr1s=; t=1732768329; x=1732858329; 
 b=VxZTfVewvuH7ZhJUAVuITikOnGDbl9rDh8vTzCSf3O/5BN+o3Y3DRUagqooEgAJuIsCLep7DQ33
 RG+CyMs/Uj30KuPmxAhvno63XJq2j6NCPaJgufpQZYUdArH+L2fIqa/K1pLoGMaMUdm58lbJfiCTA
 Kvvfe24f+3JRgmxLs+uctzXNm5taZu9ooqd01CYjYukDbzgqNHj8FaxSBJxRUGTBGVTMyxLsx1LPZ
 W5wjqNOxtRrZXe6xSvGt0yC3Yv+xAWKX2EETilq7uEpiCHWqd42rFy+agd9SEVoX+qPW5l1Tjf86d
 ehP/Et5V38WEJpUj0XQxXCskEV7xJ/f9LHMw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=Jg4kkNm9; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=VxZTfVew
Subject: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 16.6
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

Release notes: https://www.postgresql.org/docs/release/16.6/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 6a15f78628..88730dc353 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.5/postgresql-16.5.tar.bz2.sha256
-sha256  a6cbbb7037f98cb8afa7d3970b7c48040cf02b115e39253a0c037a8bb8e778f0  postgresql-16.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v16.6/postgresql-16.6.tar.bz2.sha256
+sha256  23369cdaccd45270ac5dcc30fa9da205d5be33fa505e1f17a0418d2caeca477b  postgresql-16.6.tar.bz2
 # License file, Locally calculated
 sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 12693e625c..4656eba3d8 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.5
+POSTGRESQL_VERSION = 16.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
