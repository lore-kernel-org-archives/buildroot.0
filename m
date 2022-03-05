Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB90AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 808A4408FB;
	Sat,  5 Mar 2022 14:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUbfZHW57oIP; Sat,  5 Mar 2022 14:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93E5C408F4;
	Sat,  5 Mar 2022 14:56:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E7191BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B8CE60B4B
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omw5EmZ0fclO for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:55:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5276B60B10
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:55:24 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id qa43so23105369ejc.12
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=aNQNIqXrxJtcWJUKFwJT2xpeyZErv198IlA1KmGa6PM=;
 b=YSovOToPrFISrOFQukHKkrYwNop9UsWsJ6fsar5wQ63FJf7fsYEWCyXlrWVN2H0fmD
 kezp2zDHcJppEabCQOL+UsRORKc/plrifPuanA0N8rMn8+xD6vAJ6ZAkMZbnam+77xCo
 4mC5uyVU7GRwVlwg/3M9UXn8zPMbM9WJ7rOknCC7/SDpGHBAKEg9P+pD00S1Y15Avfxz
 kqut2SHoVwr5O3TJGjmyYGp/5zvOBwHpVKCEPcmJMlw0yAwZD7rSmnTgCl10qGDpDqcO
 i2VB7utcZhxOWhQbcPwUf0bKd1U8MvbyHVhOeAeaG9voxRlxfQ/drHVuFntAodT2dZhz
 aOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aNQNIqXrxJtcWJUKFwJT2xpeyZErv198IlA1KmGa6PM=;
 b=OkgdAVbCmckjOk98SZVsWR4He5UqUvba7U05av7rhxbK5bPtgO33CZbiRPAuJlPdMP
 cOkWvVxBZWHkB7qJ9nsFTwtCLDCtXshdt2Q0V4LKZwBb3uXGtB6ZQ3wu0U8l6ToG2jU2
 ldA8cwSc7DH8kLSWC6LjaOA8d/50jGw0d/rb0euEwGsZhBNAoSAmRH5BLCF+QN3mV9Ul
 M+eDiWHVgB20o/Y9LeAaYUPhUD4JLkY6bqrRX92W1Se/Fx35uqWhKY+Ma+5VUCJRnnM/
 2zwGGuxE/xN9+uvGXBQBd5hwm92YGrqkNaPBW4gDHLtMNwZ3izdqQoJ9/Urs3BUoY7mT
 Hnbg==
X-Gm-Message-State: AOAM531iFL2tS6xUH4g176rZ35eeMFQehsfVCOEwxetwSClp0YNjI9SC
 8sD6LW3BhwBGna4KVwtu81tTZg==
X-Google-Smtp-Source: ABdhPJxgJ1Bnnz4dNlYhkFftNk1+iA1il2q0V6StdzWKgE95F4BQMp+9j3kB7MS/E0WczidC7dirQw==
X-Received: by 2002:a17:907:2d22:b0:6da:91fe:15a5 with SMTP id
 gs34-20020a1709072d2200b006da91fe15a5mr3147981ejc.448.1646492122454; 
 Sat, 05 Mar 2022 06:55:22 -0800 (PST)
Received: from ?IPV6:2a02:1811:b032:6b00:cb7e:b535:458f:f512?
 (ptr-cyunlkwzu35hsouvwnm.18120a2.ip6.access.telenet.be.
 [2a02:1811:b032:6b00:cb7e:b535:458f:f512])
 by smtp.gmail.com with ESMTPSA id
 hg11-20020a1709072ccb00b006cee4fb36c7sm2991693ejc.64.2022.03.05.06.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 06:55:21 -0800 (PST)
Message-ID: <80abb66f-709f-a91d-d183-c9a72693428a@mind.be>
Date: Sat, 5 Mar 2022 15:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220217135539.3784058-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220217135539.3784058-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/safeclib: disable tests
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



On 17/02/2022 14:55, Fabrice Fontaine wrote:
> Disable tests to avoid the following build failure raised since bump to
> version 3.7.1 in commit cc27267ae41bf44276c63b1e86042c4fae4adf50 and
> https://github.com/rurban/safeclib/commit/b90c52b1691fe82ce0a0681a503e1d45584f0162:
> 
> In file included from perf_memcpy32_s.c:7:
> perf_private.h: In function 'rdtsc':
> perf_private.h:72:3: error: 'asm' undeclared (first use in this function)
>     72 |   asm volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
>        |   ^~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ceb13c071b1461eb6d73f5940d6b010095127f41
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  The patch was rejected upstream, and instead the underlying issue was fixed. 
Care to submit the upstream patch instead?

  Regards,
  Arnout

> ---
>   .../0001-Add-an-option-to-disable-tests.patch | 66 +++++++++++++++++++
>   package/safeclib/safeclib.mk                  |  4 +-
>   2 files changed, 69 insertions(+), 1 deletion(-)
>   create mode 100644 package/safeclib/0001-Add-an-option-to-disable-tests.patch
> 
> diff --git a/package/safeclib/0001-Add-an-option-to-disable-tests.patch b/package/safeclib/0001-Add-an-option-to-disable-tests.patch
> new file mode 100644
> index 0000000000..420578fe2e
> --- /dev/null
> +++ b/package/safeclib/0001-Add-an-option-to-disable-tests.patch
> @@ -0,0 +1,66 @@
> +From 55b861a098434843f5614adcaab469defed95321 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 17 Feb 2022 14:36:51 +0100
> +Subject: [PATCH] Add an option to disable tests
> +
> +Add an option to disable tests which are not always needed (e.g. on
> +embedded systems) and can raise the following build failure on some
> +architectures such as ARM cortex-a9:
> +
> +In file included from perf_memcpy32_s.c:7:
> +perf_private.h: In function 'rdtsc':
> +perf_private.h:72:3: error: 'asm' undeclared (first use in this function)
> +   72 |   asm volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
> +      |   ^~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/ceb13c071b1461eb6d73f5940d6b010095127f41
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/rurban/safeclib/pull/115]
> +---
> + Makefile.am  |  6 +++++-
> + configure.ac | 10 ++++++++++
> + 2 files changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 429a84b2..7d14afb6 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -34,7 +34,11 @@
> + ACLOCAL_AMFLAGS = -I m4 --install ${ACLOCAL_FLAGS}
> +
> + # Sub-directories to preform recursive make in
> +-SUBDIRS = src tests
> ++SUBDIRS = src
> ++
> ++if ENABLE_TESTS
> ++SUBDIRS += tests
> ++endif
> +
> + # Library header files
> + pkginclude_HEADERS    = \
> +diff --git a/configure.ac b/configure.ac
> +index b7fd03e9..8c8fbee7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -360,6 +360,16 @@ AC_ARG_ENABLE(doc,
> + 	esac], [enable_doc=true])
> + AM_CONDITIONAL(ENABLE_DOC, test "x$enable_doc" = "xtrue")
> +
> ++AC_ARG_ENABLE(tests,
> ++	AS_HELP_STRING([--disable-tests],
> ++	               [disable tests @<:@default=no@:>@]),
> ++	[case "${enableval}" in
> ++	yes) enable_tests=true ;;
> ++	no)  enable_tests=false ;;
> ++	*)   AC_MSG_ERROR([bad value ${enableval} for --enable-tests]) ;;
> ++	esac], [enable_tests=true])
> ++AM_CONDITIONAL(ENABLE_TESTS, test "x$enable_tests" = "xtrue")
> ++
> + dnl for windows dllimport. checking pic_flag DLL_EXPORT would be better,
> + dnl but this is only enabled for the shared objs, and we need it in the config
> + dnl for our tests.
> +--
> +2.34.1
> +
> diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
> index bc58c1a38c..8f909f729b 100644
> --- a/package/safeclib/safeclib.mk
> +++ b/package/safeclib/safeclib.mk
> @@ -11,9 +11,11 @@ SAFECLIB_SOURCE = safeclib-$(SAFECLIB_VERSION).tar.xz
>   SAFECLIB_LICENSE = MIT
>   SAFECLIB_LICENSE_FILES = COPYING
>   SAFECLIB_INSTALL_STAGING = YES
> +# We're patching configure.ac
> +SAFECLIB_AUTORECONF = YES
>   SAFECLIB_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
>   # -fstack-protector-strong is used by default. Disable that so the
>   # BR2_SSP_* options in the toolchain wrapper are used instead
> -SAFECLIB_CONF_OPTS = --disable-hardening
> +SAFECLIB_CONF_OPTS = --disable-hardening --disable-tests
>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
