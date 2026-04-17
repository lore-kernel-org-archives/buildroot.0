Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B21F99C61
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 19:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC25D40D86;
	Fri, 17 Apr 2026 19:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGn7I8iUM6Gb; Fri, 17 Apr 2026 19:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D570B40F39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776455868;
	bh=WQxcnvPDtOdDgvjeqkCvobaNRCUTz2talir409qLcco=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QYin1oZCnWoqtpT/Rw9Yycb4so9/dJy9gT28SA7Tq4Wlql8M6ogwZ9UMgDCrDaiqg
	 kfO3Rysk2wDadk53HQMo3oMZGsozbWf6OF70sFMcp7WG6jWbKVkcLztzp6ltk9ZV2Y
	 f+q0vGWH5r31L/bgxgxM0E7NWLrwzKY/W5w8gGGzgGG1Gc7Xa29XXXca5fCbe+nkjU
	 zxbvNgEX9nyvZXLng3SxMQglrB+hoIqZ+TDT16dB7g06XugdjClH+n/iyPNIghAlZ9
	 FwqwpkvtV1dmiStQd2RnBvCrYZe2i9URbJoEJQzebnB2azXdHj/BoyvdXlRKvHNfoh
	 qc/vdGZq1AfqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D570B40F39;
	Fri, 17 Apr 2026 19:57:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1FF2396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B82C081E95
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZs0o4M0GdbP for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 19:57:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91C0F81E87
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91C0F81E87
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:57:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F68181E37; Fri, 17 Apr 2026 19:57:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 21:35:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2965d8af98ef9e881c8d76f076d44a9b68956674
X-Git-Newrev: 6216be221fa2b9a5849ebbc894a5574a04b8017e
X-Patchwork-Hint: ignore
Message-Id: <20260417195743.3F68181E37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: security bump to
 version 10.07.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6216be221fa2b9a5849ebbc894a5574a04b8017e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://ghostscript.readthedocs.io/en/gs10.07.0/News.html
"This release addresses CVEs: TBC (Two applied for)"

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ghostscript/0001-Fix-32-bit-build.patch | 63 -------------------------
 package/ghostscript/ghostscript.hash            |  4 +-
 package/ghostscript/ghostscript.mk              |  2 +-
 3 files changed, 3 insertions(+), 66 deletions(-)

diff --git a/package/ghostscript/0001-Fix-32-bit-build.patch b/package/ghostscript/0001-Fix-32-bit-build.patch
deleted file mode 100644
index 648e235d3b..0000000000
--- a/package/ghostscript/0001-Fix-32-bit-build.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f Mon Sep 17 00:00:00 2001
-From: Ken Sharp <Ken.Sharp@artifex.com>
-Date: Wed, 10 Sep 2025 08:55:30 +0100
-Subject: [PATCH] Fix 32-bit build
-
-Bug #708824 "ghostscript 10.06.0 compilation failure on 32-bit archs"
-
-nbytes shiouldn't be an intptr_t, it doesn't get used for pointer
-arithmetic. Previously it was a uint, should be a int64_t, to fit with
-all the other devices.
-
-Checked other warnings, and found a (very minor) one in gdevdbit.c, fix
-that while we're here (signed/unsigned mismatch, we don't really care).
-
-Upstream: https://github.com/ArtifexSoftware/ghostpdl/commit/3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f
-
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- base/gdevdbit.c | 2 +-
- base/gdevmpla.c | 6 +++---
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/base/gdevdbit.c b/base/gdevdbit.c
-index e07cc3f3b8..1b5c69325b 100644
---- a/base/gdevdbit.c
-+++ b/base/gdevdbit.c
-@@ -191,7 +191,7 @@ gx_default_copy_alpha_hl_color(gx_device * dev, const byte * data, int data_x,
-     fit_copy(dev, data, data_x, raster, id, x, y, width, height);
-     row_alpha = data;
-     out_raster = bitmap_raster(width * (size_t)byte_depth);
--    if (check_64bit_multiply(out_raster, ncomps, &product) != 0)
-+    if (check_64bit_multiply(out_raster, ncomps, (int64_t *) &product) != 0)
-         return gs_note_error(gs_error_undefinedresult);
-     gb_buff = gs_alloc_bytes(mem, product, "copy_alpha_hl_color(gb_buff)");
-     if (gb_buff == 0) {
-diff --git a/base/gdevmpla.c b/base/gdevmpla.c
-index 2f0d522561..ffc5ff42e6 100644
---- a/base/gdevmpla.c
-+++ b/base/gdevmpla.c
-@@ -1954,12 +1954,12 @@ mem_planar_strip_copy_rop2(gx_device * dev,
-         int i;
-         int j;
-         intptr_t chunky_sraster;
--        intptr_t nbytes;
-+        int64_t nbytes;
-         byte **line_ptrs;
-         byte *sbuf, *buf;
- 
-         chunky_sraster = sraster * (intptr_t)mdev->num_planar_planes;
--        if (check_64bit_multiply(height, chunky_sraster, (size_t *)&nbytes) != 0)
-+        if (check_64bit_multiply(height, chunky_sraster, &nbytes) != 0)
-             return gs_note_error(gs_error_undefinedresult);
-         buf = gs_alloc_bytes(mdev->memory, nbytes, "mem_planar_strip_copy_rop(buf)");
-         if (buf == NULL) {
-@@ -2003,7 +2003,7 @@ mem_planar_strip_copy_rop2(gx_device * dev,
-         intptr_t i;
-         intptr_t chunky_t_raster;
-         int chunky_t_height;
--        intptr_t nbytes;
-+        int64_t nbytes;
-         byte **line_ptrs;
-         byte *tbuf, *buf;
-         gx_strip_bitmap newtex;
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index e50113ecfe..c2e48b01e6 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10060/SHA512SUMS
-sha512  e9efa6a334cf34703f565f5043dd794452270415b34c2bea260e9dac6c72ebbcbedfa2e4cb9029841f8f582bbce91be8160e135a190081f3262bcf04417f80f1  ghostscript-10.06.0.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10070/SHA512SUMS
+sha512  1c2a14951223c975a53bd9767c28bd3a6e420c385a5e0d7a60a5ff5b091bc027929c815bf57cddf97611e8d265ece1c219321737f2cabb5646685c6e8cdb85c9  ghostscript-10.07.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 1fc850ad20..159e06db91 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.06.0
+GHOSTSCRIPT_VERSION = 10.07.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
