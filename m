Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C24C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8CE684198;
	Wed, 18 May 2022 19:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnatQPOzZtDR; Wed, 18 May 2022 19:16:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A873D840EA;
	Wed, 18 May 2022 19:16:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 014621BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F04BE40198
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XQtGPNCVoKy for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:16:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06B3040101
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:16:42 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id j28so4202218eda.13
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=WQKXGiCPML/nHzE2ZgrPet8FZqK544XCkI1O74CxIUQ=;
 b=RzZSGPqCTjjSJP+N18fY4MNq0dB/MmTVARKkdKCK45FXtu1wEzAI9c3slr64UEUAQV
 W6cT8Ncv0Ng0XxWtgA/o42PTrBXTk1+5t7dhQ2WV5bsqHapV2XG53sa8JxXCPGyBHSWe
 UX2q03niKyRyHj6sQsB70wJrNVn0zO6pZolAOvU2dPW5XrTEqAHL/KvT8Lx/rFKjMvGa
 0osgr+ySZD9I4JR20nxxshnatvJUZZb+YLEjDls9SIfDjrRctFwFv4gpUY5WKWMAqk2Y
 wTxMvpDJ5kHamN056NW029H5ZqdS18mzo+TRnnvee3rOQD6cvWzgup0L/S1/Y6/FoSrf
 +Iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WQKXGiCPML/nHzE2ZgrPet8FZqK544XCkI1O74CxIUQ=;
 b=P8LFBNaBOlZyLBMzbVD5q/MQ3JeUbHp63MmLjfba+rteQDc7mKvzk7+0OOqZSuIM70
 FExIDRw4z9jpEIE5m1Lz7ErgHqlSjQh/4FYSdCGZjgSLJS14grAcPa9ItJESvp2XuOkg
 XKVVxVhVGZhBKUq8qjQDalQmjasmWyaZNqX3zIfapBL6OepLEEwbcA1rqZQgP41NMFwU
 Zu4WatIt7BIQv+sUBuUQYo6kxZxC1IgBNwu3/UqxZAUkLKIpm3Fw7m9DG5arUBjPfiJQ
 ThKMq4Vf1zYMupiMZRkpu+YAKv7+9u1eJJAewnm6/qPfheyzn0vSUmVIRVvCs+m8CtvF
 QN+w==
X-Gm-Message-State: AOAM533mUq/9crhzLed3V+GsHEZZ1GBIQPRONOA1vZvkRzGzh5x59+sP
 xHD0TJDM3ZnI9nwGrTQAjnIIyw==
X-Google-Smtp-Source: ABdhPJykswJP+CarCghJyC/L49aJ4pOVnZE2A4VhSj+BZ135FWFcr4eAw+sag9F9AgScSJcZEKY/8A==
X-Received: by 2002:a05:6402:5108:b0:427:e323:4c67 with SMTP id
 m8-20020a056402510800b00427e3234c67mr1366462edd.326.1652901401201; 
 Wed, 18 May 2022 12:16:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ia16-20020a170907a07000b006f3ef214e16sm1263907ejc.124.2022.05.18.12.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:16:40 -0700 (PDT)
Message-ID: <b3197990-8d02-02ff-dce3-74c76bd35b39@mind.be>
Date: Wed, 18 May 2022 21:16:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220513215156.1342774-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220513215156.1342774-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/i2pd: fix build with libressl
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



On 13/05/2022 23:51, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> In file included from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Signature.h:18,
>                   from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Identity.h:20,
>                   from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Destination.h:21,
>                   from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd_client/ClientContext.h:16,
>                   from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/i18n/I18N.h:12,
>                   from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/i18n/Afrikaans.cpp:13:
> /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Crypto.h: In function 'int DSA_set0_pqg(DSA*, BIGNUM*, BIGNUM*, BIGNUM*)':
> /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Crypto.h:338:22: error: invalid use of incomplete type 'DSA' {aka 'struct dsa_st'}
>    338 |                 if (d->p) BN_free (d->p);
>        |                      ^~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8da524dda4a548de9b006ae156fdc582b0cffd47
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...pd-Fix-the-build-with-LibreSSL-3-5-2.patch | 27 +++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch
> 
> diff --git a/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch b/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch
> new file mode 100644
> index 0000000000..e9f905b7ee
> --- /dev/null
> +++ b/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch
> @@ -0,0 +1,27 @@
> +From 0a1e302e8a242bbd1d39556e5ef05aced1b3b504 Mon Sep 17 00:00:00 2001
> +From: orbea <orbea@riseup.net>
> +Date: Sun, 8 May 2022 22:50:44 -0700
> +Subject: [PATCH] libi2pd: Fix the build with LibreSSL 3.5.2
> +
> +[Retrieved from:
> +https://github.com/PurpleI2P/i2pd/commit/0a1e302e8a242bbd1d39556e5ef05aced1b3b504]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + libi2pd/Crypto.h | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/libi2pd/Crypto.h b/libi2pd/Crypto.h
> +index b02778141..726bd0a1e 100644
> +--- a/libi2pd/Crypto.h
> ++++ b/libi2pd/Crypto.h
> +@@ -29,7 +29,9 @@
> + #include "CPU.h"
> +
> + // recognize openssl version and features
> +-#if ((OPENSSL_VERSION_NUMBER < 0x010100000) || defined(LIBRESSL_VERSION_NUMBER)) // 1.0.2 and below or LibreSSL
> ++#if (defined(LIBRESSL_VERSION_NUMBER) && (LIBRESSL_VERSION_NUMBER >= 0x3050200fL)) // LibreSSL 3.5.2 and above
> ++#   define LEGACY_OPENSSL 0
> ++#elif ((OPENSSL_VERSION_NUMBER < 0x010100000) || defined(LIBRESSL_VERSION_NUMBER)) // 1.0.2 and below or LibreSSL
> + #   define LEGACY_OPENSSL 1
> + #   define X509_getm_notBefore X509_get_notBefore
> + #   define X509_getm_notAfter X509_get_notAfter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
