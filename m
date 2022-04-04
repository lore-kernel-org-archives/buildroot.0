Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381EFC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBC65825E8;
	Mon,  4 Apr 2022 17:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2XpgN7g2R3d; Mon,  4 Apr 2022 17:39:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D450782503;
	Mon,  4 Apr 2022 17:39:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8BFE1BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8B4A82503
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UABgbWjGeH7L for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:39:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 741B48244D
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:39:09 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r10so6290311eda.1
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 10:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=XUZ9yxf5ldyGecmKrfk+2EXfu0rQCLjEaNvqNSf/2TM=;
 b=LjY9bNlu8BVJ6SO57j6FaWxELeR9rmfdDquAQ4aeENsrgdYAzeWCmJCBdxvlJ2EXFE
 VmuWFm6bZAc7a4fCuRVXyLWH2OqL/eRsaTdfYzk/2bkkMCgs2Gmz15GysL5XMm0LITYD
 N12VMPi5ASaRvOlOPTSj2eqPj6P/lfLCsq+7h+oVDUriD4L4f4R9+iuyxFxjCxqS0VUt
 puFBZCaWocmKgmKnvPl2vgW0YuUJIWu42fiVLHhUfPoDOC1Wfn7kg1H5CEGRI8YLnPne
 B104eISW3YMmtYLvxEnwToekcBbhhFVLjg3ICyktn7IxAOExDN1K6Pjnf06PLTbbUQ9Z
 qq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XUZ9yxf5ldyGecmKrfk+2EXfu0rQCLjEaNvqNSf/2TM=;
 b=DiK8VDBOo2XUHhl1Q+CgzRHF2mbqWpd8AB9c0jBGARvTRXD4ZWtL77J8T/6uIAIo+i
 CViaAk3AxeW6JB7F7rsFqqcwinHTwWwEwM2pq9cuREW+H2hZSowvl/1XtowYxLcxONCt
 M48EAokFYXfNgQFK3rHmBCbf7gO+x36XBHYK/bPXBMFHbaUKwJLPRqHAe5/A0CtMzmqg
 YtClTTdja5kNivbQSskNYPMAwjJNSO5QXpQJt0aDEFFtLu7bo93n+apJUGQzgdPLmtX/
 xtisKy3nZ2c/A9aVuYsiyGy5G4x2TPu9j4iKJAoSHOnGMYJZKpiXW8cetogl1p0DDEf5
 Qvow==
X-Gm-Message-State: AOAM530wJJOsc9xfpFAweR5qrbc4SQnbtl88v7pQVvr5NuIMZgLcASbp
 2xUE09DpuSpw7hSArznbK0OD1A==
X-Google-Smtp-Source: ABdhPJyW8FKJ1yTWMtPexaCjgQjRthY0THPUN3hB6MFXUUV+gHZEAiwtrSSToxCzSJP3nWp9n4792A==
X-Received: by 2002:a50:e696:0:b0:419:998d:5feb with SMTP id
 z22-20020a50e696000000b00419998d5febmr1362104edm.122.1649093947676; 
 Mon, 04 Apr 2022 10:39:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a170906284b00b006e108693850sm4644933ejc.28.2022.04.04.10.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:39:07 -0700 (PDT)
Message-ID: <0f8aba9b-9c42-07e0-d524-1096b9675b3c@mind.be>
Date: Mon, 4 Apr 2022 19:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220330205112.1378968-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220330205112.1378968-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libabseil-cpp: fix uclibc-ng
 build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/03/2022 22:51, Fabrice Fontaine wrote:
> Fix the following build failure with uclibc-ng and grpc raised on arm
> and ppc:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libabsl_random_internal_randen_hwaes.so.2111.0.0: undefined reference to `getauxval'
> 
> Strangely enough it seems there is only one autobuilder failure despite
> the fact that libabseil-cpp is unconditionally using getauxval since its
> addition in commit 93568440eda120b12bcbfe267af8f0182484c3b6:
> https://github.com/abseil/abseil-cpp/blob/20200225/absl/random/internal/randen_detect.cc
> 
> Perhaps this build failure is an unexpected side effect of commit
> 8251d8c2559b25f11684776fc343059cf100657d
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/775f3ca3dedebff29e212b29dfa896b7613b7a02
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0002-fix-build-with-uclibc-ng.patch       | 62 +++++++++++++++++++
>   1 file changed, 62 insertions(+)
>   create mode 100644 package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch
> 
> diff --git a/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch b/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch
> new file mode 100644
> index 0000000000..0797d8e51b
> --- /dev/null
> +++ b/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch
> @@ -0,0 +1,62 @@
> +From b9ad9bbfed92199a1a58504306d026cd2597539e Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 30 Mar 2022 21:56:20 +0200
> +Subject: [PATCH] Fix build with uclibc-ng (#1145)
> +
> +uclibc-ng doesn't provide getauxval which results in the following build
> +failure on arm or ppc with any user of abseil-cpp such as grpc:
> +
> +/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libabsl_random_internal_randen_hwaes.so.2111.0.0: undefined reference to `getauxval'
> +
> +To fix this build failure, check that __UCLIBC__ is not defined before
> +using getauxval (as Babel is not able to check function availability)
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/775f3ca3dedebff29e212b29dfa896b7613b7a02
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/abseil/abseil-cpp/commit/b9ad9bbfed92199a1a58504306d026cd2597539e]
> +---
> + absl/debugging/internal/vdso_support.cc | 2 +-
> + absl/random/internal/randen_detect.cc   | 7 ++++++-
> + 2 files changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/absl/debugging/internal/vdso_support.cc b/absl/debugging/internal/vdso_support.cc
> +index c655cf452..e63ac4a3b 100644
> +--- a/absl/debugging/internal/vdso_support.cc
> ++++ b/absl/debugging/internal/vdso_support.cc
> +@@ -33,7 +33,7 @@
> + #endif
> + #include <unistd.h>
> +
> +-#if defined(__GLIBC__) && \
> ++#if !defined(__UCLIBC__) && defined(__GLIBC__) && \
> +     (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
> + #define ABSL_HAVE_GETAUXVAL
> + #endif
> +diff --git a/absl/random/internal/randen_detect.cc b/absl/random/internal/randen_detect.cc
> +index 9bb58fc68..6dababa35 100644
> +--- a/absl/random/internal/randen_detect.cc
> ++++ b/absl/random/internal/randen_detect.cc
> +@@ -24,6 +24,11 @@
> +
> + #include "absl/random/internal/platform.h"
> +
> ++#if !defined(__UCLIBC__) && defined(__GLIBC__) && \
> ++    (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
> ++#define ABSL_HAVE_GETAUXVAL
> ++#endif
> ++
> + #if defined(ABSL_ARCH_X86_64)
> + #define ABSL_INTERNAL_USE_X86_CPUID
> + #elif defined(ABSL_ARCH_PPC) || defined(ABSL_ARCH_ARM) || \
> +@@ -31,7 +36,7 @@
> + #if defined(__ANDROID__)
> + #define ABSL_INTERNAL_USE_ANDROID_GETAUXVAL
> + #define ABSL_INTERNAL_USE_GETAUXVAL
> +-#elif defined(__linux__)
> ++#elif defined(__linux__) && defined(ABSL_HAVE_GETAUXVAL)
> + #define ABSL_INTERNAL_USE_LINUX_GETAUXVAL
> + #define ABSL_INTERNAL_USE_GETAUXVAL
> + #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
