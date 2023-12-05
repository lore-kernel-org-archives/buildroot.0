Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E8AC4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 06:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F24D281E6B;
	Tue,  5 Dec 2023 06:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F24D281E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6eb46EhIxQf; Tue,  5 Dec 2023 06:16:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39A4D81E58;
	Tue,  5 Dec 2023 06:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39A4D81E58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78B751BF2C3
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 06:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FCF940223
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 06:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FCF940223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXnmRjt41FYE for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 06:16:43 +0000 (UTC)
X-Greylist: delayed 1446 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 05 Dec 2023 06:16:42 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D915540127
Received: from fallback3.i.mail.ru (fallback3.i.mail.ru [79.137.243.69])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D915540127
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 06:16:42 +0000 (UTC)
Received: from [10.12.4.2] (port=49274 helo=smtp29.i.mail.ru)
 by fallback3.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1rAOME-00DVTB-6Q
 for buildroot@buildroot.org; Tue, 05 Dec 2023 08:52:34 +0300
Received: by smtp29.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rAOM2-007n9D-1l; Tue, 05 Dec 2023 08:52:22 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 08:52:20 +0300
Message-Id: <20231205055220.84306-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD91486559A3ABF84E7CB0A098B493E0346EE397C45C3170F78182A05F5380850407B6B24161DDD142031596A1167E0A462C7827449833A0CF4B18A2A3863A21B40
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A85479CDD055C83FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D24CDE3D695BBBC6EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B73AB1701401CD87193AE8F65C4D494CCC78C2B88DCD678CD20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0A3E989B1926288338941B15DA834481FA18204E546F3947CA816C540FC8EEC30F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006373A48B3377AEF51A59FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F7900637AC4ECE65C2AF15826D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637FB177F6A8366F17BEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5141ADC6EC8064415E059F1A7FFD19B55DDD4B58190BA6399F87CCE6106E1FC07E67D4AC08A07B9B082B967D547A19D2F9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A091D471462564A2E19CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3DA956F909533A01B792819FFC858BA9E0A2FECAB882E2538C243C923BE2EC65506ED036F265C5429157FEB932BFB23D3E5477CF7809445050BF312F8DBF427440B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojJEmydpeiNq9xkEAjvDzWkw==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33109AC7C3F732935C49431E1A064D82F298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B420B1FC84709EBAA72FAA96BF86525171E46163036C0894B6049FFFDB7839CE9E6A691D6C77A32B6C7D7CF4BFA6DFA2119B176CD7AB91DC217F49639AF26DECB1
X-7FA49CB5: 0D63561A33F958A52D7D2840EC803A9637C596C49A582C83E549E51B253FCC55CACD7DF95DA8FC8BD5E8D9A59859A8B6580BCED469A045A2
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFddY4eMfORNHMK9WD0PaNzOA==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=P0VQ6CKDAUhs6E8NHGQdOFDWE0vfAY6cTjtOflzJkg0=; 
 t=1701757002;x=1701847002; 
 b=tV3np5jr5O/1qD7OT68cHvOL+rnXDIj8d+Pz3Ftz5KR8VrsPsV/nIdldaGkknl0EdYbN6kjROJgCu2aPbjpSo21B76fEAj0eNw5DrlKtDIG+AjwFImXkWgM/svTkf8fVX0SZWtY8KIYWKvSK119d6gy/lD03noEmDM2BhWevgE24/v/pzeCuTXbqbFuxuLowd8Eb/BomQ0ZzBirwDxj2wR+01R+5QpQHS1Jp/ha5wFgiD7x7sGi4n4UL6W1wcp6rAaE3uZnYjqXWia5V46M4LmRcSrVJrwaY+q2xPetPUB6CICKiCebC+fAmpjg+hHAVmpW+renBMe6/e0V4lRL5fw==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=P0VQ6CKDAUhs6E8NHGQdOFDWE0vfAY6cTjtOflzJkg0=; t=1701755554; x=1701845554; 
 b=fmUmbe+qvXhU7fcbj4/GTgmB/LHzCbps2eFGS6Xq2I5c6CNMEw6D1X0/ApIoPYvavg2YlSXHm03
 Ce47O6u+mClp6Uxx7xZfxupOJnOoMZiJTxXDpAA7saqCixEUi9sGuJ2csDnnTPI5bXAuVJQbwlugT
 QpIb4KdlNW5gXML9Z5m5aNU4tK1qREPvdHZbBMo5BonyKc7SdBAzVUOIU8uNfIZWc0WwbhqlU8IZO
 VV0wHI21e6an2G1EyDi6vBrz+a0d/UHHOaf9s3Pg81y6tyUiOQMzvOBfIX5GT6XKtb1YhPg1fw/Js
 GMdomafL/Ay9/4J2F33rbpC6Z4j/irwZ8R3g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=tV3np5jr; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=fmUmbe+q
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.13.0
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

Release notes: https://github.com/timescale/timescaledb/blob/2.13.0/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index ae1d3db1e1..b7e4c71774 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d24cd29aad411d3e41d543d1a30827c48f8e01a48563650db5fac145ad7a01eb  timescaledb-2.12.2.tar.gz
+sha256  584a351c7775f0e067eaa0e7277ea88cab9077cc4c455cbbf09a5d9723dce95d  timescaledb-2.13.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index adae1c2bae..34a48ad0c3 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.12.2
+TIMESCALEDB_VERSION = 2.13.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
