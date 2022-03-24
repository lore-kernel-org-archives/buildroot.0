Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647C4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA93C6104C;
	Thu, 24 Mar 2022 21:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35FZdcepLkyv; Thu, 24 Mar 2022 21:46:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A96861040;
	Thu, 24 Mar 2022 21:46:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FFFF1BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39E4B828AF
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-1fl8zVJEga for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:46:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 935E982438
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:46:42 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z92so7122142ede.13
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+VKcXHx05KIochakmNm+VrHauF/Dc5fzqJAQwB5z1SQ=;
 b=dciy2IDYiC/InKTnDZQA+ie8HGAXUcUEQ6K1eKiAZYb2gdThNUJ+o1szI/7PAWs7Xq
 hWdcoemZS5+VHIbJwJfpL95xnmmi3kCK6Hltw4b0SADoDtrVAvPoP+ljwa+J0nvAf7pw
 AQzpLp8I1txbI3xm6eMH/WQ0S8KvCqtccViJgdk9K2wmxFM4g/c9eI3Nr94AnK8AXQGy
 K2W04+alhfdzLd0EOfxPXUAvxnqUwlf7D68pJao1VS+QhJxaoM9FxtcZ5RCCIhboz/O0
 1PzUT8QmoQ4D5vF2GB3g0l96nFIZir4z7TqhdWzBBHPL8P97MwAiwraxfF9aNculiQR+
 bB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+VKcXHx05KIochakmNm+VrHauF/Dc5fzqJAQwB5z1SQ=;
 b=WQbp1ZjOpPjvoKQqzjGP2KN2PN0qYUnrTRHR86pXDjuWY686GXpc+V+UlEVMRd2xZQ
 G5emLDkIoKwiBP5TNNaWoQlTDmqVe6+r8X0Bgj4AaQAlgtH72t4R4p1plF3sUWJbvqGo
 qhqrrPDCzACD0RsQKon0cHg3GIdF9hU1qAveXgP3AHH+6H+8CIVGZYwUXL7V7SqcXbz0
 GvQCh///ifRI0BiMOypmVwhnDYybXEMcCvRC1l1mA7oY5wASUmycazIdnIcwdcMHMb+0
 RoDXBQVbiRetDiOknMH+KIe/nvXeDcbgoL/1AgyDUBbIMOKSU4hEYEdXOjSDH6gtQKUn
 8vqA==
X-Gm-Message-State: AOAM532KGSnupAw+XCWww3wzJVPALdCOWgU+4JksNeAX8dH1KkKQct4I
 6SZjGYYilz4cATV8SLVAoZAg2nWNIpdDDQ==
X-Google-Smtp-Source: ABdhPJwrUcNmEY4s4Y3r4+5xRgDWZ7TxR0INWYbEQeLFTCpawmy/A+jdqF4fprM9Nz/g2XcQeLHh7Q==
X-Received: by 2002:a05:6402:348b:b0:419:172c:e2aa with SMTP id
 v11-20020a056402348b00b00419172ce2aamr9264528edc.261.1648158400613; 
 Thu, 24 Mar 2022 14:46:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 27-20020a17090600db00b006df6b34d9b8sm1588692eji.211.2022.03.24.14.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:46:39 -0700 (PDT)
Message-ID: <97a25507-2a9c-4928-eb14-388693a3766b@mind.be>
Date: Thu, 24 Mar 2022 22:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220316190545.3618918-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220316190545.3618918-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.49
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
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/03/2022 20:05, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied both to master, thanks.

  As Peter said, a changelog would be nice (so Peter K. knows if it needs to be 
backported to the stable branches), but I've applied as-is anyway.

  Regards,
  Arnout

> ---
>   package/ell/ell.hash | 2 +-
>   package/ell/ell.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ell/ell.hash b/package/ell/ell.hash
> index 4bde1ab677..9affa390b8 100644
> --- a/package/ell/ell.hash
> +++ b/package/ell/ell.hash
> @@ -1,5 +1,5 @@
>   # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
> -sha256  9894943042a5d6165d3e5cc354f92274fb1304004d02b4bee682ab6067cdbbd5  ell-0.48.tar.xz
> +sha256  a7ff8ecbc76b187d942dd22b61cb489711400897c790319ffb7e944791687c3f  ell-0.49.tar.xz
>   
>   # License files
>   sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/ell/ell.mk b/package/ell/ell.mk
> index 267b44e5f0..9735865eae 100644
> --- a/package/ell/ell.mk
> +++ b/package/ell/ell.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ELL_VERSION = 0.48
> +ELL_VERSION = 0.49
>   ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
>   ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
>   ELL_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
