Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BE6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D84B160E52;
	Sat, 12 Mar 2022 17:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwg5KRFHzRHh; Sat, 12 Mar 2022 17:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1A8760B17;
	Sat, 12 Mar 2022 17:04:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C47C1BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B51F4028F
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96o_U1t6j_mQ for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:04:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93DE440100
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:04:43 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id d10so25367282eje.10
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=MR4L1mZMKfa0OO2HYvuALJeMb4/SvDJYZ2cXvLzFXQk=;
 b=RALjiy3ItWR6wPGoxYzixyDT3JyDZFDrRlCQqYnf+SKUerp8/0RSedwnZd7i/+6Z4b
 eoOT19GYm/TWz8efsTBMOVZFAJmHz3jKwtEFBkzvXH/TuG7tICV77edYjJScZpTHUFCD
 MtKUUF2DmacMAezfXV7Z0Ql+E7OKpzGkSbcqDeSVNwU5GytfoEb/hLKHvnSzcHYGFCCe
 RBpmuz9mkyTZPHnHHPZudMNTLRED42K51ZoZLp1pxqIMgTfo2XTyUX5DBtnYME1a37Ln
 D5ukkxRz7xCxX3U6jJdeZM/EqJ2q2JBd2q0gVQQDlIqsvcrybDskwlHZ/QSU5P3F0C8y
 LO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MR4L1mZMKfa0OO2HYvuALJeMb4/SvDJYZ2cXvLzFXQk=;
 b=DzMi2Bu9VYTIlZiGMLi2kanPWMWAQb6W7lwR3zoBDZusBCRxnHMlTdXHmAim7ga1Rr
 35L2siVZEMDNQP4RG29c7Eu+TfXrwD7JDI71gyvhpZRcM0veRYW2khIkgAalFOzCoB2u
 EC3zEYTWLpdeTvKIgrFTTJTAiehPWU03InLG2kDIujcWXb2T/FKJu3IjpQ94UBZ9KEtW
 50CLLDrQl0JYALlnwwdCzZ6V15Dc1s6His8RjOiwU8jYv+lMq+WRUxg7YuuipvkHTm62
 yOi8Y5cEhA5IbgL8wlx1a9HW7JB/eDDLjdmkF7RwbfyqKfShfQ0qu0+pv5+cOtEN1b9R
 7ZAg==
X-Gm-Message-State: AOAM531is9qSRY+PMLZm1skgzX+9r58g9t5OralxlZ/KAxePz3J3eOxD
 U+8ZHToOL8BxRjWC+dF1JrA3bA==
X-Google-Smtp-Source: ABdhPJwfP7gjLFbvZSbxBQr5gF1ENODl4FTayI9c4t9IHhhP+t51qhVeDfz5ZYHB5R6WkrK4s1Sv/g==
X-Received: by 2002:a17:906:6a24:b0:6db:ad7b:9066 with SMTP id
 qw36-20020a1709066a2400b006dbad7b9066mr6335374ejc.697.1647104681737; 
 Sat, 12 Mar 2022 09:04:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1709066b8200b006bbea7e566esm4555793ejr.55.2022.03.12.09.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:04:41 -0800 (PST)
Message-ID: <6fe83bfc-c320-5f51-00af-dad3119a3fc6@mind.be>
Date: Sat, 12 Mar 2022 18:04:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 buildroot@buildroot.org
References: <20220222095340.29327-1-nicolas.cavallari@green-communications.fr>
 <20220228085659.17489-1-nicolas.cavallari@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220228085659.17489-1-nicolas.cavallari@green-communications.fr>
Subject: Re: [Buildroot] [PATCH next v2 1/1] package/libgit2: bump version
 to 1.4.2
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



On 28/02/2022 09:57, Nicolas Cavallari wrote:
> Licence changes mostly concern vendored dependencies (that buildroot does
> not use) and a new bundled PRNG used to reimplement mkstemp()
> 
> Some buildsystem options also changed:
> - THREADSAFE is now USE_THREADS
> - BUILD_CLAR is now BUILD_TESTS, which the cmake infra already give.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

  Applied to master, thanks. Thanks for the excellent commit message.

  Regards,
  Arnout

> ---
>   package/libgit2/libgit2.hash | 4 ++--
>   package/libgit2/libgit2.mk   | 7 +++----
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> v2: bump to 1.4.2 instead of 1.4.1
> 
> diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
> index 07b1a260a4..ada411ea22 100644
> --- a/package/libgit2/libgit2.hash
> +++ b/package/libgit2/libgit2.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  192eeff84596ff09efb6b01835a066f2df7cd7985e0991c79595688e6b36444e  libgit2-1.3.0.tar.gz
> -sha256  8b7e4f54f8bf210c8fe010a49571a1ee57463ef020cc43f051d4d3fbb74942af  COPYING
> +sha256  901c2b4492976b86477569502a41c31b274b69adc177149c02099ea88404ef19  libgit2-1.4.2.tar.gz
> +sha256  0092f24acc306ee3287dc05b5e85cb9e0e48cd3f11c60c4625b1a673a5912616  COPYING
> diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
> index 6cc0f1ea74..e94dd9c370 100644
> --- a/package/libgit2/libgit2.mk
> +++ b/package/libgit2/libgit2.mk
> @@ -4,21 +4,20 @@
>   #
>   ################################################################################
>   
> -LIBGIT2_VERSION = 1.3.0
> +LIBGIT2_VERSION = 1.4.2
>   LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
> -LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch)
> +LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch), CC0-1.0 (xoroshiro256)
>   LIBGIT2_LICENSE_FILES = COPYING
>   LIBGIT2_CPE_ID_VENDOR = libgit2_project
>   LIBGIT2_INSTALL_STAGING = YES
>   
>   LIBGIT2_CONF_OPTS = \
>   	-DUSE_GSSAPI=OFF \
> -	-DBUILD_CLAR=OFF \
>   	-DUSE_ICONV=ON \
>   	-DREGEX_BACKEND=regcomp \
>   	-DUSE_HTTP_PARSER=system \
>   	-DUSE_NTLMCLIENT=OFF \
> -	-DTHREADSAFE=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
> +	-DUSE_THREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
>   
>   LIBGIT2_DEPENDENCIES = zlib libhttpparser
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
