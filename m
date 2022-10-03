Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B1DC4332F
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 08:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC61F817AB;
	Mon,  3 Oct 2022 08:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC61F817AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSgGH4yga48E; Mon,  3 Oct 2022 08:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FA4681777;
	Mon,  3 Oct 2022 08:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FA4681777
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4726B1BF271
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 08:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 202EA40878
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 08:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 202EA40878
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UxS0o1KKtEqx for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 08:36:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BED74086F
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BED74086F
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 08:36:01 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1ofGve-0006wa-EL; Mon, 03 Oct 2022 11:35:58 +0300
To: buildroot@buildroot.org
Date: Mon,  3 Oct 2022 11:35:56 +0300
Message-Id: <20221003083556.35092-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95BC634034C2E79655B374CAF81AF41E7607903C292543BCE182A05F538085040F86EA133CEC5E4A6E71E8245F6930E1FAAD813CF1809E32511470B6ED19F75F0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7495A032B936E882FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F0D8FAB78312C5B48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A7E749528E1CB4485C318449DD1A8BBF6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE759A2DA0C93DFCD719FA2833FD35BB23D9E625A9149C048EE4B6963042765DA4B28451B159A507268D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BEA77C8EAE1CE44B0A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249B0E9FD5D4288160EE827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B642416645EBD45DC2089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C41E93BD56E7067354307CAA32FF218580205367B2BCC23E5B66C12889FB4487B10003EFFB447AF238D59269BC5F550898728CF7B057D10C70ED96AA85C75E140DA9D420A4CFB5DD3EFDA55C4F0AA8061C0F3B45B14FF6C78A42F206489643FDD4D59269BC5F550898DBE8DEE28BC9005C662F61F51A99F6DB4EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF504DBC578B17CB11D78E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F1257DC9690AEBA170B84CD06C16F691D794AC5268709C0769CD369405D39810CD33D3930EDCF76B1D7E09C32AA3244CCD4A968D7DC5029ABD342D9E25273CC424AF4FAF06DA24FD729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojf/9mtrlthuSwgrpHyczv9Q==
X-Mailru-Sender: 689FA8AB762F7393CC2E0F076E87284ECFA8A5BB7ED38B48C3CB04C7ED3FF8BD98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=4Dpj9y4JIrM+xAfNPs4W5pQW376fMmBPuJoimtAwkto=; 
 t=1664786161;x=1664876161; 
 b=r8Onrb8VC3LYhNuM2/9p9GbmblrzwElqPPJjZemjmQGroWLHheSwAGqPlz67Vw9QCwIbLA6/WownouuLnN+6olcdlWGqN4JuP0unpZcsThA4OesSFrtbLJ75km33TJYXIWCBsL+KWeKxj8JGPc0jmekiwCtwZXGMqTG6Kxi+rbn+W+lYLXDFb9kx2PgNZT06hCLut7pRZbtVX8oXAyvfEG1u+NngFoRx/mq6vZjZXReoFBoTHo13v55CIPtShH2AjuZdw4f7q56Q/j1IR9nMB65WJJV4IDBfeJPCHw/wCG6qmtTe8+A2q1cKCmcDCbKLLAilKX4nEFQ7BBeKxnKR4g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=r8Onrb8V
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH v2 1/1] package/postgis: bump version to 3.3.1
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

Release-notes: https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.3.1/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
Changes in v2:
 * All the patches are merged into upstream.
---
 ...e-forced-static-linking-of-liblwgeom.patch |  4 ++--
 ...kefile.in-do-not-force-static-linkin.patch | 21 ++++++++++---------
 package/postgis/postgis.hash                  |  2 +-
 package/postgis/postgis.mk                    |  2 +-
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch b/package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch
index 4329c9cd80..6c6ca57f53 100644
--- a/package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch
+++ b/package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch
@@ -1,4 +1,4 @@
-From 845c18c1288b7a96592901baadb198f96dd71c46 Mon Sep 17 00:00:00 2001
+From 98070faad220e12fcaed9a583a70a37c510b7c6b Mon Sep 17 00:00:00 2001
 From: fidomax <adobegitler@gmail.com>
 Date: Tue, 26 Jan 2021 09:49:19 +0300
 Subject: [PATCH] Disable forced static linking of liblwgeom
@@ -27,5 +27,5 @@ index 9aebfe07f..9a0c90d3a 100644
  # GTK includes and libraries
  GTK_CFLAGS = @GTK_CFLAGS@ @IGE_MAC_CFLAGS@
 -- 
-2.30.0
+2.34.1
 
diff --git a/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch b/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
index 756a7c10dd..f91848123e 100644
--- a/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
+++ b/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
@@ -1,4 +1,4 @@
-From 29c33c483e22a4445d870739187d128df0f11f60 Mon Sep 17 00:00:00 2001
+From 93b98069713d46282cd23c3bedec6fc82242a513 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Wed, 27 Jul 2022 15:12:40 +0200
 Subject: [PATCH] raster/loader/Makefile.in: do not force static linking
@@ -12,24 +12,25 @@ available, the link fails with "d: attempted static link of dynamic
 object XYZ".
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/postgis/postgis/pull/702
+Upstream: https://github.com/postgis/postgis/commit/93b98069713d46282cd23c3bedec6fc82242a513.patch
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
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
