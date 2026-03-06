Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B70FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D13D6145D;
	Fri,  6 Mar 2026 19:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rED_uxhZhTwu; Fri,  6 Mar 2026 19:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DDA061462
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826771;
	bh=6+6l6S13BXSUrDFMr82u8tvw0xVox01CckUP/3Cxts4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VH0gSeQ5OxJNDdP8TwufToZesIGRFl2yohgs6RQcXa7WGp2dxqDwb/Rr8vGF6kvCM
	 cNUbTM0Cnf/e9GT6C/TLEi6kjZrY3jHcf6jXYCt4nTuYh+3Ik+UyxJNIJxLbo/eAiM
	 NcQ5lx3C0kWGeu2gwmQROEgBoXWVL0GH+O+YezYalpue/Iy/3vQ/a7Yl4y6yzuIy8C
	 ohI0nKiya/kRm3aMcxjgLL3CmZt/YNn0fGA0ndvgAqu4U9A9/MZdMsR6DLNXJBvoeW
	 BbSsLoVoa4RPJGfniAIFbB99kfE4LpksOywXHJ2gMBzuVtoJH+89Wc2c4kWLksoLUG
	 APUMs7UEHQQPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DDA061462;
	Fri,  6 Mar 2026 19:52:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C55223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A30F983BB9
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKWQ-kVued85 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B665E82FE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B665E82FE7
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC2947FB67; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:02:36 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bb4cb7b5a4860f91d0411b69bc9eae75d1b9db38
X-Git-Newrev: ce7a47f3d9581bbfd634517243e2cf327e5028dc
X-Patchwork-Hint: ignore
Message-Id: <20260306195222.CC2947FB67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mupdf: add patch
 for CVE-2026-25556
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce7a47f3d9581bbfd634517243e2cf327e5028dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 3f4e289aab9c2aa113d05589ba6b83778e60a0f3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index 6fdbf59f05..f209cafef2 100644
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
