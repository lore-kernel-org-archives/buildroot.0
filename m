Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753A6C6FA99
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 21:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 326DA4170F;
	Fri, 10 Mar 2023 21:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 326DA4170F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H4VfoqQcUDWt; Fri, 10 Mar 2023 21:02:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FCF541741;
	Fri, 10 Mar 2023 21:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FCF541741
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70E661BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 21:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AD4C60FE1
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 21:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AD4C60FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Veb10q-SRrYg for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 21:02:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E27BA6060A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E27BA6060A
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 21:02:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso4273205wms.5
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 13:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678482134;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=20WNLD1wpf8yl8glUdFfPGokFbks88gGXllfJA0RfnY=;
 b=5mD8NJlcqO18XUnuigADio6iT02C0paEMMGyK5udwiqzDc8As5JToHi6lwO+8EQYWJ
 AvZa2JEXT/3CXlV31j9UgTLwFJnGZ6M/PKSJ4NfHRA8/GAa1G8LcpkvF6Tc7OSr6zaBK
 3cUUWGknUVnzaTL88t+l6xsRZDT5NmXrpdmxabvYnItZDegfEVDkglvx10I3nDcWCow6
 2OKSi/zDFJiRVBRFw+5pr4PIpdofBUfmjwND8SdFIX0NwS6YHq3kOCO8Ac3oEDESX7I2
 5fBIQn5QqTkI+RD9OGirjale6VouvDG2bvCma4Zeml+lpm0BVPO4qvH/Yyxd7qQZjm3F
 zPEw==
X-Gm-Message-State: AO0yUKU34vKKY5tuyqdL4eYfDHkwE5YfQaFL/zMMcE324mW0vpimlmbZ
 Ondof2pbM2eKkIdL6owaHLtZLd9i/G5admvP0i0=
X-Google-Smtp-Source: AK7set9xdDyoyb+F2oEqOlTTxlv25NZ+3UN9hPejngq5Lf+A+mh+8aP1XTlcLHF88UuBRidLPkBfQQ==
X-Received: by 2002:a05:600c:3ca2:b0:3eb:3104:efec with SMTP id
 bg34-20020a05600c3ca200b003eb3104efecmr4335396wmb.16.1678482134010; 
 Fri, 10 Mar 2023 13:02:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a1cf20a000000b003eb5ce1b734sm928146wmc.7.2023.03.10.13.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 13:02:13 -0800 (PST)
Message-ID: <294bddae-b3c0-8dc1-80a3-3aee2ccb17ae@mind.be>
Date: Fri, 10 Mar 2023 22:02:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230221133041.963258-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230221133041.963258-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678482134;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=20WNLD1wpf8yl8glUdFfPGokFbks88gGXllfJA0RfnY=;
 b=PPqK9dJ+JdbR8yPYcf1xisz8u1FFTtEFW7CTsSQvG55edQP6I8lM7Yr7a6pMBAJk2/
 mNxKXYQc23rT7l902Y5QBX8wtkZc/lGW3LLQkKgh6FxC11uDuD8XHNJZPDpT1GQ+r05m
 BdI+hP0fnqxuA7r+PCVO2xQ0fAAPWSj2mGOTuG4rpZmCKSkj4Ll+x/eGnc96+qw8Zq2d
 rE9Y34k0Xmc1rW1m92VycKy8rw4VodOOTdaEJOMPu890aGlBbBpAGysPgO6VC7CGu4g1
 1LX0ZifoaevMU4jELtNoU4mZ6Cit7uOuldIAhjlWmj4lsBbm8lLlLcGr7+rmIx5lheeM
 Pexg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PPqK9dJ+
Subject: Re: [Buildroot] [PATCH 1/1] package/ace: fix build with libressl >=
 3.5.0
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



On 21/02/2023 14:30, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> /tmp/instance-17/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:45:19: error: variable 'BIO_METHOD methods_ACE' has initializer but incomplete type
>     45 | static BIO_METHOD methods_ACE =
>        |                   ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/7f40d6dde03134238151c248fbbd66e4713546cb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...Asynch_BIO.cpp-fix-build-with-libres.patch | 56 +++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
> 
> diff --git a/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch b/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
> new file mode 100644
> index 0000000000..4f9fde5579
> --- /dev/null
> +++ b/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
> @@ -0,0 +1,56 @@
> +From 82b139f921ddb549c1bd236030bbc86e314852b3 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 21 Feb 2023 14:20:11 +0100
> +Subject: [PATCH] ACE/ace/SSL/SSL_Asynch_BIO.cpp: fix build with libressl >=
> + 3.5.0
> +
> +Fix the following build failure with libressl >= 3.5.0:
> +
> +/tmp/instance-17/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:45:19: error: variable 'BIO_METHOD methods_ACE' has initializer but incomplete type
> +   45 | static BIO_METHOD methods_ACE =
> +      |                   ^~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/7f40d6dde03134238151c248fbbd66e4713546cb
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/DOCGroup/ACE_TAO/pull/2053]
> +---
> + ACE/ace/SSL/SSL_Asynch_BIO.cpp | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/ace/SSL/SSL_Asynch_BIO.cpp b/ace/SSL/SSL_Asynch_BIO.cpp
> +index 0faa775fc0..5543598873 100644
> +--- a/ace/SSL/SSL_Asynch_BIO.cpp
> ++++ b/ace/SSL/SSL_Asynch_BIO.cpp
> +@@ -41,7 +41,8 @@ extern "C"
> +
> + #define BIO_TYPE_ACE  ( 21 | BIO_TYPE_SOURCE_SINK )
> +
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
> ++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
> + static BIO_METHOD methods_ACE =
> +   {
> +     BIO_TYPE_ACE, // BIO_TYPE_PROXY_SERVER,
> +@@ -68,14 +69,15 @@ static BIO_METHOD methods_ACE =
> + #else
> + static BIO_METHOD* methods_ACE;
> + # define BIO_set_num(b, val)
> +-#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER) */
> ++#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L) */
> +
> + ACE_BEGIN_VERSIONED_NAMESPACE_DECL
> +
> + BIO *
> + ACE_SSL_make_BIO (void * ssl_asynch_stream)
> + {
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
> ++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
> +   BIO * const pBIO = BIO_new (&methods_ACE);
> + #else
> +   if (!methods_ACE)
> +--
> +2.39.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
