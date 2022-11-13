Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF74AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 10:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EFE281292;
	Sun, 13 Nov 2022 10:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EFE281292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IC8N6Q0uOJ3C; Sun, 13 Nov 2022 10:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64CBB812AB;
	Sun, 13 Nov 2022 10:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64CBB812AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5EAF1BF47E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 10:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A11B84020B
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 10:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A11B84020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMC05P9SLtIg for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 10:09:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE4F940140
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE4F940140
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 10:09:21 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1ou9vS-0007cP-KX; Sun, 13 Nov 2022 13:09:19 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 13:09:14 +0300
Message-Id: <20221113100914.1012977-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9143903447CF85CF5092F15731B949002ECF52CCFBA4658E0182A05F5380850404C228DA9ACA6FE27E7FE5ABD441B2A7794A5B572095DDF8CE43F7E46C385883FC2338AB5A00FFB05
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7876E9C5582D2D91DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379703D7D5B138802D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83603AC821117B541C18A97909A717B3C6F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC292D688DDAD4E7BC389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC860910C30DCD593B1F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B779389CF6F126FEC75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A52A08A48D3EEC0D60115812CDD2E2F1E67B59EC67646AC6BB4EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF50F2237FE565727C05
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34CC972AA0E2E780C436F8A8FFAD5BF5AE76F755E0DBFDD50D755706497CCE70B183BF0C62D8C36E931D7E09C32AA3244C8C83339E2100B1C8225C2ED3A1ED476C30452B15D76AEC14729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj8JpecWJC8nUr5Q7/IxJXIg==
X-Mailru-Sender: 689FA8AB762F7393CC2E0F076E87284E19EB43465878E4AA92BE3D8E9C3F973498CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=0pDB+Yu6hQm2UwEz8s92vVNWFYOsJyvBcFLOTHSdz7g=; 
 t=1668334161;x=1668424161; 
 b=mBdeZ2DXSGyCw+89hIF6sjCosyY2jMMvzWcdJQwibuwXvgGZvzRftMa/FnR/b5ciepVgku7A8aBS/UdnXnBjTqo286vXby905p43Lzx/CZe/k9fn35Ql28xADuMjEQh7MXZyNTNe3P/p4Qcpo+7rOFs0ud0Q4UzP1jaHlA7HMeYq2iqxxi4/ygD3UcIWlPExCfOY4al8Es69HOR618RBoCqzXvA8ZYhG7evxQDZvSwokZSfPKkl3RMRGjEBfwGNEERwLWEpHzZxnDW89PO6WPcb7h2R0E+9H9jXipUoGAxyD5eJba7nOsisEqTSSFKWH6P31JjE2rpFN6GISCtmu4w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=mBdeZ2DX
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.3.2
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

All patches are merged into upstream, so drop them.

https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.3.2/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 ...e-forced-static-linking-of-liblwgeom.patch | 31 ----------------
 ...kefile.in-do-not-force-static-linkin.patch | 35 -------------------
 package/postgis/postgis.hash                  |  2 +-
 package/postgis/postgis.mk                    |  2 +-
 4 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch
 delete mode 100644 package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch

diff --git a/package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch b/package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch
deleted file mode 100644
index 4329c9cd80..0000000000
--- a/package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 845c18c1288b7a96592901baadb198f96dd71c46 Mon Sep 17 00:00:00 2001
-From: fidomax <adobegitler@gmail.com>
-Date: Tue, 26 Jan 2021 09:49:19 +0300
-Subject: [PATCH] Disable forced static linking of liblwgeom
-
-In case of shared libs build fails:
-ld: cannot find -lgeos_c
-ld: attempted static link of dynamic object `/usr/lib/libproj.so'
-
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
-Fetch from: https://github.com/postgis/postgis/commit/98070faad220e12fcaed9a583a70a37c510b7c6b.patch
----
- loader/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/loader/Makefile.in b/loader/Makefile.in
-index 9aebfe07f..9a0c90d3a 100644
---- a/loader/Makefile.in
-+++ b/loader/Makefile.in
-@@ -44,7 +44,7 @@ ICONV_CFLAGS=@ICONV_CFLAGS@
- 
- # liblwgeom
- LIBLWGEOM=../liblwgeom/liblwgeom.la
--LDFLAGS += -static $(LIBLWGEOM)
-+LDFLAGS += $(LIBLWGEOM)
- 
- # GTK includes and libraries
- GTK_CFLAGS = @GTK_CFLAGS@ @IGE_MAC_CFLAGS@
--- 
-2.30.0
-
diff --git a/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch b/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
deleted file mode 100644
index 756a7c10dd..0000000000
--- a/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 29c33c483e22a4445d870739187d128df0f11f60 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 27 Jul 2022 15:12:40 +0200
-Subject: [PATCH] raster/loader/Makefile.in: do not force static linking
-
-This is similar to commit
-https://github.com/postgis/postgis/commit/98070faad220e12fcaed9a583a70a37c510b7c6b,
-but applied to raster/loader. It ensures that if only shared variants
-of the libraries are available, the link still works. If you force
--static and only shared variants of some of the libraries are
-available, the link fails with "d: attempted static link of dynamic
-object XYZ".
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/postgis/postgis/pull/702
----
- raster/loader/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/raster/loader/Makefile.in b/raster/loader/Makefile.in
-index 3df47a96f..d0a408333 100644
---- a/raster/loader/Makefile.in
-+++ b/raster/loader/Makefile.in
-@@ -36,7 +36,7 @@ PGSQL_BINDIR=@PGSQL_BINDIR@
- 
- RT_CORE=../rt_core
- 
--LIBLWGEOM_LDFLAGS= -static ../../liblwgeom/liblwgeom.la
-+LIBLWGEOM_LDFLAGS= ../../liblwgeom/liblwgeom.la
- LIBLWGEOM_CFLAGS=-I../../liblwgeom
- LIBGDAL_CFLAGS=@LIBGDAL_CFLAGS@
- LIBGDAL_LDFLAGS=@LIBGDAL_LDFLAGS@
--- 
-2.37.1
-
diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 9569ca71dd..8550a57939 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  18cf3d013f45b1aa8ed59d78bc707e9e125e250d8f0615396ae9bfe3dd7c3d7c  postgis-3.2.2.tar.gz
+sha256  9a2a219da005a1730a39d1959a1c7cec619b1efb009b65be80ffc25bad299068  postgis-3.3.2.tar.gz
 sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index e6ea52bf7a..4148180adf 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.2.2
+POSTGIS_VERSION = 3.3.2
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
