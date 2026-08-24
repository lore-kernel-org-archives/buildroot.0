Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F5BC5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 07:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E3D4067A;
	Mon, 24 Aug 2026 07:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXagvsQeWjvA; Mon, 24 Aug 2026 07:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787554900;
	bh=y1Op4iQT1uQTd/1Q7LH12LJC97dURKV+vQ0iv65dWPs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DW5E/eh2Sn1Pg5zaDB+XvE/xA2/rO0YJ1j4W9HSR+TYb5WZRvnLAYh6fsUXXKaFYn
	 34o8+ZUIE9NGpz0q/T4nluaIyKEioOUHo1AwxCfb/bthbmGZOm5VsQedAkjpHT6gbv
	 Y7h8CxXpG3wazPH/Ma8SeKzU51DqcHUZxldgE1r72i+WABvHy0svCUhuaPHe2l+u8X
	 Tcnce7DZrQV/f+LIWx1cRfRAOZcgFh3FPW02SybB9Wyup81tB+phWPwXYPhyRMp4fr
	 qpqZNvHmUeY9EfClTqUkUllH9VtEOixtpy6fl13sCAtGMovR0P/XCi6SnnGQWk1Jls
	 b3lG63Ob/+kBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60A4F4065D;
	Mon, 24 Aug 2026 07:01:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 785E63DA
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 07:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A43380DD8
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 07:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXEpen5-TqO9 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 07:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90E6480DD2
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 07:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6CC98F2AA; Mon, 24 Aug 2026 07:00:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 08:41:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d74a065a16be4e18e6c85ddf257c4f5ff033e6b8
X-Git-Newrev: c0a51767a0d33b5f8da866a6a0f1f35968311614
X-Patchwork-Hint: ignore
Message-Id: <20260824070042.A6CC98F2AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jpeg-turbo: fix libm linking issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c0a51767a0d33b5f8da866a6a0f1f35968311614
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit bb38f6f7208497cf5a4df922e833492001170111 bumped the
package to 3.2.0. This version first included upstream commit
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/ed00e0f4b39291e954958b96a8d941ca4a9e03a2
which removed the dependency to libm causing build errors detected by
the autobuilders.

Disabling the build of tests by the previous patch of this series is not
enough because the build will fail on other tools like

[ 98%] Linking C executable djpeg-static
/home/bernd/buildroot/output/per-package/jpeg-turbo/host/bin/../lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 src/spng/CMakeFiles/spng-static.dir/spng.c.o: in function
 `spng_decode_image':
spng.c:(.text+0x4c62): undefined reference to `__fpclassifyf'

Add upstream commit to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/981/98114d4ea7afe62bb4cef934a06bf289d863ad3f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...bspng-Really-remove-gamma-correction-code.patch | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch b/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch
new file mode 100644
index 0000000000..594e28f65c
--- /dev/null
+++ b/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch
@@ -0,0 +1,113 @@
+From 0da22762971551462cfad8f0b11cfb037472a4e8 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Thu, 16 Jul 2026 12:09:54 -0400
+Subject: [PATCH] libspng: Really remove gamma correction code
+
+We really don't use it, and fpclassify() apparently introduces yet
+another libm dependency in some cases (although I can't reproduce that.)
+
+Fixes #904
+
+Upstream: https://github.com/libjpeg-turbo/libjpeg-turbo/commit/0da22762971551462cfad8f0b11cfb037472a4e8
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
