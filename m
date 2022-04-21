Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE0CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90614409EC;
	Thu, 21 Apr 2022 17:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ai6BO1jdwrAC; Thu, 21 Apr 2022 17:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F64D4046B;
	Thu, 21 Apr 2022 17:57:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FAC01BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D3F883148
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsY1AYee0Ong for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:57:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5074C830E2
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 17:57:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t6so4321096wra.4
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+P/NrMIhN5T5Gmkcoe9xIq3ozmMf/SdTd54lz82dlW0=;
 b=Ke0RrBqARmIuqdReU8Sc0J+hx4mTxbVPPg5JG7y7F1GcGrD5ffIeZh9BtUntAnEX/r
 jXVtANCet9OmSWxVYYXktUrdJmotSkVdguzT5aR9pYzjl1IRBI1vJTiUAfedSwNfLMas
 ZqKh/8aKst0rIc8TIf3r7HxkWAIDzAJVG6spCrAf0p2q4VLKX8ScyLuGiDpqsrPerNLj
 WPDJlLXbHpnJtNKztGIteT5dzv/SDlr9SzzIs1lCcFu+UU76uN8AFR611qQNrPXmdXBK
 TYn58gjPk3+KkTIv5sfb3slyLgRLJ+I/2XCNc4Uyo3YhlmIiaTA3U6vLOVU1XXebHYlt
 pjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+P/NrMIhN5T5Gmkcoe9xIq3ozmMf/SdTd54lz82dlW0=;
 b=FAWPbGjGVnZeZzyS6d9wkNW5fBIL0FNtZSaAC+N86HOy1hRBniZreGMpHChx/yDLAc
 UVbOJJUKqVQ2TCGlMVJP6M1zcwankVMc+rqnP8YFqKTR69mqG65GEP5KdxSSnZi0LNBz
 EDhYhJYVEbJL2cXs0WzyUfiOiEio0vgno9CY1QrCqFR37YQAORce8eAlujvenCyyjhqr
 DmSX6v7HXA3py2mB/Sz506Mrkf4mgvR8xgpLMq3Na5wQf6xXXDMwJjc0iOZEFwTHrg0+
 NNWKISiBlmitEkmKP2vMg+/XwLTX205DNmaH+GlK6vDFo00JypRMIKC/rM8gXGag7zCE
 gJKw==
X-Gm-Message-State: AOAM533FIISILqWuJRRGyxZYxnzPXJAt82cz93Ov6Fj1Rg2HXQSAdoIj
 A89Wyb/k3hDiiA03uBCrBer44gkYzBiTFA==
X-Google-Smtp-Source: ABdhPJxzqycTNhDsUUJFPZYJhFvlW16lwoB+HjE1XpPUKwoiBV5j+JGRKDRtWrujuNZsRCT9+HY5lw==
X-Received: by 2002:a05:6000:2c9:b0:20a:8f9f:4a08 with SMTP id
 o9-20020a05600002c900b0020a8f9f4a08mr647411wry.297.1650563846489; 
 Thu, 21 Apr 2022 10:57:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056000186500b0020a8688963bsm3665251wri.89.2022.04.21.10.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:57:25 -0700 (PDT)
Message-ID: <7cba12b4-c45f-8c1c-3584-6eed95cd5522@mind.be>
Date: Thu, 21 Apr 2022 19:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220412182242.1452070-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220412182242.1452070-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: fix build with
 libressl >= 2.8.0
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/04/2022 20:22, Fabrice Fontaine wrote:
> Fix the following build failure with libressl >= 2.8.0 raised since
> https://github.com/libressl-portable/openbsd/commit/703abab3212b397d500bd8c2f5f7ee6b03feb159:
> 
> /nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c: In function 'add_certificate_to_store':
> /nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c:961:24: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>    961 |             bio_method = BIO_s_mem();
>        |                        ^
> cc1: all warnings being treated as errors
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/873f86fb2311ed29a791140f2341943475985fcc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...apters-fix-build-with-libressl-2.8.0.patch | 85 +++++++++++++++++++
>   1 file changed, 85 insertions(+)
>   create mode 100644 package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch
> 
> diff --git a/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch b/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch
> new file mode 100644
> index 0000000000..e2a241bffe
> --- /dev/null
> +++ b/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch
> @@ -0,0 +1,85 @@
> +From 43b313988d66de144a528e4cf57827df1e8c692d Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 12 Apr 2022 20:00:36 +0200
> +Subject: [PATCH] adapters: fix build with libressl >= 2.8.0 (#589)
> +
> +Fix the following build failure with libressl >= 2.8.0 raised since
> +https://github.com/libressl-portable/openbsd/commit/703abab3212b397d500bd8c2f5f7ee6b03feb159:
> +
> +/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c: In function 'add_certificate_to_store':
> +/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c:961:24: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
> +  961 |             bio_method = BIO_s_mem();
> +      |                        ^
> +cc1: all warnings being treated as errors
> +
> +Fix #585
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/873f86fb2311ed29a791140f2341943475985fcc
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/Azure/azure-c-shared-utility/commit/43b313988d66de144a528e4cf57827df1e8c692d]
> +---
> + adapters/tlsio_openssl.c                | 2 +-
> + adapters/x509_openssl.c                 | 4 ++--
> + tests/x509_openssl_ut/x509_openssl_ut.c | 4 ++--
> + 3 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/c-utility/adapters/tlsio_openssl.c b/c-utility/adapters/tlsio_openssl.c
> +index 4a3df8496..aa48ce52d 100644
> +--- a/c-utility/adapters/tlsio_openssl.c
> ++++ b/c-utility/adapters/tlsio_openssl.c
> +@@ -953,7 +953,7 @@ static int add_certificate_to_store(TLS_IO_INSTANCE* tls_io_instance, const char
> +         }
> +         else
> +         {
> +-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
> ++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
> +             const BIO_METHOD* bio_method;
> + #else
> +             BIO_METHOD* bio_method;
> +diff --git a/c-utility/adapters/x509_openssl.c b/c-utility/adapters/x509_openssl.c
> +index 5a9e5ac29..46195b403 100644
> +--- a/c-utility/adapters/x509_openssl.c
> ++++ b/c-utility/adapters/x509_openssl.c
> +@@ -75,7 +75,7 @@ static int load_certificate_chain(SSL_CTX* ssl_ctx, const char* certificate)
> +                 // certificates.
> +
> +                 /* Codes_SRS_X509_OPENSSL_07_006: [ If successful x509_openssl_add_ecc_credentials shall to import each certificate in the cert chain. ] */
> +-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
> ++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
> +                 SSL_CTX_clear_extra_chain_certs(ssl_ctx);
> + #else
> +                 if (ssl_ctx->extra_certs != NULL)
> +@@ -345,7 +345,7 @@ int x509_openssl_add_certificates(SSL_CTX* ssl_ctx, const char* certificates)
> +         else
> +         {
> +             /*Codes_SRS_X509_OPENSSL_02_012: [ x509_openssl_add_certificates shall get the memory BIO method function by calling BIO_s_mem. ]*/
> +-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
> ++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
> +             const BIO_METHOD* bio_method;
> + #else
> +             BIO_METHOD* bio_method;
> +diff --git a/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c b/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
> +index b3349f6b0..f73191e3f 100644
> +--- a/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
> ++++ b/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
> +@@ -348,7 +348,7 @@ BEGIN_TEST_SUITE(x509_openssl_unittests)
> +         STRICT_EXPECTED_CALL(BIO_new_mem_buf((void*)TEST_PUBLIC_CERTIFICATE, -1));
> +         STRICT_EXPECTED_CALL(PEM_read_bio_X509_AUX(IGNORED_PTR_ARG, NULL, NULL, NULL));
> +         STRICT_EXPECTED_CALL(SSL_CTX_use_certificate(IGNORED_PTR_ARG, IGNORED_PTR_ARG));
> +-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
> ++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
> +         // Actual macro name: SSL_CTX_clear_extra_chain_certs:
> +         STRICT_EXPECTED_CALL(SSL_CTX_ctrl(TEST_SSL_CTX_STRUCTURE, SSL_CTRL_CLEAR_EXTRA_CHAIN_CERTS, 0, NULL));
> + #endif
> +@@ -537,7 +537,7 @@ BEGIN_TEST_SUITE(x509_openssl_unittests)
> +
> +         umock_c_negative_tests_snapshot();
> +
> +-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
> ++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
> +     #ifdef __APPLE__
> +         size_t calls_cannot_fail_rsa[] = { 4, 5, 6, 10, 12, 13, 14 };
> +         size_t calls_cannot_fail_ecc[] = { 3, 4, 8, 10, 11, 12} ;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
