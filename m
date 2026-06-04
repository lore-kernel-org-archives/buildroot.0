Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260ADCD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F32BB4124F;
	Fri,  5 Jun 2026 12:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYSyfnHov9Y1; Fri,  5 Jun 2026 12:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BE9841234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663204;
	bh=PgvgTCrrWwQMIgUVezu2bUIE95Lmchqj84WQyKeIv4s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y/BCaeGNl6vUkDKC9IJAbJU9M179SHZ+EphCI2PleV8JYThm8CV0+8VXr4CJHOD6Z
	 fV4vnpKg1OqbaNjynxBzV3LQmPRZ50jJBh/0/mcfjQaigRE4/MQirzB5PnOYlLX9+F
	 SIBGKTkVsJCBLT6fFZlcJJJRBOIkCQwe7TpSAsE/Kz67apiTg4OdFnLDMwmrXfDleq
	 /90/1kA2OWjvk+xTl4fqJQHmrDe0eUudL/jNKu01pYuY58BxXqHpdCXz+pwPpnVgtA
	 SBvyKb4S3t8AONMCvIpx/XOj0op+6f1H1KR/YYCn3BCU/OrIynGiavP5LwhhcPbQVU
	 jNa2+/+9eUTVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE9841234;
	Fri,  5 Jun 2026 12:40:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 101833B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CD0641028
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lV1HrGQ4jYKi for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 909C841056
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 909C841056
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAEC887B3B; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:04:27 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 5a29ec02f617b6fcefbf8d71aedb5f68b7e0c9be
X-Git-Newrev: 4d3c8925b0f2199820fc25c6a30d77b31fc6cba0
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.BAEC887B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/cups-filters: add
 upstream patch to fix CVE-2025-64524
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4d3c8925b0f2199820fc25c6a30d77b31fc6cba0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add "CVE:" tag in patch]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ddde78c1bd251225c07f1910d6f9db2fc5189365)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
