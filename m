Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89236C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16402410B9;
	Tue,  4 Jan 2022 18:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INCJGMb5tU4u; Tue,  4 Jan 2022 18:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57E83410BB;
	Tue,  4 Jan 2022 18:30:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28D121BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14CCE404D4
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AR3qpbhFodZ6 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:30:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4AD540236
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:30:14 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id q14so144097688edi.3
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=TKA2g/fMZFZrZ/QjojN4M7FCmcZlZ1VbO9gQ3GkgDI0=;
 b=FWhFjO16BsjkQs6gK+JNssPJ0JghWmfmhq7atpDIIX/bJJ8XftWB9Dy/+E85+Yrx2u
 bRCZYNACp20/ZwNfiId0VEBsVdPS3shIIKbGRHFD2b0Rg7NzPCF+1Xv+NPOoOaPWLRfa
 sL4k15Fz0y68pMZpB9xAiFzul74VqixDPUMJLptoKdHHGUFiSStf4p1MTmgIUKQfSrWO
 JtP6Yjt/Mpmo4REOscAb8NNEZOirwscOQJsYqXPeo8eyJJDf6r+6uvii000EJThInmXS
 RhL69bRVNBDfiYOnVxUm+EB9oiGhlvysaMvKCp7XMwOpOG35YWUSovuYVJ5xgDeDBKCG
 /YVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TKA2g/fMZFZrZ/QjojN4M7FCmcZlZ1VbO9gQ3GkgDI0=;
 b=npkiG6dSJ6RQwwWp0im7Pr+5xqDmhaCR4rsVxI+4/xiWZUsk6zJ9TSJ3AGzS1v0b62
 bmmRVWZUa1JVLF70K7LWSsopv46pjVGm086ACluHW2kZ2TxDdQsWLlLZ6VarD1HVt/pw
 mOGYltjYhG/bS3NmCATUbQNKmbithafxVzQUEYkSp8k7EIQcaCQiw5X77/69FjWNfrnn
 lyLZIHrckSXNvjDFZCIeKqNjWk3FxL4+hkbh8Kmz9ZRYV3EOc//EYSsoVckuOF2z8UpW
 4cNMCk/XJsQkFJkCvvyrmidCO8oI5dggnhSOL5tG5x/pX/Z7M9gNuLZj9IpyCEqkCBhI
 CZkg==
X-Gm-Message-State: AOAM533APrmyrmfrRAaE7TW/eFOOzqUpuSzUh3G9KXIEi1IaJRyc7VCB
 al8iRLWm/bbqYawwljbkbLWkFA==
X-Google-Smtp-Source: ABdhPJzrstSMBoKv3JYQS2fcG677JsfY12i3g6/LMb65YKzo5T5cTCsLQELjxgh0aM5HqCTVzGluWQ==
X-Received: by 2002:aa7:d749:: with SMTP id a9mr48407264eds.232.1641321012741; 
 Tue, 04 Jan 2022 10:30:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a16sm11620425ejk.8.2022.01.04.10.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:30:12 -0800 (PST)
Message-ID: <2386b29d-68b3-5ffa-8a0e-6dfd3de3b83d@mind.be>
Date: Tue, 4 Jan 2022 19:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220103210713.8642-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220103210713.8642-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/terminology: bump to version 1.12.0
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



On 03/01/2022 22:07, Romain Naour wrote:
> Requires efl 1.26.0 [1]
> 
> [1] https://git.enlightenment.org/apps/terminology.git/commit/?id=3e95d2ad9f59e01d498e90dcb4413dc886d49852
> 
> See:
> https://www.enlightenment.org/news/2022-01-02-terminology-1.12.0
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/terminology/terminology.hash | 4 ++--
>   package/terminology/terminology.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
> index be1d6f4269..7e9658482a 100644
> --- a/package/terminology/terminology.hash
> +++ b/package/terminology/terminology.hash
> @@ -1,3 +1,3 @@
> -# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.9.0.tar.xz.sha256sum
> -sha256  3f3bc327da5cc239d468570afed29a17e2fda3b1fee02b28f02ee7ed5141e46c  terminology-1.9.0.tar.xz
> +# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.12.0.tar.xz.sha256sum
> +sha256  74d2d3b253a77bcb215fc36eedf0ccb59643452e2ef15c510430ffaa6034dcf0  terminology-1.12.0.tar.xz
>   sha256  6863ee700fc82b9c3b82a1627136f6935a9eb68e6a64491f20e00b4023c33622  COPYING
> diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
> index 29b59fb39e..787c9ad137 100644
> --- a/package/terminology/terminology.mk
> +++ b/package/terminology/terminology.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TERMINOLOGY_VERSION = 1.9.0
> +TERMINOLOGY_VERSION = 1.12.0
>   TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
>   TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
>   TERMINOLOGY_LICENSE = BSD-2-Clause
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
