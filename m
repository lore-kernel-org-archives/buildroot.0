Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59765C55ABA
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 11:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03A1083B7B;
	Fri, 20 Feb 2026 11:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRcuvyN2h4fu; Fri, 20 Feb 2026 11:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F59883E55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771588292;
	bh=FU0UyUPaZe2C1zSocD7X/+hsYBFFkB5b2TAb6q+Ui3c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUqjcKEweQbHdWkDEeFB3zqGgJHkkBfdAtFB8qSZvZgE7lSBGooT2rgVBJPINReT8
	 1VYWuUwDNLU3r1xK8L+pd2bhd7oA9r4Y2os42UITfFJsqY8exWPyOshv7Q23YGY0iF
	 PWz5MZpGuSSoIKFwhCXuALUT6yA9EA1my865LAZc5nn4i5D5k2jeZhmbVmV62Arcok
	 EaPV3ZeaGZPUaRmcBjm7nbjBissGrY69H4rl6lfxLXxrzxjLch6aRDI0NXAseckYwW
	 YA63ie28H4KNYjHXtxKw3OWK0qw2h3zt7PKeRYAWzHDUzAnuZjApb+2pQog6gjyrSt
	 MMdUMfRzBUZLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F59883E55;
	Fri, 20 Feb 2026 11:51:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E25B81CE
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF9A34034A
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFYZRRnyDOU4 for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 11:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CABA402FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CABA402FF
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CABA402FF
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:51:30 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-824c9da9928so1050913b3a.3
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 03:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771588289; x=1772193089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=//48ub9Td0B3/HlaboMsLKlOS0ZRxbZo498TADgzAJ8=;
 b=XPOFCnOUCV7PQdo4/TEGTNrp2Yzbm8GZjePGri2iWI3DlVccedomM68uTQPtZx1Wef
 Yh048I5RA6OQu1scrNcUbcUwldj5SIi4yA8goeewo1yZOfRfJAeM1A2WT/7u5FabArp8
 Ggq1EIiWaYQ8neyU/jclm5xV2LqdEx93DZbCXV0GfPGuVOdOLOyDsIL8kuiiKS+NYqfS
 pCgl6xf70h5OLBnS+Erwpbuizn/ncVZwpjuu6WPGUDHVWbGwGEA5gC+GeyYURVj7Otph
 MqNJDObxbZ2EqcHr0N+gL4LofLRXBaeF/E54TEiA0eOhc7odJ8/Ea7oOHwnBN5FWWznd
 ytEA==
X-Gm-Message-State: AOJu0YwgETVZvnrTfitMWRiycrLise+4+gwobG1Ec8apUqE89hC3XPF2
 nbG6qmpiNkRAI2v3JZOmlH31tWqLH2Oa1CbwNaS7GEBqaLH0F8rBXnPVwMOu/eusv5/omQ==
X-Gm-Gg: AZuq6aLGikv07yaJUAojlpseTUDIy7q+UCaxrZI9c1JbO66DNGPMPJWibCXEU7zHHzB
 Nlk80q+5G41KufxijxuBEOWFCyx+DIMLanFmdZdQxR9mmflgeJhg3fJuLCK/FNH+Deiks/LAW86
 MJ44S0FQ6P5UTCSqdwDcXqSdq1sqdJic/TNCFIQlxuiEE7mp/p7pnuUtxlaXoHJ6w+17NlEiRgL
 mD7YGfR8vdRTlOSkt+J3PUdSgnMdarb+Ln792yA638XQntOkBjLxWkUp83I8op30XcnaEy41mlT
 XxW60zeMFgRO4nO36tRkQPYdYfOYcTzqzL4fcfvi+0g3udncdPo3c4xiO2ExP6MlNZ8FhT9mtHv
 Vm4sNXT1Cn/wwD7G1R3xdnD0XzzYS4AD0TNWXXPaiJjMb98qO/dD6BIgga1D3E2aVfIT2ZBkyuL
 DdwBlTQJ6flJeglzFj8QgIOnS17F/HQy52EA==
X-Received: by 2002:a05:6a21:c210:b0:38b:eeb9:cbb5 with SMTP id
 adf61e73a8af0-395121d8424mr4739619637.39.1771588289117; 
 Fri, 20 Feb 2026 03:51:29 -0800 (PST)
Received: from fedora ([2409:40e5:116b:88d4:3795:8a9b:7eb9:b495])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-358a2abf178sm1175622a91.5.2026.02.20.03.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 03:51:28 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: "Ernesto L . Williams Jr" <realcontrols@gmail.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 20 Feb 2026 17:21:15 +0530
Message-ID: <20260220115115.231929-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218073958.455704-1-chakrabortyshubham66@gmail.com>
References: <20260218073958.455704-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771588289; x=1772193089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=//48ub9Td0B3/HlaboMsLKlOS0ZRxbZo498TADgzAJ8=;
 b=a0RMQYf0a7axOvRz95+bXkwMkfAuh3l7pGRpyzPWVB9ICipuz/wRGXYbZzkzqEi5e4
 CGnIBNRjDf8lRESL847eppTM5hrNhHWUf8vXRtqZMKtgY07ehAuwgWqNzu7o7qcwORcS
 HKrRxieIzSUUExxA03Gk1Cj+GCJZnDpj0Um66+Jw0lC2bBdDSn9UX5Z5/Wu4q8Dh3ItZ
 owyTQ6RXyj4TPhxHXN9QHcOCfLB+jaSvtMCCMNFwj/h3m/hvPkPmfa9pAmY0nscXP8o9
 oL9ztf47i1rTAzZdoOs3eg6ZdWkqdQIoPCTWVZ93zCm17FrBflimMhpregshbuBw/MOE
 BrzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a0RMQYf0
Subject: [Buildroot] [PATCH v2] package/szip: fix build with GCC 15
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

GCC 15 defaults to C23, which no longer allows empty parameter lists
in function pointer declarations or old-style K&R function definitions.
Modernize all affected declarations in src/rice.c and src/sz_api.c.

Tested with musl toolchain and verified across 32 toolchain
configurations using test-pkg.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes v1 -> v2:
  - Fix Signed-off-by name (was "Rick", now correct)
  - Extend fix to cover all K&R style function definitions in rice.c
    and sz_api.c, not just winner_function pointers
  - Add proper patch headers (Signed-off-by, Upstream)
  - Tested across 32 toolchains with test-pkg, all OK
---
 ...-error-by-modernizing-C-declarations.patch | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 package/szip/0001-rice-sz_api-fix-too-many-arguments-error-by-modernizing-C-declarations.patch

diff --git a/package/szip/0001-rice-sz_api-fix-too-many-arguments-error-by-modernizing-C-declarations.patch b/package/szip/0001-rice-sz_api-fix-too-many-arguments-error-by-modernizing-C-declarations.patch
new file mode 100644
index 0000000000..0f0bdbfb49
--- /dev/null
+++ b/package/szip/0001-rice-sz_api-fix-too-many-arguments-error-by-modernizing-C-declarations.patch
@@ -0,0 +1,92 @@
+diff -u -r a/src/rice.c b/src/rice.c
+--- a/src/rice.c	2017-01-25 23:36:17.000000000 +0530
++++ b/src/rice.c	2026-02-20 15:06:07.163580418 +0530
+@@ -103,8 +103,8 @@
+ #endif /* !HDF */
+ 
+ #ifndef REMOVE_SZIP_ENCODER
+-static int (*winner_function)();
+-static int (*winner_ref_function)();
++static int (*winner_function)(unsigned *, unsigned *);
++static int (*winner_ref_function)(unsigned *, unsigned *);
+ #endif /* !defined(REMOVE_SZIP_ENCODER) */
+ 
+ static boolean compress_exactly_as_chip;
+@@ -534,9 +534,7 @@
+ ---------------------------------------------------------------------------*/
+ #ifndef REMOVE_SZIP_ENCODER
+ static void
+-fix_last_scanline(byte_buffer, n)
+-unsigned char *byte_buffer;
+-int n;
++fix_last_scanline(unsigned char *byte_buffer, int n)
+ {
+     unsigned char *end;
+     unsigned char *p;
+@@ -601,7 +599,7 @@
+ 
+ #ifndef REMOVE_SZIP_ENCODER
+ static int
+-encode_scanline()
++encode_scanline(void)
+ {
+     char *bptr;
+     int del;
+@@ -3577,14 +3575,7 @@
+ * Valid bits_per_pixel are: 1-24,32,64.                         *
+ ****************************************************************/
+ long
+-compress_memory(options_mask, bits_per_pixel, pixels_per_block, pixels_per_scanline, in, pixels, out)
+-int options_mask;
+-int bits_per_pixel;
+-int pixels_per_block;
+-int pixels_per_scanline;
+-const void *in;
+-long pixels;
+-char *out;
++compress_memory(int options_mask, int bits_per_pixel, int pixels_per_block, int pixels_per_scanline, const void *in, long pixels, char *out)
+ {
+ #ifndef REMOVE_SZIP_ENCODER
+     long out_bytes;
+@@ -5484,15 +5475,7 @@
+ * Valid bits_per_pixel are: 1-24,32,64.                         *
+ ****************************************************************/
+ long
+-uncompress_memory(new_options_mask, new_bits_per_pixel, new_pixels_per_block, new_pixels_per_scanline, in, in_bytes, out, out_pixels)
+-int new_options_mask;
+-int new_bits_per_pixel;
+-int new_pixels_per_block;
+-int new_pixels_per_scanline;
+-const char *in;
+-long in_bytes;
+-void *out;
+-long out_pixels;
++uncompress_memory(int new_options_mask, int new_bits_per_pixel, int new_pixels_per_block, int new_pixels_per_scanline, const char *in, long in_bytes, void *out, long out_pixels)
+ {
+     static char *interleave_array;
+     long bytes_written;
+@@ -5796,12 +5779,7 @@
+ #endif /* !HDF */
+ 
+ int
+-check_params(bits_per_pixel, pixels_per_block, pixels_per_scanline, image_pixels, msg)
+-int bits_per_pixel;
+-int pixels_per_block;
+-int pixels_per_scanline;
+-long image_pixels;
+-char **msg;
++check_params(int bits_per_pixel, int pixels_per_block, int pixels_per_scanline, long image_pixels, char **msg)
+ {
+     if (bits_per_pixel >= 1 && bits_per_pixel <= 24)
+         ;
+diff -u -r a/src/sz_api.c b/src/sz_api.c
+--- a/src/sz_api.c	2017-01-25 22:10:25.000000000 +0530
++++ b/src/sz_api.c	2026-02-20 15:06:19.243681266 +0530
+@@ -467,6 +467,6 @@
+ }
+ 
+ int
+-SZ_encoder_enabled() {
++SZ_encoder_enabled(void) {
+     return(szip_allow_encoding);
+ }
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
