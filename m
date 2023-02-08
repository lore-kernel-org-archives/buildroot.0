Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B72C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 07:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CDEA81F1C;
	Wed,  8 Feb 2023 07:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CDEA81F1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Oc3TsEh6w7f; Wed,  8 Feb 2023 07:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A14781F19;
	Wed,  8 Feb 2023 07:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A14781F19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80EDF1BF3BB
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 07:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B45A40B88
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 07:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B45A40B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJtXptnARz-5 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 07:18:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E831D401F8
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E831D401F8
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 07:18:20 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pPeif-0008Ey-DR; Wed, 08 Feb 2023 10:18:17 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 10:18:15 +0300
Message-Id: <20230208071815.36221-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9D919194CF4FC66046397AEC088A59FC2E4C3B8ABD5857F3D182A05F53808504030BB733452FDEDFAAB943C09A39EA4A4D8F65EB5C5A7C773E6C6E5F6ACBD9482
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A1DB0B089319D380EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370BACBAB4C30C4AEB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88E4D347E51F6267EAA019325F788AFF06F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74A95F4E53E8DCE969FA2833FD35BB23D9E625A9149C048EE26055571C92BF10F618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BC2ED6D5310B1F811A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE31A2885C41F97C443847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A50FEE0E7FEC5A0793813024E2F93FE96454398D217D0385B64EAF44D9B582CE87C8A4C02DF684249CC203C45FEA855C8F
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D346B222596F62B8FA94D9A6B347F051388F082392F12001B5CA77E6AAA41502426C21A6F621DF0328C1D7E09C32AA3244C21EA1F8FBA41ECDBFCD7C5FF9C444843A95CA90A1D8AC565729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojDL2JcYrVG/9w9urjJHkpTg==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5EF004F757DD1C58226B61750F370820A98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=h75m5HxQt91aUZe/z3KTW0ZAMfw9HQo8Ougd3wqvez4=; 
 t=1675840701;x=1675930701; 
 b=Uk+a2tgF3S/vNPXu86pdBwdMxSNQg4r5kmL7Vcb45vwAIc0Rio5YI5H6FDuSIWbyeV36U25JWXCti3rj2E/RowtIPmu6EpqvJg6Ei/kugs9rcbgsrodBeomz8YQi/v5IsfnOcTPrC9LMr+s5QyaPL03v5hllenNB+CSz7Ef5zkEaKY95E0yUlzk8UDHl6QLZLr8c+fsIgoytueqd23SKFeWb5Eh7prksPYOCkqU0Y6Aqu/urdk4BcvhUlTgAP8anUTz0LjrRTFpEIug+bAtfssK3VneLRpmgcK8nihhKXneCES7msOhC6o1GhFiTe8cfCNeZp1qkRDwKu0O+Klbevg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=Uk+a2tgF
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 1.8.0
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

Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.8.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index 505a4496c8..b5b76c15c6 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  94c72ceb3c401c816499339f8765c62efbf40685a798dcdf9a4bf7dbedf6c7a5  osm2pgsql-1.7.2.tar.gz
+sha256  b266b50f46fe4d1caddab61d26b39f10ea33b896ec23b8b3e294be4666e7b927  osm2pgsql-1.8.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 2bc8d41e6e..9cdfb44ce0 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 1.7.2
+OSM2PGSQL_VERSION = 1.8.0
 OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
