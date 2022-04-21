Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E84CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3ECD83033;
	Thu, 21 Apr 2022 20:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ICohem6Trlur; Thu, 21 Apr 2022 20:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE7083F33;
	Thu, 21 Apr 2022 20:55:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68EB01BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56AB3418AB
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nnDao1-Dv8L0 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:55:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E581B41885
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:55:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso6649405wme.5
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jxi1QmS8OBl19NjEruBpNrdoAGipfn6mOu9Ws4sfR7w=;
 b=JtKRXMMn2b20FKVvMCzmLpL2dpvhIQMZ2CiEEZ0YsyDUarMVQQ2apjaT/Z/E7sM68U
 ds2D0ROFgEp6QXCzaYWaobBI2e3OaUaK86l/UjIRenxEjYOqhgRYLG6e5s7YF69RlxW7
 aKfVdEH/Cy7en94hAyXOhxp79Yi1vAM61QU2VlwrpVzv4FbceWk995qftZOXl+9k7iLG
 NkfjmfeyVt34FRrjyBF5fZA/7xqrR2azNWU6Sz9zxz8qxCyz8Yvc+HEZ5mOz7j4NgKsd
 fWHuI5u5FitMOud3sxaMuV8tRGbzwrkO3BV+GnFkyL8jXJ1zNi/IOXw9F9l0myoWZJ74
 hvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jxi1QmS8OBl19NjEruBpNrdoAGipfn6mOu9Ws4sfR7w=;
 b=IUDc/1kWQNyMhHPSG/vgNGs6ippvy91yagXx7t9v3dNkVa0/mh+1xqrHYZtyVcamRm
 Q7QsLD0P3TpAQnqe/62r1/ZQ23JS1y28j6SlETv137NbVQvPbBS3KL4KTc6RU5h//aFw
 Uz6iM7de9t32GUWERubl57wp0gEskyWip4D0nYJiM1JTv+VH0dFC7qAP87PvoOXXNKwM
 /m9BKp4hzM38K/rdY5Ct1T8Wm/VXPjt2e4iWERimlnYbCWul1QaGX899DTsfbqBPyuTW
 mwIrtfp0T2eDbjpTzmnzpe4OkKF27FDx7nrD99Bkl/lR9ToumzKFTV0oKFAtysIUJrfD
 FFNw==
X-Gm-Message-State: AOAM530i62h/jvM2dIuqin20uWEi9GU9y4TpIm+C1xqNJv2dKBDB1hxR
 DkNzI/Qx+fWXCEH27KV4b18rnw==
X-Google-Smtp-Source: ABdhPJyvKhuYbXuyjcU8BDr14hwuW0gqpTWsy3R6I7VrUBf7sa3Iq8bURArrXLv44iVvEDtuaIsXcA==
X-Received: by 2002:a1c:2c6:0:b0:38f:f280:caa2 with SMTP id
 189-20020a1c02c6000000b0038ff280caa2mr1014927wmc.87.1650574505148; 
 Thu, 21 Apr 2022 13:55:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v18-20020adfc5d2000000b0020589b76704sm92765wrg.70.2022.04.21.13.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:55:04 -0700 (PDT)
Message-ID: <3feeb6eb-412d-c7e2-1407-1bd2395491f9@mind.be>
Date: Thu, 21 Apr 2022 22:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220417202746.110249-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220417202746.110249-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/glorytun: fix aarch64 build
 with uclibc
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
Cc: =?UTF-8?Q?Adrien_Gallou=c3=abt?= <adrien@gallouet.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/04/2022 22:27, Fabrice Fontaine wrote:
> Fix the following aarch64 build failure with uclibc:
> 
> mud/aegis256/aegis256.c:51:10: fatal error: sys/auxv.h: No such file or directory
>     51 | #include <sys/auxv.h>
>        |          ^~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4e1bbd72b9b7e0f9963f6693c3d7bc9a1d24fab4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Add-support-for-Apple-silicon.patch  | 51 +++++++++++++++++++
>   ...s256.c-fix-aarch64-build-with-uclibc.patch | 43 ++++++++++++++++
>   2 files changed, 94 insertions(+)
>   create mode 100644 package/glorytun/0001-Add-support-for-Apple-silicon.patch
>   create mode 100644 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch
> 
> diff --git a/package/glorytun/0001-Add-support-for-Apple-silicon.patch b/package/glorytun/0001-Add-support-for-Apple-silicon.patch
> new file mode 100644
> index 0000000000..6d4b8273f3
> --- /dev/null
> +++ b/package/glorytun/0001-Add-support-for-Apple-silicon.patch
> @@ -0,0 +1,51 @@
> +From 577ae0352d191fa604f861ea2f0847e7c5eda617 Mon Sep 17 00:00:00 2001
> +From: Frank Denis <github@pureftpd.org>
> +Date: Wed, 1 Jul 2020 22:51:43 +0200
> +Subject: [PATCH] Add support for Apple silicon
> +
> +[Retrieved from:
> +https://github.com/angt/aegis256/commit/577ae0352d191fa604f861ea2f0847e7c5eda617]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + aegis256.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/mud/aegis256/aegis256.c b/mud/aegis256/aegis256.c
> +index 9a580bf..75a772c 100644
> +--- a/mud/aegis256/aegis256.c
> ++++ b/mud/aegis256/aegis256.c
> +@@ -36,7 +36,7 @@ typedef __m128i       x128;
> + #define store128(X,Y) _mm_storeu_si128((x128 *)(X), (Y))
> + #define set2x64(X,Y)  _mm_set_epi64x((long long)(X), (long long)(Y))
> +
> +-#elif defined(__linux__) && (defined(__ARM_NEON_FP) || defined(__aarch64__))
> ++#elif (defined(__APPLE__) || defined(__linux__)) && (defined(__ARM_NEON_FP) || defined(__aarch64__))
> +
> + #ifdef __clang__
> + #pragma clang attribute push (__attribute__((target("crypto"))),apply_to=function)
> +@@ -48,7 +48,9 @@ typedef __m128i       x128;
> + #endif
> +
> + #ifdef __ARM_FEATURE_CRYPTO
> ++#ifdef __linux__
> + #include <sys/auxv.h>
> ++#endif
> + #include <arm_neon.h>
> +
> + typedef uint8x16_t    x128;
> +@@ -62,11 +64,15 @@ typedef uint8x16_t    x128;
> + int
> + aegis256_is_available(void)
> + {
> ++#ifdef __linux__
> +     return (getauxval(AT_HWCAP) & HWCAP_AES)
> + #ifdef HWCAP2_AES
> +         || (getauxval(AT_HWCAP2) & HWCAP2_AES)
> + #endif
> +         ;
> ++#else // __APPLE__
> ++    return 1;
> ++#endif
> + }
> +
> + #endif // __ARM_FEATURE_CRYPTO
> diff --git a/package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch b/package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch
> new file mode 100644
> index 0000000000..37ae8a3301
> --- /dev/null
> +++ b/package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch
> @@ -0,0 +1,43 @@
> +From eb22e270a962d4a2da1972304fd8b1216211c9d1 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 16 Apr 2022 23:32:55 +0200
> +Subject: [PATCH] aegis256.c: fix aarch64 build with uclibc
> +
> +Fix the following aarch64 build failure with uclibc:
> +
> +mud/aegis256/aegis256.c:51:10: fatal error: sys/auxv.h: No such file or directory
> +   51 | #include <sys/auxv.h>
> +      |          ^~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/4e1bbd72b9b7e0f9963f6693c3d7bc9a1d24fab4
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/angt/aegis256/commit/eb22e270a962d4a2da1972304fd8b1216211c9d1]
> +---
> + aegis256.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/mud/aegis256/aegis256.c b/mud/aegis256/aegis256.c
> +index 75a772c..4e73fab 100644
> +--- a/mud/aegis256/aegis256.c
> ++++ b/mud/aegis256/aegis256.c
> +@@ -48,7 +48,7 @@ typedef __m128i       x128;
> + #endif
> +
> + #ifdef __ARM_FEATURE_CRYPTO
> +-#ifdef __linux__
> ++#if defined(__linux__) && __has_include("sys/auxv.h")
> + #include <sys/auxv.h>
> + #endif
> + #include <arm_neon.h>
> +@@ -64,7 +64,7 @@ typedef uint8x16_t    x128;
> + int
> + aegis256_is_available(void)
> + {
> +-#ifdef __linux__
> ++#if defined(__linux__) && __has_include("sys/auxv.h")
> +     return (getauxval(AT_HWCAP) & HWCAP_AES)
> + #ifdef HWCAP2_AES
> +         || (getauxval(AT_HWCAP2) & HWCAP2_AES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
