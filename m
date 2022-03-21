Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B79C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AE9340A8F;
	Mon, 21 Mar 2022 21:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHlmZ6ks8tG3; Mon, 21 Mar 2022 21:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E17CB40A96;
	Mon, 21 Mar 2022 21:09:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA01B1BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7B5C60FAF
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBrGVKpSy-bn for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:09:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF6CD60FB3
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:09:09 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id dr20so31980098ejc.6
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4Vvbf2CpGG4aRlsj6yWX0TvHNTkkJ+bvQE/iq+lx9z8=;
 b=ZKvEvWVIqqRJdpalJnhu5GQLZ466B1OG4IFx89YbmprH+SczUPHgbLssYYvEHgWxc6
 JAdT3KlFCOy0uQm5s5eXdNe8LIMivIFX2YuCISr9/q/l/Z9YvzCa0nNzHVVAtnPUEMe3
 KpMDz7gawrJcGli1nyAy4vclMS/mSiGMQgZ4oXCdP0Ca2nD3Oqmhf+cNUqF3LgnUdPG7
 q9i6DeJuGl2Iq7lhgbLkiebgEgstvJ5mpKQ1JGNSqA8T/kK6S17MM9+BqzRYgTiOKF/n
 7aEQEAG5Mxd/asa/p+gxqoElGMoptDxFjlcw6IWnNVghzXljUyqWVAz9AQwIh5DcJFPv
 l0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4Vvbf2CpGG4aRlsj6yWX0TvHNTkkJ+bvQE/iq+lx9z8=;
 b=VLYH4tljpBpzR/ukFspAkGTD9uO6mKHHiMfhgOsUY9WhWD3G0ACBCTzSOASyF0D6/5
 exjzvXpCST9+iWTd9Z4iXbHsOUyI2jpLVUK6gsAzvhIi9/Uf1CTftV9eyfFJISjtN9ah
 V9dK7O9mS3or3pwS9ZEJKjw3Pw87/q7+eJ7o8BgupuW4jFG8Kq/SyBDKZHD+MkNRCIu0
 3dR80Gaa93pHBj+eINit30fDX6+zc5kk/9cZ+KpQxvVZQQy5Qg1hjKrmP1E7yu+Zpe+u
 LZ7MZJyx23Uc2YeeofJaC6bCr9rXjElUQuAb61vuAwb2wpoXqj24WzYqcfBl4KDWAJ7R
 8ulQ==
X-Gm-Message-State: AOAM531IEObrvTjoIlntlMB6mraXxvMeozcLidk0rf4qH7alVNAGkX/F
 4m1MGaHVWPxhpEZ+wpBIL/f9uQ==
X-Google-Smtp-Source: ABdhPJycDkvh1TMcZp5HBXc6abP/A38INuhXTJnCUhm+Wn4ffqm8r4Ryp2EkMwFasIZ29IwD2F7TUQ==
X-Received: by 2002:a17:907:9801:b0:6db:ab31:96f4 with SMTP id
 ji1-20020a170907980100b006dbab3196f4mr22452706ejc.571.1647896947872; 
 Mon, 21 Mar 2022 14:09:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a5-20020aa7cf05000000b0041919e52a38sm4343095edy.46.2022.03.21.14.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:09:07 -0700 (PDT)
Message-ID: <49aefc4a-d973-5ed0-0e8c-c74607de9ff2@mind.be>
Date: Mon, 21 Mar 2022 22:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220309220018.786891-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220309220018.786891-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/3] package/cmake: bump to version 3.18.6
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/03/2022 23:00, Fabrice Fontaine wrote:
> Update hash of Copyright.txt (year updated and Qt Company Ltd. added:
> https://gitlab.kitware.com/cmake/cmake/-/commit/1edc4a8a7e759c4047dd1a1b9864b34f6cb4cc50
> https://gitlab.kitware.com/cmake/cmake/-/commit/f8c505d4b30aa636b013486913591060b2040716)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  This may create some fallout, but the autobuilders will tell us.

  Regards,
  Arnout

> ---
>   package/cmake/cmake.hash | 6 +++---
>   package/cmake/cmake.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index 97e83a274c..da514a6d6b 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From https://cmake.org/files/v3.16/cmake-3.16.9-SHA-256.txt
> -sha256  1708361827a5a0de37d55f5c9698004c035abb1de6120a376d5d59a81630191f  cmake-3.16.9.tar.gz
> +# From https://cmake.org/files/v3.18/cmake-3.18.6-SHA-256.txt
> +sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600  cmake-3.18.6.tar.gz
>   
>   # Locally calculated
> -sha256  dc628fb936a5d229296d42083f9a8218aa32204c016919e784404c9ec58776e9  Copyright.txt
> +sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d  Copyright.txt
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index b1b214982e..4177b119ab 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -CMAKE_VERSION_MAJOR = 3.16
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
> +CMAKE_VERSION_MAJOR = 3.18
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
>   CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>   CMAKE_LICENSE = BSD-3-Clause
>   CMAKE_LICENSE_FILES = Copyright.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
