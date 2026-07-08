Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3F0C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FFB160A3A;
	Fri, 10 Jul 2026 13:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tm7Z_RPQnrxV; Fri, 10 Jul 2026 13:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86457608F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691013;
	bh=mf0EByylN6yRbFxaj/NpGl6Fbky35b/Nff4RYBk5DDA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RGf6/bXlfJWHYJphnV9mV1jPqv+XhlGBDbXej/Fwg7bvTpU03n7uzZGdfBMnmW/i0
	 1CDri20TeXpdiQi7uHbhqEPfrUXu6ta0y2K5eNeOHMkqmezgWnt9BMlEAAYFeKBC9z
	 1eAv5iH6BOTZX+UG0AA/gfsIHPOCyEI8u8DwxtqYsjsbz/J+Q3CzPv2clwq7HmRZP7
	 fgSAcMhMe3FU6wAcXoV9+BHGwF1EUnvY67eBU65t1vYrD62N5lVQFOWPrQl7ojBqMY
	 6QWYXYo/27FYDWxMj1Ows5jPqvUQtb2dqfQgxoMxXed6HzhcfQfj35wGYWh0MY/WAu
	 zCV75Xi9iw+WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86457608F9;
	Fri, 10 Jul 2026 13:43:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CD6D2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12DC4408F3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5vhP1rVsEH3 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D239A408F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D239A408F0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13C0188660; Fri, 10 Jul 2026 13:42:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 15:00:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 413158f39b9d070983821f6157f7abb20de6790c
X-Git-Newrev: 2b412e077cbe63172d8554f3bfd72c8be89c3171
X-Patchwork-Hint: ignore
Message-Id: <20260710134218.13C0188660@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cups-filters:
 upstream patch CVE-2025-64503
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
Content-Type: multipart/mixed; boundary="===============2244890997018122774=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2244890997018122774==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b412e077cbe63172d8554f3bfd72c8be89c3171
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerability:

- CVE-2025-64503:
    cups-filters contains backends, filters, and other software required
    to get the cups printing service working on operating systems other
    than macos. In cups-filters prior to 1.28.18, by crafting a PDF file
    with a large `MediaBox` value, an attacker can cause CUPS-Filter 1.x’s
    `pdftoraster` tool to write beyond the bounds of an array. First, a
    PDF with a large `MediaBox` width value causes `header.cupsWidth` to
    become large.  Next, the calculation of `bytesPerLine =
    (header.cupsBitsPerPixel * header.cupsWidth + 7) / 8` overflows,
    resulting in a small value. Then, `lineBuf` is allocated with the
    small `bytesPerLine` size. Finally, `convertLineChunked` calls
    `writePixel8`, which attempts to write to `lineBuf` outside of its
    buffer size (out of bounds write). In libcupsfilters, the maintainers
    found the same `bytesPerLine` multiplication without overflow check,
    but the provided test case does not cause an overflow there, because
    the values are different. Commit
    50d94ca0f2fa6177613c97c59791bde568631865 contains a patch, which is
    incorporated into cups-filters version 1.28.18.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-64503
  - https://github.com/OpenPrinting/cups-filters/commit/50d94ca0f2fa6177613c97c59791bde568631865

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit def2405f39f949813148cc973660845bff30b3ca)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...05-fix-out-of-bounds-write-in-pdftoraster.patch | 41 ++++++++++++++++++++++
 package/cups-filters/cups-filters.mk               |  3 ++
 2 files changed, 44 insertions(+)

diff --git a/package/cups-filters/0005-fix-out-of-bounds-write-in-pdftoraster.patch b/package/cups-filters/0005-fix-out-of-bounds-write-in-pdftoraster.patch
new file mode 100644
index 0000000000..1da04ca959
--- /dev/null
+++ b/package/cups-filters/0005-fix-out-of-bounds-write-in-pdftoraster.patch
@@ -0,0 +1,41 @@
+From 50d94ca0f2fa6177613c97c59791bde568631865 Mon Sep 17 00:00:00 2001
+From: Till Kamppeter <till.kamppeter@gmail.com>
+Date: Mon, 10 Nov 2025 18:31:48 +0100
+Subject: [PATCH] Fix out-of-bounds write in pdftoraster
+
+PDFs with too large page dimensions could cause an integer overflow and then a too small buffer for the pixel line to be allocated.
+
+Fixed this by cropping the page size to the maximum allowed by the standard, 14400x14400pt, 200x200in, 5x5m
+
+https://community.adobe.com/t5/indesign-discussions/maximum-width-of-a-pdf/td-p/9217372
+
+CVE: CVE-2025-64503
+Upstream: https://github.com/OpenPrinting/cups-filters/commit/50d94ca0f2fa6177613c97c59791bde568631865
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ filter/pdftoraster.cxx | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/filter/pdftoraster.cxx b/filter/pdftoraster.cxx
+index 7b3af924f..b64b34c62 100755
+--- a/filter/pdftoraster.cxx
++++ b/filter/pdftoraster.cxx
+@@ -1698,6 +1698,18 @@ static void outPage(poppler::document *doc, int pageNo,
+     header.PageSize[0] = (unsigned)l;
+   else
+     header.PageSize[1] = (unsigned)l;
++  /*
++    Maximum allowed page size for PDF is 200x200 inches (~ 5x5 m), or 14400x14400 pt
++    https://community.adobe.com/t5/indesign-discussions/maximum-width-of-a-pdf/td-p/9217372
++  */
++  if (header.PageSize[0] > 14400) {
++    fprintf(stderr, "ERROR: Page width is %dpt, too large, cropping to 14400pt\n", header.PageSize[0]);
++    header.PageSize[0] = 14400;
++  }
++  if (header.PageSize[1] > 14400) {
++    fprintf(stderr, "ERROR: Page height is %dpt, too large, cropping to 14400pt\n", header.PageSize[1]);
++    header.PageSize[1] = 14400;
++  }
+ 
+   memset(paperdimensions, 0, sizeof(paperdimensions));
+   memset(margins, 0, sizeof(margins));
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index da882ab838..43fbfd0aae 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -16,6 +16,9 @@ CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
 # 0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
 CUPS_FILTERS_IGNORE_CVES += CVE-2025-64524
 
+# 0005-fix-out-of-bounds-write-in-pdftoraster.patch
+CUPS_FILTERS_IGNORE_CVES += CVE-2025-64503
+
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
 CUPS_FILTERS_CONF_OPTS = \

--===============2244890997018122774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2244890997018122774==--
