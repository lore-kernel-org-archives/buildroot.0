Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FCDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF8AF402E2;
	Wed, 27 Apr 2022 19:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t94aDzJfeSUU; Wed, 27 Apr 2022 19:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A4BE40400;
	Wed, 27 Apr 2022 19:35:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 474D61BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3526E60A75
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ss6lPPPWyYGr for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:34:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 597B7600BA
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:34:58 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gh6so5485264ejb.0
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XqUq055jsGcbRU3Bl1pXufer9hdm5/5Ksn/oDcNv++0=;
 b=CrHkPJ4SiROUMiPVhRGx2BBenw3dLdHVP1kR70iKw4CzSq+QyWMfCxMyR9vGeTMXGh
 N5Hb8tEhUElKh/vKRdW6/xoj0+USO0VbMq7IKGx0y1ySS3phGBJi7Ru78CUbnyRm3jUp
 sCMiZ3RAnwba8j4W8xbUIqRxCfgaJm5QwQhWNLJIlTq7wRxMtvD0KKoAoPtpNujwDyDO
 bE/ZIDOHI7xBpmkSlHNlnytWDkv2g4mUv0ey2kDlScDTdGg6vtOB0/AENZpH/UMtLWdy
 bwKpLJiO7F+D5cQTI52s46Oze2wFeUp9zHPHR5Vk58puzA/ETp0sXpDR67GML8yrJP5L
 YPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XqUq055jsGcbRU3Bl1pXufer9hdm5/5Ksn/oDcNv++0=;
 b=bt3Sdc/NrTALz6jGWZxwYNFrTsMY4EVtcx8lY9cSNDALqjCRMFuDO4BLETQVcnlf7h
 3nVylcst/4CyPdoRN35LSe5N3btjyNwwEGW3kh68rf/d10p48O+xQreTVoB7TJWCUQp0
 JMBYlEMblxHKCGPOXsM6dcv5KyGyPAhZ6PeO9GcLJYM1XarJXjUxHTKRAYuT5XbKEx00
 8Ffjv06CzVaweznv4xe9IqhZchfRiwCwOlRACGJ8KSPtGfT85+IkCpDN5OI88A6C69/r
 /JjRtjlD8Y1hZhjg+K6/jTSzhd0WATWujMY5hmRLG9Y/tLk4yB6HwYKHaLMzC20qqVem
 sqFQ==
X-Gm-Message-State: AOAM531ShXetQmrGRRuhjH/LLCjGDP0cL380sHQ1OrKbIvVwJkvIsY+g
 ip7Jc2sQw7Ai/IEafZhlYvZcgw==
X-Google-Smtp-Source: ABdhPJzw2vOrWI/SqhmFhawif5djQqLsM+N5ooiGDIvo1f87NBz/R4OMVW4xdBiYNfDg8EyaUt58ag==
X-Received: by 2002:a17:907:7f8d:b0:6db:7227:daea with SMTP id
 qk13-20020a1709077f8d00b006db7227daeamr27906516ejc.100.1651088096211; 
 Wed, 27 Apr 2022 12:34:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a056402064500b0042617ba63a0sm87792edx.42.2022.04.27.12.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:34:55 -0700 (PDT)
Message-ID: <0aed2ce7-a7bb-38e3-d15c-2637cd6a5cb1@mind.be>
Date: Wed, 27 Apr 2022 21:34:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220426173403.545488-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426173403.545488-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libevent: fix build with
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 19:34, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> In file included from bufferevent_openssl.c:68:
> bufferevent_openssl.c: In function 'bio_bufferevent_free':
> openssl-compat.h:44:28: error: invalid use of incomplete typedef 'BIO' {aka 'struct bio_st'}
>     44 | #define BIO_get_init(b) (b)->init
>        |                            ^~
> bufferevent_openssl.c:124:7: note: in expansion of macro 'BIO_get_init'
>    124 |   if (BIO_get_init(b) && BIO_get_data(b))
>        |       ^~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/273f9aa354a08ef3af6140b8dec086408bf5d574
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...define-BIO_get_init-for-LibreSSL-3-5.patch | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch
> 
> diff --git a/package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch b/package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch
> new file mode 100644
> index 0000000000..33c349b11d
> --- /dev/null
> +++ b/package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch
> @@ -0,0 +1,29 @@
> +From 883630f76cbf512003b81de25cd96cb75c6cf0f9 Mon Sep 17 00:00:00 2001
> +From: Theo Buehler <tb@openbsd.org>
> +Date: Sun, 21 Nov 2021 21:38:20 +0100
> +Subject: [PATCH] Don't define BIO_get_init() for LibreSSL 3.5+
> +
> +BIO_get_init() is available in LibreSSL 3.5 and later. The BIO type
> +will become opaque, so the existing macro will break the build.
> +
> +[Retrieved from:
> +https://github.com/libevent/libevent/commit/883630f76cbf512003b81de25cd96cb75c6cf0f9]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + openssl-compat.h | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/openssl-compat.h b/openssl-compat.h
> +index a23e34251b..f5de25539f 100644
> +--- a/openssl-compat.h
> ++++ b/openssl-compat.h
> +@@ -40,7 +40,8 @@ static inline BIO_METHOD *BIO_meth_new(int type, const char *name)
> + #endif /* (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
> + 	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L) */
> +
> +-#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x20700000L
> ++#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x20700000L && \
> ++	LIBRESSL_VERSION_NUMBER < 0x30500000L
> + #define BIO_get_init(b) (b)->init
> + #endif
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
