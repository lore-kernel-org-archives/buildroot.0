Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64754C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0253140260;
	Mon,  4 Apr 2022 20:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kwsb3WG4BZDe; Mon,  4 Apr 2022 20:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC60140173;
	Mon,  4 Apr 2022 20:18:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78C401BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6367660A70
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cblEwxiDJfx0 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:17:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D81C607F9
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:17:59 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id bq8so22311953ejb.10
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v2AeJZ2UXq6Utdp980a3yXfm2WEWrZQ6GNlhQpGRrnQ=;
 b=MHC1M+xCWu86ltjEQAxJNHhL55X0w6UcvxgCokex9MqC/UMvFfRk7KB0jQstTsBAUZ
 rrQRQeYbuLCsy5s1P73pRPuKbq+LYSENwG0Xwfn1Gcxsxo5ElcjjwNk0YBkDxrl0mG7N
 f9y2965pXKDHARAzKc8SlnCV4E3y74uKXfx0t+9VdOy2b5QU+F6xPCF/SEhviCqcLa8p
 S0FPQ1XKKC3HYnps6HzRbail6ZEBqMthXnZWLISlPyC50tGc8cSKRZrijh6oW2z264EE
 1QZJLEw3DLYf3iKObbxUdvaSjbCAGz841LUfhcmQ7L6o0Os1q7XnzzbiVLbWpL4BcoLx
 +umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v2AeJZ2UXq6Utdp980a3yXfm2WEWrZQ6GNlhQpGRrnQ=;
 b=QPZ/opcrnl7vV6OOrn3H1ORXspe7wcV7rHPbjspfBVGfGr2MzEXFaCwzQTUHAV1V9d
 msycNvln/r+DZjINOs3Oz4zBc8ivQK4Rw//0mVlAvkCrpXlU/5yYuM34XSQsdPqDVK71
 GOlOle0R1vzW6k0wDF+eRS0JZZ0MT9Zvfw8oH++nOnSn/gZvNvX7ECpUTYLWzGTA/wJd
 90Yn5JpNrjqndPcX9hGA4kt7zlvJSMUO2ZXsQ+5m7o2EovLXZsTmxeR8JePExvLFgQJF
 Xk2QRziMjYIksYKcwrE2sQ5Ufi8KrMcSiy2qwziup1f3iDwH1wIsDbiOfrysIu+hz8jc
 C0gw==
X-Gm-Message-State: AOAM533o3LrnFeT1KHbeTICC4Qmy+3ZfnMVAgyRc6U/3npdGALh8k1w/
 bonL2+x2PhiQ4vmYvwUVrLTJkA==
X-Google-Smtp-Source: ABdhPJxyrLylarpPz982d+Y+mZtFnHnMZbb9x9RqWlPqgdC6KLec3Zy5N51L9b5etio5dEeiMj/Srg==
X-Received: by 2002:a17:907:3e82:b0:6e1:3fe3:9b14 with SMTP id
 hs2-20020a1709073e8200b006e13fe39b14mr1772262ejc.561.1649103477463; 
 Mon, 04 Apr 2022 13:17:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a50daca000000b0041cc361b1c9sm2752858edj.68.2022.04.04.13.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 13:17:57 -0700 (PDT)
Message-ID: <ec65158d-12c9-4c71-7f1e-727e2ba2b0c5@mind.be>
Date: Mon, 4 Apr 2022 22:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220404162545.326240-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404162545.326240-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ace: fix build with libressl
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 18:25, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since the addition
> of the package in commit 3621918d1bc1ddc9312dd1cc8dec6db61e712fe2:
> 
> /home/autobuild/autobuild/instance-10/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:174:7: error: 'BIO_get_init' was not declared in this scope; did you mean 'BIO_set_init'?
>    174 |   if (BIO_get_init(pBIO) == 0 || p_stream == 0 || buf == 0 || len <= 0)
>        |       ^~~~~~~~~~~~
>        |       BIO_set_init
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/386afa88ac9e5e3bb65dddeabf610bb1e9bc4285
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...Asynch_BIO.cpp-fix-build-with-libres.patch | 52 +++++++++++++++++++
>   1 file changed, 52 insertions(+)
>   create mode 100644 package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
> 
> diff --git a/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch b/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
> new file mode 100644
> index 0000000000..ad82c10172
> --- /dev/null
> +++ b/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
> @@ -0,0 +1,52 @@
> +From e06cadc3b95a577e6a8bbc94f93dd063710c73a1 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 3 Apr 2022 15:25:49 +0200
> +Subject: [PATCH] ACE/ace/SSL/SSL_Asynch_BIO.cpp: fix build with libressl
> +
> +Fix the following build failure with libressl:
> +
> +/home/autobuild/autobuild/instance-10/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:174:7: error: 'BIO_get_init' was not declared in this scope; did you mean 'BIO_set_init'?
> +  174 |   if (BIO_get_init(pBIO) == 0 || p_stream == 0 || buf == 0 || len <= 0)
> +      |       ^~~~~~~~~~~~
> +      |       BIO_set_init
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/386afa88ac9e5e3bb65dddeabf610bb1e9bc4285
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/DOCGroup/ACE_TAO/commit/e06cadc3b95a577e6a8bbc94f93dd063710c73a1]
> +---
> + ACE/ace/SSL/SSL_Asynch_BIO.cpp | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/ace/SSL/SSL_Asynch_BIO.cpp b/ace/SSL/SSL_Asynch_BIO.cpp
> +index a657d8a14e6f7..64aa14c6ab9a7 100644
> +--- a/ace/SSL/SSL_Asynch_BIO.cpp
> ++++ b/ace/SSL/SSL_Asynch_BIO.cpp
> +@@ -41,7 +41,7 @@ extern "C"
> +
> + #define BIO_TYPE_ACE  ( 21 | BIO_TYPE_SOURCE_SINK )
> +
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
> + static BIO_METHOD methods_ACE =
> +   {
> +     BIO_TYPE_ACE, // BIO_TYPE_PROXY_SERVER,
> +@@ -68,14 +68,14 @@ static BIO_METHOD methods_ACE =
> + #else
> + static BIO_METHOD* methods_ACE;
> + # define BIO_set_num(b, val)
> +-#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
> ++#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER) */
> +
> + ACE_BEGIN_VERSIONED_NAMESPACE_DECL
> +
> + BIO *
> + ACE_SSL_make_BIO (void * ssl_asynch_stream)
> + {
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
> +   BIO * const pBIO = BIO_new (&methods_ACE);
> + #else
> +   if (!methods_ACE)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
