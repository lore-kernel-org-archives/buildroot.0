Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00540C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B402460F20;
	Sat, 14 May 2022 09:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFW7HteLmiVx; Sat, 14 May 2022 09:49:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE65660F0A;
	Sat, 14 May 2022 09:49:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E79B01BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E444640C5D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FMra-gL93Ag for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:49:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8BB5400EF
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:49:53 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id d6so12593158ede.8
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uLGsKD1nvYiMxGAv400Izf7C2ygTZx1leOgFvRzj+lg=;
 b=KV0KAAO4GDAAiWh+7mtPBi1Xan+Ne2bk98yGkLE6UX2wPMy5NZHZrPG3MFOff9kOTH
 QbzvmiJyQqU9Xa6scesDFzaGWBARKYMqYwF9mFPUXhQu1+iAHrDWm+OliNmPMtKmqeBc
 /LuPIfpGzJDCPpu87nMZQXEdi6tkp5CgYdSffQs195yPdhiGJo5Vwaenwi+EqbJK0DTT
 9QFs+PqU4DXorxpyCzWOnECa5Hsueo/XCuAGePAgeHH3mtUY5ATzQCTEKaAq9UTIrT0Z
 aDhVr4by7aanWETtUpg7SRtfOeyq8ovymL7xY8HqXlQU9QTLF9KpbxVzlh18rd0S6gKU
 rUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uLGsKD1nvYiMxGAv400Izf7C2ygTZx1leOgFvRzj+lg=;
 b=j3cY4gO4DcwSPeYVQSL+Be6VGoWG6BGrCV0zzg3YqJm7OEQhFS2QHj7TyYJd9l68xS
 9XTY/2ZRMo1PtmB8SbRmnClm6cscK727HUQbeAmmoqPhT8rivh1ssQV80VUPmCNySAb7
 LotvnqC9bsi3VTW048rlt3tQzuvjho/5BBDyGKyLRvXCdwFxL6X+a4JdPw7/Cs37hd6T
 HOzmqaxuKhNJk6lNC/AnOGS8f+NFf8jWfkQJakiKR8/+WoHheoSPLXltt8mCTwS3zesS
 4aH68scADCX84+Jsnz0kHTr5q+Dyqdi87FD42X8lDrhH5sTd7zs6TzjKsOdMFNAVy3lV
 fU/A==
X-Gm-Message-State: AOAM533HZpt1V1HTDmqndncZuDQohmsKOVnEjWSolvtpWyXV45bsnqAK
 S8uS0i9lblUBD4tWmw02if3J5w==
X-Google-Smtp-Source: ABdhPJyB+0DMk52qoakr353OPIsO/6wCB1bUWoLmIO+9OfC8CQWKHsuyHJNBtAGrgcm1sIaNcaLGyA==
X-Received: by 2002:aa7:c14a:0:b0:42a:9ddd:2019 with SMTP id
 r10-20020aa7c14a000000b0042a9ddd2019mr341111edp.43.1652521792082; 
 Sat, 14 May 2022 02:49:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 dq7-20020a170907734700b006f3ef214defsm1585639ejc.85.2022.05.14.02.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:49:51 -0700 (PDT)
Message-ID: <305a6ee6-f1e8-c72b-653d-14cdbd40bc68@mind.be>
Date: Sat, 14 May 2022 11:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220512214716.3021965-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220512214716.3021965-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/freeswitch: fix build with
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/05/2022 23:47, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> crypto/hash/hmac_ossl.c: In function 'srtp_hmac_alloc':
> crypto/hash/hmac_ossl.c:88:55: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
>     88 |         pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
>        |                                                       ^~~~~~~~
> crypto/hash/hmac_ossl.c:97:9: warning: implicit declaration of function 'HMAC_CTX_init'; did you mean 'HMAC_CTX_new'? [-Wimplicit-function-declaration]
>     97 |         HMAC_CTX_init(new_hmac_ctx);
>        |         ^~~~~~~~~~~~~
>        |         HMAC_CTX_new
> crypto/hash/hmac_ossl.c: In function 'srtp_hmac_dealloc':
> crypto/hash/hmac_ossl.c:130:5: warning: implicit declaration of function 'HMAC_CTX_cleanup' [-Wimplicit-function-declaration]
>    130 |     HMAC_CTX_cleanup(hmac_ctx);
>        |     ^~~~~~~~~~~~~~~~
> crypto/hash/hmac_ossl.c:133:40: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
>    133 |     octet_string_set_to_zero(a, sizeof(HMAC_CTX) + sizeof(srtp_auth_t));
>        |                                        ^~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e696ead9ffffa5bb80928d75607bfbb9b263d3c6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-hash-hmac_ossl.c-fix-build-with-lib.patch | 59 +++++++++++++++++++
>   1 file changed, 59 insertions(+)
>   create mode 100644 package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch
> 
> diff --git a/package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch b/package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch
> new file mode 100644
> index 0000000000..eb717fc26d
> --- /dev/null
> +++ b/package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch
> @@ -0,0 +1,59 @@
> +From c8cc6f1773ff370bb14bb963e2f632eef6d6a3c2 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 12 May 2022 23:22:42 +0200
> +Subject: [PATCH] libs/srtp/crypto/hash/hmac_ossl.c: fix build with libressl >=
> + 3.5.0
> +
> +Fix the following build failure with libressl >= 3.5.0:
> +
> +crypto/hash/hmac_ossl.c: In function 'srtp_hmac_alloc':
> +crypto/hash/hmac_ossl.c:88:55: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
> +   88 |         pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
> +      |                                                       ^~~~~~~~
> +crypto/hash/hmac_ossl.c:97:9: warning: implicit declaration of function 'HMAC_CTX_init'; did you mean 'HMAC_CTX_new'? [-Wimplicit-function-declaration]
> +   97 |         HMAC_CTX_init(new_hmac_ctx);
> +      |         ^~~~~~~~~~~~~
> +      |         HMAC_CTX_new
> +crypto/hash/hmac_ossl.c: In function 'srtp_hmac_dealloc':
> +crypto/hash/hmac_ossl.c:130:5: warning: implicit declaration of function 'HMAC_CTX_cleanup' [-Wimplicit-function-declaration]
> +  130 |     HMAC_CTX_cleanup(hmac_ctx);
> +      |     ^~~~~~~~~~~~~~~~
> +crypto/hash/hmac_ossl.c:133:40: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
> +  133 |     octet_string_set_to_zero(a, sizeof(HMAC_CTX) + sizeof(srtp_auth_t));
> +      |                                        ^~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/e696ead9ffffa5bb80928d75607bfbb9b263d3c6
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + libs/srtp/crypto/hash/hmac_ossl.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/libs/srtp/crypto/hash/hmac_ossl.c b/libs/srtp/crypto/hash/hmac_ossl.c
> +index 8146438b05..6730cbb35c 100644
> +--- a/libs/srtp/crypto/hash/hmac_ossl.c
> ++++ b/libs/srtp/crypto/hash/hmac_ossl.c
> +@@ -79,7 +79,8 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
> +
> + /* OpenSSL 1.1.0 made HMAC_CTX an opaque structure, which must be allocated
> +    using HMAC_CTX_new.  But this function doesn't exist in OpenSSL 1.0.x. */
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
> ++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
> +     {
> +         /* allocate memory for auth and HMAC_CTX structures */
> +         uint8_t *pointer;
> +@@ -125,7 +126,8 @@ static srtp_err_status_t srtp_hmac_dealloc(srtp_auth_t *a)
> +
> +     hmac_ctx = (HMAC_CTX *)a->state;
> +
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
> ++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
> +     HMAC_CTX_cleanup(hmac_ctx);
> +
> +     /* zeroize entire state*/
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
