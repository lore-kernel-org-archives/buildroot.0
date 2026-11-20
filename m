Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8F4606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LD2f6JKH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A9E640ADC;
	Fri, 20 Nov 2026 09:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EH34kSMqmZXA; Fri, 20 Nov 2026 09:58:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3932A40E01
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168735;
	b=eam8KAWV9sy0UBZd2o4hO539vrq7U4/snfUBoHXBRMF6u1yPdF252ohm9bM7qDNQ68K2
	 tM64Pkbcs1ObbQOawKQuZAw0QUz0jPsfawdaGvuT5IvDBiIwfq8jzdkBZY6eU/Jfkaqni
	 OilY7cuR0KQfXvCJRhC8yb0c/l3QSsD+oI8ywjfOjEyj8mBX5/Tk4l0utzB/kO39oSUlk
	 ufqZ7TTsfUHq8TPBEFhbbfPL4RUymt5BmTGISvr3YZJgUJVAf69WHkCoJ8oSEi97fRgt/
	 WzSFEtAv7n/qMB7WfVtYfA2zxA2mUdDg2d1JIqb/24N63TuUOrjsHzmued+cWdemsEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168735;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2k9h+xJMpnPyV/FQKsieTqwqbnEz7xXnYRu5Ef5mH+A=;
	b=WwHzNqVZ4/ePNOHH/vRzdPUcxa8glvRXh+XJeyIQsga1KocDO1KWwmZbDrqbrhsoGG7d
	 ut7HFM93Nhapj323asSzVkJqQhl2ANAs5K8nk+xh5z4KwvT848gYd0ETV+vGKtrUdlmw+
	 9HJAZZF2H8volKp/MTN5ksIwUGsJaljvcJdE38P0WgbNEXKdokR6C6FLtSClKaE0N6j8K
	 2jY8c/6YbtPm/Zo6SfVMumOcux1zOPHp8U65sSvvuyqACSmAbJWWuTvR30M24941hwVIP
	 CTWrk6V+kdSOiTGOcYWoByH55PzL9jBujAY0903RH84kII/pzDASgZ+abVvymMnJ0Bw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168735;
	bh=2k9h+xJMpnPyV/FQKsieTqwqbnEz7xXnYRu5Ef5mH+A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LD2f6JKH+iGhYmWCSD8tcgDu/LToqNKj9OnT89eod4IXPYwXDec9mAfBUiBqN07Or
	 AhiFGVIAIqEdg+6BFyKBZN5TGt9b5wbYdrGKKA4l0CIgmooZzU8MvNaygYJ+hSKArx
	 OCgA211OGzoFoxxWONz8wjrpwn2pjv7424AyzdDn8RBXZnEPqHigcJQn+ecQNVz6hV
	 u+dLb28dojDIRBt78eRWvR89l1i+B4rRkX4JSwoEf9bT2ST1b2l9QVSEu+rof4tLxB
	 2aGw8fhf5v+FlNqJ+z8CcuvUfncN7qBrCw8JAzEKzA2ItqqdSTXLmQZIHx+hfMtgy2
	 QnA9H+k6yHFQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3932A40E01;
	Fri, 20 Nov 2026 09:58:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 684F0169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EBF74020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQHWivV15LWB for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:58:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D91D24016D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D91D24016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:52 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4bb68c197c7so8066095e9.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:58:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168731; x=1795773531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iPC53A1VEz/Vi6uliGr0G90uaAiyV9IMzIQw1OLgr/c=;
 b=fIj/nYJa9G6D5mIcv2OKl92Y/Q/LiNN9TEHP8vEQIwNB0wvG+CvAYFced76mq9CLCq
 Jwvm43N6gXo2yJiXDhJM5xYIPPrN1eMSYkg9tALSX5TH5zu/CF8lox5XTpu5JcSHfJ7H
 6H7fWks5EiphtKjbQaBR8KRCAHij+krFpzfkXKmVMraOHryLFQuV+kvDkdNSxCkadd57
 kKEkb77XBTOHzINe8kJKwiWMrp1fFznA8AqxFeDSmxwQ/9u1vDJULFQIK9NrV7BlMB2U
 nycbg/D6wbp+ZuPRJOxoWFFotaxiKVNCCaec6AGfgesg7ItkXPoy55QSafu/N/syy3fn
 kq7Q==
X-Gm-Message-State: APuU4Z+8L/fa2/buGnpDPGzcDIOLXiSSpO5OuEPqGkrwzBRADhD3gREf
 nZJr0GybNIeLyI+CJfXTBpakqYVuJZGBX88Aa2d3mniVZMKVttYWeqel+skYzECVpRo0ZY0YI+d
 LZcSSTXM54g==
X-Gm-Gg: AYBFou1r5jSxFE7s/4QPXOvT+T4oVP5l4sFjfKJ7dwmW+KjfR4EfiF6WTHN9XYjRjZz
 ZASSgtU1Si/qZ93/RAPXVwk85GYVeqpcPWLGNPFZtSt0NIyxwkb13BM4KXteqCs8GxEhiUDlilK
 kSOZec5+I8xXoiPzBKNhBkAFQl3yOfV5yCi/8+r9o69AIlbHVI399howzxruInX1SSrmvTKDOnG
 vc6KuU5AJx57lQQY9v0hTVOgBlZQ0VXT1JPImVFBxL8+TY/WvxV01WMU759wjvNiog3kVx0fLkX
 8PDX8/yQCNiQLW0t44ZJjHaYAnOnoWqKRiasX/ExTjyhbijRKD+dXLwn2SCiUWIDkhNIkhlMUUc
 BnLvFZg9ZGfarTVsTPkwOOnnEdygnZiYiR7TABKi5BQiQQDS0+InAkLnXhdfUtBaTDSzJKSua+Q
 Rg+cmQh20RHA/6yjlb8Qhbgr8u9yLTWWpNzC57GEhCvxaPOd3nH+0nAs2DVf6HTGynl/151bFy/
 7AckEe1Xqrzgrdm4OkMQ2T3sV4I2S0jYALYnS3L4rF6VR6Gmc9BcK1FA/91nrzrZsDdaBU6fhNB
 kynqqivE/B5s2hnUxXfMGZ33lmWP6nCZR6gqJYq3Q0Mw
X-Received: by 2002:a05:600c:1da9:b0:4b1:2026:6b41 with SMTP id
 5b1f17b1804b1-4bb88819294mr55810175e9.30.1795168730613; 
 Fri, 20 Nov 2026 01:58:50 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb895f050asm40190625e9.1.2026.11.20.01.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:58:50 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:58:45 +0100
Message-ID: <20261120095849.538208-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110114907.2273598-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libcurl: fix build on LoongArch
 with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Since libcurl 8.21.0, building the curl tool for loongarch64 with a musl
> toolchain fails with:
> 
> ld: read-only segment has dynamic relocations
> collect2: error: ld returned 1 exit status
> 
> On musl, none of the secure memory zeroing functions curl knows about
> are detected, so curlx_memzero_low() falls back to calling memset()
> through a 'const volatile' function pointer. In non-PIC code, GCC places
> this pointer in .rodata, and on LoongArch the linker emits a dynamic
> R_LARCH_64 relocation against memset() there, i.e. a text relocation.
> musl's dynamic loader does not support DT_TEXTREL, so the Buildroot
> toolchain wrapper links with -z text, which turns it into an error.
> Other architectures resolve the address to a PLT entry at link time and
> are not affected.
> 
> Backport the upstream fix, which detects explicit_bzero() at configure
> time. musl provides it since 1.1.20, so the memset() fallback is no
> longer used. As the patch touches configure.ac and m4/, autoreconf the
> package.
> 
> This issue has been present since commit be2789d08432 ("package/libcurl:
> security bump to version 8.21.0"), which brought in the upstream code
> using the 'const volatile' pointer. It therefore affects 2026.08 and
> later, and 2026.05.x since 2026.05.1.
> 
> Fixes:
> https://autobuild.buildroot.org/results/558c08d552920e45628254bdc029518120a35ae1
> 
> Fixes: be2789d08432da951c0ebfb23b034072601bc8fe ("package/libcurl: security bump to version 8.21.0")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes v1 -> v2:
>   - replace the local patch with the upstream fix, which detects
>     explicit_bzero() at configure time instead (suggested by Viktor
>     Szakats in the upstream review)
>   - autoreconf the package, as the patch touches configure.ac and m4/
> 
>  ...o-detect-explicit_bzero-in-configure.patch | 235 ++++++++++++++++++
>  package/libcurl/libcurl.mk                    |   2 +
>  2 files changed, 237 insertions(+)
>  create mode 100644 package/libcurl/0001-build-auto-detect-explicit_bzero-in-configure.patch
> 
> diff --git a/package/libcurl/0001-build-auto-detect-explicit_bzero-in-configure.patch b/package/libcurl/0001-build-auto-detect-explicit_bzero-in-configure.patch
> new file mode 100644
> index 0000000000..475c55b6e6
> --- /dev/null
> +++ b/package/libcurl/0001-build-auto-detect-explicit_bzero-in-configure.patch
> @@ -0,0 +1,235 @@
> +From e55a7ff40ebe1974735205135dfb3bf9e3db269b Mon Sep 17 00:00:00 2001
> +From: Viktor Szakats <commit@vsz.me>
> +Date: Mon, 9 Nov 2026 19:24:43 +0100
> +Subject: [PATCH] build: auto-detect `explicit_bzero()` in configure
> +
> +Replacing compile-time auto-detection. Mainly due to MUSL, which offers
> +no means to detect its presence or version via the preprocessor,
> +requiring costly configure-time detection.
> +
> +After this patch `explicit_bzero()` is used with MUSL 1.1.20+
> +(2018-09-04), and potentially more platforms which wasn't expliticly
> +opted-in previously.
> +
> +This in turn avoids this link-time error, and suspect toolchain bug,
> +when falling back to the local memzero, combined with LoongArch ld
> +2.45.1 + gcc 16.2.0:
> +```
> +gcc/loongarch64-buildroot-linux-musl/16.2.0/.../loongarch64-buildroot-linux-musl/bin/ld: read-only segment has dynamic relocations
> +```
> +Ref: https://autobuild.buildroot.org/results/558c08d552920e45628254bdc029518120a35ae1
> +
> +Reported-by: Yegor Yefremov
> +Fixes #23844
> +Follow-up to 982e2e8c75f157940ef100f59dea94c4eb607058 #21989
> +Follow-up to 066478f6346a2d987a9ecc3bd3bf45764d69c1c4 #21598
> +
> +Closes #23866
> +
> +Upstream: https://github.com/curl/curl/commit/e55a7ff40ebe1974735205135dfb3bf9e3db269b
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + CMake/unix-cache.cmake     |  9 +++++
> + CMakeLists.txt             |  5 ++-
> + configure.ac               |  6 +++-
> + lib/cf-socket.c            |  4 +++
> + lib/curl_config-cmake.h.in |  3 ++
> + lib/curl_setup.h           | 15 +++------
> + m4/curl-functions.m4       | 67 ++++++++++++++++++++++++++++++++++++++
> + 7 files changed, 96 insertions(+), 13 deletions(-)
> +
> +diff --git a/CMake/unix-cache.cmake b/CMake/unix-cache.cmake
> +index b6b544442046..468bd3e4dc01 100644
> +--- a/CMake/unix-cache.cmake
> ++++ b/CMake/unix-cache.cmake
> +@@ -69,6 +69,15 @@ elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux" OR
> +        CMAKE_SYSTEM_NAME STREQUAL "NetBSD")
> +   set(HAVE_EVENTFD 1)
> + endif()
> ++if(CYGWIN OR
> ++   CMAKE_SYSTEM_NAME STREQUAL "Linux" OR  # glibc 2.25+, MUSL 1.1.20+
> ++   CMAKE_SYSTEM_NAME STREQUAL "DragonFlyBSD" OR  # 5.6+
> ++   CMAKE_SYSTEM_NAME STREQUAL "FreeBSD" OR  # 11 r272673+
> ++   CMAKE_SYSTEM_NAME STREQUAL "OpenBSD")  # 5.5+
> ++  set(HAVE_EXPLICIT_BZERO 1)
> ++elseif(APPLE)
> ++  set(HAVE_EXPLICIT_BZERO 0)
> ++endif()
> + if(ANDROID AND ANDROID_PLATFORM_LEVEL GREATER_EQUAL 34)
> +   set(HAVE_MEMSET_EXPLICIT 1)
> + endif()
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index a9df7a21bc3c..23f21dd37d47 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1739,7 +1739,10 @@ if(NOT WIN32)
> + 
> +   check_symbol_exists("memset_s" "string.h" HAVE_MEMSET_S)
> +   if(NOT HAVE_MEMSET_S)
> +-    check_function_exists("memset_explicit" HAVE_MEMSET_EXPLICIT)
> ++    check_symbol_exists("explicit_bzero" "string.h" HAVE_EXPLICIT_BZERO)
> ++    if(NOT HAVE_EXPLICIT_BZERO)
> ++      check_function_exists("memset_explicit" HAVE_MEMSET_EXPLICIT)
> ++    endif()
> +   endif()
> + endif()
> + 
> +diff --git a/configure.ac b/configure.ac
> +index d6a542311116..ebefb158a27f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -4242,7 +4242,11 @@ if test "$curl_cv_native_windows" != "yes"; then
> + 
> +   CURL_CHECK_FUNC_MEMSET_S
> +   if test "$curl_cv_func_memset_s" = "no"; then
> +-    AC_CHECK_FUNCS([memset_explicit])
> ++    dnl Use complex detection to avoid misdetection on old Linux.
> ++    CURL_CHECK_FUNC_EXPLICIT_BZERO
> ++    if test "$curl_cv_func_explicit_bzero" = "no"; then
> ++      AC_CHECK_FUNCS([memset_explicit])
> ++    fi
> +   fi
> + fi
> + 
> +diff --git a/lib/cf-socket.c b/lib/cf-socket.c
> +index 97b5fa89d219..9073274ba0c2 100644
> +--- a/lib/cf-socket.c
> ++++ b/lib/cf-socket.c
> +@@ -59,6 +59,10 @@
> + #include <inet.h>
> + #endif
> + 
> ++#ifdef __DragonFly__
> ++#include <sys/param.h>  /* for __DragonFly_version */
> ++#endif
> ++
> + #include "urldata.h"
> + #include "curl_trc.h"
> + #include "if2ip.h"
> +diff --git a/lib/curl_config-cmake.h.in b/lib/curl_config-cmake.h.in
> +index 45c5de970dce..dbbbd04fdfb8 100644
> +--- a/lib/curl_config-cmake.h.in
> ++++ b/lib/curl_config-cmake.h.in
> +@@ -234,6 +234,9 @@
> + /* Define to 1 if you have the `opendir' function. */
> + #cmakedefine HAVE_OPENDIR 1
> + 
> ++/* Define to 1 if you have the explicit_bzero function. */
> ++#cmakedefine HAVE_EXPLICIT_BZERO 1
> ++
> + /* Define to 1 if you have the memset_explicit (C23) function. */
> + #cmakedefine HAVE_MEMSET_EXPLICIT 1
> + 
> +diff --git a/lib/curl_setup.h b/lib/curl_setup.h
> +index d4d0f25bfe24..504b21210352 100644
> +--- a/lib/curl_setup.h
> ++++ b/lib/curl_setup.h
> +@@ -1638,9 +1638,8 @@ typedef struct sockaddr_un {
> + #endif
> + 
> + /* For FreeBSD it is included from curl/curl.h */
> +-#if defined(__DragonFly__) || defined(__OpenBSD__) || defined(__NetBSD__)
> +-#include <sys/param.h>  /* for __DragonFly_version, OpenBSD,
> +-                           __NetBSD_Version__ */
> ++#ifdef __NetBSD__
> ++#include <sys/param.h>  /* for __NetBSD_Version__ */
> + #endif
> + 
> + /* NetBSD before 6.1 did not set SS_NBIO for SOCK_NONBLOCK. */
> +@@ -1660,16 +1659,10 @@ typedef struct sockaddr_un {
> + #endif
> + #elif defined(HAVE_MEMSET_S)
> + #define curlx_memzero_low(buf, size)  (void)memset_s(buf, size, 0, size)
> ++#elif defined(HAVE_EXPLICIT_BZERO)
> ++#define curlx_memzero_low(buf, size)  explicit_bzero(buf, size)
> + #elif defined(HAVE_MEMSET_EXPLICIT)
> + #define curlx_memzero_low(buf, size)  (void)memset_explicit(buf, 0, size)
> +-#elif defined(__CYGWIN__) || \
> +-  (defined(__NEWLIB__) && !defined(__CLIB2__)) || \
> +-  (defined(__GLIBC__) && \
> +-    (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 25))) || \
> +-  (defined(__DragonFly__) && __DragonFly_version >= 500600 /* 5.6+ */) || \
> +-  (defined(__FreeBSD__) && __FreeBSD_version >= 1100037 /* 11.0+ */) || \
> +-  (defined(__OpenBSD__) && OpenBSD >= 201405 /* 5.5+ */)
> +-#define curlx_memzero_low(buf, size)  explicit_bzero(buf, size)
> + #elif defined(__NetBSD__) && __NetBSD_Version__ >= 702000000 /* 7.2+ */
> + #define curlx_memzero_low(buf, size)  (void)explicit_memset(buf, 0, size)
> + #endif
> +diff --git a/m4/curl-functions.m4 b/m4/curl-functions.m4
> +index 64046a834afb..2edbdf0fb5f4 100644
> +--- a/m4/curl-functions.m4
> ++++ b/m4/curl-functions.m4
> +@@ -3956,6 +3956,73 @@ AC_DEFUN([CURL_CHECK_FUNC_MEMSET_S], [
> +   fi
> + ])
> + 
> ++dnl CURL_CHECK_FUNC_EXPLICIT_BZERO
> ++dnl -------------------------------------------------
> ++dnl Verify if explicit_bzero is available.
> ++
> ++AC_DEFUN([CURL_CHECK_FUNC_EXPLICIT_BZERO], [
> ++
> ++  tst_links_explicit_bzero="unknown"
> ++  tst_proto_explicit_bzero="unknown"
> ++  tst_compile_explicit_bzero="unknown"
> ++
> ++  AC_MSG_CHECKING([if explicit_bzero can be linked])
> ++  AC_LINK_IFELSE([
> ++    AC_LANG_FUNC_LINK_TRY([explicit_bzero])
> ++  ],[
> ++    AC_MSG_RESULT([yes])
> ++    tst_links_explicit_bzero="yes"
> ++  ],[
> ++    AC_MSG_RESULT([no])
> ++    tst_links_explicit_bzero="no"
> ++  ])
> ++
> ++  if test "$tst_links_explicit_bzero" = "yes"; then
> ++    AC_MSG_CHECKING([if explicit_bzero is prototyped])
> ++    AC_EGREP_CPP([explicit_bzero],[
> ++      $curl_includes_string
> ++    ],[
> ++      AC_MSG_RESULT([yes])
> ++      tst_proto_explicit_bzero="yes"
> ++    ],[
> ++      AC_MSG_RESULT([no])
> ++      tst_proto_explicit_bzero="no"
> ++    ])
> ++  fi
> ++
> ++  if test "$tst_proto_explicit_bzero" = "yes"; then
> ++    AC_MSG_CHECKING([if explicit_bzero is compilable])
> ++    AC_COMPILE_IFELSE([
> ++      AC_LANG_PROGRAM([[
> ++        $curl_includes_string
> ++      ]],[[
> ++        char buf[2];
> ++        explicit_bzero(buf, sizeof(buf));
> ++      ]])
> ++    ],[
> ++      AC_MSG_RESULT([yes])
> ++      tst_compile_explicit_bzero="yes"
> ++    ],[
> ++      AC_MSG_RESULT([no])
> ++      tst_compile_explicit_bzero="no"
> ++    ])
> ++  fi
> ++
> ++  AC_MSG_CHECKING([if explicit_bzero might be used])
> ++  if test "$tst_links_explicit_bzero" = "yes" &&
> ++     test "$tst_proto_explicit_bzero" = "yes" &&
> ++     test "$tst_compile_explicit_bzero" = "yes" &&
> ++     test "x$curl_disallow_explicit_bzero" != "xyes"; then
> ++    AC_MSG_RESULT([yes])
> ++    AC_DEFINE_UNQUOTED(HAVE_EXPLICIT_BZERO, 1,
> ++      [Define to 1 if you have the explicit_bzero function.])
> ++    curl_cv_func_explicit_bzero="yes"
> ++  else
> ++    AC_MSG_RESULT([no])
> ++    curl_cv_func_explicit_bzero="no"
> ++  fi
> ++])
> ++
> + dnl CURL_RUN_IFELSE
> + dnl -------------------------------------------------
> + dnl Wrapper macro to use instead of AC_RUN_IFELSE. It
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 00f718fbec..a8cbe65385 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -14,6 +14,8 @@ LIBCURL_LICENSE = curl
>  LIBCURL_LICENSE_FILES = COPYING
>  LIBCURL_CPE_ID_VENDOR = haxx
>  LIBCURL_INSTALL_STAGING = YES
> +# 0001-build-auto-detect-explicit_bzero-in-configure.patch
> +LIBCURL_AUTORECONF = YES
>  
>  # Likewise, there is no compiler on the target, so libcurl-option (to
>  # generate C code) isn't very useful
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
