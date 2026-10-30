Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5525A606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NXoMfYiJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XC/NE4J
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2532A40B3E;
	Fri, 30 Oct 2026 15:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lwbakai54qWB; Fri, 30 Oct 2026 15:24:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 20A7440B36
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373889;
	b=dH9Ek9EGj09rYpyx2JnFulmmydq13rrqWwYa2GXkZnwgM+YoF0ctZfV1ziAchK8EKXDp
	 +QhHyMm/ScnOweKJgiw2GYdCiXoalJSEKukttADefS+ntsdJTq3XmPIEJtj+ntBOuk5r8
	 xE0K+ucPjvtE/lGds5M9YF0Q9h5iIvchNjA4ZAWM32Ga3F+VN7fbI4xU0dEpH5ArDVlkw
	 CGyNahAwL/GqO1royZBTs4RimyT+rChY5y7l9QfQp03Qk20pvIxJ7HENtzVpJJCNcjWSw
	 Pz3mCRd1F+AMMb8Uxi+q0sz2pvCXuz8F6HvlO28Br4Y6sWBt47kADThSdBsw0Qc3dVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373889;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=SVB6jB//BS7r4+SUHySzsWYIN/w5lej6ziQaOPf9gQY=;
	b=NRmsL4A4UGCjdVfLhsPZfDVICI0EMRIrZ3KLeq2YFqorWubu+DVwllIbFkMI/EjOWC1/
	 ijr1PpvSYSgNWIrlKZCE87S5WQBv0s7L2hb8EOE/+Sns2wbmiE4sxoCuRi5RriPGIzW6A
	 yhvjqZ2kl/eu9RnjAG5tLAZTmbz/19pSKZZw4sk/2032ZmR/Z9oOvu258MPwMu6Zb3cZz
	 NG2W4qtSlbzSDl26zptTHJ3/67t/2ggO6mtHzLqyQo+Qfuapk2hCr4dgkEXsv8uEW/oxK
	 sZfCc1YB/5WuZQHEOi2naJCbtROPX6em6LzwKomNHi0oueKlCEqOzbE/giS0NwYp6rQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373889;
	bh=SVB6jB//BS7r4+SUHySzsWYIN/w5lej6ziQaOPf9gQY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXoMfYiJmEGdr0jKbfkYO7ftQUi6ijicc4TBwT5CbPeETzmuviObgEe93pGK+h2aL
	 kjxhuvjkHglB2N5m7nypb4GbidEqufYDkDnFRGwgkQB+fygqPnV72vjrGDFaFRrE5c
	 96GqYSmc6G2st7KXecjBMTEVnwQ1wYWBjbkK5Yn59GY//CmYk+ugq2FspMe+QmlvJm
	 05mX0+oy3tkatzed2zFwSRwZxmRfvOs+BQWKWDLitkc3i1SDVkv6PsuHpFP/OVFl7C
	 6ODAjPmYQJ+yb+WZJLjxs7wartRSA+ZGZkOJgkkhRzTLov9b0sTn0yaQx0HzCo55fb
	 RbccUZaBQn5PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20A7440B36;
	Fri, 30 Oct 2026 15:24:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47A483AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39DDB81250
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcGMQmQJZBgN for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:24:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D78B8125B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373884;
 b=piThfVLZPRyIV7JVeWCztcLcoSU5E858GH+uTvJmXlbttUrdjMccLuMne0yDg2q1hLF3
 q6Cb0zk0jLyoLalA+oQT8FbV0LERqvA4bwl3TwoBCGgg1bmyRibCHytcDLESfegK1bLQW
 pC18IB7SU89gF3qOdr+lUDmkQhigRkkvDvODZ3JEKkrEKiIOIMkQJQkzqw/zHhjLA+4wT
 heS++IbERRGEk5pBAnEHEL/IgSzZQlsg8COOJ2/553GO6Dkv22QNKQvMvMbCPiu4x7doZ
 uxdE1lbGq9YXSTpyq0iicuKcDnhsnRxKVC81VQppIyB7BN4jSSZwFViENNY3RqvUaPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373884;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=4hwbgEadYnvmNjZNfF8NWDnc4kzHEI549hld5n3cyNE=;
 b=VE+rwWC8oaxTXRVVh5iDGJC4F2eLJ10zl+pkbM9T8BgbuS7S7QolsRHFm3vWSIBdEURu
 nd8VQ2YfV2meTM/CNicvRf+kDO072UOeYZCfZDqXbVKaD2kn/OAIqMiNcUAlO3w9Q1nIA
 TUoOoydaJms6+A684y7Pn/m/EjQxssM8i4tod/ZNhQv58iJOT0djxSWCKa4Y/tU3FfuHt
 FvZKB/79Z1yDIRPrhQly8s22HsuTo6xozbQpEwt9gaq9tY6GB/rewvtexbeGB9VBJBNsi
 DipAWjMjAJray74ay28iYdRF9qPi05uMF7tbDkHD3H+ishXy/St3zAycEJ4D2gR/+5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="0XC/NE4J"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=0XC/NE4J
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D78B8125B
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:43 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48b042c0728so238824f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373881; x=1793978681; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4hwbgEadYnvmNjZNfF8NWDnc4kzHEI549hld5n3cyNE=;
 b=0XC/NE4JLU2q3l2P9UGI4w22nb0CNp5Xpe/a3k7U9u7LbRjy4eLeXcGwoZUHdX9FCM
 eMT6dEOaaYSazLSDx9oBVJbamGhnXLMrZsnGvjTjP0umd3q7DZr+xuS+G7rQ24GCSDEc
 G/B+aFwikO9VrB04lpg0lbC5458H2HPquPDPz3cVHLI4naTMbvKlWVTQHx/hzrsDwMDb
 Nn4+KzLavY8AbWjXJGxN9HQYnXclW+qcvGVi7zMDDRuzWL93d9jAMvaKmKwwAVOo+RFH
 rEMH6S2y+iv4MtNGxQrtlno9ux3oatwyG4J2xQ6EsV1/lDGjng9p7US9NnvDajUlAiBv
 hM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373881; x=1793978681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4hwbgEadYnvmNjZNfF8NWDnc4kzHEI549hld5n3cyNE=;
 b=ZmmRQG5nx+7qYYNzYLLzDDPyN4wYBhFm9/7BZ6wjK6rg3P1NEogXUZlipOv1yemBD2
 wlXxCws7cGn6XqL3v6CFBlqi3ZGEgVgFNtlIeFozISH8GEPPwU40AWBV7ORUjeeGf1Pj
 X/4FEeh5vHr3np+ge6fLPMiNbb/vIi0EvObwxx9JtG5LlIm0MP8Cx0qjyVdcb+bfGg4t
 KtHHyPrkwXKrHI3XdUVqH5yGh/dGknKfqUWw2Z6BbaiXHa1oZ/z3Q227xi3YAIUYYwps
 zIBsUVD5A3QskjrQzxf8uMwjwdamMyvvLdlS1c/hCrIoWA5LfC6ly5fbTs4m81amZBGY
 NoZA==
X-Gm-Message-State: AFq9FYLiJmTvnLdm2XWPf9nThN8Y5YFRjGYnzpMXhHDmfvdJkQnY/cXl
 tXxP1a8jOsD6dXR94l/3qDp8gitsrLx7tutggIvkGF8VeHyedHxlt6fg5bjHXQ==
X-Gm-Gg: AYBFou2RQGrJCyJEJMYKKTVz/rchrYQ9eJWtLzALxUtKEzxHrrR5mONR74Yk9+FN+US
 gcx9xepw18MqG2RjMbocAy5gBUXmZWxkrxqi4hjhN0vF4rOmJxlCBwY0qZgPDDEnfBXl7q1WZrk
 7Aide7zhSVpPfeMpAcBYe05WdgaI7DxorgfPyezFOnUP/obeTDVxyMJKOKrR9/wGs1wBXf+px6h
 XXfMaNB7kJRP+fKkmW3WcRmWFkinTFTfCwnF+63cGFKqRPBOOGxp03fEx74ILLNVILEEFqSqYxn
 cWzf8xLKiT8YGn28JBxFIN5mxj98VYKsvn8wOCQdxR74c/HJAFEPzguMqbtwgKhfPhGg+fnYOBA
 ZxaY4lxm1/5ZUFgnBOY8Xf3ZYjbUhlmu7AGuLBfxFt2OuaMQ7o3AKVBQTPJt8/8Jb4Qz49YQpRH
 4aWT4YlDUp9jJvcq+3vmPRA1bjxpA+K/4xhD2GgMhtF4/+e6iBFfmVjfeKQrYHPhwl067i0lpFb
 X19rQouW4Y0T+y6yw3px98P7ztgbERdRLx3HPCp+l8EpqSotCzTGvkYk4TjWxb+Bb0Bs8o9vbfb
 cyrEtkv9P7qjkullADses5x4qX5GhFYSNj0vNdDk0P9Mk2LAJsGY7w==
X-Received: by 2002:a05:6000:642:b0:48e:1421:ed63 with SMTP id
 ffacd0b85a97d-48e6e2ebd36mr5689701f8f.15.1793373880982; 
 Fri, 30 Oct 2026 08:24:40 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8c0b6sm3540180f8f.41.2026.10.30.08.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:24:40 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 16:24:28 +0100
Message-Id: <20261030152434.3738285-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/9] package/libabseil-cpp: allow building with
 musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libabseil-cpp depends on BR2_TOOLCHAIN_HAS_UCONTEXT, which is not set
for musl, as it doesn't provide the {get,make,set}context functions.

However, absl/debugging/internal/examine_stack.cc only uses the ucontext
data structures, to get the program counter from the signal context,
and never calls those functions. musl provides those data structures,
so allow building with musl.

On 32-bit powerpc, examine_stack.cc assumes the glibc layout of
mcontext_t (uc_mcontext.uc_regs), which is different with musl, so keep
it disabled there.

examine_stack.cc was build-tested with the Bootlin musl toolchains for
aarch64, armv7, i686, x86-64, m68k, mips32el, powerpc64, powerpc64le,
riscv32, riscv64, s390x and sh4, and libabseil-cpp, re2, protobuf, grpc
and webrtc-audio-processing with the aarch64 and armv7 musl toolchains.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/libabseil-cpp/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index aba065fca7..ea037f5de2 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -13,7 +13,11 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	default y if BR2_sh
 	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_x86_64
-	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
+	# Only the ucontext data structures are used, not the
+	# {get,make,set}context functions, so musl is supported, except
+	# on 32-bit powerpc, where the glibc mcontext_t layout is assumed.
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || BR2_TOOLCHAIN_USES_MUSL
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_MUSL)
 	# absl/base/internal/direct_mmap.h only implements DirectMmap()
 	# with mmap2 for the o32 ABI on MIPS, and its 64-bit fallback
 	# fails to build with the n32 ABI, where long is 32-bit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
