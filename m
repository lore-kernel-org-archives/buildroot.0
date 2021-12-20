Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2FCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17622409B1;
	Mon, 20 Dec 2021 22:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y07rNA-0M3WO; Mon, 20 Dec 2021 22:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12226409B3;
	Mon, 20 Dec 2021 22:35:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3371BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C83540321
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0uz57CuSBjk for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:35:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D150402FF
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:35:48 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b13so15742077edd.8
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=baM9FqWiw+yQ9mp/x476btxB6gRYAI9nDvW62qrQ7YM=;
 b=bgz70TcVnCzTzc4ual0Nz0/JGg9wsBTStZXXuBZiHST5FrDGEKlvwGaQo68qEhV4Ts
 xJjLLtInTCV4rIhfeAq9zeO1i+CRy/hnKWjl4q+WKIiCZHc9p6Sgob1LgBn0uD3wDiaa
 2RziT30U2TaQPmwgIH659nLfdzo3oQ2rxH08nQ9wYzYWty0m0mkAddiBC58yFnlGQxLB
 90WQWFsrlO1q4+xVFXiW7tDoVbJNonW3z2pmI2beL/QWIiXXuJzJArSGKlErsnvVCjqU
 K7b1PG5d72ghl/JWyH+AbOEeqxaTz+XKtRcMu51lMUbLPp9PzehDopOgbkMEQGCNvYCF
 jgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=baM9FqWiw+yQ9mp/x476btxB6gRYAI9nDvW62qrQ7YM=;
 b=Dpf1n9BeJrbk0pfTNtegqW3QFM3C9YvKXy6R/M1Km31MzbB1ShDvxOd4qyVYsnQMsp
 hn8MUaEHPJCZ77KZzVTwyud0f7NvnGHlZhmZ7Py2KTT0X5+zoRgls7EOjNdUTUGUY3tl
 JI4bb39s9bfqvv7zw88qoVgshk/O5Nwo7tplk8an8CcENHs2/g7EU+U+DKLLIZswnGgc
 ObEiIAoZLmKSuOf5RpwpD63fZjz5dkFUMeW2n9nMXgMwOpdnqPqYfq9U8HUCBT9dL+rn
 BUQ/mihc74B5jnyczuRtYFdeMzCS8/A+o2HBL06JA37xVNdBycrvklJJ2Upg8+6WDESW
 dpfA==
X-Gm-Message-State: AOAM533CojNamf5zcSt9H1PpQiufVpR4tq/31GmF9zvkRd28CxhF+Guc
 esTMMO2Fnt+jaF1wUXlLLyYesPfwSZnWyQ==
X-Google-Smtp-Source: ABdhPJxJbTkuDkcG8AGHTD6inwSaBi+EJ6BCzHsHcmLa44FzslARr0z1LbXWQPjft8rNmQQfxHFRwQ==
X-Received: by 2002:a17:906:6703:: with SMTP id
 a3mr238580ejp.632.1640039746853; 
 Mon, 20 Dec 2021 14:35:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f26sm5726040ejf.131.2021.12.20.14.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:35:46 -0800 (PST)
Message-ID: <4f9af423-1bf5-6d53-1b38-0afbd176d339@mind.be>
Date: Mon, 20 Dec 2021 23:35:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211217191252.30122-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211217191252.30122-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.16.12
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



On 17/12/2021 20:12, Fabrice Fontaine wrote:
> https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-12
> https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.12
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mbedtls/mbedtls.hash | 4 ++--
>   package/mbedtls/mbedtls.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index b93da164f9..8247748afd 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.11:
> -sha256  c18e7e9abf95e69e425260493720470021384a1728417042060a35d0b7b18b41  mbedtls-2.16.11.tar.gz
> +# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.12:
> +sha256  294871ab1864a65d0b74325e9219d5bcd6e91c34a3c59270c357bb9ae4d5c393  mbedtls-2.16.12.tar.gz
>   # Locally calculated
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index 9207daf186..93ac1bb163 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MBEDTLS_VERSION = 2.16.11
> +MBEDTLS_VERSION = 2.16.12
>   MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
>   MBEDTLS_CONF_OPTS = \
>   	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
