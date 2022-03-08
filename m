Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBE4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 17:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF3A960F45;
	Tue,  8 Mar 2022 17:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id op1fZqS4FGgW; Tue,  8 Mar 2022 17:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B1360B36;
	Tue,  8 Mar 2022 17:48:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5DBA1BF86D
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 17:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9869D401F8
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 17:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMyXo-bX7opT for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 17:48:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60D60401ED
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 17:48:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so1901126wmj.0
 for <buildroot@buildroot.org>; Tue, 08 Mar 2022 09:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q47ZA1pv6LWNyg3FRNyjlTh1C88tz8YIL5Rm/bmS3Vc=;
 b=gJ+TyRhz2IzQ0rzeh3+nN4mIHeBBuwyIirH3b97l76agcGAPXDoeFYCHLiQynw25G0
 aadPvJK0nnu9q6OtfyNGrqkFak1SfihmTsG1rZ5HFsxvWDUeWT84wHoVasIH52pGsSmm
 LfPa7GajwtBHb6vXks/WzR5w1XJPIqrtIblp9pjx86kP/obH2Gx0BCrB/5oBHHtT3XvD
 exuBG9XSH5Jckx4QOs2iXgxZfFnd6RapvrCJxKxNwcIeYLY/v57P2bDl4yRQfF8ZKy45
 6IsTR6cU8B0y11WUhVj76JrfuKeZw7etRkmM05O4qqAv+0wdYtvd06P37YPO4E7akvO1
 VknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q47ZA1pv6LWNyg3FRNyjlTh1C88tz8YIL5Rm/bmS3Vc=;
 b=XXkwjAUH5cL35K6yDqcGD43sQh8RyklOKubVwsA27DtFMw1ULyixul8rtmmMZkQkB2
 The6TG8YBfIckmSj/Tezq8bFG6U69op/YKhLX0ZNCpHyVbCyENxCzyDHMQx8dLVN9qju
 OheJdTiW85q96v3BRBR4AnA9e3UBGuTWVdiQl7+pHXy7SAlOUoQiZrwa3vI4kQcYjIrh
 fPbykFbUzrcPeXsDhfMlw78v0PaQG3w6Ccvqb8K2nXNTf3n4DxwwfG53rHMIfpWr232R
 oSVP98RwkOyBQtlZwbnUHIKTKf4tZrPFANbgt7LPiYG3+OJ6DGiebE29L/j65qkUVo3z
 0D4w==
X-Gm-Message-State: AOAM530EhJt22aliLL9/CPA2J0nRAMHI08bqsgE8laLGYOI28l0G/38G
 uG6Ss2WE9lOj+IM6IsFUIV6ILdC8xhA=
X-Google-Smtp-Source: ABdhPJxLUPPpcEAsRnd//aBhlyCBL2lEP3O+ygWAbLypp7u/lQ/wiLNbw+hAcVCgk+5afzCNRN5gug==
X-Received: by 2002:a1c:f409:0:b0:381:500b:ad90 with SMTP id
 z9-20020a1cf409000000b00381500bad90mr346165wma.42.1646761702209; 
 Tue, 08 Mar 2022 09:48:22 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b00381141f4967sm3586748wmq.35.2022.03.08.09.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 09:48:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Mar 2022 18:47:37 +0100
Message-Id: <20220308174737.1413882-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/safeclib: fix armv7 and sparc builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on armv7 and sparc raised since bump to
version 3.7.1 in commit cc27267ae41bf44276c63b1e86042c4fae4adf50 and
https://github.com/rurban/safeclib/commit/b90c52b1691fe82ce0a0681a503e1d45584f0162:

In file included from perf_memcpy32_s.c:7:
perf_private.h: In function 'rdtsc':
perf_private.h:72:3: error: 'asm' undeclared (first use in this function)
   72 |   asm volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
      |   ^~~

Fixes:
 - http://autobuild.buildroot.org/results/ceb13c071b1461eb6d73f5940d6b010095127f41

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-fix-armv7-asm-inline-error-GH-115.patch | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch

diff --git a/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch b/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
new file mode 100644
index 0000000000..3cb37b96f5
--- /dev/null
+++ b/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
@@ -0,0 +1,156 @@
+From 9c739800a8915d5f2a73c840190920e95ffa1c5c Mon Sep 17 00:00:00 2001
+From: Reini Urban <rurban@cpan.org>
+Date: Fri, 18 Feb 2022 09:46:45 +0100
+Subject: [PATCH] fix armv7 asm inline error GH #115
+
+some armv7 buildroot variants fail on asm.
+we already probe for that, so use it.
+Fixes GH #115
+
+[Retrieved from:
+https://github.com/rurban/safeclib/commit/9c739800a8915d5f2a73c840190920e95ffa1c5c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tests/perf_private.h | 49 +++++++++++++++++++++++++-------------------
+ 1 file changed, 28 insertions(+), 21 deletions(-)
+
+diff --git a/tests/perf_private.h b/tests/perf_private.h
+index 3296cb3d..843674d3 100644
+--- a/tests/perf_private.h
++++ b/tests/perf_private.h
+@@ -1,9 +1,9 @@
+ /*------------------------------------------------------------------
+  * perf_private.h - Internal benchmarking tools
+  *
+- * 2020  Reini Urban
++ * 2020,2022  Reini Urban
+  *
+- * Copyright (c) 2017, 2020 Reini Urban
++ * Copyright (c) 2017, 2020, 2022 Reini Urban
+  * All rights reserved.
+  *
+  * Permission is hereby granted, free of charge, to any person
+@@ -55,13 +55,16 @@ static inline uint64_t timer_start();
+ static inline uint64_t timer_end();
+ 
+ static inline clock_t rdtsc() {
+-#ifdef __x86_64__
++#ifndef ASM_INLINE
++#define NO_CYCLE_COUNTER
++    return clock();
++#elif defined __x86_64__
+     uint64_t a, d;
+-    __asm__ volatile("rdtsc" : "=a"(a), "=d"(d));
++    ASM_INLINE volatile("rdtsc" : "=a"(a), "=d"(d));
+     return (clock_t)(a | (d << 32));
+ #elif defined(__i386__)
+     clock_t x;
+-    __asm__ volatile("rdtsc" : "=A"(x));
++    ASM_INLINE volatile("rdtsc" : "=A"(x));
+     return x;
+ #elif defined(__ARM_ARCH) && (__ARM_ARCH >= 7) && (SIZEOF_SIZE_T == 4)
+   // V7 is the earliest arch that has a standard cyclecount (some say 6)
+@@ -69,11 +72,11 @@ static inline clock_t rdtsc() {
+   uint32_t pmuseren;
+   uint32_t pmcntenset;
+   // Read the user mode perf monitor counter access permissions.
+-  asm volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
++  ASM_INLINE volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
+   if (pmuseren & 1) {  // Allows reading perfmon counters for user mode code.
+-    asm volatile("mrc p15, 0, %0, c9, c12, 1" : "=r"(pmcntenset));
++    ASM_INLINE volatile("mrc p15, 0, %0, c9, c12, 1" : "=r"(pmcntenset));
+     if (pmcntenset & 0x80000000ul) {  // Is it counting?
+-      asm volatile("mrc p15, 0, %0, c9, c13, 0" : "=r"(pmccntr));
++      ASM_INLINE volatile("mrc p15, 0, %0, c9, c13, 0" : "=r"(pmccntr));
+       // The counter is set up to count every 64th cycle
+       return (int64_t)(pmccntr) * 64;  // Should optimize to << 6
+     }
+@@ -83,22 +86,22 @@ static inline clock_t rdtsc() {
+   uint64_t pmccntr;
+   uint64_t pmuseren = 1UL;
+   // Read the user mode perf monitor counter access permissions.
+-  //asm volatile("mrs cntv_ctl_el0,  %0" : "=r" (pmuseren));
++  //ASM_INLINE volatile("mrs cntv_ctl_el0,  %0" : "=r" (pmuseren));
+   if (pmuseren & 1) {  // Allows reading perfmon counters for user mode code.
+-    asm volatile("mrs %0, cntvct_el0" : "=r" (pmccntr));
++    ASM_INLINE volatile("mrs %0, cntvct_el0" : "=r" (pmccntr));
+     return (uint64_t)(pmccntr) * 64;  // Should optimize to << 6
+   }
+   return (uint64_t)rdtsc();
+ #elif defined(__powerpc64__) || defined(__ppc64__)
+     uint64_t tb;
+-    __asm__ volatile (\
++    ASM_INLINE volatile (\
+       "mfspr %0, 268"
+       : "=r" (tb));
+     return tb;
+ #elif defined(__powerpc__) || defined(__ppc__)
+     // This returns a time-base, which is not always precisely a cycle-count.
+     uint32_t tbu, tbl, tmp;
+-    __asm__ volatile (\
++    ASM_INLINE volatile (\
+       "0:\n"
+       "mftbu %0\n"
+       "mftbl %1\n"
+@@ -109,12 +112,12 @@ static inline clock_t rdtsc() {
+     return (((uint64_t) tbu << 32) | tbl);
+ #elif defined(__sparc__)
+     uint64_t tick;
+-    asm(".byte 0x83, 0x41, 0x00, 0x00");
+-    asm("mov   %%g1, %0" : "=r" (tick));
++    ASM_INLINE(".byte 0x83, 0x41, 0x00, 0x00");
++    ASM_INLINE("mov   %%g1, %0" : "=r" (tick));
+     return tick;
+ #elif defined(__ia64__)
+     uint64_t itc;
+-    asm("mov %0 = ar.itc" : "=r" (itc));
++    ASM_INLINE("mov %0 = ar.itc" : "=r" (itc));
+     return itc;
+ #else
+ #define NO_CYCLE_COUNTER
+@@ -126,9 +129,11 @@ static inline clock_t rdtsc() {
+ // 3.2.1 The Improved Benchmarking Method
+ static inline uint64_t timer_start()
+ {
+-#if defined (__i386__) || (defined(__x86_64__) && SIZEOF_SIZE_T == 4)
++#ifndef ASM_INLINE
++    return (uint64_t)rdtsc();
++#elif defined (__i386__) || (defined(__x86_64__) && SIZEOF_SIZE_T == 4)
+   uint32_t cycles_high, cycles_low;
+-  __asm__ volatile
++  ASM_INLINE volatile
+       ("cpuid\n\t"
+        "rdtsc\n\t"
+        "mov %%edx, %0\n\t"
+@@ -137,7 +142,7 @@ static inline uint64_t timer_start()
+     return ((uint64_t)cycles_high << 32) | cycles_low;
+ #elif defined __x86_64__
+   uint32_t cycles_high, cycles_low;
+-  __asm__ volatile
++  ASM_INLINE volatile
+       ("cpuid\n\t"
+        "rdtsc\n\t"
+        "mov %%edx, %0\n\t"
+@@ -151,9 +156,11 @@ static inline uint64_t timer_start()
+ 
+ static inline uint64_t timer_end()
+ {
+-#if defined (__i386__) || (defined(__x86_64__) && defined (HAVE_BIT32))
++#ifndef ASM_INLINE
++    return (uint64_t)rdtsc();
++#elif defined (__i386__) || (defined(__x86_64__) && defined (HAVE_BIT32))
+   uint32_t cycles_high, cycles_low;
+-  __asm__ volatile
++ ASM_INLINE volatile
+       ("rdtscp\n\t"
+        "mov %%edx, %0\n\t"
+        "mov %%eax, %1\n\t"
+@@ -162,7 +169,7 @@ static inline uint64_t timer_end()
+     return ((uint64_t)cycles_high << 32) | cycles_low;
+ #elif defined __x86_64__
+   uint32_t cycles_high, cycles_low;
+-  __asm__ volatile
++  ASM_INLINE volatile
+       ("rdtscp\n\t"
+        "mov %%edx, %0\n\t"
+        "mov %%eax, %1\n\t"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
