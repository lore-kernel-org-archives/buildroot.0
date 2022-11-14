Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D63C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64B204085D;
	Mon, 14 Nov 2022 22:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64B204085D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8OKYcFYs00C; Mon, 14 Nov 2022 22:15:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 135AB4086A;
	Mon, 14 Nov 2022 22:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 135AB4086A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CA2D1BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66FC940217
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66FC940217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hq5NTlR7If3d for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:15:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88FFB40012
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88FFB40012
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7891E83B6E; Mon, 14 Nov 2022 22:15:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 23:14:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bc283a7bc8967fe7d38205ac8ffe966d035dafc2
X-Git-Newrev: 1718c2ba6a4db1461b2490aa42ca4f0a2112adae
X-Patchwork-Hint: ignore
Message-Id: <20221114221554.7891E83B6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/postgis: bump version
 to 3.3.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1718c2ba6a4db1461b2490aa42ca4f0a2112adae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

All patches are merged into upstream, so drop them.

https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.3.2/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...isable-forced-static-linking-of-liblwgeom.patch | 31 -------------------
 ...er-Makefile.in-do-not-force-static-linkin.patch | 35 ----------------------
 package/postgis/postgis.hash                       |  2 +-
 package/postgis/postgis.mk                         |  2 +-
 4 files changed, 2 insertions(+), 68 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
