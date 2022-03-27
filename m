Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712E7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9FA8198A;
	Sun, 27 Mar 2022 15:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlePgYIwwLES; Sun, 27 Mar 2022 15:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4884A81959;
	Sun, 27 Mar 2022 15:59:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A975B1BF20B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9644740179
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0XnCdb0bVcUa for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:59:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E6FB40104
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:59:12 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z92so14348010ede.13
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=eInWjVE3ANRstD+BUPZcsHOtS7BIZ4BLfZYZZ0GxIxw=;
 b=PqBlyBCQTArNtZmLGqKKCdwmsQElUVivSRX+mEMsZ/32Ap1KeKio3EhPxxATmU597V
 g1AlGpVf4uj8c9XcAnx1rlv9mWy/q6xPSw11VgiwxjWfQSU5lbhpd4oSJXfvn52DalxJ
 ZDKFfIjah1/3eKB69YiedMPVpxl+oUPEFYVaNvBEON7ZMBhTTgP92lA/PgsVn2QnbrkQ
 RYiHxhRBJ6G7rnrLUQkHaQYanO2TOyBgWFwoWpzMNRVGOU0+HC95JuJxDzHeD50konK+
 +3AHuBPzTcqNGK/Ufn6hQd52GbgmzXkkWhQtP7m7ObDaCz6Wrg8jYyCJiJqzPt6LzqjD
 /evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eInWjVE3ANRstD+BUPZcsHOtS7BIZ4BLfZYZZ0GxIxw=;
 b=qWdOTAHL+WUA/uW3iKcK8EgSYdFx4WzyfOh9QCXThwvA3SyFPVkORbVg42MzuFkqVi
 AWtbYzgpn6jCBG9NWKYJ33msL/OJKh7LxQ48e5Mr8PKlHAvhh3lMTHMMigXxqoOKy3iV
 Bj6ZDqO8iRMCP7cmJbeMPsNb3BmbBcv8jg+GU63x7UyhnB4FldTcQIfIG9gaIPXPKs9c
 DucOP8CTyirZOqE5UZZvUcYjBGWdqBztGM8N+v78UGgfzLU1ftOnWN6AkdtZlrap24zN
 AdllWxy5N88NaqFj6FJ49EMqObPJr3FY+DDVt1h87ogcFmtBAeSiWAFAdOaIyp0GNW53
 C5VQ==
X-Gm-Message-State: AOAM530MVM12hAE6/4k2yqJsPmNEHIbJh05xOzF7G/pIhvCbNe8CWQhD
 is+QErzThGkjKldmoAkw9cb4pk/5XmiGaw==
X-Google-Smtp-Source: ABdhPJyHPqbgpB7CiGX1okbKj19Cd8bk2mWfFXGQOSkxiZg4uVp7O2sX9YM8fWCk/ek+DKoV5zV/yQ==
X-Received: by 2002:a05:6402:40d5:b0:419:496b:5ab0 with SMTP id
 z21-20020a05640240d500b00419496b5ab0mr10924932edb.284.1648396750583; 
 Sun, 27 Mar 2022 08:59:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170906778700b006df7e0e140bsm4777924ejm.140.2022.03.27.08.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:59:10 -0700 (PDT)
Message-ID: <8c69827f-53b8-eec1-f235-a45e8e313af6@mind.be>
Date: Sun, 27 Mar 2022 17:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
References: <20220320221445.10259-1-paguilar@paguilar.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220320221445.10259-1-paguilar@paguilar.org>
Subject: Re: [Buildroot] [PATCH 1/2] packages/guile: bump to version 3.0.8
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



On 20/03/2022 23:14, Pedro Aguilar wrote:
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

  Applied to master after squashing the two patches as suggested by Yann, thanks.

  Regards,
  Arnout

> ---
>   package/guile/guile.hash | 2 +-
>   package/guile/guile.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/guile/guile.hash b/package/guile/guile.hash
> index c2719fa7f2..e9ae5b6e51 100644
> --- a/package/guile/guile.hash
> +++ b/package/guile/guile.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256  f57d86c70620271bfceb7a9be0c81744a033f08adc7ceba832c9917ab3e691b7  guile-3.0.7.tar.xz
> +sha256  daa7060a56f2804e9b74c8d7e7fe8beed12b43aab2789a38585183fcc17b8a13  guile-3.0.8.tar.xz
>   # Locally computed
>   sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
> index 859d7ec96f..9478e75b41 100644
> --- a/package/guile/guile.mk
> +++ b/package/guile/guile.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GUILE_VERSION = 3.0.7
> +GUILE_VERSION = 3.0.8
>   GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
>   GUILE_SITE = $(BR2_GNU_MIRROR)/guile
>   GUILE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
