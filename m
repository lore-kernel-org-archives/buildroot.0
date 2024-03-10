Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24373C54E60
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 06:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBC7B40708;
	Sun, 10 Mar 2024 06:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PziMdnwCBoEw; Sun, 10 Mar 2024 06:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92CD44070D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92CD44070D;
	Sun, 10 Mar 2024 06:57:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 770721BF865
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 06:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 644584018F
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 06:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AN1beVpFbLTO for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 06:57:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.87;
 helo=smtp51.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0916040187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0916040187
Received: from smtp51.i.mail.ru (smtp51.i.mail.ru [95.163.41.87])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0916040187
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 06:57:42 +0000 (UTC)
Received: by smtp51.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rjD7r-000000096S1-2CTp; Sun, 10 Mar 2024 09:57:39 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 09:57:35 +0300
Message-ID: <20240310065735.1074171-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD987C0EE6E7F0A597D8D64E6F18B2E2E3258EF6A9BB0633F3C182A05F5380850405AB69DE9AC5AD80C5D1BE6A8D71B10A562CE2D2D03950DDA71B41F1F9AAE84E63ED127E0E40C37DC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70D278D70F8433719EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063797024C28700A46CB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F16001A668140E0003FEEBDBC1E428C1CE2F1C195900384C20879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F7900637498978385686B898389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D56D36E97F3F038CF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE33AC447995A7AD182BEBFE083D3B9BA73A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D05AD665AB97B35DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5AD74BB0211633C035002B1117B3ED696FEAD35963847E1F98D59E407A97E9958823CB91A9FED034534781492E4B8EEAD2E48F5DFA0C1F120C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFA2899B6B108155FB763270127EF75721FCEE0752713F259A8F974EDD6781FDBF698455FC0CD9C182748ED927723DE83FC8E9F7015305F1B07AC503F491F7372E6ED6C4EAC4E589B5111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojuV2YtZBbGDwlJEwtDDOFGQ==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33B23F194BC42B446197196FBF833FA4337406A49A55284E7890DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=qhLGJfM7ovDcmW3ftllCOYF/QXCINj0U9uKUx5Vjg6I=; t=1710053863; x=1710143863; 
 b=tn63dvbWdlGwJ0RU60UQ66sFfOH5ygFqIeUngUP9WPEvG+pI3SWiI9dxLoinQgioHiRVewNIuxh
 ZcnZHx6NHVp5HohYfSQOFJOKmf2Nah91UUM1ydq2E0N0g64irS/nTjsi8oIB0aXtnZDLf6tyByzUQ
 QmRtf6j0sRHz3ZbLw5opeL7UijtkJXOFLhZZNeRrQCoh6r17cIHo9DbONdEzzsFC+83wLULdIDVZ0
 gc+nir/3H7/ziVngqtdSQ0mnUrV2CfNm5bySBjfvLZPPZ+e1g14Ezo++bnGxhGMDKKnVplGIm+MpI
 i4BFKVMSNjfXzYv9Z/tgE754ziJhom9xk00A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=tn63dvbW
X-Mailman-Original-Authentication-Results: smtp51.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 2023.11.x 1/1] package/postgresql: security bump
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
