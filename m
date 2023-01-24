Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EB9C25B4E
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 05:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1EF560E81;
	Tue, 24 Jan 2023 05:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1EF560E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnWv8LYylMyD; Tue, 24 Jan 2023 05:47:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A82BF60D63;
	Tue, 24 Jan 2023 05:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A82BF60D63
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52B761BF2AA
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 05:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B90181FF4
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 05:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B90181FF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyqsVpKNa5Iq for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 05:47:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5967C81FF0
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5967C81FF0
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 05:47:55 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pKC9w-0001Cm-6K; Tue, 24 Jan 2023 08:47:52 +0300
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 08:47:46 +0300
Message-Id: <20230124054748.13980-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9A6D6F5724DD3A0B60E915A56FB921C507276FF3A4351DE38182A05F538085040682D4115A3FE1DEE724961AC4BD9FAB1BF7736B0E192CD392B4D93B172B817BF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE782A779A89F7D69B2C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE720512D700D076E85EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CEAE36C4DD8C2A02B16D2978D10488E82F20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0A3E989B1926288338941B15DA834481FA18204E546F3947C0CABCCA60F52D7EBF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637A3E1607A70BC73F0389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7350555CCFDA08FA3FAC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A53D3E1F0A5596A21A7EB448325F2526019B29C26F27ACB50E4EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF50F2237FE565727C05
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D347215713CF3EEE9D101D59571F5B67F364F2EB4639907BC1F404FF28427CEE808D3D51F3D5946E09D1D7E09C32AA3244C39627CA4AD451E36CA0CC238C84C77BD55E75C8D0ED9F6EE729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4ukhBIi/0FDT6e2ZVQpcpw==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5AE94EB6B0CCF7369F5E27A0B19D14D5698CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=e6D2OOkdXoNP9it7bvqxXdBPgk+Cbadj91hTLH55d7A=; 
 t=1674539275;x=1674629275; 
 b=UhCWLI26znjSTen/EOdSNtQNnZ1/Cl7/D9IAxDHPz1YqK95UQe/oWJYfJ3GtvOCETPt967yGnHgCRM7i/MmH8yHWIUQ/lcxpJiiQeiFG3fOOTBqY4WBNUSjXN7O1dnL6182/1lGM4J7BUSESZ70LJcxDvjsfg1/NO8PYWNvKhigLYFhoBgjYLX4WO3jUtjjYne6xBiWKgVHAYpi06r3IbS3bTRXRif3PTJmQxJiZdBsdCotHoWosa2TgQJYgoxLVRoyKNSlmhbTmfMNEXGoukdpUBPvITC/qecAgBw4uQBBspeBFsOJ6zjgPd82WT3IlfRIJh/uA64H6QA6Inkwb6Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=UhCWLI26
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/3] package/postgresql: bump version to 15.1
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

Release notes: https://www.postgresql.org/docs/release/15.1/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 26bb626943..ef2806c2dd 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v14.6/postgresql-14.6.tar.bz2.sha256
-sha256  508840fc1809d39ab72274d5f137dabb9fd7fb4f933da4168aeebb20069edf22  postgresql-14.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v14.6/postgresql-15.1.tar.bz2.sha256
+sha256  64fdf23d734afad0dfe4077daca96ac51dcd697e68ae2d3d4ca6c45cb14e21ae  postgresql-15.1.tar.bz2
 # License file, Locally calculated
 sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 502860bc99..5313e03b12 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 14.6
+POSTGRESQL_VERSION = 15.1
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
