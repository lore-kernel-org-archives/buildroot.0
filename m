Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433B5CD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEE288394A;
	Fri, 12 Jun 2026 16:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O37DiEHMYSnz; Fri, 12 Jun 2026 16:31:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC7A483300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781281870;
	bh=CwfqnkPRyVPxJwA2G2Fw8lqbBuGMNkurEkcXSUBusDg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TOXTXe9FclFkZtn8HG3fZGYrAKZL8LQNerIBZEVqSRTydOIqPx6907h6fGRPfZTId
	 rlWHGzGYotC7rqb4I+ybrC66NVfYGVSIfERekR7L1OTrmZbdpfqu89ta4yAhMmwEM1
	 k2ZbXDqR7/1GHWp4x/ljDqWtegTT6BI/0ZSi02frzTrC4AwrXw3ESkc8Pz5MzCv94w
	 LbMUt30MdVh7h8Uq2Q/QC3qWXfeIfkb74Fet3fQFhnR3Nm9lJmVZERSbnDtj2V48yS
	 Kx/c8cAMwz6PLzK4lfa/T6WL4tJKABeMPwv0Gt0IcOvlZ8A/xBv1Gh6GQ9wFhHvTvM
	 +i19BEcamjKmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC7A483300;
	Fri, 12 Jun 2026 16:31:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 176B0F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08F5A40711
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDxk7C2TcGBO for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA4B24070C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA4B24070C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:31:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79CAF8810D; Fri, 12 Jun 2026 16:30:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 18:29:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef2c002141e1beda2c648c049c60c5504ae1920e
X-Git-Newrev: 8b05934511aba4f0323b03548faae6ddc29f941a
X-Patchwork-Hint: ignore
Message-Id: <20260612163049.79CAF8810D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgphoto2: bump to version 2.5.34
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b05934511aba4f0323b03548faae6ddc29f941a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The removed patch has been merged.

Release notes:
https://github.com/gphoto/libgphoto2/releases/tag/v2.5.34

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...checks-for-the-size-type-of-jpeg_mem_dest.patch | 143 ---------------------
 package/libgphoto2/libgphoto2.hash                 |   2 +-
 package/libgphoto2/libgphoto2.mk                   |   2 +-
 3 files changed, 2 insertions(+), 145 deletions(-)

diff --git a/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch b/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
deleted file mode 100644
index 543678181b..0000000000
--- a/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From ca4441f48117c681cecfb3c883115e0546aed985 Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Sun, 29 Mar 2026 21:31:49 +0200
-Subject: [PATCH] autoconf checks for the size type of jpeg_mem_dest
-
-fixes https://github.com/gphoto/libgphoto2/pull/1176
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://github.com/gphoto/libgphoto2/commit/ca4441f48117c681cecfb3c883115e0546aed985
----
- camlibs/ax203/ax203.c                   |  2 +-
- camlibs/ax203/ax203_compress_jpeg.c     |  2 +-
- camlibs/ax203/jpeg_memsrcdest.h         |  2 ++
- camlibs/jl2005c/jl2005bcd_decompress.c  |  2 +-
- camlibs/jl2005c/jpeg_memsrcdest.h       |  2 ++
- camlibs/ptp2/chdk.c                     |  2 +-
- libgphoto2_port/gphoto-m4/gp-libjpeg.m4 | 32 +++++++++++++++++++++++++
- 7 files changed, 40 insertions(+), 4 deletions(-)
-
-diff --git a/camlibs/ax203/ax203.c b/camlibs/ax203/ax203.c
-index 62f572686c44..b9db8ebdabf1 100644
---- a/camlibs/ax203/ax203.c
-+++ b/camlibs/ax203/ax203.c
-@@ -1202,7 +1202,7 @@ ax203_encode_image(Camera *camera, int **src, char *dest, unsigned int dest_size
- 	struct jpeg_compress_struct cinfo;
- 	struct jpeg_error_mgr jcerr;
- 	JOCTET *jpeg_dest = NULL;
--	unsigned long jpeg_size = 0;
-+	JPEG_SIZE jpeg_size = 0;
- 	JSAMPLE row[camera->pl->width * 3];
- 	JSAMPROW row_pointer[1] = { row };
- #endif
-diff --git a/camlibs/ax203/ax203_compress_jpeg.c b/camlibs/ax203/ax203_compress_jpeg.c
-index 1ec7534ff484..22068afd79c0 100644
---- a/camlibs/ax203/ax203_compress_jpeg.c
-+++ b/camlibs/ax203/ax203_compress_jpeg.c
-@@ -124,7 +124,7 @@ ax206_compress_jpeg(Camera *camera, int **in, uint8_t *outbuf, int out_size,
- 	jvirt_barray_ptr *in_coefficients;
- 	unsigned int i, x, y;
- 	int stop, size, ret, outc;
--	unsigned long regular_jpeg_size = 0, buf_size = 0;
-+	JPEG_SIZE regular_jpeg_size = 0, buf_size = 0;
- 	int last_dc_val[3] = { 0, 0, 0 };
- 
- 	/* We have a rgb24bit image in the desired dimensions, first we
-diff --git a/camlibs/ax203/jpeg_memsrcdest.h b/camlibs/ax203/jpeg_memsrcdest.h
-index 674ab7128f8e..22ba2ac1e2c7 100644
---- a/camlibs/ax203/jpeg_memsrcdest.h
-+++ b/camlibs/ax203/jpeg_memsrcdest.h
-@@ -5,6 +5,8 @@
- 
- #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
- 
-+#define JPEG_SIZE unsigned long
-+
- void
- jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
- 	unsigned long bufsize);
-diff --git a/camlibs/jl2005c/jl2005bcd_decompress.c b/camlibs/jl2005c/jl2005bcd_decompress.c
-index dff2d6264025..8c3307fd6098 100644
---- a/camlibs/jl2005c/jl2005bcd_decompress.c
-+++ b/camlibs/jl2005c/jl2005bcd_decompress.c
-@@ -85,7 +85,7 @@ jl2005bcd_decompress (unsigned char *output, unsigned char *input,
- 	struct jpeg_error_mgr jcerr, jderr;
- 	JOCTET *jpeg_header = NULL;
- 	int outputsize = 0;
--	unsigned long jpeg_header_size = 0;
-+	JPEG_SIZE jpeg_header_size = 0;
- 	int i, x, y, x1, y1, jpeg_data_size, jpeg_data_idx, eoi, size, ret;
- 	JSAMPLE green[8 * 16];
- 	JSAMPLE red[8 * 8];
-diff --git a/camlibs/jl2005c/jpeg_memsrcdest.h b/camlibs/jl2005c/jpeg_memsrcdest.h
-index 4334e099688a..94fca070d05b 100644
---- a/camlibs/jl2005c/jpeg_memsrcdest.h
-+++ b/camlibs/jl2005c/jpeg_memsrcdest.h
-@@ -5,6 +5,8 @@
- 
- #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
- 
-+#define JPEG_SIZE unsigned long
-+
- void
- jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
- 	unsigned long bufsize);
-diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
-index 2787a7261c4a..2646c3ba0fb1 100644
---- a/camlibs/ptp2/chdk.c
-+++ b/camlibs/ptp2/chdk.c
-@@ -1145,7 +1145,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
- 	struct		jpeg_error_mgr jerr;
- 	JSAMPROW	row_ptr[1];
- 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
--	unsigned long	outlen = 0;
-+	JPEG_SIZE	outlen = 0;
- 	unsigned int	row_inc;
- 	int		sshift, dshift, xshift, skip;
- 
-diff --git a/libgphoto2_port/gphoto-m4/gp-libjpeg.m4 b/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
-index ce9e816fdbce..4870882a686d 100644
---- a/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
-+++ b/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
-@@ -77,6 +77,38 @@ found and made to work.
-     GP_CONFIG_MSG([JPEG mangling support],
-                   [${have_libjpeg}])
-   ])
-+  dnl find type of memdest
-+  AC_LANG_PUSH([C])
-+
-+  AC_MSG_CHECKING([type of jpeg_mem_dest size])
-+  AC_COMPILE_IFELSE([
-+    #include <stdio.h>
-+    #include <unistd.h>
-+    #include <jpeglib.h>
-+    void f(j_compress_ptr cinfo, unsigned char ** outbuffer, unsigned long * outsize) {
-+	    jpeg_mem_dest(cinfo, outbuffer, outsize);
-+    }
-+  ],[
-+     AC_MSG_RESULT([unsigned long*])
-+     AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
-+  ],[
-+     AC_COMPILE_IFELSE([
-+    #include <stdio.h>
-+    #include <unistd.h>
-+    #include <jpeglib.h>
-+    void f(j_compress_ptr cinfo, unsigned char ** outbuffer, size_t * outsize) {
-+	    jpeg_mem_dest(cinfo, outbuffer, outsize);
-+    }
-+    ],[
-+     AC_MSG_RESULT([size_t*])
-+     AC_DEFINE([JPEG_SIZE],[size_t], "JPEG memdest size type")
-+    ],[
-+     AC_MSG_RESULT([unknown, using unsigned long*])
-+     AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
-+    ])
-+  ]
-+  )
-+  AC_LANG_POP([C])
- ],
- [AC_MSG_ERROR([
- Unhandled value given to --with-jpeg: ${with_jpeg}
--- 
-2.43.0
-
diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
index c2ff672613..6a5010da4f 100644
--- a/package/libgphoto2/libgphoto2.hash
+++ b/package/libgphoto2/libgphoto2.hash
@@ -1,3 +1,3 @@
 # Locally calculated hash
-sha256  28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2  libgphoto2-2.5.33.tar.xz
+sha256  51993f5d9bfb6b4e5925cbbe5883085791bff6f81bcacb8ffe1b783ce76d586a  libgphoto2-2.5.34.tar.xz
 sha256  530128f45fc02d92d4dae04d9c1e1f28a078a9b0d32c0ab254c406ba8fba43ec  COPYING
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index 4265d1c57e..a639245c25 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPHOTO2_VERSION = 2.5.33
+LIBGPHOTO2_VERSION = 2.5.34
 LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
 LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
