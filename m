Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4326CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9864C85643;
	Tue,  9 Jun 2026 13:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UClOoXQc51kK; Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E16168561A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010104;
	bh=YBNkquIWqEb90YAlH3FAtQ//t/Fh94kE4+MB9l8Ud9Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H6nZbVD2UNUKn5g2KfthQDlNUCGeX8xBt/yraW5CywApR0Gc0BKvgJyB6M1iXqtKc
	 9bkxB8lTOxsjblkPQI6l8daVlrtgvPmJB4DAlXXNz6VsL/Zt1FjKziis2WcdFVn8WX
	 cxeJm39silbiHL6tPmtmPUQIFAVVjS4vVZN4Ifbvh4CiXTf1QR/5KSnVvgswy0qeID
	 OxJNcBgNZbNUVbFmnp4K4TjSq5ZErfopDY0LPqVAtjxtpcFgPMkR6fmlM/WxYnklED
	 XALNb9G+2rJ+LgnncTOWQwTZTIO4X2j02yDXS1bpgnSym577fCZ/j6z/hDxRw2y237
	 SNjYmRfByQRsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E16168561A;
	Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 585BB190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D34140DA8
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWuJls53_8wf for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EF4A4103D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EF4A4103D
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A3CA87E7E; Tue,  9 Jun 2026 13:01:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:39:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b335d2237cc154f15f45ba5641557c0a59e9a9aa
X-Git-Newrev: b77485f2016908b14e4e6f9721801abcf57c2bf4
X-Patchwork-Hint: ignore
Message-Id: <20260609130107.8A3CA87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libv4l: bump version to 1.32.0
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
Content-Type: multipart/mixed; boundary="===============5657952097489566378=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5657952097489566378==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b77485f2016908b14e4e6f9721801abcf57c2bf4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=v4l-utils-1.32.0

Removed patches which are included in this release.

Updated license hashes due to upstream commit
https://git.linuxtv.org/v4l-utils.git/diff/?h=v4l-utils-1.32.0&id=dc81a361e22ce71a454ad63a6ede725b97cc26ce

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...1-meson.build-fix-arm-_TIME_BITS-64-error.patch | 37 ----------
 ...rt-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch | 83 ----------------------
 package/libv4l/libv4l.hash                         |  8 +--
 package/libv4l/libv4l.mk                           |  2 +-
 4 files changed, 5 insertions(+), 125 deletions(-)

diff --git a/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch b/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch
deleted file mode 100644
index 43fe9b2721..0000000000
--- a/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6faf5e963eadeab8b7d47d5b3c14f06e0ae1da01 Mon Sep 17 00:00:00 2001
-From: Hans Verkuil <hverkuil@xs4all.nl>
-Date: Sat, 12 Apr 2025 12:30:13 +0200
-Subject: [PATCH] meson.build: fix arm _TIME_BITS=64 error
-
-Undefine _TIME_BITS to avoid this error on 32-bit arm:
-
-/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
-
-Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
-Upstream: https://git.linuxtv.org/v4l-utils.git/commit/?id=d517cfdcdc16533ab7e06e97c07ca089cf261aef
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- meson.build | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 269a9da7..31927cda 100644
---- a/meson.build
-+++ b/meson.build
-@@ -53,8 +53,12 @@ v4l2_wrapper_args = [
-     # As the library needs to provide both 32-bit and 64-bit versions
-     # of file operations, disable transparent large file support (fixes
-     # 'Error: symbol `open64/mmap64' is already defined' compile failure
--    # otherwise)
-+    # otherwise).
-+    #
-+    # Also disable _TIME_BITS=64 since this is allowed only with
-+    # _FILE_OFFSET_BITS=64, which is now 32.
-     '-U_FILE_OFFSET_BITS',
-+    '-U_TIME_BITS',
-     '-D_FILE_OFFSET_BITS=32',
-     '-D_LARGEFILE64_SOURCE',
- ]
--- 
-2.49.0
-
diff --git a/package/libv4l/0002-libv4lconvert-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch b/package/libv4l/0002-libv4lconvert-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch
deleted file mode 100644
index 298eaaf888..0000000000
--- a/package/libv4l/0002-libv4lconvert-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 9f0da8467183f9f647bddc4a5b4f01aad930846a Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 2 Sep 2024 15:59:53 +0200
-Subject: [PATCH] libv4lconvert: fix jpeg-v9x/gcc-14.x compile (jpeg_mem_dest
- argument mismatch)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-- fix jpeg_mem_dest pointer arument mismatch (long unsigned int vs. size_t)
-  with jpeg-v9x/gcc-14.x 32-bit arm compile
-
-Fixes:
-
-  ../lib/libv4lconvert/jl2005bcd.c: In function ‘v4lconvert_decode_jl2005bcd’:
-  ../lib/libv4lconvert/jl2005bcd.c:94:46: error: passing argument 3 of ‘jpeg_mem_dest’ from incompatible pointer type [-Wincompatible-pointer-types]
-     94 |         jpeg_mem_dest (&cinfo, &jpeg_header, &jpeg_header_size);
-        |                                              ^~~~~~~~~~~~~~~~~
-        |                                              |
-        |                                              long unsigned int *
-  In file included from ../lib/libv4lconvert/libv4lconvert-priv.h:26,
-                   from ../lib/libv4lconvert/jl2005bcd.c:30:
-  .../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/jpeglib.h:979:28: note: expected ‘size_t *’ {aka ‘unsigned int *’} but argument is of type ‘long unsigned int *’
-    979 | EXTERN(void) jpeg_mem_dest JPP((j_compress_ptr cinfo,
-        |                            ^~~
-
-  ../lib/libv4lconvert/jpeg.c: In function ‘init_libjpeg_cinfo’:
-  ../lib/libv4lconvert/jpeg.c:157:45: error: passing argument 3 of ‘jpeg_mem_dest’ from incompatible pointer type [-Wincompatible-pointer-types]
-    157 |         jpeg_mem_dest(&cinfo, &jpeg_header, &jpeg_header_size);
-        |                                             ^~~~~~~~~~~~~~~~~
-        |                                             |
-        |                                             long unsigned int *
-  In file included from ../lib/libv4lconvert/libv4lconvert-priv.h:26,
-                   from ../lib/libv4lconvert/jpeg.c:21:
-  .../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/jpeglib.h:979:28: note: expected ‘size_t *’ {aka ‘unsigned int *’} but argument is of type ‘long unsigned int *’
-    979 | EXTERN(void) jpeg_mem_dest JPP((j_compress_ptr cinfo,
-        |                            ^~~
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
-Upstream: https://git.linuxtv.org/v4l-utils.git/commit/?id=e11e10ff7c8a4ef69526edd275c0ed92a450fbf3
-[Romain: backport to 1.28.1]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- lib/libv4lconvert/jl2005bcd.c | 4 ++++
- lib/libv4lconvert/jpeg.c      | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/lib/libv4lconvert/jl2005bcd.c b/lib/libv4lconvert/jl2005bcd.c
-index 707c3205..14b040f3 100644
---- a/lib/libv4lconvert/jl2005bcd.c
-+++ b/lib/libv4lconvert/jl2005bcd.c
-@@ -63,7 +63,11 @@ int v4lconvert_decode_jl2005bcd(struct v4lconvert_data *data,
- 	struct jpeg_decompress_struct dinfo;
- 	struct jpeg_error_mgr jcerr, jderr;
- 	JOCTET *jpeg_header = NULL;
-+#if JPEG_LIB_VERSION >= 90
-+	size_t jpeg_header_size = 0;
-+#else
- 	unsigned long jpeg_header_size = 0;
-+#endif
- 	int i, x, y, x1, y1, jpeg_data_size, jpeg_data_idx, eoi, size;
- 
- 	/* src_size had better be bigger than 16 */
-diff --git a/lib/libv4lconvert/jpeg.c b/lib/libv4lconvert/jpeg.c
-index ebfc8149..450d0967 100644
---- a/lib/libv4lconvert/jpeg.c
-+++ b/lib/libv4lconvert/jpeg.c
-@@ -136,7 +136,11 @@ static void init_libjpeg_cinfo(struct v4lconvert_data *data)
- {
- 	struct jpeg_compress_struct cinfo;
- 	unsigned char *jpeg_header = NULL;
-+#if JPEG_LIB_VERSION >= 90
-+	size_t jpeg_header_size = 0;
-+#else
- 	unsigned long jpeg_header_size = 0;
-+#endif
- 
- 	if (data->cinfo_initialized)
- 		return;
--- 
-2.50.1
-
diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 0c8ea1010b..5c3f11b068 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,9 +1,9 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.28.1.tar.xz.asc
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.32.0.tar.xz.asc
 # with key 05D0169C26E41593418129DF199A64FADFB500FF
-sha256  0fa075ce59b6618847af6ea191b6155565ccaa44de0504581ddfed795a328a82  v4l-utils-1.28.1.tar.xz
+sha256  6828828a17775526eb93fb258a9294d1d1073d633c344dd71ecd4e7a1ffb7dfc  v4l-utils-1.32.0.tar.xz
 
 # Locally calculated
-sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
-sha256  5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
+sha256  ef79a4373399a83c4ed8ee96af23824a8f4fabc9e48470c06d7f2194f4a74fce  COPYING
+sha256  6db18e1c5b47fd0b84a9ddf763cebae7bf6b9c56f1a1eeceae76a157ed9cd26e  COPYING.libv4l
 sha256  34229b5aadfb768d0d083987cba54203a920904a3ec8320823c6125b9831acd1  lib/libv4l1/libv4l1-kernelcode-license.txt
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index a535b8e8a6..a70cec79d3 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.28.1
+LIBV4L_VERSION = 1.32.0
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.xz
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES

--===============5657952097489566378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5657952097489566378==--
