Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B0FC6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 05:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C3C960BAA;
	Mon, 13 Mar 2023 05:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C3C960BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kAj7qXgo4Hx; Mon, 13 Mar 2023 05:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA83E60BA1;
	Mon, 13 Mar 2023 05:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA83E60BA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D22301BF2CD
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 05:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB7DD41579
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 05:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB7DD41579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFLUn5BWTZpz for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 05:09:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A32774150F
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A32774150F
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 05:09:44 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pbaRJ-0002sy-Ey; Mon, 13 Mar 2023 08:09:41 +0300
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 08:09:38 +0300
Message-Id: <20230313050938.9860-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9BCEC41593EBD83570AA601AEA34798F73F5BC8FBBA927E37182A05F538085040C7101BBCA1D7B0B5ED117828B73E362A37F9245866AEDF5EC99827C7158F9A26
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7952C4D7BD0BF3359EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637C867FEFF36BCDF178638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F54EE761B89A8D83B5D97F18B10999616F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77E7E81EEA8A9722B8941B15DA834481FA18204E546F3947CAC824117EA787438117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7069B8BEE518BDBBF9FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16B262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5742E098CF50B074BC7FEABDB2BB38F92C8E40915B2419E444EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF505830FD47C92F6C63
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D341776B9FDE05FBA7A7AA5A84B82B2F2F5BF3FDF426F48C601712253A6948AEF5B452A6BAC0789CD361D7E09C32AA3244C77E4B09C4E2C05E47FA4CB1756ECC141D08D48398F32B4A6729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojN3wBDQf4j7Oqa3mQHDvlLg==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5FAEE690D70D81F3C0EE72573729130E298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Jz/mdOcuOTFvO3gAKhmr0oS53i9/9JcVz6hdVAIotp0=; 
 t=1678684184;x=1678774184; 
 b=RKi6giC+Nt9yz0iRcsnieUl0ITmBUftoY401JR0lxml4hj0RubazwrLV4hklO1zvCl+BaxrNJAwmuqLwDMzjrZmTOZF5hrXXGhadnrRlNxVWMs/ti4e6qsYHfRFGCOFQ1iuYAz0PlXbeTxU2adSi4BYq8uw/cVJC5+fQQXWgZVQxWDzJYQ8KyVjevAsYZyik8DMbw2SkjYkDK8cxotyYOu2oSoaf9tb6aGPksi85AWQsKEQz7wLqxoMi8gKOcumAzSuYpD+ArZGtNhjNrGsvVPF9G3eUtxN+H4y+luPyH6DVWUnqEn/CfAQLmv52aVFeP2Sex7qhzKRVK7orO7YJWA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=RKi6giC+
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH v3 1/1] package/gdal: bump version to 3.6.2
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

Release notes: https://github.com/OSGeo/gdal/blob/v3.6.2/NEWS.md
License changes: https://github.com/OSGeo/gdal/commit/a394f9cb299b2c3c2159098483d1fece3a464fda

ISC License is added for FlatGeobuf and Flatbush
Apache-2.0 is added for flatbuffers

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/gdal/gdal.hash | 8 ++++----
 package/gdal/gdal.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
index ab77d7840d..d0b08b4535 100644
--- a/package/gdal/gdal.hash
+++ b/package/gdal/gdal.hash
@@ -1,6 +1,6 @@
-# md5 from: https://download.osgeo.org/gdal/3.5.2/gdal-3.5.2.tar.xz.md5, sha256 locally computed:
-md5  821b3b0637ebada5d20dbefb2e3ec964  gdal-3.5.2.tar.xz
-sha256  0874dfdeb9ac42e53c37be4184b19350be76f0530e1f4fa8004361635b9030c2  gdal-3.5.2.tar.xz
+# md5 from: https://download.osgeo.org/gdal/3.6.2/gdal-3.6.2.tar.gz.md5, sha256 locally computed:
+md5  6f22ffdbd8e00059ddb2b825c5920c4c  gdal-3.6.2.tar.xz
+sha256  35f40d2e08061b342513cdcddc2b997b3814ef8254514f0ef1e8bc7aa56cf681  gdal-3.6.2.tar.xz
 
 # Hashes of license files:
-sha256  fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a  LICENSE.TXT
+sha256  1dae3468e81d00da56e2936f74d33b8b3ad09d726437f19ce209a5dabea41f77  LICENSE.TXT
diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index a3b11c53af..ce67399c32 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GDAL_VERSION = 3.5.2
+GDAL_VERSION = 3.6.2
 GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
 GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
-GDAL_LICENSE = MIT, many others
+GDAL_LICENSE = Apache-2.0, ISC, MIT, many others
 GDAL_LICENSE_FILES = LICENSE.TXT
 GDAL_CPE_ID_VENDOR = osgeo
 GDAL_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
