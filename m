Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344A1CCD18A
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07DAE612FF;
	Thu,  9 Oct 2025 10:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d52bW4M73jJu; Thu,  9 Oct 2025 10:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5583612A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5583612A9;
	Thu,  9 Oct 2025 10:16:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E0639DA
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7834F83C2F
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L24XEQF6Bklp for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A0FC83C2D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A0FC83C2D
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1531A86E17; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:32:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3da3cee8fea00b2df50efca2539557308012092d
X-Git-Newrev: dc2fc7aebc0bf980640ac496e7ab8a4b12af679f
X-Patchwork-Hint: ignore
Message-Id: <20251009101600.1531A86E17@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ghostscript:
 security bump to v10.06.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc2fc7aebc0bf980640ac496e7ab8a4b12af679f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For release note, see:
https://ghostscript.readthedocs.io/en/gs10.06.0/News.html

This fixes the following vulnerabilities:
- CVE-2025-59798:
    Artifex Ghostscript through 10.05.1 has a stack-based buffer overflow
    in pdf_write_cmap in devices/vector/gdevpdtw.c.
    https://www.cve.org/CVERecord?id=CVE-2025-59798

- CVE-2025-59799:
    Artifex Ghostscript through 10.05.1 has a stack-based buffer overflow
    in pdfmark_coerce_dest in devices/vector/gdevpdfm.c via a large size
    value.
    https://www.cve.org/CVERecord?id=CVE-2025-59799

- CVE-2025-59800:
    In Artifex Ghostscript through 10.05.1, ocr_begin_page in
    devices/gdevpdfocr.c has an integer overflow that leads to a heap-
    based buffer overflow in ocr_line8.
    https://www.cve.org/CVERecord?id=CVE-2025-59800

- CVE-2025-59801:
    In Artifex GhostXPS before 10.06.0, there is a stack-based buffer
    overflow in xps_unpredict_tiff in xpstiff.c because the
    samplesperpixel value is not checked.
    https://www.cve.org/CVERecord?id=CVE-2025-59801

Also remove patch that is now applied upstream, and add new patch from
upstream to fix a compilation issue on 32bits platforms

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien:
 - add link to release note in commit log
 - fix URL in hash file comment
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6f984089c0ff103fca50617c9fa033eaadf61e51)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ghostscript/0001-Fix-32-bit-build.patch    | 63 ++++++++++++++++++++++
 ...0001-Fix-compatibility-with-C23-compilers.patch | 36 -------------
 package/ghostscript/ghostscript.hash               |  4 +-
 package/ghostscript/ghostscript.mk                 |  2 +-
 4 files changed, 66 insertions(+), 39 deletions(-)

diff --git a/package/ghostscript/0001-Fix-32-bit-build.patch b/package/ghostscript/0001-Fix-32-bit-build.patch
new file mode 100644
index 0000000000..648e235d3b
--- /dev/null
+++ b/package/ghostscript/0001-Fix-32-bit-build.patch
@@ -0,0 +1,63 @@
+From 3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Wed, 10 Sep 2025 08:55:30 +0100
+Subject: [PATCH] Fix 32-bit build
+
+Bug #708824 "ghostscript 10.06.0 compilation failure on 32-bit archs"
+
+nbytes shiouldn't be an intptr_t, it doesn't get used for pointer
+arithmetic. Previously it was a uint, should be a int64_t, to fit with
+all the other devices.
+
+Checked other warnings, and found a (very minor) one in gdevdbit.c, fix
+that while we're here (signed/unsigned mismatch, we don't really care).
+
+Upstream: https://github.com/ArtifexSoftware/ghostpdl/commit/3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ base/gdevdbit.c | 2 +-
+ base/gdevmpla.c | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/base/gdevdbit.c b/base/gdevdbit.c
+index e07cc3f3b8..1b5c69325b 100644
+--- a/base/gdevdbit.c
++++ b/base/gdevdbit.c
+@@ -191,7 +191,7 @@ gx_default_copy_alpha_hl_color(gx_device * dev, const byte * data, int data_x,
+     fit_copy(dev, data, data_x, raster, id, x, y, width, height);
+     row_alpha = data;
+     out_raster = bitmap_raster(width * (size_t)byte_depth);
+-    if (check_64bit_multiply(out_raster, ncomps, &product) != 0)
++    if (check_64bit_multiply(out_raster, ncomps, (int64_t *) &product) != 0)
+         return gs_note_error(gs_error_undefinedresult);
+     gb_buff = gs_alloc_bytes(mem, product, "copy_alpha_hl_color(gb_buff)");
+     if (gb_buff == 0) {
+diff --git a/base/gdevmpla.c b/base/gdevmpla.c
+index 2f0d522561..ffc5ff42e6 100644
+--- a/base/gdevmpla.c
++++ b/base/gdevmpla.c
+@@ -1954,12 +1954,12 @@ mem_planar_strip_copy_rop2(gx_device * dev,
+         int i;
+         int j;
+         intptr_t chunky_sraster;
+-        intptr_t nbytes;
++        int64_t nbytes;
+         byte **line_ptrs;
+         byte *sbuf, *buf;
+ 
+         chunky_sraster = sraster * (intptr_t)mdev->num_planar_planes;
+-        if (check_64bit_multiply(height, chunky_sraster, (size_t *)&nbytes) != 0)
++        if (check_64bit_multiply(height, chunky_sraster, &nbytes) != 0)
+             return gs_note_error(gs_error_undefinedresult);
+         buf = gs_alloc_bytes(mdev->memory, nbytes, "mem_planar_strip_copy_rop(buf)");
+         if (buf == NULL) {
+@@ -2003,7 +2003,7 @@ mem_planar_strip_copy_rop2(gx_device * dev,
+         intptr_t i;
+         intptr_t chunky_t_raster;
+         int chunky_t_height;
+-        intptr_t nbytes;
++        int64_t nbytes;
+         byte **line_ptrs;
+         byte *tbuf, *buf;
+         gx_strip_bitmap newtex;
diff --git a/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch b/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
deleted file mode 100644
index 0dfca9cfa2..0000000000
--- a/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ae940946473ceb8c5353bc6e7f04673c6e60502d Mon Sep 17 00:00:00 2001
-From: Alex Cherepanov <alex@coscript.biz>
-Date: Thu, 3 Apr 2025 17:19:41 +0100
-Subject: Bug 708160: Fix compatibility with C23 compilers
-
-Upstream: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ae940946473ceb8c5353bc6e7f04673c6e60502d
-[thomas: Only backport the bool typedef condition]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- base/stdpre.h              |  6 ++++--
- 1 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/base/stdpre.h b/base/stdpre.h
-index dda30b6a4..2f9c84e0d 100644
---- a/base/stdpre.h
-+++ b/base/stdpre.h
-@@ -1,4 +1,4 @@
--/* Copyright (C) 2001-2023 Artifex Software, Inc.
-+/* Copyright (C) 2001-2025 Artifex Software, Inc.
-    All Rights Reserved.
-
-    This software is provided AS-IS with no warranty, either express or
-@@ -341,7 +341,9 @@ typedef signed char schar;
-  * and the MetroWerks C++ compiler insists that bool be equivalent to
-  * unsigned char.
-  */
--#ifndef __cplusplus
-+
-+/* C23 has bool as a builtin type. */
-+#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
- #ifdef __BEOS__
- typedef unsigned char bool;
- #else
---
-cgit v1.2.3
-
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index c434ac1f3a..e50113ecfe 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10051/SHA512SUMS
-sha512  1a3f2b0f53db9a00a245df19ce8fdce0fbccc6fad47b64d14fc9058b494ab07c77e21bb073df8d4a2522b3ccb0df26735f8224a9e36c07367031ed2262fb26af  ghostscript-10.05.1.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10060/SHA512SUMS
+sha512  e9efa6a334cf34703f565f5043dd794452270415b34c2bea260e9dac6c72ebbcbedfa2e4cb9029841f8f582bbce91be8160e135a190081f3262bcf04417f80f1  ghostscript-10.06.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index c9d13f5545..1fc850ad20 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.05.1
+GHOSTSCRIPT_VERSION = 10.06.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
