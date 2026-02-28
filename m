Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9503FEE4F8
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 20:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48EB160FB4;
	Sat, 28 Feb 2026 20:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyxyRanKZXX3; Sat, 28 Feb 2026 20:49:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6013260FBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772311774;
	bh=HN5X6gd7yKLcWJagJwdi/4WIHBXUUhKcS5lPWC+B6Og=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E+7LdW/n2MvOfhozT7h8aPukB8UTq5cAO3gUheeBjBwsbkUbdyQfBH8U4sm/NHo/s
	 wpKfYbd7v95KBucSBahPLFUxDsmZsAUW9rHsFzuO+/QvESh0sQDyLXzGQ5dPNwf3+S
	 gvrzfXLyu83btSorCidp4Ca3GGBPTRSCTIjap15NNWCstHl2mHadC5G8OR+nypfTms
	 Ew7kbkQ8FroV/ykZKGXaCdjZrXcHZ05ieh/lwoN2zVkuYjtv2VdZLKkpOctoo6mCKA
	 OfMUMKDt2l8tuG2tpH839jN8tjseF0aCZ4xzwG1KcXx9+lzyLQTeIN9TKp3P1N3nJj
	 V0Y+gc5QoFaVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6013260FBC;
	Sat, 28 Feb 2026 20:49:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D92DC1EB
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEE834166D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bumBGmvbKDLk for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 20:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DB5B4164A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DB5B4164A
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:49:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AC9785C2D; Sat, 28 Feb 2026 20:49:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 21:43:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f47b624a12d38f23809c0d82c94588c3a3d26d16
X-Git-Newrev: 3f4e289aab9c2aa113d05589ba6b83778e60a0f3
X-Patchwork-Hint: ignore
Message-Id: <20260228204931.8AC9785C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: add patch for CVE-2026-25556
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f4e289aab9c2aa113d05589ba6b83778e60a0f3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerability:

- CVE-2026-25556:
    MuPDF versions 1.23.0 through 1.27.0 contain a double-free
    vulnerability in fz_fill_pixmap_from_display_list() when an exception
    occurs during display list rendering. The function accepts a caller-
    owned fz_pixmap pointer but incorrectly drops the pixmap in its error
    handling path before rethrowing the exception. Callers (including the
    barcode decoding path in fz_decode_barcode_from_display_list) also
    drop the same pixmap in cleanup, resulting in a double-free that can
    corrupt the heap and crash the process. This issue affects
    applications that enable and use MuPDF barcode decoding and can be
    triggered by processing crafted input that causes a rendering-time
    error while decoding barcodes.

For more information, see
  - https://www.cve.org/CVERecord?id=CVE-2026-25556
  - https://cgit.ghostscript.com/cgi-bin/cgit.cgi/mupdf.git/commit/?id=d4743b6092d513321c23c6f7fe5cff87cde043c1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...1-Fix-incorrect-error-case-free-of-pixmap.patch | 53 ++++++++++++++++++++++
 package/mupdf/mupdf.mk                             |  3 ++
 2 files changed, 56 insertions(+)

diff --git a/package/mupdf/0001-Fix-incorrect-error-case-free-of-pixmap.patch b/package/mupdf/0001-Fix-incorrect-error-case-free-of-pixmap.patch
new file mode 100644
index 0000000000..f78c429cef
--- /dev/null
+++ b/package/mupdf/0001-Fix-incorrect-error-case-free-of-pixmap.patch
@@ -0,0 +1,53 @@
+From d4743b6092d513321c23c6f7fe5cff87cde043c1 Mon Sep 17 00:00:00 2001
+From: Robin Watts <Robin.Watts@artifex.com>
+Date: Mon, 12 Jan 2026 19:08:56 +0000
+Subject: Bug 709029: Fix incorrect error-case free of pixmap.
+
+Don't free a pixmap we don't own!
+
+CVE: CVE-2026-25556
+Upstream: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/mupdf.git/commit/?id=d4743b6092d513321c23c6f7fe5cff87cde043c1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ source/fitz/util.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/source/fitz/util.c b/source/fitz/util.c
+index 7710124cc..90226a5c1 100644
+--- a/source/fitz/util.c
++++ b/source/fitz/util.c
+@@ -119,7 +119,15 @@ fz_new_pixmap_from_display_list_with_separations(fz_context *ctx, fz_display_lis
+ 	else
+ 		fz_clear_pixmap_with_value(ctx, pix, 0xFF);
+
+-	return fz_fill_pixmap_from_display_list(ctx, list, ctm, pix);
++	fz_try(ctx)
++		fz_fill_pixmap_from_display_list(ctx, list, ctm, pix);
++	fz_catch(ctx)
++	{
++		fz_drop_pixmap(ctx, pix);
++		fz_rethrow(ctx);
++	}
++
++	return pix;
+ }
+
+ fz_pixmap *
+@@ -136,14 +144,9 @@ fz_fill_pixmap_from_display_list(fz_context *ctx, fz_display_list *list, fz_matr
+ 		fz_close_device(ctx, dev);
+ 	}
+ 	fz_always(ctx)
+-	{
+ 		fz_drop_device(ctx, dev);
+-	}
+ 	fz_catch(ctx)
+-	{
+-		fz_drop_pixmap(ctx, pix);
+ 		fz_rethrow(ctx);
+-	}
+
+ 	return pix;
+ }
+--
+cgit v1.2.3
+
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index fe4f3e6756..c538b9bec8 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -27,6 +27,9 @@ MUPDF_IGNORE_CVES = \
 	CVE-2024-24258 \
 	CVE-2024-24259
 
+# 0001-Fix-incorrect-error-case-free-of-pixmap.patch
+MUPDF_IGNORE_CVES += CVE-2026-25556
+
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
 # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
 MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
