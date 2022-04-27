Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6B3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E142282B1B;
	Wed, 27 Apr 2022 17:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0C-NrAGzjDd0; Wed, 27 Apr 2022 17:13:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E900D82AC6;
	Wed, 27 Apr 2022 17:13:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 381B61BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2651960B64
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bYKgIK5BKYI for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:13:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F053160783
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:13:16 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g6so4749654ejw.1
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 10:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uX04zHFc/+tLvpEtj907UVXHk2kzdoE0rzcJjfsc3oA=;
 b=NuME7/dnAfqLILZbOrbMdKg4nvN8UyC32HcjhUckPJVXXpFXrBbNL4nGufGVQ5zuHc
 /XaVudqOUAZcskB87X0LyVhD3OqVMBP89VCF5QdlLLU4HEgsrhxXiWrbHryBCR29h7HK
 dp7iUhjIKp8cNhy6XxJUOnENXz+V7YlidDxhID3te3jKBUrC6p3U4+vcfBCoQdSRV+jp
 rAkrrxBNTkpqIs40YfvjLefLY0w7Sm6W8HKkLLTUiCdjU9ngXbPvt9R+lXawai2ZRW43
 XGs7UDRpyc0P3sL3FHUPZ1rjjAXvo8/wW8h92UHK4RWJcOvCgQbwH2OmyAIySqF+dLCt
 X8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uX04zHFc/+tLvpEtj907UVXHk2kzdoE0rzcJjfsc3oA=;
 b=JGyCC0cnIUSyFhw1ZZUrG3Cip9pVWgMLctEwqjvSOyMdzgPYv8FvRTaCi9bKhylq10
 8OgTHRjnnXRaEyn6yOSOp7EtDWC4HotnJS5efWxHIcECrEPwkBGpb8ceXcpC7W1u3QoU
 9JtxN/Z+l67CzFhGB9+iU8o8o6IK5MAy1DnVP9t3tXX/1WyTxcAqC2PbVM6G4fhCJUgH
 NWLTqRa+SSPuLwPD2nlxraDLdsW0dJ3OMeKz7doSA9r/5/BfTlwc1Q2Ae5fA7dGV4Ghh
 PINCr5N5L+9ifwX1beY+M5A+KxQvhJCukSMVOiOMs4tdtlTXnIpRKd8AmUgRIQejnqp9
 N+5w==
X-Gm-Message-State: AOAM533lGJclb2DVxsoAaSH6jh0cio1YO8AxApCuQ76M0IwWgm0DyHRC
 1WIMvMpib9PfctEzqlQpK+UBISZiNVUyHw==
X-Google-Smtp-Source: ABdhPJzigOUhW2mBkueHvmuhVVUzF/TC+ZymvtA0ABI92Y3AOVEjZGsA8TOjDB/0xb+xdxnP49C7Ng==
X-Received: by 2002:a17:906:9b89:b0:6da:ac6b:e785 with SMTP id
 dd9-20020a1709069b8900b006daac6be785mr27993683ejc.295.1651079595173; 
 Wed, 27 Apr 2022 10:13:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170906c18c00b006f3b99d29e0sm2687335ejz.223.2022.04.27.10.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:13:14 -0700 (PDT)
Message-ID: <7675691e-a91c-e28f-21b2-d1350e199de3@mind.be>
Date: Wed, 27 Apr 2022 19:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220424191957.435337-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424191957.435337-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libeXosip2: fix build with
 libressl
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/04/2022 21:19, Fabrice Fontaine wrote:
> Fix the following build failure with libressl >= 3.4.1 raised since
> commit 25ef2c26dabaf1553f1724214a4fa5e3ce48dfc8:
> 
> In file included from eXtl_dtls.c:82:
> /home/autobuild/autobuild/instance-4/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/openssl/ssl.h:1272:6: note: previous declaration of 'SSL_set0_rbio' was here
>   1272 | void SSL_set0_rbio(SSL *s, BIO *rbio);
>        |      ^~~~~~~~~~~~~
> eXtl_dtls.c: In function 'SSL_set0_rbio':
> eXtl_dtls.c:108:17: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
>    108 |   BIO_free_all(s->rbio);
>        |                 ^~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/dfafdbf71b31fbda1b5ba491ac35239af4a20aa2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...dtls.c-fix-build-with-libressl-3.4.1.patch | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch
> 
> diff --git a/package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch b/package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch
> new file mode 100644
> index 0000000000..0b4be43b6c
> --- /dev/null
> +++ b/package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch
> @@ -0,0 +1,43 @@
> +From 4201c0ff3fd75e09025d515c427f85f9fec89621 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 5 Apr 2022 22:27:35 +0200
> +Subject: [PATCH] src/eXtl_dtls.c: fix build with libressl >= 3.4.1
> +
> +Fix the following build failure with libressl >= 3.4.1 which provides
> +SSL_set0_rbio() since
> +https://github.com/libressl-portable/openbsd/commit/c99939f9665a9c3c648682b4987df46600b70efc:
> +
> +In file included from eXtl_dtls.c:82:
> +/home/autobuild/autobuild/instance-4/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/openssl/ssl.h:1272:6: note: previous declaration of 'SSL_set0_rbio' was here
> + 1272 | void SSL_set0_rbio(SSL *s, BIO *rbio);
> +      |      ^~~~~~~~~~~~~
> +eXtl_dtls.c: In function 'SSL_set0_rbio':
> +eXtl_dtls.c:108:17: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
> +  108 |   BIO_free_all(s->rbio);
> +      |                 ^~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/dfafdbf71b31fbda1b5ba491ac35239af4a20aa2
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: sent to amoizard@antisip.com]
> +---
> + src/eXtl_dtls.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/eXtl_dtls.c b/src/eXtl_dtls.c
> +index 07c0dc2..d0bd7dc 100644
> +--- a/src/eXtl_dtls.c
> ++++ b/src/eXtl_dtls.c
> +@@ -102,7 +102,7 @@
> + #define RANDOM "random.pem"
> + #define DHFILE "dh1024.pem"
> +
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3040100L)
> +
> + static void SSL_set0_rbio(SSL *s, BIO *rbio) {
> +   BIO_free_all(s->rbio);
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
