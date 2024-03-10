Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F32C54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 06:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A9C94070D;
	Sun, 10 Mar 2024 06:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rTVGTcf6vU7; Sun, 10 Mar 2024 06:57:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B011340708
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B011340708;
	Sun, 10 Mar 2024 06:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9EB1BF32B
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 06:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A08481E17
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 06:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJ0qB465n5q5 for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 06:57:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.94;
 helo=smtp56.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9854981DFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9854981DFC
Received: from smtp56.i.mail.ru (smtp56.i.mail.ru [95.163.41.94])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9854981DFC
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 06:57:22 +0000 (UTC)
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rjD7W-0000000A0Z3-0nHt; Sun, 10 Mar 2024 09:57:18 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 09:57:05 +0300
Message-ID: <20240310065705.1074148-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD93B4404EFBC5FECACE5C610B1725ED3C661FD8B55A48E2EE5182A05F5380850404C228DA9ACA6FE27659CA60501856A0BC591814E25D11F9F23B62022156203AE71B41F1F9AAE84E68312A077F85E9B44
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE745C0EDBD94D46193EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373DBA3D7E24987517EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B73AB1701401CD871B377F1F6CDA2CE7FA3E7F74DE519E659896D0C1BBA8CC7861DF9E95F17B0083B26EA987F6312C9ECCCD848CCB6FE560C6FD1C55BDD38FC3FD2E47CDBA5A96583C09775C1D3CA48CF5C5DFC4BFF39B799CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0A4D2052C2575E1C58941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5278DA827A17800CE76631511D42670FFE2EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7E1BCFB2C0BE3F189731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5182C859DC51B67645002B1117B3ED69620CC3B3A6B98403C19AC5B239BAD4335823CB91A9FED034534781492E4B8EEAD0BE004AA24E73514C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9EB93C75FE5B60ED5C559530DE61568F0D1187D1B1D623B12F9CC8B1128C518DE5D0AE1B90484215748ED927723DE83FC71350CDB9AE05E0F766AA72BBFE9186A09D8BDA808314A8111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojuV2YtZBbGDwPgm85tnVxAA==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE3352CEA48A33CB76C7B0E6BED2A4530B738935D5D76E8996F090DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=qhLGJfM7ovDcmW3ftllCOYF/QXCINj0U9uKUx5Vjg6I=; t=1710053842; x=1710143842; 
 b=Q2MukjDXx8vBG/ztvFquSnuTjHBB0ulNlL32zoBSIJHUTGlcget+aJccTII6q1HDJo4Bc34n6dk
 71q/WMlG5FC8eaIHmy38AnOtpJm+a3ebdwL17Hr2nNr4MCzobgXEWi/kW4kC0XgOvTdET3aKOyTQR
 n3h+Vhp2quK4yqZpdBt5wcwQjVQuRlooIQc7yPrvzMjDpE/XsVF9b5Jjv5LgRzChGyjl8jtk8hTtU
 retrEaTkzhw1at7Oxe9oUnlywSLxCtHCv2wEU5jBseKBFeJaLrqfcBuXQOwnJEgUkKxPAUhIPr5KZ
 MSph8wqpaJ2dKAtlp2bSbDLMJ36G/8A1pxNg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=Q2MukjDX
X-Mailman-Original-Authentication-Results: smtp56.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 2023.02.x 1/1] package/postgresql: security bump
 version to 15.6
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://www.postgresql.org/docs/release/15.6/

Fixes CVE-2024-0985.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 4fc3bfcff0..c1ec8e89c8 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.5.tar.bz2.sha256
-sha256  8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa342f540b23c9b10a6  postgresql-15.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v15.6/postgresql-15.6.tar.bz2.sha256
+sha256  8455146ed9c69c93a57de954aead0302cafad035c2b242175d6aa1e17ebcb2fb  postgresql-15.6.tar.bz2
 # License file, Locally calculated
 sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 89ba80557d..da37affe7b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 15.5
+POSTGRESQL_VERSION = 15.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
