Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933FBC53209
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 22:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6443406CE;
	Sun, 26 Jul 2026 22:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFR-tmA4GQ_0; Sun, 26 Jul 2026 22:38:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1551240603
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785105487;
	bh=xt7QRYXNQDNdT2pgJIE+nwoKIz2auAXoZ+IC+Qaf8Ek=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Td3pm6z/2H7aLLAk9TE3qNBE3WCTKanXX9fMMYlhaBgdZOlIqdEA+5DegMjhINl5O
	 qMSF0zfPIlXGDHbIYv3Q8Fv0E7t35Xclyr5UzJANQPSRnPopyzIYG0vQQ2iYgPdIG5
	 tidUYHCzvF0dZYlLZV7UZ0FMs7ISooXT0d2kTL0xEAaxSBpmkc+tl5w5Kocg3xA/nW
	 py9zx/JsSZNIMABDvn823hjLON4SJ6PlSXQ+MU3nYroMw4lapxQoLPtU7EXpfTAuNN
	 xt3YCDiSS0MVRIe7S5RQnhZOq8xOpvF9e9M5SoeXGSezuz4dvqwf4483lnV56mYUHt
	 jTfeaDXUWJIJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1551240603;
	Sun, 26 Jul 2026 22:38:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 163BE3B1
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 22:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E775F40603
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 22:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dozJZ1dj1fg for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 22:38:03 +0000 (UTC)
X-Greylist: delayed 2433 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 26 Jul 2026 22:38:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B47B405E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B47B405E5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=93.91.132.248;
 helo=mail.gnudd.com; envelope-from=rubini@arcana.gnudd.com;
 receiver=<UNKNOWN> 
Received: from mail.gnudd.com (mail.gnudd.com [93.91.132.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B47B405E5
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 22:38:02 +0000 (UTC)
Received: from rubini by mail.gnudd.com with local (Exim 4.94.2)
 (envelope-from <rubini@arcana.gnudd.com>) id 1wo6qc-0004gL-CY
 for buildroot@buildroot.org; Sun, 26 Jul 2026 23:57:26 +0200
Date: Sun, 26 Jul 2026 23:57:26 +0200
From: Alessandro Rubini <rubini@gnudd.com>
To: buildroot@buildroot.org
Message-ID: <amaCxq1lFi8rsIyJ@arcana.i.gnudd.com>
MIME-Version: 1.0
Content-Disposition: inline
Organization: GnuDD, Device Drivers, Embedded Systems, Courses
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=gnudd.com
Subject: [Buildroot] [PATCH] package/jpeg-turbo: fix aarch64 build using an
 upstream patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is 3.2.0-8-g0da22762 in the original jpeg-turbo package,
where the committer claims they can't reproduce the problem. Buildroot
is currently using version 3.2.0 of the package.

The build issue I esperience with an aarch64 build (cm4 custom baseboard)
is the following:

   spng.c:(.text+0x4d8c): undefined reference to `__fpclassifyf'

The patch actually fixes it.

Signed-off-by: Alessandro Rubini <rubini@gnudd.com>
---
 ...-Really-remove-gamma-correction-code.patch | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch

diff --git a/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch b/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch
new file mode 100644
index 0000000000..5dcd95d0b9
--- /dev/null
+++ b/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch
@@ -0,0 +1,109 @@
+From 0da22762971551462cfad8f0b11cfb037472a4e8 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Thu, 16 Jul 2026 12:09:54 -0400
+Subject: [PATCH] libspng: Really remove gamma correction code
+
+We really don't use it, and fpclassify() apparently introduces yet
+another libm dependency in some cases (although I can't reproduce that.)
+
+Fixes #904
+---
+ src/spng/spng.c | 20 ++++++++++++++++++--
+ 1 file changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/src/spng/spng.c b/src/spng/spng.c
+index 06249d68..aeadb67e 100644
+--- a/src/spng/spng.c
++++ b/src/spng/spng.c
+@@ -353,9 +353,12 @@ struct spng_ctx
+     int widest_pass;
+     int last_pass; /* last non-empty pass */
+ 
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+     uint16_t *gamma_lut; /* points to either _lut8 or _lut16 */
+     uint16_t *gamma_lut16;
+     uint16_t gamma_lut8[256];
++#endif
+     unsigned char trns_px[8];
+     union spng__decode_plte decode_plte;
+     struct spng_sbit decode_sb;
+@@ -1742,6 +1745,8 @@ static uint16_t sample_to_target(uint16_t sample, unsigned bit_depth, unsigned s
+     return sample;
+ }
+ 
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+ static inline void gamma_correct_row(unsigned char *row, uint32_t pixels, int fmt, const uint16_t *gamma_lut)
+ {
+     uint32_t i;
+@@ -1785,6 +1790,7 @@ static inline void gamma_correct_row(unsigned char *row, uint32_t pixels, int fm
+         }
+     }
+ }
++#endif
+ 
+ /* Apply transparency to output row */
+ static inline void trns_row(unsigned char *row,
+@@ -3302,7 +3308,10 @@ int spng_decode_scanline(spng_ctx *ctx, void *out, size_t len)
+     const struct spng_subimage *sub = ctx->subimage;
+ 
+     const struct spng_ihdr *ihdr = &ctx->ihdr;
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+     const uint16_t *gamma_lut = ctx->gamma_lut;
++#endif
+     unsigned char *trns_px = ctx->trns_px;
+     const struct spng_sbit *sb = &ctx->decode_sb;
+     const struct spng_plte_entry *plte = ctx->decode_plte.rgba;
+@@ -3529,7 +3538,10 @@ int spng_decode_scanline(spng_ctx *ctx, void *out, size_t len)
+ 
+     if(f.do_scaling) scale_row(out, width, fmt, processing_depth, sb);
+ 
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+     if(f.apply_gamma) gamma_correct_row(out, width, fmt, gamma_lut);
++#endif
+ 
+     /* The previous scanline is always defiltered */
+     void *t = ctx->prev_scanline;
+@@ -3768,6 +3780,8 @@ int spng_decode_image(spng_ctx *ctx, void *out, size_t len, int fmt, int flags)
+ 
+     /*if(f.same_layout && !flags && !f.interlaced) f.zerocopy = 1;*/
+ 
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+     uint16_t *gamma_lut = NULL;
+ 
+     if(f.apply_gamma)
+@@ -3807,15 +3821,14 @@ int spng_decode_image(spng_ctx *ctx, void *out, size_t len, int fmt, int flags)
+         unsigned i;
+         for(i=0; i < lut_entries; i++)
+         {
+-#if 0 /* libjpeg-turbo: Eliminate libm dependency */
+             float c = pow((float)i / max, exponent) * max;
+-#endif
+             float c = 0.0f;
+             if(c > max) c = max;
+ 
+             gamma_lut[i] = (uint16_t)c;
+         }
+     }
++#endif
+ 
+     struct spng_sbit *sb = &ctx->decode_sb;
+ 
+@@ -5000,7 +5013,10 @@ void spng_ctx_free(spng_ctx *ctx)
+ 
+     if(!ctx->user_owns_out_png) spng__free(ctx, ctx->out_png);
+ 
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+     spng__free(ctx, ctx->gamma_lut16);
++#endif
+ 
+     spng__free(ctx, ctx->row_buf);
+     spng__free(ctx, ctx->scanline_buf);
+-- 
+2.47.3
+
-- 
2.47.3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
