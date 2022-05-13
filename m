Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF501C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AD464027A;
	Fri, 13 May 2022 22:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eNk2MpuYBw5; Fri, 13 May 2022 22:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E633403A4;
	Fri, 13 May 2022 22:12:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C249D1BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0CBD60806
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WD_sYCNnyG77 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BBB060AC1
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:25 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z19so11460981edx.9
 for <buildroot@buildroot.org>; Fri, 13 May 2022 15:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=MbnG8nlc2a4OjcLw1B9w3ghidMA8PNtWw++2d0FJaog=;
 b=aDZjPorhDIlwC3KLZIYwQmYlv3J4RX3YfId6z+H5iQR0TiGVldnrMKYoh+zx1LACNL
 tSJjpVB2UA0xccG7WmhY0OF8xRvpdHO13E1zH9j3FtPv7fPM+UVMPkvCAcFpBFrYzFbw
 7F+U90Bms2zJxCz8gnWSZNQf1dgva9N0QDRJWP6AgvLLV2Hl2YnluzeCSUkw8hDWDSEW
 6d3SuYsPeGgg5IIU6Z3l3xh3dUaioLklXu81Q+ZjC8bfQoNEqWtGqa3z4vqtRgzzJEPJ
 oZ0+vTms67IP/x4/PEgBOam6FFs25Sb48rB5Xn6hZSw+2a8vteyUNNGBrMw8rBZSkNdZ
 qTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MbnG8nlc2a4OjcLw1B9w3ghidMA8PNtWw++2d0FJaog=;
 b=tyxj9EBYFmcjfNh6WSOsFr7+GAWy0PQ8VU3N8r1fB4F9binucdz38kECB4ETHKxffJ
 C9e82uRGBcbJh5/LY0ZS7bNAa+MgfRsQrEUNABm3pmy+e9qslWQ/ZcaUnThpTDcU3rig
 DKO/imKaoTU5v65ter9hOMKV4Np7e5Z5HGhvTv4XJwHaJZ3NwSHsUhDjd2VQQ0tRWIgP
 H8xPEaUXvhN0JUJjHk2rd7WutQ4mcNQRIGCVeW/3f4mS1SH0kTYIbu+1eI4icBVFSGAG
 KKryGTK5aoth2L0AhBx2B1yqT0vl1TRJRiuIogOD1X1HAF14XIGdOaSya8ClT5zqiRnh
 49LQ==
X-Gm-Message-State: AOAM531I9XEuaToTPZP5ylPMufyiHwXeky9JNZGhLEhr4faHxK4MpLxC
 Fbg1y8wLkb18fN2uAdgeg/IZJg==
X-Google-Smtp-Source: ABdhPJxXn+0gDuYnG2Q41OkTzz2GGzoaeyaA5xiVEJFfmzKWkBX/AR1BB0JWEPhXzFYqmRdrPjHbtA==
X-Received: by 2002:a05:6402:4408:b0:427:ab6f:a383 with SMTP id
 y8-20020a056402440800b00427ab6fa383mr781490eda.249.1652479883535; 
 Fri, 13 May 2022 15:11:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a50c3c6000000b0042617ba63besm1420182edf.72.2022.05.13.15.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 15:11:23 -0700 (PDT)
Message-ID: <cf810e8a-2295-b438-f88d-ecbeba6bbf47@mind.be>
Date: Sat, 14 May 2022 00:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220505210151.9244-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505210151.9244-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkcs11-helper: fix build with
 libressl >= 3.5.0
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



On 05/05/2022 23:01, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> pkcs11h-openssl.c: In function 'DSA_meth_set1_name':
> pkcs11h-openssl.c:239:41: error: invalid use of incomplete typedef 'DSA_METHOD' {aka 'struct dsa_method'}
>    239 |  rv = _pkcs11h_mem_strdup ((void *)&meth->name, name);
>        |                                         ^~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/9b0d3bf7d97696c7be6de1724daaba196626b865
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...5-0-does-not-have-DSA_meth_set1_name.patch | 69 +++++++++++++++++++
>   package/pkcs11-helper/pkcs11-helper.mk        |  2 +
>   2 files changed, 71 insertions(+)
>   create mode 100644 package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
> 
> diff --git a/package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch b/package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
> new file mode 100644
> index 0000000000..21ce66ae79
> --- /dev/null
> +++ b/package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
> @@ -0,0 +1,69 @@
> +From 17d10b0dfb2b56a047db307687640adcd560e199 Mon Sep 17 00:00:00 2001
> +From: Alon Bar-Lev <alon.barlev@gmail.com>
> +Date: Mon, 2 May 2022 21:26:58 +0300
> +Subject: [PATCH] openssl: libressl-3.5.0 does not have DSA_meth_set1_name
> +
> +while it does not expose the DSA_METHOD structure.
> +
> +[Retrieved (and updated to remove ChangeLog update) from:
> +https://github.com/OpenSC/pkcs11-helper/commit/17d10b0dfb2b56a047db307687640adcd560e199]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + ChangeLog             |  1 +
> + configure.ac          | 16 ++++++++++++++++
> + lib/pkcs11h-openssl.c |  4 ++++
> + 3 files changed, 21 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 716bb8d8..57697a3b 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -300,7 +300,9 @@ if test "${have_openssl}" = "no"; then
> + fi
> +
> + if test "${have_openssl}" = "yes"; then
> ++	old_CFLAGS="${CFLAGS}"
> + 	old_LIBS="${LIBS}"
> ++	CFLAGS="${CFLAGS} ${OPENSSL_CFLAGS}"
> + 	LIBS="${LIBS} ${OPENSSL_LIBS}"
> + 	AC_CHECK_FUNCS([ \
> + 		RSA_meth_dup RSA_meth_free \
> +@@ -344,6 +346,20 @@ if test "${have_openssl}" = "yes"; then
> + 	)
> + 	AC_MSG_CHECKING([for OpenSSL ec support])
> + 	AC_MSG_RESULT([${openssl_ec}])
> ++	# https://github.com/OpenSC/pkcs11-helper/pull/55
> ++	AC_COMPILE_IFELSE(
> ++		[AC_LANG_PROGRAM(
> ++			[[#include <openssl/dsa.h>]],
> ++			[[
> ++				int foo() {
> ++					DSA_METHOD *meth = NULL;
> ++					sizeof(meth->name);
> ++				}
> ++			]]
> ++		)],
> ++		[AC_DEFINE([HAVE_DSA_METHOD_NAME], [1], [Have DSA_METHOD->name])]
> ++	)
> ++	CFLAGS="${old_CFLAGS}"
> + 	LIBS="${old_LIBS}"
> + fi
> +
> +diff --git a/lib/pkcs11h-openssl.c b/lib/pkcs11h-openssl.c
> +index 961c955c..38ee8e2d 100644
> +--- a/lib/pkcs11h-openssl.c
> ++++ b/lib/pkcs11h-openssl.c
> +@@ -235,9 +235,13 @@ DSA_meth_free (DSA_METHOD *meth)
> + static int
> + DSA_meth_set1_name (DSA_METHOD *meth, const char *name)
> + {
> ++#ifdef HAVE_DSA_METHOD_NAME
> + 	CK_RV rv;
> + 	rv = _pkcs11h_mem_strdup ((void *)&meth->name, name);
> + 	return rv == CKR_OK ? 1 : 0;
> ++#else
> ++	return 0;
> ++#endif
> + }
> + #endif
> +
> diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
> index 4fc3e21e5a..f8fe54ecf5 100644
> --- a/package/pkcs11-helper/pkcs11-helper.mk
> +++ b/package/pkcs11-helper/pkcs11-helper.mk
> @@ -11,6 +11,8 @@ PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
>   PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
>   PKCS11_HELPER_DEPENDENCIES = host-pkgconf
>   PKCS11_HELPER_INSTALL_STAGING = YES
> +# We're patching configure.ac
> +PKCS11_HELPER_AUTORECONF = YES
>   
>   PKCS11_HELPER_CONF_OPTS = \
>   	--disable-crypto-engine-polarssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
