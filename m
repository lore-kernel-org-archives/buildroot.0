Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227AAC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 09:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A69BB80BDA;
	Tue,  2 Jan 2024 09:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A69BB80BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EewbyyLshzYN; Tue,  2 Jan 2024 09:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA89D8127D;
	Tue,  2 Jan 2024 09:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA89D8127D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FE091BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 09:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4878760881
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 09:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4878760881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xv-voFU1cPmG for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 09:34:37 +0000 (UTC)
Received: from smtp37.i.mail.ru (smtp37.i.mail.ru [95.163.41.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7047607CA
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 09:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7047607CA
Received: by smtp37.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rKbAP-003u87-1m; Tue, 02 Jan 2024 12:34:33 +0300
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 12:34:27 +0300
Message-ID: <20240102093427.1189491-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102093427.1189491-1-fido_max@inbox.ru>
References: <20240102093427.1189491-1-fido_max@inbox.ru>
MIME-Version: 1.0
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9F008C97756F746CA14E95E8474F0BC9BE89BAA13E884E306182A05F5380850407195A18598A1BCEE09348C90C98685C40E28A6417F3553F0EDB97B901A45296F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72E4E5201E1C2E308EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063767A3307017EE919D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8136EBF98DC36895849694172C20C71056F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7ABB305BD10C6E5099FA2833FD35BB23D9E625A9149C048EE270D6DF50F29E9E2117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE781ECA9009345E4589FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F7900637F9425D8FA97DB4396D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637C970FD8DF19C51D2EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A502B76796C5AE4AFED044A9013C0A4837E69048E04F6EDF1BF87CCE6106E1FC07E67D4AC08A07B9B0E753FA5741D1AD029C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A091D471462564A2E19CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF85B592CD26C61B3E9D24BCCF6017C3D133C816CC6C96DC128C2FB211CCFBDBFB45CF0F9AF1251E13B477C3CC75CCF1925BFF4F3029C4AB18AC0E403CFD8B2EEC40B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYOVVBoB1ShWbKx9ob9bRdg==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33C85344C14641EE5FC48C2E750C8C869298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=fXQcmxbhkLjvq/lsXfUdC0wxADExDQNLltVH6OpqfkU=; t=1704188076; x=1704278076; 
 b=TJGb3L/zmqC2HUtnkVVbrGmih0PGO3Ag0IADfEpt45M0yKkWsc55+qors+dj9VaJEeAt6A3excR
 xXfbqY7CzQngImzZfBS5LsbJhhiEvd144KkyViK7jOQGo/Untq9ZH3CRBQ/O3wQu5kU2vTYAziWwM
 d/cdVsgRXcR34rAspu+pPaCDRsOOLzVp5XNhTpFXqeDjADVMZQDGWl7++QE50OidMqavn4z10fHik
 5iFgiVQd0wR+o1XVTp8xd/fE9rlCa474HHCTui7OiAamCkBWqefOxzHZe4NRpRgzOfQFal9byyMzQ
 6YQz5bTmdM674BhLwlePoZXjtZGXcqE0o8Yg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=TJGb3L/z
X-Mailman-Original-Authentication-Results: smtp37.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH v2 2/2] package/postgresql: bump version to 16.1
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://www.postgresql.org/docs/release/16.1/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 4fc3bfcff0..cf859e3505 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.5.tar.bz2.sha256
-sha256  8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa342f540b23c9b10a6  postgresql-15.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v16.1/postgresql-16.1.tar.bz2.sha256
+sha256  ce3c4d85d19b0121fe0d3f8ef1fa601f71989e86f8a66f7dc3ad546dd5564fec  postgresql-16.1.tar.bz2
 # License file, Locally calculated
 sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 89ba80557d..ec5b61b932 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 15.5
+POSTGRESQL_VERSION = 16.1
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
