Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501ECC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E86B84010E;
	Sat,  5 Feb 2022 22:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvT0ZjWH7hOj; Sat,  5 Feb 2022 22:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFD5E4016D;
	Sat,  5 Feb 2022 22:51:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28B771BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6626640888
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0kTbbWejbBh for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:51:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8931140895
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:51:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id j23so21280108edp.5
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 14:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/dQN06dRaSW0cytaPrtbNFNAtlVX3Hcd5/oIWG2Df6U=;
 b=EXC4/CXMune8/Q+ABH3h1e3N9MH8AIFL9fqF47S6BbhgaH1uReWzg9BNYyzRe8Ikyh
 q9k4Y1KnK5rs+qhd466NR4bM0drPE53qeIB8Oi/cPn5o2UCSjeJQd1P/RZeU8NKAMz7b
 TiaVVs+uYOULoW5E2pLSf2tNtKbZWENHmPd8qLsRkMBWxspctFNnW0L3pq/RVmhb0xMr
 HnKHk1HoF++0iB+plGW5+iXMTuO0G1nbGaNaAx7lwR0g6yDaJu6Qg7q7eo6rnxPll+Mk
 zLMv5d93QzZnJH0J0Z+ZlriqAy5P2PE7wQvXC1pwcAgq2qb4CMMSmUMrErINjFoM7Io3
 pU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/dQN06dRaSW0cytaPrtbNFNAtlVX3Hcd5/oIWG2Df6U=;
 b=WcI/cv6aLEeUBXhLmuG1NW5Ao2DjBCYrgc0SKVMy3Q+/cjIXH5GTw5FKoJcEgszC74
 tT3E6fTIGHzO4pL6+8xUQ1qwKKSiuuzzXXh2Ld3Cg0sdoDDFiKrdXUwBT2g0WaSy4e1M
 fzBfOkJILZJHI9APeSU3ouUlk5kkO+VEcADAX7WK4diXmvDUhKboIVM3HQ4uw09J2mdz
 qzX9bjK20qexIyZaym2FD8IDT3kw7fW64YcyylFO+1oixW8WmS95gLwv4tO9aOhe93Wq
 YS/tFWeSwx9ZOXRpUxsqqaykjweicFM4UJJMY8HfcTwA0YAoxzCsJ+us33w4fdjyTkEn
 a51A==
X-Gm-Message-State: AOAM532EGYbfpLjqe8vPbgSYHe9w4NY7buex3ql6IhidBZSs+CcVEl8U
 OVYASnDfXowxykWTvCeDMiPOYw==
X-Google-Smtp-Source: ABdhPJyjDInRTk0T+hnKzeOd9QJfEKXvwEKT0CvgNqcrsTIKEuPQQ9nVfOljpF/8Dw4NTPYTGucOYQ==
X-Received: by 2002:a05:6402:26c2:: with SMTP id
 x2mr6476712edd.354.1644101478877; 
 Sat, 05 Feb 2022 14:51:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u19sm2056662ejy.171.2022.02.05.14.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:51:18 -0800 (PST)
Message-ID: <527e0e50-1daa-5683-b587-053b503b1202@mind.be>
Date: Sat, 5 Feb 2022 23:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220125212039.300631-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220125212039.300631-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dataproperty: bump to
 version 0.54.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/01/2022 22:20, Fabrice Fontaine wrote:
> https://github.com/thombashi/DataProperty/releases/tag/v0.54.2
> https://github.com/thombashi/DataProperty/releases/tag/v0.54.1
> https://github.com/thombashi/DataProperty/releases/tag/v0.54.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-dataproperty/python-dataproperty.hash | 6 +++---
>   package/python-dataproperty/python-dataproperty.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
> index 9a8c250125..380846e9f1 100644
> --- a/package/python-dataproperty/python-dataproperty.hash
> +++ b/package/python-dataproperty/python-dataproperty.hash
> @@ -1,5 +1,5 @@
> -# md5, sha256 from https://pypi.org/pypi/DataProperty/json
> -md5  6a6930ae266399df58707a13a5f0cfa6  DataProperty-0.53.0.tar.gz
> -sha256  9589b5c5b400a77e1aeb63d89d755043bbe00043219336963c93db5df49cbaf7  DataProperty-0.53.0.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/dataproperty/json
> +md5  ce5fd0d37b6d0ca57f144e22cd62bfec  DataProperty-0.54.2.tar.gz
> +sha256  df2fcf00e7a57f0a6089f686f847527eb3c91ded5c419daef6d06ee4bb1187b4  DataProperty-0.54.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
> diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
> index 5ceb7f72f5..1b07dc1bb7 100644
> --- a/package/python-dataproperty/python-dataproperty.mk
> +++ b/package/python-dataproperty/python-dataproperty.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_DATAPROPERTY_VERSION = 0.53.0
> +PYTHON_DATAPROPERTY_VERSION = 0.54.2
>   PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
> -PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/df/d0/36deb707996c5ef48ab353804291f44f59bd9d46875c384d163ad106df1a
> +PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/9a/03/44fb9094c4fb8032f254eaa37b3b07db82fa35779ceca097b3cde8464749
>   PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
>   PYTHON_DATAPROPERTY_LICENSE = MIT
>   PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
