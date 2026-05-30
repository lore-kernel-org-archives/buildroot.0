Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FF7CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2B236F543;
	Sat, 30 May 2026 13:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlDdJ4TD1DeE; Sat, 30 May 2026 13:00:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D447E6F544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146005;
	bh=pRcCTy9lu/Fyse1M922S61kldtzmddtyRAzKjJFOoT0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NAoW15iRgiSgm5Y3DEFKwyTGiUQhphC9yqjh5a1qKDHz1ZkIKoOTT9w5JmEzFHTgq
	 V7ksTYf30dsDZnQVnnZCrxLOF1w+BY4TKP8F5HSgqy9K/PtCh8+DYKgxJk/ogGtF52
	 wdSndNpd69epDNj+9MsCOOvB3aV4r+1Ab2Uxerl7nbZVDTdb6zI2we+NXegcgtoXev
	 cd3VwEzbKQSHowH55MnaELF3Ns6fofVVquRPvA3u/yZ191+juH3SF6HaNHc222G5re
	 5aO+U3p/A9w1ED2FsdYpynGm+Iw4o+V+d3xPOz3i1W0wiQEtNcxFh6rwTa6C244Mdo
	 Qj8hZjfvZAXGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D447E6F544;
	Sat, 30 May 2026 13:00:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9EB0F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB67E6F544
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izny31loWwkP for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6C8D6F543
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6C8D6F543
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:00:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8481874F5; Sat, 30 May 2026 12:59:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 14:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b45e479b9658fdcc6b8ee5e6ea4034d5f452c37f
X-Git-Newrev: ddde78c1bd251225c07f1910d6f9db2fc5189365
X-Patchwork-Hint: ignore
Message-Id: <20260530125950.C8481874F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups-filters: add upstream patch
 to fix CVE-2025-64524
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ddde78c1bd251225c07f1910d6f9db2fc5189365
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add "CVE:" tag in patch]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...x.c-Fix-infinite-loop-caused-by-crafted-f.patch | 84 ++++++++++++++++++++++
 package/cups-filters/cups-filters.mk               |  3 +
 2 files changed, 87 insertions(+)

diff --git a/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch b/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
new file mode 100644
index 0000000000..8badcfd429
--- /dev/null
+++ b/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
@@ -0,0 +1,84 @@
+From b03866fd2e251a6d822a5e8c807c8d47b4d2dce2 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 12 Nov 2025 16:02:20 +0100
+Subject: [PATCH] rastertopclx.c: Fix infinite loop caused by crafted file
+
+Infinite loop happened because of crafted input raster file, which led
+into heap buffer overflow of `CompressBuf` array.
+
+Based on comments there should be always some `count` when compressing
+the data, and processing of crafted file ended with offset and count
+being 0.
+
+Fixes CVE-2025-64524
+
+Upstream: https://github.com/OpenPrinting/cups-filters/commit/b03866fd2e251a6d822a5e8c807c8d47b4d2dce2
+
+CVE: CVE-2025-64524
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ filter/rastertopclx.c | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/filter/rastertopclx.c b/filter/rastertopclx.c
+index 3e7c129da..1015308da 100644
+--- a/filter/rastertopclx.c
++++ b/filter/rastertopclx.c
+@@ -818,10 +818,10 @@ StartPage(ppd_file_t         *ppd,	/* I - PPD file */
+   }
+ 
+   if (header->cupsCompression)
+-    CompBuffer = malloc(DotBufferSize * 4);
++    CompBuffer = calloc(DotBufferSize * 4, sizeof(unsigned char));
+ 
+   if (header->cupsCompression >= 3)
+-    SeedBuffer = malloc(DotBufferSize);
++    SeedBuffer = calloc(DotBufferSize, sizeof(unsigned char));
+ 
+   SeedInvalid = 1;
+ 
+@@ -1152,6 +1152,13 @@ CompressData(unsigned char *line,	/* I - Data to compress */
+               seed ++;
+               count ++;
+             }
++
++	    //
++	    // Bail out if we don't have count to compress
++	    //
++
++	    if (count == 0)
++	      break;
+ 	  }
+ 
+          /*
+@@ -1245,6 +1252,13 @@ CompressData(unsigned char *line,	/* I - Data to compress */
+ 
+             count = line_ptr - start;
+ 
++	    //
++	    // Bail out if we don't have count to compress
++	    //
++
++	    if (count == 0)
++	      break;
++
+ #if 0
+             fprintf(stderr, "DEBUG: offset=%d, count=%d, comp_ptr=%p(%d of %d)...\n",
+ 	            offset, count, comp_ptr, comp_ptr - CompBuffer,
+@@ -1416,6 +1430,13 @@ CompressData(unsigned char *line,	/* I - Data to compress */
+ 
+             count = (line_ptr - start) / 3;
+ 
++	    //
++	    // Bail out if we don't have count to compress
++	    //
++
++	    if (count == 0)
++	      break;
++
+            /*
+             * Place mode 10 compression data in the buffer; each sequence
+ 	    * starts with a command byte that looks like:
+-- 
+2.47.3
+
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index f2b85aa9d5..da882ab838 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -13,6 +13,9 @@ CUPS_FILTERS_CPE_ID_VENDOR = openprinting
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
 
+# 0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
+CUPS_FILTERS_IGNORE_CVES += CVE-2025-64524
+
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
 CUPS_FILTERS_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
