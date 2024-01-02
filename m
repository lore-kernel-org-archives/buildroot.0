Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A26C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 09:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BD3080BCA;
	Tue,  2 Jan 2024 09:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD3080BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JCkqhXmYEke; Tue,  2 Jan 2024 09:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59BDC80BC4;
	Tue,  2 Jan 2024 09:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59BDC80BC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 638891BF298
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 09:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 440BF40510
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 09:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 440BF40510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qerwim3F7VTu for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 09:34:36 +0000 (UTC)
Received: from smtp37.i.mail.ru (smtp37.i.mail.ru [95.163.41.78])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03E4540472
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 09:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03E4540472
Received: by smtp37.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rKbAO-003u87-0C; Tue, 02 Jan 2024 12:34:32 +0300
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 12:34:26 +0300
Message-ID: <20240102093427.1189491-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9344F665CF1C84C2976356D4BAB86AA771558E53B0BF89E43182A05F5380850404C228DA9ACA6FE27F44CB9EFDEB057CA43B8090297EA17CCDFD332AC8E82F661E2CFF83E1D7018F7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE789066434B85BF7C7EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063748C26B83F2B024408638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B4B41392D09BD70A09C057113A8C87046F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7850F8B975A76562C9FA2833FD35BB23D9E625A9149C048EE042285CD7A5C321FF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BBB91C8F559589CC8A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249D082881546D93491E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B65D56369A3576CBA5089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5407371CF1D0927ACD044A9013C0A4837096BB258E19250E2F87CCE6106E1FC07E67D4AC08A07B9B01E44367C8E80A7B49C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFD5EDB4855B3F0E098EB2A17142A33CCC25B71EC5561A3F5392046866497952924D6692FC0148BA75B477C3CC75CCF192997A1C0189FB96C9F3D805DCE4C6398640B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYOVVBoB1ShXEAKKxLqI1/A==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE3378EE8531D901F50835D0B8F40E1C29DF98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=GxZp13wuWbc6s5Vkkgy1xkAfe2FMQKoyXH7nq8V+HI8=; t=1704188076; x=1704278076; 
 b=HFD52PObSU1LmEpXIDVlzD4an0YKq7t7xW5QlZP41VKDqXX0YrSSLi5S4ytoBnlzb0NMF9pN1pb
 bxpQthl5AOKybo8fDbq1DJJmgipPwmiay7AGeuqQY17rt2aa7+HzBxSHRe/Pdq0LnmTnULeUSc8t9
 NJ+TSn06h2uYgJD2K7FJ9yhILDuwIdYzge/SqWvwIA1jqBBqjuPvDFVzQYcRVHdEY7DyHHCQ2T4it
 xXtz0Xwq6uKes338cm5pQFNqOPYxrI36puEvm2AY/35RFpLdLWZkpDnKReRfjZUTzOsVB2KNd9I/w
 gBu1aJRMwvb0jp3+T/vfz642IpiTsb9/PrRg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=HFD52POb
X-Mailman-Original-Authentication-Results: smtp37.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH v2 1/2] package/postgresql: add ICU support
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

PostgreSQL has optional ICU support. So enable it if library are available.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 3108fe65e1..89ba80557d 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -87,6 +87,13 @@ else
 POSTGRESQL_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_ICU),y)
+POSTGRESQL_DEPENDENCIES += icu
+POSTGRESQL_CONF_OPTS += --with-icu
+else
+POSTGRESQL_CONF_OPTS += --without-icu
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 POSTGRESQL_DEPENDENCIES += libxml2
 POSTGRESQL_CONF_OPTS += --with-libxml
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
