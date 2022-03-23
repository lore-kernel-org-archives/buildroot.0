Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE0BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3857D418B0;
	Wed, 23 Mar 2022 20:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3U0oil5-_3GU; Wed, 23 Mar 2022 20:43:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F91241872;
	Wed, 23 Mar 2022 20:43:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FEB31BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F05D140383
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id brz1olBhy5z7 for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:43:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54601400C4
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:43:47 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dr20so5253308ejc.6
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 13:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=blBEZVQ8auQ4TPdveeu8l0U3/5gTbbm4YDJ+03p83XU=;
 b=gFPaI3A5X5QgYyeiEM1y0u4QdmXVhljRVSf2XuH08oFpU3d850Rhreo36n3EKHXgfp
 Dcl8rJ4+PCMkNlAgqBq6LiF8soVEwFzQPW1KYv56CJomHMjcpuhkTYKVYauCjY39KZ5Q
 oEOfE/os7uFOoLeL3fb9TXKlEVBoFOzQAbAjLi9SWmLNbt19W7Iiti3VWt2EXIPxbce+
 pS5kw7N1/YTfoWBjyh/na8OyFLJo8aZ1byb01ad8bh8QBeSGb0YSfQ/fsse8/mJ+bMGb
 d11wcKnDXwQqNURR2eaqWnJ4KGG99OdYoulT3istmynyncU2MD9SbE43F9H1QRW4oWNY
 /pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=blBEZVQ8auQ4TPdveeu8l0U3/5gTbbm4YDJ+03p83XU=;
 b=GsRjNOCL6cyYQFPuB0Y3bEUysahcZGId5iA1nxdlt7b/WcWkNQXZU+6ZPEmp4DWKVz
 0oMO92Aa5lpHLjIU/T6DVFibVk7SY0FfY4xTUJTf6BU5+0BWKVt/F/Bo7MhYL+UWLhHq
 nudTByYvBJaA+SvsXqIBsYpQMGlqfbfgjRWr5oiIkTIT16A1HsnRR1NbUTcpt/xAdD3O
 slV3iA/f2b05X/xYkkEiSaRxd+tJLK6/FWW+CFMc1nywi5AqkKvCmVhFwhTawC5rt8Uu
 ai+FhrhIr2cRTP7L8kjhhTFlHxLsGow4wL1nZxhBN7vEsvGokH7LBPvrDkEx/9WDUykt
 esgg==
X-Gm-Message-State: AOAM530d3h7FgPFCljrfmGB7ph4mukm4FiR/1dnG7VUd18aU8mlcpPwR
 OZJqtrTYm72HqwyePyGWqRKrMg==
X-Google-Smtp-Source: ABdhPJz8nb2thtYb3iGSkBQzoRLa8PiQsVDqlW42HAd4+aU5bHlseVfUel54bidnu6ZixA1NkFwo5g==
X-Received: by 2002:a17:906:3adb:b0:6b7:876c:d11b with SMTP id
 z27-20020a1709063adb00b006b7876cd11bmr2138681ejd.250.1648068225447; 
 Wed, 23 Mar 2022 13:43:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ch26-20020a0564021bda00b00418f99695f0sm429252edb.23.2022.03.23.13.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:43:44 -0700 (PDT)
Message-ID: <535e8a72-f175-8c1b-9cb9-e8156143796c@mind.be>
Date: Wed, 23 Mar 2022 21:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220313130424.3046857-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313130424.3046857-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 7.82.0
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



On 13/03/2022 14:04, Bernd Kuhls wrote:
> Changelog: https://curl.se/changes.html
> 
> Updated license hash due to copyright year bump:
> https://github.com/curl/curl/commit/0409192b1fde6b7a4f09667e80ca5dc555eab3f1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, after dropping the NSS option entirely, and with an 
explanation in the commit message why we choose that rather than passing 
--with-nss-deprecated.

  Regards,
  Arnout

> ---
>   package/libcurl/libcurl.hash | 6 +++---
>   package/libcurl/libcurl.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 63d6ba306c..4be245041c 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-7.81.0.tar.xz.asc
> +# https://curl.se/download/curl-7.82.0.tar.xz.asc
>   # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  a067b688d1645183febc31309ec1f3cdce9213d02136b6a6de3d50f69c95a7d3  curl-7.81.0.tar.xz
> -sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
> +sha256  0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c  curl-7.82.0.tar.xz
> +sha256  321b1a09ebc30410f2e837c072e5521cf7095b757193af4a7dae1086e36ed31a  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 20ebb4f271..863cc268b4 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBCURL_VERSION = 7.81.0
> +LIBCURL_VERSION = 7.82.0
>   LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>   LIBCURL_SITE = https://curl.se/download
>   LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
