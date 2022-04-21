Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086CFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3102417CF;
	Thu, 21 Apr 2022 20:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vI_5dTo5cyHe; Thu, 21 Apr 2022 20:58:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 522F640055;
	Thu, 21 Apr 2022 20:58:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 410201BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DCA460C27
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qeeok6_L4VNF for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:58:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2762260C19
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:58:42 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so6663334wmb.4
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wbv9y9WEg3QpiynndTNpV7KwNazF37PWpumpyiJQp64=;
 b=dsCIz/I3sg2V/r3b6W/1y8EdecmaRZSE5bxp1Wno/Irn0KxlIkJVnaFrjZSb1X+9qP
 bMNqDL1r6G5m25sm1idAdDBTwZHS8ITQ3/SDqKiKy9g/XPjpNO1GRm0QUsAZGsdfU0jh
 V3SZqSXuxi/by5hd498Mhn/7TqUjhf/4Qg8XB+/U/DTgAvA4NgBT837nYjlUNgYmOel3
 plnsLYCfDVI6z6KpViB/NUBZLYdKbITNKQchcSaDxGdeK4AkSS8bzDNZnV0KieOLu//v
 u8fPfj19AKTYZS+EIbAdGCD/rt6/PP1hZzHkgMD/pDyNrVHxwFfELyH6V7eqeFuECtgb
 qRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wbv9y9WEg3QpiynndTNpV7KwNazF37PWpumpyiJQp64=;
 b=HRz3ctSeoYgGNpgD8ipm34waq+XEEBmQWyc/+I6dmsA3duhy3F6ido6YAOQSTmKr9F
 90sEVhC434IJ8ZqwfTDsIJDpoCmjXnxswO8oH9C7SZ7akszp4mJ2PQUadQH9lw3srmW+
 LOUhM+9S2/tD4dtABSV7ufzIut3P8gRd8uMw1zluGviboSiY44PzLosdhCb4lmPEWam0
 +8MLiLKiS2DfllpxlSI2ubRKRZtJMUm2CGB7vJ8tl5cVThUwP4Lyk9FUrtwgYF8QtQvJ
 RwquUKwyiTwtFksuQg550GWfhWVxo7eVS2QAnqpxEUHxMib15ZwvcitQoKpu5djtYL/o
 hh8Q==
X-Gm-Message-State: AOAM533MdSDtFJInW+iYUAeE7prTpzK6z1PlRTpvBDDfuMb23jpFjvHc
 7j+wzHZBhrP0JD6sLOx3NLbuwg==
X-Google-Smtp-Source: ABdhPJxCqP0T5WTHpXrOnoXQpl36YpYul7GVX/TPX1/NEwbE931b8hV6WOdqGmiLMglz6vHmo3n6Tg==
X-Received: by 2002:a7b:cb4b:0:b0:38e:9c4c:9120 with SMTP id
 v11-20020a7bcb4b000000b0038e9c4c9120mr1072172wmj.76.1650574720331; 
 Thu, 21 Apr 2022 13:58:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a5d59a3000000b0020a9132d1fbsm112690wrr.37.2022.04.21.13.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:58:39 -0700 (PDT)
Message-ID: <c3a6b642-035d-6b23-1d84-b04369cd1394@mind.be>
Date: Thu, 21 Apr 2022 22:58:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220418095919.13738-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220418095919.13738-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/keepalived: fix build with
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
Cc: Ilias Apalodimas <apalos@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/04/2022 11:59, Fabrice Fontaine wrote:
> Fix the following build failure with libressl:
> 
> /nvmedata/autobuild/instance-9/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: check/libcheck.a(check_ssl.o): in function `ssl_connect':
> check_ssl.c:(.text+0x7da): undefined reference to `SSL_set0_wbio'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/76f72a3c7350ea265e2277c89d68e5256410e94c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0003-fix-build-with-libressl.patch        | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 package/keepalived/0003-fix-build-with-libressl.patch
> 
> diff --git a/package/keepalived/0003-fix-build-with-libressl.patch b/package/keepalived/0003-fix-build-with-libressl.patch
> new file mode 100644
> index 0000000000..090d35511c
> --- /dev/null
> +++ b/package/keepalived/0003-fix-build-with-libressl.patch
> @@ -0,0 +1,50 @@
> +From bbec15d4781670ac1be5e543cb04543f79200e69 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 12 Apr 2022 20:30:57 +0200
> +Subject: [PATCH] fix build with libressl
> +
> +SSL_set0_rbio is provided by libressl since version 3.4.0 and
> +https://github.com/libressl-portable/openbsd/commit/c99939f9665a9c3c648682b4987df46600b70efc
> +but SSL_set0_wbio is not provided resulting in the following build
> +failure:
> +
> +/nvmedata/autobuild/instance-9/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: check/libcheck.a(check_ssl.o): in function `ssl_connect':
> +check_ssl.c:(.text+0x7da): undefined reference to `SSL_set0_wbio'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/76f72a3c7350ea265e2277c89d68e5256410e94c
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/acassen/keepalived/commit/bbec15d4781670ac1be5e543cb04543f79200e69]
> +---
> + configure.ac                 | 2 +-
> + keepalived/check/check_ssl.c | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5a2ea76ec..e8b5ccc41 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1327,7 +1327,7 @@ AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
> + AC_CHECK_FUNCS([SSL_CTX_set_verify_depth])
> +
> + # SSL_set0_rbio(), SSL_set0_wbio() OPENSSL_init_crypto() and TLS_method() introduced OpenSSL v1.1.0
> +-AC_CHECK_FUNCS([SSL_set0_rbio OPENSSL_init_crypto TLS_method])
> ++AC_CHECK_FUNCS([SSL_set0_wbio OPENSSL_init_crypto TLS_method])
> +
> + # In OpenSSL v1.1.1 the call to SSL_CTX_new() fails if OPENSSL_init_crypto() has been called with
> + # OPENSSL_INIT_NO_LOAD_CONFIG. It does not fail in v1.1.0h and v1.1.1b.
> +diff --git a/keepalived/check/check_ssl.c b/keepalived/check/check_ssl.c
> +index 0155fce59..2cbedb8d3 100644
> +--- a/keepalived/check/check_ssl.c
> ++++ b/keepalived/check/check_ssl.c
> +@@ -234,7 +234,7 @@ ssl_connect(thread_ref_t thread, int new_req)
> + 		BIO_get_fd(req->bio, &bio_fd);
> + 		if (fcntl(bio_fd, F_SETFD, fcntl(bio_fd, F_GETFD) | FD_CLOEXEC) == -1)
> + 			log_message(LOG_INFO, "Setting CLOEXEC failed on ssl socket - errno %d", errno);
> +-#ifdef HAVE_SSL_SET0_RBIO
> ++#ifdef HAVE_SSL_SET0_WBIO
> + 		BIO_up_ref(req->bio);
> + 		SSL_set0_rbio(req->ssl, req->bio);
> + 		SSL_set0_wbio(req->ssl, req->bio);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
