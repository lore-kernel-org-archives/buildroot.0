Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF71C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 08:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E397405BD;
	Mon, 10 Jan 2022 08:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9ikb-hAZv5a; Mon, 10 Jan 2022 08:13:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A6AE40463;
	Mon, 10 Jan 2022 08:13:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8AC1BF29A
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BF3660C06
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOi8COwKpSC0 for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 08:13:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1134C60C00
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 08:13:22 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r9so23357698wrg.0
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 00:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=DF7YohGXlWQsswXskC14fT1uYlT4SHip0AYn4fzpjSE=;
 b=D+92m46r5d9A4xM7+p/reOPAWKu4l4WaKiLq3J8bYkUn49wP/4obJ8vsW7zfArIoC1
 a7zeByJaqfWO8OONTRAkCQnB98Q35HOpj4J3OoL8BbNnHTyqxxZuIpjxmkGu/uB1HKiR
 8dt5o6z02NQbXTRH/XXo7c1gay/nzDP94+l+fZz2eo6gtiI2jEAijcsTdO2OYtdAmnc0
 Tm494/ue8oxvQnHipseM9lGbMmdTi9NcdX2+hUQlJ5R+qN2JPPeWY6rNGPDExm9ZBItq
 +DTzhkSn6T+o/M4mLs7mXFAnV28RZEu7RElFgH2e1dbBKvz7H1ZuN3dMQzqqAmA3gKpM
 ZeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DF7YohGXlWQsswXskC14fT1uYlT4SHip0AYn4fzpjSE=;
 b=anj8ZeSnAhzA1uLa8Gto4GRAlNJsNaH/rmBPIj5VuRrqTavr3VtCBpncigeUJb3xSD
 TV9ggiPIOKq7BtOI11KeVY3clOidYJ0ZEhTvWK6DrJBOy2YNWzj4W2qRxT18h0bKWHSd
 C9yxA8jt1uZCPdFzCaYPfRwrWRFw2o9syRM8v6Nnr81twVIqSHfN+dTYZzNw0J6CxThq
 RRht7/3jxs2U8Lszo7rwVjSZIe8PPWVSajUzW9eJ+CrzeRqrnWNJUHNxH8BZwUEALy39
 BXHXN8BQvf3/A0Es2D3d8DmvoRO9vXHD2Ed9zSc7ZeIOxKSR29LdxJsahNH/YMzoFzWd
 9Kyw==
X-Gm-Message-State: AOAM5325a/3qZ3fRth+Wy/62BRpsduKpLai1oJzoQZpDX5NRN/zUJtqI
 djwbl08bDA6am6qG0nj1xDevwA==
X-Google-Smtp-Source: ABdhPJx7Z354DwbPRUWwwUHzuiPGAGS9Ovtc6xmcyhucLvVi+zYbve0ae2RTRsFJUrtS4KY97/4KVg==
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr64732126wrz.513.1641802401167; 
 Mon, 10 Jan 2022 00:13:21 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id j39sm6223976wms.0.2022.01.10.00.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:13:20 -0800 (PST)
Message-ID: <d3b32112-3f10-1bbc-9ef1-09b9b1878843@mind.be>
Date: Mon, 10 Jan 2022 09:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
References: <20220110080301.2805134-1-marcus.folkesson@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220110080301.2805134-1-marcus.folkesson@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2022.1
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



On 10/01/2022 09:03, Marcus Folkesson wrote:
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
> index e81deb82a6..3a06340575 100644
> --- a/package/libostree/libostree.hash
> +++ b/package/libostree/libostree.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  e80631cb1363d4734fe9d0c91f69a68be3848166d6e0481db19ce44a9cb4f531  libostree-2021.6.tar.xz
> +sha256  43a00e7856842b8a34f6616fc2ce1ce238ef43210cca41f70e6b4b0d2a9fcad5  libostree-2022.1.tar.xz
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index a6b09f95e5..22cb83d039 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOSTREE_VERSION = 2021.6
> +LIBOSTREE_VERSION = 2022.1
>   LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
>   LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
