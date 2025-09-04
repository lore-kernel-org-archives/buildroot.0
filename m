Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E62BCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A2466067E;
	Thu,  4 Sep 2025 16:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNAzKk2NGkv7; Thu,  4 Sep 2025 16:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E5BC60634
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E5BC60634;
	Thu,  4 Sep 2025 16:33:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0368B106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A54E400A4
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZPvfdeQdRNT for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8298B4005F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8298B4005F
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7300F87E99; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:00:21 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: bea4423e13fea337e1cb145047bfc108d8e5667a
X-Git-Newrev: e75d6c44f7e0b7c185ef94d5a1f4741329f17d81
X-Patchwork-Hint: ignore
Message-Id: <20250904163334.7300F87E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libv4l: backport
 fix jpeg-v9x/gcc-14.x build
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4349992243956047234=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4349992243956047234==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e75d6c44f7e0b7c185ef94d5a1f4741329f17d81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This issue seems to caused by gcc-14 (added in 2024.05) which has
become the default version in 2025.08.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295052 (TestZbar)
https://autobuild.buildroot.org/results/e0f/e0fac4a10181139d975c627f22a55d6681547d33

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 37741586af7696985bff7ef398581681fe6e96b9)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...rt-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/package/libv4l/0002-libv4lconvert-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch b/package/libv4l/0002-libv4lconvert-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch
new file mode 100644
index 0000000000..298eaaf888
--- /dev/null
+++ b/package/libv4l/0002-libv4lconvert-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch
@@ -0,0 +1,83 @@
+From 9f0da8467183f9f647bddc4a5b4f01aad930846a Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 2 Sep 2024 15:59:53 +0200
+Subject: [PATCH] libv4lconvert: fix jpeg-v9x/gcc-14.x compile (jpeg_mem_dest
+ argument mismatch)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+- fix jpeg_mem_dest pointer arument mismatch (long unsigned int vs. size_t)
+  with jpeg-v9x/gcc-14.x 32-bit arm compile
+
+Fixes:
+
+  ../lib/libv4lconvert/jl2005bcd.c: In function ‘v4lconvert_decode_jl2005bcd’:
+  ../lib/libv4lconvert/jl2005bcd.c:94:46: error: passing argument 3 of ‘jpeg_mem_dest’ from incompatible pointer type [-Wincompatible-pointer-types]
+     94 |         jpeg_mem_dest (&cinfo, &jpeg_header, &jpeg_header_size);
+        |                                              ^~~~~~~~~~~~~~~~~
+        |                                              |
+        |                                              long unsigned int *
+  In file included from ../lib/libv4lconvert/libv4lconvert-priv.h:26,
+                   from ../lib/libv4lconvert/jl2005bcd.c:30:
+  .../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/jpeglib.h:979:28: note: expected ‘size_t *’ {aka ‘unsigned int *’} but argument is of type ‘long unsigned int *’
+    979 | EXTERN(void) jpeg_mem_dest JPP((j_compress_ptr cinfo,
+        |                            ^~~
+
+  ../lib/libv4lconvert/jpeg.c: In function ‘init_libjpeg_cinfo’:
+  ../lib/libv4lconvert/jpeg.c:157:45: error: passing argument 3 of ‘jpeg_mem_dest’ from incompatible pointer type [-Wincompatible-pointer-types]
+    157 |         jpeg_mem_dest(&cinfo, &jpeg_header, &jpeg_header_size);
+        |                                             ^~~~~~~~~~~~~~~~~
+        |                                             |
+        |                                             long unsigned int *
+  In file included from ../lib/libv4lconvert/libv4lconvert-priv.h:26,
+                   from ../lib/libv4lconvert/jpeg.c:21:
+  .../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/jpeglib.h:979:28: note: expected ‘size_t *’ {aka ‘unsigned int *’} but argument is of type ‘long unsigned int *’
+    979 | EXTERN(void) jpeg_mem_dest JPP((j_compress_ptr cinfo,
+        |                            ^~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
+Upstream: https://git.linuxtv.org/v4l-utils.git/commit/?id=e11e10ff7c8a4ef69526edd275c0ed92a450fbf3
+[Romain: backport to 1.28.1]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ lib/libv4lconvert/jl2005bcd.c | 4 ++++
+ lib/libv4lconvert/jpeg.c      | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/lib/libv4lconvert/jl2005bcd.c b/lib/libv4lconvert/jl2005bcd.c
+index 707c3205..14b040f3 100644
+--- a/lib/libv4lconvert/jl2005bcd.c
++++ b/lib/libv4lconvert/jl2005bcd.c
+@@ -63,7 +63,11 @@ int v4lconvert_decode_jl2005bcd(struct v4lconvert_data *data,
+ 	struct jpeg_decompress_struct dinfo;
+ 	struct jpeg_error_mgr jcerr, jderr;
+ 	JOCTET *jpeg_header = NULL;
++#if JPEG_LIB_VERSION >= 90
++	size_t jpeg_header_size = 0;
++#else
+ 	unsigned long jpeg_header_size = 0;
++#endif
+ 	int i, x, y, x1, y1, jpeg_data_size, jpeg_data_idx, eoi, size;
+ 
+ 	/* src_size had better be bigger than 16 */
+diff --git a/lib/libv4lconvert/jpeg.c b/lib/libv4lconvert/jpeg.c
+index ebfc8149..450d0967 100644
+--- a/lib/libv4lconvert/jpeg.c
++++ b/lib/libv4lconvert/jpeg.c
+@@ -136,7 +136,11 @@ static void init_libjpeg_cinfo(struct v4lconvert_data *data)
+ {
+ 	struct jpeg_compress_struct cinfo;
+ 	unsigned char *jpeg_header = NULL;
++#if JPEG_LIB_VERSION >= 90
++	size_t jpeg_header_size = 0;
++#else
+ 	unsigned long jpeg_header_size = 0;
++#endif
+ 
+ 	if (data->cinfo_initialized)
+ 		return;
+-- 
+2.50.1
+

--===============4349992243956047234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4349992243956047234==--
