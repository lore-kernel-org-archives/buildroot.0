Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306D9C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3A7D40520;
	Mon,  4 Apr 2022 18:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZdhuZ1ToGgYO; Mon,  4 Apr 2022 18:02:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8FFC4015D;
	Mon,  4 Apr 2022 18:02:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69FA41BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68E418293F
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p18IFIABDijN for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:02:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0036E828B3
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:02:14 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g22so12112701edz.2
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=x7+l5YYMysjvJAhNgtZCgqQt/H8dzn0qOLjdA7buMsI=;
 b=Jf+KLbSkjERAeF74zeiMbP+Jy+dl5ZcMkcLAuvvXub6SPkMm9XcAE827pa9SXvihmp
 Gg94rV1TNljY0BBiNIrGPhuwoaPLCKwcp3AJ61Rk84WaBZaUIEYgJjWUq9e564aWXTjY
 iK3X5zgugW18nmgMl4kU2RsTZHphrrLXbrByp8uFIKdG+MMdAPkTNSgON6Q9n8j5bl+D
 AEdmptUxSvrhhnxhBuZAW6uA6YLTTAY2BbuvTzc1bLQyDOouGohti0mrsrxJSWUT51Sv
 NklSBDkMm9JoEIK8rFomudBb+9g7Hyy5IZhEip+ZNt4Gs83EF62fqquOt9WdlxGrQQ8v
 pW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x7+l5YYMysjvJAhNgtZCgqQt/H8dzn0qOLjdA7buMsI=;
 b=mbgYVKDnhYdWayCiZKnlkBEcR+eaq72QcCRUKuQvHCjLkDAcegP7nn+lmVVOoqZijK
 hEzFp3EQ3TTXSwI/HJ2hGUCRcwkj6JJH/WfX29rFOE+esHb5jPUeRQ2dFLJOXwhtHX1R
 UuS1Jean0NH0rY0Q/AsnkOfKIIZmNWH8VM/GQjcScC2je+8GxxDv3UjIvS2GMM+d0XJs
 5O+4KukDSX/36tzg6NstpxbdE4uptysotRqjAr7YllXGNjn8XfZe3mu2llFp5wSaCHp1
 SDLodyJZdXB0nbyVH4KTxFQ1JNqA+5Cu8VmScnK943IUtC7OupH81OEUO5820VmktGCb
 F8JA==
X-Gm-Message-State: AOAM530qMMMMst6VnsWZZ3a3LS8RDxGTPdb9z1o1ffiHg+xNY2cKoUyC
 AIx+aE+8Af+iHPk/Rc54l/hjc5qCo1IEOA==
X-Google-Smtp-Source: ABdhPJxh0tW48Sk0eNXNUHJJd91G1uTsEK4r1nLwcM1ZWDHz9gK7tcYirFBLYcFYmsbktBiI8ZvMzA==
X-Received: by 2002:a05:6402:4248:b0:419:4583:eaa2 with SMTP id
 g8-20020a056402424800b004194583eaa2mr1446328edb.376.1649095333056; 
 Mon, 04 Apr 2022 11:02:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a1709060e1900b006e7fe06664esm748301eji.106.2022.04.04.11.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:02:12 -0700 (PDT)
Message-ID: <94227ab6-9e4a-f728-adb8-ca75eca8975a@mind.be>
Date: Mon, 4 Apr 2022 20:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
References: <20220401083100.64722-1-marcus.folkesson@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220401083100.64722-1-marcus.folkesson@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2022.2
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



On 01/04/2022 10:31, Marcus Folkesson wrote:
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libostree/libostree.hash | 2 +-
>   package/libostree/libostree.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
> index 3a06340575..4c8c2c4f10 100644
> --- a/package/libostree/libostree.hash
> +++ b/package/libostree/libostree.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  43a00e7856842b8a34f6616fc2ce1ce238ef43210cca41f70e6b4b0d2a9fcad5  libostree-2022.1.tar.xz
> +sha256  76e2f5b5784d8cb686e90be32fcecbb56c6c6a824e0374a1a6820b577103676b  libostree-2022.2.tar.xz
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index 9cbf2848c9..07e0a2aaa4 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOSTREE_VERSION = 2022.1
> +LIBOSTREE_VERSION = 2022.2
>   LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
>   LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
