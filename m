Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EE6C4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 05:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3B6A80BFC;
	Tue,  5 Dec 2023 05:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3B6A80BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id modk0QtzSLxO; Tue,  5 Dec 2023 05:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DE8380C04;
	Tue,  5 Dec 2023 05:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DE8380C04
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4A3C1BF2CC
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 05:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB15F40127
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 05:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB15F40127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfG1Wp7_BZri for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 05:52:03 +0000 (UTC)
Received: from fallback1.i.mail.ru (fallback1.i.mail.ru [79.137.243.67])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 958F2400D1
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 05:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 958F2400D1
Received: from [10.12.4.15] (port=49648 helo=smtp40.i.mail.ru)
 by fallback1.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1rAOLg-00D1t0-2Q
 for buildroot@buildroot.org; Tue, 05 Dec 2023 08:52:00 +0300
Received: by smtp40.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rAOLT-007chR-0t; Tue, 05 Dec 2023 08:51:47 +0300
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 08:51:43 +0300
Message-Id: <20231205055144.74622-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9DBEED9ECEB82BED75B481D7100CFC4A540CBC70C88FF08D41313CFAB8367EF908E2BE116634AD74D0B43CDAAB309EA90B766E582AC78FAF5969AA2B0223B4D248CCE5171D93B726C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A8325FA649D0A450EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E1AAA91777E61F958638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D839EF54C1B04EE28C96FB124DF1E266F66F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC1F9C260F03842663A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F4460429728776938767073520CCD848CCB6FE560CE5D25F19253116ADD2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269176DF2183F8FC7C0C70DDB8F70474A6A68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CDDB9BF3B882869D543847C11F186F3C59DAA53EE0834AAEE
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5433CCEC7A720BCC10EF0445FBB7825AA5CBE9943DD7EDCD6F87CCE6106E1FC07E67D4AC08A07B9B08ED1AC82D843A2BB9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A092FFDA4F57982C5F4CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFED3FBFBDC86AFB8FA5FCAF13436F539E3DDF5FAEAF3E908A19334C14F5285B7B508B3DC588E9D1C79157FEB932BFB23DDAA8710007C9406CE8B056028445667340B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojJEmydpeiNq/v552/fMW6iA==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33456DA40EE190B496B8ABC1B4605D7FF198CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B420B1FC84709EBAA72FAA96BF86525171D08914F6E8EBD7CC049FFFDB7839CE9E6A691D6C77A32B6C514E21C59C1474F11677FA28E5DC8260FEBD943383A03272
X-7FA49CB5: 0D63561A33F958A52817816BB5076111BA045300348811485DED24E97496E442CACD7DF95DA8FC8BD5E8D9A59859A8B63DA3FB5D9D20EC30
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFddY4eMfORNHNlquXCalvogQ==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=GCiPrCkEsclDcNmTHC7Qi7sFESOqfgRaNHuv0BuOx/s=; 
 t=1701755522;x=1701845522; 
 b=Tox72xR+G11PxR9aBXj7XMn5GLXrSPXFIxH6DM1buOm8Ydqfv2c6dnKfnSH6UPtBmTL0rXfhIiQFqr3yAqTIi4YQMjeLYa+mdg9tUF+UlchJDemUw9NzAnlW1I0eo7uTuFfOjC8tmhPYvWQ3ZWBMBzFm2O1cb4SAZzwHgLyFdlnt6UUZERb7DbpSe8ofoeb8A+2SSL7YoBjXO5HjSy8lI8ijGZBxYFUt4IiCMHfTwEU3Xt2C0YtP6hu2MIgmt/D1seCyJRnTT3nleaFvQejSQvflW34KqPx58vJ5Dve+PrZaPcu7nWofuNqG2q0Nr45lUZ1K25dL6j5T//GNEvkwew==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=GCiPrCkEsclDcNmTHC7Qi7sFESOqfgRaNHuv0BuOx/s=; t=1701755520; x=1701845520; 
 b=jScn/mrtPuV8yMdprmja/v0TEzpBHwT3I1hkBhPXyaf4R99WYdRJmwh4ruxCYo9ttq3iRcYBjUR
 QGzAFW1BdBC+VqnB/yspKZpMvGjXkHJXHWbPY7/xD1eNCsnt8PJEZT9mFG4sIj6SDMg3wof8LXTMf
 VLlYNu/kMS71Pe6R+Jp8gJAOYiOiE/gRkN56ZSvUoddxBeYhDOER9YQ7Fh9jFhXQOfe5zYKgY84+B
 CRVHw7ExfZy+tr4DA4JGoB1CXD3TO+SVw+4sxGwwVqax//kExK1FHajJ07g2JP5sL0oAy9Sk57Be3
 h7wmI67X54r1+z0WHc8LT7PNcL3y4CaerhtQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=Tox72xR+; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=jScn/mrt
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 15.5
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

Release notes:
https://www.postgresql.org/about/news/postgresql-161-155-1410-1313-1217-and-1122-released-2749/

Fixes CVE-2023-5868, CVE-2023-5869, CVE-2023-5870.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 0640f883a7..4fc3bfcff0 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.4.tar.bz2.sha256
-sha256  baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9  postgresql-15.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.5.tar.bz2.sha256
+sha256  8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa342f540b23c9b10a6  postgresql-15.5.tar.bz2
 # License file, Locally calculated
 sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index b951b14aa0..3108fe65e1 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 15.4
+POSTGRESQL_VERSION = 15.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
