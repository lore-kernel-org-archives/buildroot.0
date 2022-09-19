Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E901C54EE9
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 06:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C24C425A9;
	Mon, 19 Sep 2022 06:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C24C425A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pw9cYiF60_gd; Mon, 19 Sep 2022 06:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377AC4259F;
	Mon, 19 Sep 2022 06:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 377AC4259F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75F811BF393
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 06:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F02B4259F
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 06:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F02B4259F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyLTg0566Hcl for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 06:21:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 513FD4259D
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 513FD4259D
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 06:21:00 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1oaA9J-00006w-7L; Mon, 19 Sep 2022 09:20:57 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Mon, 19 Sep 2022 09:20:23 +0300
Message-Id: <20220919062023.1091771-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9EBD81B01C038F8F37A3C6F5B007D561670736DF5E326B93F182A05F53808504099B462805F40A24F26C82C481438A964B4D53E2CCD6E8C1370790977D09EF8E0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F09446BC3D835A58EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378D8F1FE4E764DFCDEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B8859CA687ABA27BA286163D8FA88DF2D00A592F39E19D2CA20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0DEC8C2C8BCD2534D8941B15DA834481FA18204E546F3947C13BDA61BF53F5E1DF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370BDB19F53EE528DD389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735B17145F0B7815491C4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C41E93BD56E7067354307CAA32FF218580205367B2BCC23E5B60B02BA32D92E101E7E65F06B2D3BF1CAD91A466A1DEF99B6ED91DBE5ABE359A3485EE9140A7D39D7BB222D9AD51FB28574CD456CC796227FB74B39B9C800387D8BA4333CE3E613DB1881A6453793CE9C32612AADDFBE061501E677427FAD4073D58D961240FA4EF6DABF04D5057A81F1E618B5D5F965AFDF9425D8FA97DB43915E2725BA614EAEA1EF972C1F679AE1C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34EB7BD66E9101C100891E0AAFBDE0B66C543DC3CBFC608447A75A851EBAF89A62032D107570628CA91D7E09C32AA3244C9839FF57F7265F90329F5CA05BADE43124AF4FAF06DA24FD729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYCidGuNEkb6u9G/VcuK/Ww==
X-Mailru-Sender: 689FA8AB762F7393CC2E0F076E87284ECDD0B0EB6C5E406A9426F1FDE34AC90598CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=5Fp0qyOoH6C+OkMtUy7IivAJuQ0HEHm9K8P/s4WZhRE=; 
 t=1663568460;x=1663658460; 
 b=lO7EI9lXEFnLdGVdLutBepVS5uYMkCMUcrNSM82rRyru7YHntZaKnD99Z6juQw/YDjOq/HGrMQnMMinUoVq/SV/7a2RhnAw0iEswSos+llffBYxFwwibx4FmdzDwbH+JzxJbP40MdPRicI8gtx6JHVG2QT0JPzaZgSy69SpTr7YwCq242OW4mJs9l958Qcg+Q872OBBsaXf7fkGPzjG4YrTh843CjOQ6nxvoXiyAEtEXU81KDp4rY4A6Dx7lywel7elbsI+qJlo/Z01ovtn+F7Kzb0PJY0xhUNMmi/hsZe5wl8gdAryM79zo5H1FY+SnJgHhGrkwGKRVM1JKlTJzRQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=lO7EI9lX
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.3.1
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

Release-notes: https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.3.1/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 ...kefile.in-do-not-force-static-linkin.patch | 23 ++++++++++---------
 package/postgis/postgis.hash                  |  2 +-
 package/postgis/postgis.mk                    |  2 +-
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch b/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
index 756a7c10dd..20a359fadd 100644
--- a/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
+++ b/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
@@ -1,6 +1,6 @@
-From 29c33c483e22a4445d870739187d128df0f11f60 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 27 Jul 2022 15:12:40 +0200
+From 50af3f4fc2353ba35fd054060e27e034d29b1c78 Mon Sep 17 00:00:00 2001
+From: Maxim Kochetkov <mkochetkov@airspan.com>
+Date: Mon, 19 Sep 2022 09:09:44 +0300
 Subject: [PATCH] raster/loader/Makefile.in: do not force static linking
 
 This is similar to commit
@@ -13,23 +13,24 @@ object XYZ".
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Upstream: https://github.com/postgis/postgis/pull/702
+Signed-off-by: Maxim Kochetkov <mkochetkov@airspan.com>
 ---
  raster/loader/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/raster/loader/Makefile.in b/raster/loader/Makefile.in
-index 3df47a96f..d0a408333 100644
+index b5d2e6709..5fc6b6038 100644
 --- a/raster/loader/Makefile.in
 +++ b/raster/loader/Makefile.in
-@@ -36,7 +36,7 @@ PGSQL_BINDIR=@PGSQL_BINDIR@
+@@ -38,7 +38,7 @@ RASTER2PGSQL=raster2pgsql@EXESUFFIX@
+ # PostgreSQL executable directory
+ PGSQL_BINDIR=@PGSQL_BINDIR@
  
- RT_CORE=../rt_core
- 
--LIBLWGEOM_LDFLAGS= -static ../../liblwgeom/liblwgeom.la
-+LIBLWGEOM_LDFLAGS= ../../liblwgeom/liblwgeom.la
- LIBLWGEOM_CFLAGS=-I../../liblwgeom
+-LIBLWGEOM_LDFLAGS = -static $(top_builddir)/liblwgeom/liblwgeom.la
++LIBLWGEOM_LDFLAGS = $(top_builddir)/liblwgeom/liblwgeom.la
+ LIBLWGEOM_CFLAGS = -I$(top_builddir)/liblwgeom -I$(top_srcdir)/liblwgeom
  LIBGDAL_CFLAGS=@LIBGDAL_CFLAGS@
  LIBGDAL_LDFLAGS=@LIBGDAL_LDFLAGS@
 -- 
-2.37.1
+2.34.1
 
diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 9569ca71dd..e25ed152c5 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  18cf3d013f45b1aa8ed59d78bc707e9e125e250d8f0615396ae9bfe3dd7c3d7c  postgis-3.2.2.tar.gz
+sha256  91be800a72d748c5a3a4a00d82ac1de42023e29da61ece6ebf9c77fe228fcb1a  postgis-3.3.1.tar.gz
 sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index e6ea52bf7a..a853c09bd8 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.2.2
+POSTGIS_VERSION = 3.3.1
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
