Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1617C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 18:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D66384069;
	Mon,  6 Jun 2022 18:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuqA3v6wer_o; Mon,  6 Jun 2022 18:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D7CC830B8;
	Mon,  6 Jun 2022 18:19:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2423E1BF2E3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1305D830B8
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4aAum36Cf8I for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 18:19:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBD2082F8A
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 18:19:08 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z7so19908165edm.13
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=crr7tkBY4tvlsPkDow/X09XQAg0DFkTrBgIAoCxzqvk=;
 b=RgMRY1WgeCAVmgLm2s1qb9Dxx/N+/3iKvFdS/jqzjxSl20eY3N/IA3MK/wQoHZBBAe
 00FiLeQvStbPRQz8yPEO7dBciAN6zuvJqE+C5prbPMdjVk1b4G+8oSwr8MpupwEsItBM
 qnt1CEHYkH6P/2O05J9MH9thIfmHio6uhGDgCkFRAN9iT3hwOtTdtS4/h0JmCpKYPUwb
 byLWoJmVFVn70o9KcK5zlJIIaUIbzQVCRc9hrpXVSf0v/R4vE2r2FN/XM0WC1HobDSQu
 z4KEJHqB7akjfHo4lYOKBgGdLdWWxHayKKA4PzpiVnn/uYy/87EcXQdENiBEEJZMZqEV
 IYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=crr7tkBY4tvlsPkDow/X09XQAg0DFkTrBgIAoCxzqvk=;
 b=ke5fRMp+1lFxhw4I/5EqYMS6QopKiTz08J+1bA77OGCmnZpVsBgVaNf00sMfFtF2/7
 2eH0YOQga17P5xdexMxTvcTMq0LdXg0NpRgLPRgFfsnV5+UdPIg31OU4Rx5O3C7RJnZa
 RbqB/YSaDdh23Cus7n6LR3i2SVCqyH2l2nNp1SzGzucIcBjgW9XP74CGmeCWbUvw6Of8
 hzOHF1IIaAY7rcDNxiodtDjdZMEiT5XnmItZapSTRu8gAHzEDYOe6Rk+yOunlhY8u/xk
 q7gKhscjLJJg74aFqxHrq0WCw7VIYgnVlNjrPSktGkqiDl+mHkMQ+szfxU3w/HbEy6oQ
 CdEg==
X-Gm-Message-State: AOAM5329FyeG2qOqOoAwsMw8VV3sp9zwFG4OnyzNDgzqfaWYnXyGul/e
 jXRKczK+/YFd8izw3Bb95p29TTXlMOct8Q==
X-Google-Smtp-Source: ABdhPJxftHk+uevEIwsRbmEY6OPSKmCz9jb9IB29I7h87fQ1AaMREzUo+RW0k3tBOaXN0fJpfJNXLg==
X-Received: by 2002:aa7:c14b:0:b0:42d:d763:104 with SMTP id
 r11-20020aa7c14b000000b0042dd7630104mr28987342edp.104.1654539546901; 
 Mon, 06 Jun 2022 11:19:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h22-20020aa7c616000000b0042ab2127051sm8834330edq.64.2022.06.06.11.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 11:19:06 -0700 (PDT)
Message-ID: <8f8660db-9cfd-2764-151b-774608848ce4@mind.be>
Date: Mon, 6 Jun 2022 20:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20220606085108.1628288-1-joel@jms.id.au>
 <20220606085108.1628288-3-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606085108.1628288-3-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH 2/2] package/powerpc-utils: Bump to v1.3.10
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

  Hi Joel,

On 06/06/2022 10:51, Joel Stanley wrote:
> Since v1.3.9 the package requires numa.h from numctl, so add this as a
> dependency.
> 
> This bump fixes a missing limits.h for PATH_MAX when building with musl
> as detected by the autobuilder.
> 
> librtas now builds fine with musl too, so remove the glibc restriction
> for enabling that support.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/613ec647e251ac52a01f222044bd675ce36c1b5b/

  Since we're about to release 2022.05, it's inconvenient to bump the package 
version...

  Also, it's not clear if this bump depends on the librtas bump. For sure, the 
removal of the glibc requirement does depend on it.

  Is there a possibility to backport the patch that fixes the build issue instead?

  Regards,
  Arnout


> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   package/powerpc-utils/Config.in          | 5 +----
>   package/powerpc-utils/powerpc-utils.hash | 2 +-
>   package/powerpc-utils/powerpc-utils.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
> index d04d81c08acb..9034ea2e0fdd 100644
> --- a/package/powerpc-utils/Config.in
> +++ b/package/powerpc-utils/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_POWERPC_UTILS
>   	depends on !BR2_STATIC_LIBS # dlfcn.h
>   	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>   	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_NUMACTL
>   	help
>   	  System utilities for PowerPC machines.
>   
> @@ -16,7 +17,6 @@ if BR2_PACKAGE_POWERPC_UTILS
>   
>   config BR2_PACKAGE_POWERPC_UTILS_RTAS
>   	bool "RTAS support"
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
>   	select BR2_PACKAGE_LIBRTAS
>   	help
>   	  Enable support for functions that require RTAS.
> @@ -28,7 +28,4 @@ config BR2_PACKAGE_POWERPC_UTILS_RTAS
>   	  lsslot, activate_firmware, rtas_ibm_get_vpd, serv_config,
>   	  rtas_event_decode, sys_ident.
>   
> -comment "RTAS support needs a glibc toolchain"
> -	depends on !BR2_TOOLCHAIN_USES_GLIBC
> -
>   endif
> diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
> index 8d0b10425b6d..b3c77fb223ba 100644
> --- a/package/powerpc-utils/powerpc-utils.hash
> +++ b/package/powerpc-utils/powerpc-utils.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  4e3a21419863c08adde49f0795eff0fbfe4597ce82593fa5fe1f1177913fb7b9  powerpc-utils-1.3.8.tar.gz
> +sha256  d64d9016a3e63a1e44c6e0833742cf964ae6bb1c6a9c7f0c7c5748aa335dc3db  powerpc-utils-1.3.10.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
> index b12194ae8e73..19fa84946c91 100644
> --- a/package/powerpc-utils/powerpc-utils.mk
> +++ b/package/powerpc-utils/powerpc-utils.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -POWERPC_UTILS_VERSION = 1.3.8
> +POWERPC_UTILS_VERSION = 1.3.10
>   POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,v$(POWERPC_UTILS_VERSION))
> -POWERPC_UTILS_DEPENDENCIES = zlib
> +POWERPC_UTILS_DEPENDENCIES = zlib numactl
>   POWERPC_UTILS_AUTORECONF = YES
>   POWERPC_UTILS_LICENSE = GPL-2.0+
>   POWERPC_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
