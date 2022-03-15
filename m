Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF3CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AEB660C30;
	Tue, 15 Mar 2022 20:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZfRl0Q9ziXw; Tue, 15 Mar 2022 20:17:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 341E360B14;
	Tue, 15 Mar 2022 20:17:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBD6B1BF31E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8C45403CA
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsJk3PK9Ggyv for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:17:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A538E4026E
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:17:47 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bg10so31829ejb.4
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 13:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UYa71RTtR5otgumEn/irU9O2yxqJwvbBJVUxIK/MbOE=;
 b=RUQaDm9X9rbJDqGWnOEbZjlp7A5rrLjhq0bHzPVAPJl/95GR/kPVIXYbvkwTtaWGK/
 tnCYPKJb4SPI3hVdUtXTWoiyDbK9ZH1A1rn5u+LnFAXR9/3iiFqvq12Z8kJRVzmYepqB
 2cn9hVNo8xXxd6zqvWdJ3a6ETjcvx9ad9pM32ej5hoE2uWQ7K/MFLg5FkGRXOAEtWteM
 +ovTYdCBNimDKBxP+Tj7UTWbwKA5FhPiF28+M9spF5+SkRzZ2kqFlQdzlLeyFl4ZzxWV
 yzkjSaICEGAIf5W3mErISVV0yRseiiOSW4da3x3MWPZgNdBbI3qpgVr/RqY5+6G7klSd
 yaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UYa71RTtR5otgumEn/irU9O2yxqJwvbBJVUxIK/MbOE=;
 b=HxCVk7m5Bovpiivjg7YKvzjshz8jHYV4zj8ModkEqUSQXdQQcsIUmiDHgN1HDc0iAw
 bxxWSflwPglowhGYW7q+ZphE62vx53WVyQVROK+a74nF6LpevLYtHADtOQ9mvL+f1nrB
 KCRm1zwF6gOiyQUHH7eXYbjEjiAwnIZDt8rphZHBLUfNGXmuYS3akenDAgYdJ2nRkNHr
 KxTODFUqAOeaVFWje+1BJdAfBq6eh3gu3N3FLEXxYUW4b3SVz3JPuwJQomHtbQnJ1UCQ
 C8jDLZ+6Vvr31yGhzzLZj0ImbnriPxp8wwCVcnZQfVBPO+qJHuoqi57SrCaMSmI6Yrw4
 67sw==
X-Gm-Message-State: AOAM532RIi1148eJOrQafKd0HLGekrdChXXYysNT7d+Ts0YntM95v8m5
 m3gI0H0vqU+fHTTKHjlZkFhP/A==
X-Google-Smtp-Source: ABdhPJxpRSZoIynW6YSFSIYJmt8YKsk7unm1wcD7UHRQCZVAO5EMj1LPr6qLAU/U+h11zBLMQBjKBg==
X-Received: by 2002:a17:907:3fa8:b0:6d3:477a:efe with SMTP id
 hr40-20020a1709073fa800b006d3477a0efemr25608676ejc.401.1647375465892; 
 Tue, 15 Mar 2022 13:17:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a50cf42000000b004135b6eef60sm10058582edk.94.2022.03.15.13.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:17:45 -0700 (PDT)
Message-ID: <f7d88a3c-5f09-b277-57b5-3527ec6a210d@mind.be>
Date: Tue, 15 Mar 2022 21:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220227103528.3888282-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220227103528.3888282-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/2] package/valijson: drop boost
 dependency
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



On 27/02/2022 11:35, Fabrice Fontaine wrote:
> boost is not mandatory since the deactivation of tests when bumping to
> version 0.2.0 in commit d8e2876104be3f9f01613b17d3e60120883be1a1 and
> https://github.com/tristanpenman/valijson/commit/1844241d2a2379bca79a0d654f4b007209b10883
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/valijson/Config.in   | 8 ++------
>   package/valijson/valijson.mk | 1 -
>   2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/package/valijson/Config.in b/package/valijson/Config.in
> index 10721b3703..07706cd963 100644
> --- a/package/valijson/Config.in
> +++ b/package/valijson/Config.in
> @@ -1,10 +1,6 @@
>   config BR2_PACKAGE_VALIJSON
>   	bool "valijson"
> -	depends on BR2_USE_WCHAR
>   	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	select BR2_PACKAGE_BOOST
> -	select BR2_PACKAGE_BOOST_REGEX
>   	help
>   	  Valijson is a header-only JSON Schema Validation library for
>   	  C++. Valijson provides a simple validation API that allows
> @@ -14,5 +10,5 @@ config BR2_PACKAGE_VALIJSON
>   
>   	  https://github.com/tristanpenman/valijson
>   
> -comment "valijson needs a toolchain w/ C++, threads, wchar  support"
> -	depends on !BR2_INSTALL_LIBSTDCPP  || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +comment "valijson needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
> index e425757d26..71c5b05f2b 100644
> --- a/package/valijson/valijson.mk
> +++ b/package/valijson/valijson.mk
> @@ -11,7 +11,6 @@ VALIJSON_LICENSE_FILES = LICENSE
>   VALIJSON_CPE_ID_VENDOR = valijson_project
>   VALIJSON_INSTALL_STAGING = YES
>   VALIJSON_INSTALL_TARGET = NO
> -VALIJSON_DEPENDENCIES = boost
>   VALIJSON_CONF_OPTS = -Dvalijson_INSTALL_HEADERS=TRUE -Dvalijson_BUILD_TESTS=FALSE
>   
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
