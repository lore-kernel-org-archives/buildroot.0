Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141C0C678D5
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 06:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BAD41B9C;
	Sat, 11 Mar 2023 06:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59BAD41B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x9EEbV4DGKKh; Sat, 11 Mar 2023 06:00:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45C9E4184C;
	Sat, 11 Mar 2023 06:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45C9E4184C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F14FF1BF616
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 06:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAB53400D2
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 06:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAB53400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPDPjvTSkiPI for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 06:00:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D45B41728
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D45B41728
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 06:00:06 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pasGx-0000MF-NY; Sat, 11 Mar 2023 09:00:04 +0300
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 09:00:01 +0300
Message-Id: <20230311060001.657936-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9BCEC41593EBD8357C44FF2494EBC845BD7AEF656CFC8618A182A05F5380850407A489BB7B7872AE42E23ABF1E89FE07743662D795BAAB27BBCB04708BAF1FBCD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77545ECFDF1E157EBEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063790B55F3E386DB9B28638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80AC6D894615A1A979BF7DC3CF6B27C7A6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74A95F4E53E8DCE969FA2833FD35BB23D9E625A9149C048EE437C869540D2AB0F2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B406C66621D3021AFA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CD1D040B6C1ECEA3F43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5E6376097152CF055CCD6439B19D52580FCED78FA36ACAAD04EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF505830FD47C92F6C63
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34EC58E35A639A24717657FB66ADE4D115AA7C97F1A5F08F2CB45947980D944FDF378933869ACABBC11D7E09C32AA3244C5734E1D5DAA9B3B128FD916D9B65DD9F9CA7333006C390A0729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojEg2t1XEOuWFyh4LlbXut5Q==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5B48CA7C3387DB50A38EC0FD134493CDA98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=fiJQHFvhWq86byKUi4ED1IY6HS5Zukk0vlu9tZuVNEw=; 
 t=1678514407;x=1678604407; 
 b=FcfoxfiOxc0oIrVAAFEWslAUu98CcoFDX2bVR1rjl1w1b2yEB9To+rVYO5j/lZ2GJtU0TPTOegzemIojNSr1Aipf22Hz6i+tevI/G9WJoXjnRg+/XjQXyyDiJt5ptHaXuWwITZ2jPs6GGd77LfDhl4raNLC7y73qkcqIu+QIVTd3/27+NyxzuKLj86aHoOpHbG3o3orhWVKvJGkxMOXtt2RsTdZ3rDm/OLM4fIAOXNo8CDoivF9yJ+p2jiRHtvOWsTnQr4hFOq++yi7zHX0jmEyEW6ilMazvH6DRKMwdmjox/gTDLhlUEe6S9o7dPMsUiJa/P5i9a8cZ629GcktqUw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=FcfoxfiO
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH v2 1/1] package/gdal: bump version to 3.6.2
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
 package/gdal/gdal.mk   | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

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
index a3b11c53af..08992ce73c 100644
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
@@ -32,6 +32,7 @@ GDAL_DEPENDENCIES = host-pkgconf jpeg json-c libgeotiff libpng proj tiff zlib
 # Yes, even though they have -DDGDAL_USE options, a few libraries are
 # mandatory. If we don't provide them, bundled versions are used.
 GDAL_CONF_OPTS = \
+	-DCMAKE_NO_SYSTEM_FROM_IMPORTED=ON \
 	-DGDAL_USE_GEOTIFF=ON \
 	-DGDAL_USE_JPEG=ON \
 	-DGDAL_USE_JSONC=ON \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
