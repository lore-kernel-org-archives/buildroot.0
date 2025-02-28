Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC876C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 06:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CEEA612B1;
	Fri, 28 Feb 2025 06:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGQ4HkF3yltH; Fri, 28 Feb 2025 06:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6804960BBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6804960BBF;
	Fri, 28 Feb 2025 06:22:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CAEE269
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 06:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA61160674
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 06:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxKtd7gHVwdo for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 06:22:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.198;
 helo=send103.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58AD9612B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58AD9612B1
Received: from send103.i.mail.ru (send103.i.mail.ru [89.221.237.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58AD9612B1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 06:22:42 +0000 (UTC)
Received: by exim-smtp-6559db9d9c-pjt6s with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tntlf-000000006sA-2pzz; Fri, 28 Feb 2025 09:22:40 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 28 Feb 2025 09:22:38 +0300
Message-ID: <20250228062238.78514-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD94C6F4C9F24859151D3EDAEE1498F6FA8C189BF784DEC388000894C459B0CD1B9D08E9FA0C01E142D2EB5D77EF37489D165739042499088F09221968377255F6FA5D819213F947FA3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BC08626EA5717D14EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375662B0B15A2BD47BC34ECB8F5FC334073DEEF05AC8F3820023F89A0AE8C04E6537F8EEF46B7454FC60B9742502CCDD46D0DED96AA85C75E140D117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCD56D4C633DAC2ADFA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F4460429728776938767073520FAD5A440E159F97D28451B159A507268D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B66F6A3E018CF4DC80089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A54128A4B3A3564E9B5002B1117B3ED6966FCB969EF3001837F5FEB6EB1EB183FD823CB91A9FED034534781492E4B8EEAD81B3E0F64AD3EF57C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF7BE96781EA1B32D8AB8983F6500CC4091A6196A55843E848C48367A3FB837C519AB7DC20417E2115D4F7E0138972EF0236D5E11752FA091F326449875B6DA000843FE946B16DCB77111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVQQG/FugD0/C61kcwhy7ncE=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA2195B95F3EBD7C7A84086BAFE5F40A9AE26AC90DC005036D47590DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=Gdcwv4861k9EcIqkf+vBFzFbvDWvs1/tzYJwNnpm+VQ=; t=1740723764; x=1740813764; 
 b=NeADbnLNeLL2gzjKwawxPuZU8+R+Uo2DU1eyMoYJzdpq/GiVXhA4K1JdYGtnRAfVsecuDKCJJPs
 zw7CKplPuYaReDBTmJGMxMTYaO22ZhWckXTuBEQ80epkCtLpXyQ62EQua8yZ+FND5UEC+nWLl0q6o
 m1+N8eN4DIQVNKHh4K/78qZt2rIzqQfvJFkCsoII/fXSFnDbr/PVYjgdBjMqha1RZjs9IOmnqEomF
 EBFL1hlb0SKYepqZRwf4Om1P4TLrXXg0qlHMUs1CXlZO/iMsNPXKUL9/35Iu7lkGMFvsuhHUl6/iH
 ydqFaXoF3J5eYPfzXSQMzwLF7qVOAHF+jBqA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=NeADbnLN
X-Mailman-Original-Authentication-Results: exim-smtp-6559db9d9c-pjt6s;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 17.4
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

Release notes:
https://www.postgresql.org/docs/release/17.4/
https://www.postgresql.org/about/news/postgresql-174-168-1512-1417-and-1320-released-3018/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index e582510832..1c77119207 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.3/postgresql-17.3.tar.bz2.sha256
-sha256  13c18b35bf67a97bd639925fc581db7fd2aae4d3548eac39fcdb8da74ace2bea  postgresql-17.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.4/postgresql-17.4.tar.bz2.sha256
+sha256  c4605b73fea11963406699f949b966e5d173a7ee0ccaef8938dec0ca8a995fe7  postgresql-17.4.tar.bz2
 # License file, Locally calculated
 sha256  e3822c4797fadcab31a3fc73f75c28ac20c73d72b565da91e9974cf9398ef4d2  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index a9ca9f4ee1..2b6e78b941 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.3
+POSTGRESQL_VERSION = 17.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
