Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2208EC433FE
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB6A60AD0;
	Fri, 13 May 2022 22:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDE2l8GSv5Hd; Fri, 13 May 2022 22:12:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF4CD60806;
	Fri, 13 May 2022 22:12:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BCF31BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A03540207
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvPSJUYKpJnX for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 252834015A
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:22 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id kq17so18683359ejb.4
 for <buildroot@buildroot.org>; Fri, 13 May 2022 15:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VyuPAPyAFAJobvarFCN7bjta5nugl87W5Q3pS9fKP+Y=;
 b=Y0MKb5ngp0QX5WnawnjPtaBr0a+kcgGwIQSSYrAFb53x8t5QQwSsaXeUg+32yAlviG
 qpF/2TUyQMWw6bAXHu41/P3TVOwLjD/9h7AVI73nC5ul846LFUzCVLnzr7HFWdlnkG9C
 5x32d+7pkp40SfZRlRYWCNHGIYHzJ1WqrlNm8lmPYEb2LChfSy2jfWxepcKh6VNgfO6n
 3VBTbFcGG0Iy7bSZriMMNbUIXvia+ZndrFjVjEIbXODbQ9HQz0V+x8IOQL4YMlf1xeAd
 0OMNuxhBF2xS3PdGGUE6teHxMw/Kq5FwMwd4kVaGwpM2zNyvJiVWTyd2Q4Vmyc3pO8gR
 wnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VyuPAPyAFAJobvarFCN7bjta5nugl87W5Q3pS9fKP+Y=;
 b=wbSOsXX/awhwE8Xza86lg7G125YpGSwmBJqPbPNyLydXrVPtovqkimttXzLOLs0N3o
 d7swDeP5MzpPYKwpueNJ0B7cDG4X9W9p3zPE09+8bT5EXoJP4iJmWrKvNQS8ksNywISR
 OZ2Z0FQZzcCTIiqoHlvadKD8Js0PmuTLBpsgNccwrxukFgQm9UKUqSVq3SQcdWw53oD2
 mVNG8gVXSkhB7v1+rmat4/VB47z4egk0OVkBIe+/rojofhjP9uHNq6C1IGAuIqHUmQq/
 Sf8mTFe1RBW6ezD+JFBfJpiaDHAx5pGZ6O1VHlqydIGA8S8W4mYQS30LwlPdoIzVw7OA
 J0Cg==
X-Gm-Message-State: AOAM532UdXIYrIPX8fAyYNIzR8eZVEgf4P9ee28OX8hhjKjKIfcQ8pAY
 oxEZsipfshf0aSkk7wHFWiZwDA==
X-Google-Smtp-Source: ABdhPJzrumNrsgAxy6yKZE4Qz7WBxeB7U1CLnHmnLXpbYaWltp5M0HKlVGfOAKmoCVLlr3jNtH2zmg==
X-Received: by 2002:a17:906:4f90:b0:6f6:b288:b3ab with SMTP id
 o16-20020a1709064f9000b006f6b288b3abmr6209101eju.189.1652479880329; 
 Fri, 13 May 2022 15:11:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 zd7-20020a17090698c700b006f3ef214dfbsm1177869ejb.97.2022.05.13.15.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 15:11:19 -0700 (PDT)
Message-ID: <7b54b51b-0c2c-4e7d-d901-d5d0769ad2f1@mind.be>
Date: Sat, 14 May 2022 00:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220505210604.9605-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505210604.9605-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/sngrep: fix build with libressl
 >= 3.5.0
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



On 05/05/2022 23:06, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> capture_openssl.c: In function 'P_hash':
> capture_openssl.c:101:18: error: storage size of 'hm' isn't known
>    101 |         HMAC_CTX hm;
>        |                  ^~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/f1e8cdb3ac35a30055ab79d41e6cc038e5339c37
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...nssl.h-fix-build-with-libressl-3.5.0.patch | 40 +++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch
> 
> diff --git a/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch b/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch
> new file mode 100644
> index 0000000000..7dbb29ab00
> --- /dev/null
> +++ b/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch
> @@ -0,0 +1,40 @@
> +From 4e1406ad0df370ff8bf1d3a81aaadbb1cad2d761 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 29 Apr 2022 18:53:45 +0200
> +Subject: [PATCH] src/capture_openssl.h: fix build with libressl >= 3.5.0
> +
> +Fix the following build failure with libressl >= 3.5.0:
> +
> +capture_openssl.c: In function 'P_hash':
> +capture_openssl.c:101:18: error: storage size of 'hm' isn't known
> +  101 |         HMAC_CTX hm;
> +      |                  ^~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/f1e8cdb3ac35a30055ab79d41e6cc038e5339c37
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/irontec/sngrep/commit/4e1406ad0df370ff8bf1d3a81aaadbb1cad2d761]
> +---
> + src/capture_openssl.h | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/capture_openssl.h b/src/capture_openssl.h
> +index 780de494..1f87a5cd 100644
> +--- a/src/capture_openssl.h
> ++++ b/src/capture_openssl.h
> +@@ -67,10 +67,11 @@
> + #endif
> +
> + /* LibreSSL declares OPENSSL_VERSION_NUMBER == 2.0 but does not include most
> +- * changes from OpenSSL >= 1.1 (new functions, macros, deprecations, ...)
> ++ * changes from OpenSSL >= 1.1 (new functions, macros, deprecations, ...) until
> ++ * version 3.5.0
> +  */
> + #if defined(LIBRESSL_VERSION_NUMBER)
> +-#define MODSSL_USE_OPENSSL_PRE_1_1_API (1)
> ++#define MODSSL_USE_OPENSSL_PRE_1_1_API (LIBRESSL_VERSION_NUMBER < 0x30500000L)
> + #else
> + #define MODSSL_USE_OPENSSL_PRE_1_1_API (OPENSSL_VERSION_NUMBER < 0x10100000L)
> + #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
