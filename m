Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0BF606A324
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kFBd8Dv0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2vX+AhM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF78406EC;
	Fri, 30 Oct 2026 13:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1u7biIsl5dgF; Fri, 30 Oct 2026 13:59:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5419840AAD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793368769;
	b=Uwihzx0Ej9/FtA0oqUoo/dkSYgf0Kl2MoKBNy9O1Rs5eYOTRsoMWccR4D0HnCqff4z0T
	 wQIa7/C0eHtP0krLni/JrdLMuLsDCxzhhMSlbCHei8x8+hBfKavE3/FE8w87zIRlkKSlp
	 LLPq5vKqXZf/BtnW3EPd051I1RrmNWAwhVyLqF1U9KS9S0wFZu9NDGQJU8cOx5PVRt4LM
	 Wo+pdeeegS7Dr6oB24mJ6pRWoXRm+uJ63tFh4YrwdIytGP5nDMt2+Q/Nwz5cQXutYEnHa
	 N+X3mkSpggPKPMS+FuZGh0afyPD0nsbxzfG14GTzRVpIqhDpg//bjI0IeYw7RLe8xbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793368769;
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
	b=FRt2ZWX7fXNZjdWZu8wyuMNXHslCEj+D2QhfZZA57nVK+Ce5GJNHfg174hHUzO3smE2q
	 Tkh9R8c99UYwmzlG9Vuj60sJbMYfYgcXfKEobnbqxaiACaQbgUSeBXxaEZrXW7A/j1C9n
	 sQmDBds4S1DhjZUw/tLG28tc7PfGUU66lv8HVWiYQbN5mpOucKq8ii2sx9k85kZ/bpsWg
	 0UpF18xgxRSJHMBAiwP+vvwSYK+bGp9hDWfOI4bY/eoJNnRTVUDROPDmTUO0DsLz0qBIg
	 BKdQJyM+xW7hkUy8Qt/2Fz65fpuFh27VfGCXuR+54caRI7+JYYuoK5yJWai99pPu8ig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793368769;
	bh=SVB6jB//BS7r4+SUHySzsWYIN/w5lej6ziQaOPf9gQY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kFBd8Dv05FhjyjVnk2HNV6QZDUaxdxdZbVtcGWcLBbKUzs744G+EXWDvLCDZfen8V
	 MCErio+fyqdWRBmBSXxKR9aWObGvnPuhzeJVjUHJL9fknI62wcfIsyabJFyS15/5MW
	 CjOmkfJXmT/tEtWmLpUhOQjUPwPeNEpE7Fn3Pi5l9EBxu1aVo0oiLQpfy89kOrDuYc
	 swB1/zPD4otC9b/uQlA17V5ZpXrT60n0X3pQgTzabCof7ziuJrlrB1soWj9JPbJIdD
	 OWNspMLoasb2Df7uV1omv+rFI0zIxzxt/1iPWnt6LvmWG0oB8bCRKEp1y00T7hUN+5
	 HAqtwWbmzYmwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5419840AAD;
	Fri, 30 Oct 2026 13:59:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB776529
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD66580E6B
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0H2dMssyLmlV for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 13:59:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E79F480E37
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793368765;
 b=fieIluat4Dr4KXI+RgpFTr94I/cqLCs1UwlsArL+xqVpTzltIdpkPP0PnNPo0OUg6AFG
 xHRaLZ9wBfYLtWXq1XUVniG4ep7FuwIKryNogU1fBidQZKI7vYeNYIEgIQGcMPpdir8El
 Si07Oz3UjamR5wJDTdis2EdgdTD1wTROs6Za0jBOWPyFMumSsSqzsicvwxf4SI3u6ljng
 6wsUOe1jik2Z3RYZqGaAWF23/scQbADv3t5yhg5D8wVhUObLOZH8c2mFBR6FjnSHywqkb
 Q0YBY7mXAIGaT6JuC1ao+zUdOn+r8/oxXwa+hYv0lQLGDK12Q0GlfxM9+ZxgI91Awdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793368765;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=4hwbgEadYnvmNjZNfF8NWDnc4kzHEI549hld5n3cyNE=;
 b=iT7iTU2UsUqk1a40a01UQd/wvSfOknR4rbJs4FuIrErQ4E+/yIGJD8i1cb5QdnzAy/Rw
 2R3Kghg5i5WHZ4Y0+kYcGcrnSU0DWfDfzb9YOJzfU/ByBjJEUkKWHapC0q7FgllbgdRwp
 677kE9ZqnWlKGOf8q11ue80lHDT2PxMHAud3tDC0hbgxT4HuWRuCfndEP2WboWvhfnh98
 s8Fqk2Yhc3+bi4u5rxppLuXsfh9zmTTONhBmfHOszZE9IRSbAQkwfh6J58hGorye6+OZr
 EHaYY5eUoZgJIqh6wJhaMoeukDwatzOB32pir49Ax24tQpVFMnTSxBQ3I34hP3JP62g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=g2vX+AhM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=g2vX+AhM
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E79F480E37
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so591090f8f.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793368762; x=1793973562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4hwbgEadYnvmNjZNfF8NWDnc4kzHEI549hld5n3cyNE=;
 b=g2vX+AhMunh+ZCA2dZ+G8IRGpBjvZEO72nmnW6Jt0glWJu2jLOr5hANDHmE66XXPxf
 ug5TTkaKT5nXF7ar4kmcoNLcyQKS8JOIfQuJroaktesqB1Su1Xw2fjaAguPgHsIaRA3V
 RY5Otdy+10iGHTLv2cxIDrTY9FzXm84eP+ardaZt21++E65zZMUJT3+muABgjQzCBc9o
 HBOXKVN7kMnOM574biCl8KCgXa7sTJDD54TcIlJw0SW1TX+0OS3WoF5MMX4BKCvk14mf
 8YYDObzczGpHmkNaIbeyoGbEs4nGGsL81lZGu3cACa84M9a7OmceRv0gnJdDQdcg9Ail
 vgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793368762; x=1793973562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4hwbgEadYnvmNjZNfF8NWDnc4kzHEI549hld5n3cyNE=;
 b=TUCql6h0g+nvJPeZnuBvNOd5L3F97YA23Vrzq0fZ9bq8OU4Sw0yOnwCT1SvuwvTBjS
 XxNjpDKKiXk0FbdJRtQvGcULLSuUS0a7bb4K7o3Mr9+ubPoscix0T2R/TUiqd0KNaapK
 X5NiESgcRuZotxHbSAhyAv5uL4Uu08pABZetxfwLAFG+7IMCWzFanODG/mjp2tjmeoJF
 f3blp2WOEcZBhoSEcAcaGPVmKQnU0KVHzWwfuBjpKmCLdjBZf+aIxlQTCF5Oh6MB9Tnf
 Z8jRuax+Nv71IEklnbbwlH0VeA9ijH/9ePdGBZG8uKwSsIXeaEgT2gHCpdGiuliKwIix
 VOWQ==
X-Gm-Message-State: AFq9FYLRDEyZLCAzBKk0lTwmvpoTogtWNqXq0Du481QsPlwFPP/yemdO
 7S1cIg9LygUz4HxeAq/9BHiHTxNo4a6Etr8aByqugfGxe3h/EaD/H3QAvVB9Dg==
X-Gm-Gg: AYBFou0fA7Pro8VJ6GnD4bEEo4LBUOaFZNpBlCcRgh3cY6FSrZsXR7oCflvnZJfyIjR
 NSHJxRi6UtXPbAFQoVTlw3jZTYa3RPMRHfvyelDuM1CcTsPiXd5phocK4x3BpzKZBmCUcJzz/Bh
 tgEISXVu8YzrSL/FoMqbi+2ev++ntk5xNyd1jzJ3EJnFCfgqSPrIIadykXcgUOzsO+f3I9AhPbS
 HFzY/sRks4Ni6yGwSv1EcdcM7ihLUJDKquVNNb/P/UPqiBsH8Lc51j2cDxjd26Ac/ovhAF0YU3m
 qkeNla7m9CPRs8hLtabB4PPwR6aMThLSJSDZ3T4EUsR1QQHftUJ7/rNJW/rl0VzNXl4HE2wGYZ2
 UC0cCAr5W9JUh3Mvzpq2oPLQNRXcZTpMUogcaSESc+nt0hnTpKM/J1vazerY92xPF1QEPTMd8qh
 Pig6NQqAB3Kgxo1fVphvthzFh8QtELmZoVWuaZvO0v2XuibUQ7qAhiBjNUiKaKOtim8JJQUebyI
 NfPzONLTZ36hz5crKm3XGY+hY/TT4xuxSMTFjkSLMIkpjVP1eizrqLEyFhg1tA+5AO/N2mz4/B8
 RfqDBiSVmvxNL/KVt0YONMRPfV+sLfBx266zT5gmeRnhigvIsitFUg==
X-Received: by 2002:a05:6000:310c:b0:48c:7387:6b88 with SMTP id
 ffacd0b85a97d-48e6e2fb059mr5271258f8f.37.1793368762373; 
 Fri, 30 Oct 2026 06:59:22 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm3423347f8f.45.2026.10.30.06.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 06:59:21 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 14:59:10 +0100
Message-Id: <20261030135916.3599219-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
References: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
