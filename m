Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC471FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C70C684DE5;
	Fri, 24 Apr 2026 16:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jo1W4JtwT5a8; Fri, 24 Apr 2026 16:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 210A484E2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048729;
	bh=NXaUBoUx7fLEThdvzKHM7L3u2TwhEShgTjm2xPW6FbE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MvK7aLO0vtHi8zksMj+gUPIQKblGIM85jvMDHygGQFkWGR3j9ByOQRYKJQct1A4ET
	 nsRQeO28Osyuid7oB3XECASg3mluiVhwVJRGvWpN5fmFjLhE7G2cRvxae6tzw75H4v
	 I1lqIhZAMj9VYsLNYdb2iclqRPDivT9QGNyPzQ6A8zAjOx3Kn88/ZTHNZWozZ+CtUP
	 86jG4VyCJ3c+bAXZvKSLR5na2GXOe39CHGLfmdd3ibzFtWbUamiDMH2SK8irBfoKb2
	 YNSHLLaDiCQmfba9tsi0Mvj/HPx8R7NBLEfUleBd36SPdmqQSmoAzg+JKQkHWBS6oo
	 EpnpoOHyfaCbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 210A484E2A;
	Fri, 24 Apr 2026 16:38:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE5B2231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4380F423F1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id doqd-67wTxJb for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7E99423F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7E99423F0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 903E682AFA; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 14:26:25 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 7c9a398ebac9f5a50cc060c8cc582eb3c8746da3
X-Git-Newrev: e898ab668ff4aab151d53508fbdba513416d1ce1
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.903E682AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/ghostscript:
 security bump to version 10.07.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e898ab668ff4aab151d53508fbdba513416d1ce1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://ghostscript.readthedocs.io/en/gs10.07.0/News.html
"This release addresses CVEs: TBC (Two applied for)"

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6216be221fa2b9a5849ebbc894a5574a04b8017e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
