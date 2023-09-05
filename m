Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769DDC83F33
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 07:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EA1D60BBD;
	Tue,  5 Sep 2023 07:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EA1D60BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eq1316ij1nDs; Tue,  5 Sep 2023 07:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8353360BDA;
	Tue,  5 Sep 2023 07:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8353360BDA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD5F1BF2FA
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 07:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7F3E41769
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 07:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7F3E41769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dkI3AYNHebyA for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 07:11:23 +0000 (UTC)
X-Greylist: delayed 1520 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 05 Sep 2023 07:11:23 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E46641768
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E46641768
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 07:11:23 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qdQDZ-0001XY-00; Tue, 05 Sep 2023 10:11:21 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 10:11:19 +0300
Message-Id: <20230905071119.1277036-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD96E142CFC92DB15CD43B17B8DE4233CAE5689C6DEE55D6799182A05F538085040D778793892D58ACF91D9D4EF953FE3E40B0288903E5BEAD0111B0ADCE5380BBE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B2ADBDCD737373ABEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377028CFB5BD7FD30C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80443D57406791ED8BFC40BDB4479E9686F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE764603B5C71CE8B8F9FA2833FD35BB23D9E625A9149C048EE437C869540D2AB0F2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B911D863C7A028B9E389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E73542F54486E6D6388DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A561781917896653F6940CA7DAFCA65F0B0B432602D7606328F87CCE6106E1FC07E67D4AC08A07B9B0E753FA5741D1AD029C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF7C6FD53E421D6DD8F6984A1578CD9886B2A073B857DBB679D17C0B44EA2B6D92C7834276CD052397EA61C66FA002EE272E74224F870C9DB90F9C81837CC3891340B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojNmsqR+t6vc+dHveXJfG7+A==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986BFF426CA3981FE9D8F5BD5B3433AE192098CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=ox6Q8JT9uA1uEkZ12wWQ1Wb84hqjOXOJFQ/CMOB6OxE=; 
 t=1693897883;x=1693987883; 
 b=uEAAmqBRfS6mFx/6kAACDaxB58h681eMlVYQNjpeBGtGmtfz66aEkZG9U+rFeRTXhwHLJp7FF0vBsEpl1wQq4BiomfGdUJ1BDYLdG97OvBif1vAdUIbthrxW14VIoqAdOasndqLkGyAkN9/9M/wnhT66Ut8bIASRVMUQ3OvIksNW8QQvvtFQSZauEDBOrHj+RqPjg2vHMKsHChKLHcAqpDksCYKncUtqL59TuMaWAbzqxrhurSfrSaqvr7b6tbh/JOHQGxlJwI3us0NLjWlmO3NHR3OoaHi3a0N2lPwsk6VyQtkVY4i4w/MTclTCU37VJvDROo+oqqja4diiZE3UDQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=uEAAmqBR
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 1.9.2
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

Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.9.2

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/osm2pgsql/Config.in      | 1 +
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index 3e73572a80..c6a38f3180 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_OSM2PGSQL
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_LIBOSMIUM
 	select BR2_PACKAGE_PROTOZERO
 	select BR2_PACKAGE_ZLIB
diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index cc13bf741d..0b4eb17c99 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9e3cd9e13893fd7a153c7b42089bd23338867190c91b157cbdb4ff7176ecba62  osm2pgsql-1.8.1.tar.gz
+sha256  dc30a3ad9a27f944e4169be9a8e07ee09711901536ddc8fcf4a292bd3aec51d9  osm2pgsql-1.9.2.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 11f09fe7d1..44c980ac95 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 1.8.1
+OSM2PGSQL_VERSION = 1.9.2
 OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
 OSM2PGSQL_SUPPORTS_IN_SOURCE_BUILD = NO
 
-OSM2PGSQL_DEPENDENCIES = boost bzip2 expat libosmium postgresql protozero zlib
+OSM2PGSQL_DEPENDENCIES = boost bzip2 expat json-for-modern-cpp libosmium postgresql protozero zlib
 
 # fmt > 8.0 is not yet supported
 OSM2PGSQL_CONF_OPTS = \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
