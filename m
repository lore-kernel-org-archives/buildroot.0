Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2C4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DFB184036;
	Sun, 10 Apr 2022 14:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yl9QwA5Vg0-u; Sun, 10 Apr 2022 14:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8441A8401C;
	Sun, 10 Apr 2022 14:47:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 396661BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 272D04017A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J70AnpavfGro for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:47:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A93EA40119
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:47:21 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id k23so26056475ejd.3
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5RJtE/RlTJ6vM39K2ybdUiCObW16rVjKrtNB+GKeVYE=;
 b=VnmGSqyEHar/SQUJN5DP9B87MP556zTBfhGAfvVBokmEcUju4zwlY/Dy/XCJyB4VW1
 mzlH9ct9UFfwOWSm5J7gXsAyrNsG86fVzDTCzlRwccmV3Sa/jU1gpqhkMmNRYUbfpcfF
 Fcqpzo5Z0ABtWWVBqPmgriWY/mOKCrABkuxooy2BDLVhzJcS4Fq8h0ZMWjYTslb0G5jm
 C8E1MxksRQ1CXqh1b5vH3mpVhGzTVJ8HhfsHWzX1mgpjDiZxj0GB7yG6CgLBrXCGPIqm
 qNHdEAguRng1Yxx+WOPTgYRFBfhQs+GQOK8Z9MjJcs79QCEpi46CYNV+yC8UVav4GSkI
 /7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5RJtE/RlTJ6vM39K2ybdUiCObW16rVjKrtNB+GKeVYE=;
 b=gYidbiBQdf2x/N+6DJBHarfZwJne7YZl5QRO25XDr5aAON7bF/EdSjfcdpRkcBjujP
 E3i2Kyp3oAX/HrcglT7KFtuPVH5b/xD/ZLsz8cc8LWzCqhTVJiEFVGweqJTjh8jQ4jxP
 pFa3kpaR7BawgZDZEn3/J6oBgmvjAxz0jl43ifr9gbg8wpNMKoZWpJavsp/qW1mDY+V7
 SsRVRtKpVWcXaBfZZKMai/b+2OrQrJF3UVS2X0HP+wfw7wGp9sZPWv4duV2udKVtG6Up
 ill7QyO/kdy5ttdXvugeQc5KoNNLMI7wjR4mZBTVQjphC/NIxStznMrKXg0xNFlcHPZ3
 3XgQ==
X-Gm-Message-State: AOAM530ZUnO0CG2PZPFZhP6QHoFrlUTKdn0mVXyxf/hRNuVVUbInuWio
 So0Z0Gllwi8Zqs2N+n1PwXg3Bw==
X-Google-Smtp-Source: ABdhPJzXGgNU6I7IFCnwTViiBbX59/vUEHJZLUBqPqovLmo4eDXvITpY0anLUmBIgip1HNH/n1Fcvw==
X-Received: by 2002:a17:906:4fcc:b0:6e0:3269:2054 with SMTP id
 i12-20020a1709064fcc00b006e032692054mr25290228ejw.117.1649602039777; 
 Sun, 10 Apr 2022 07:47:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056402440e00b00416046b623csm14363961eda.2.2022.04.10.07.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:47:19 -0700 (PDT)
Message-ID: <ff5d52e8-f5a3-fda0-1c40-de3ef223d8d8@mind.be>
Date: Sun, 10 Apr 2022 16:47:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20220404221451.610628-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404221451.610628-1-christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: bump to version
 v1.6.2
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 00:14, Christian Stewart via buildroot wrote:
> Note: this version adds compatibility for Go 1.18.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/containerd/containerd.hash | 2 +-
>   package/containerd/containerd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
> index d5aafe2e70..eb9f2894a9 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>   # Computed locally
> -sha256  40c9767af3e87f2c36adf2f563f0a8374e80b30bd2b7aa80058c85912406cef4  containerd-1.5.9.tar.gz
> +sha256  4ea21a6b4649512366e7c31ae547ad89c6a69c6586a6d8565cff07898de344b0  containerd-1.6.2.tar.gz
>   sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index 8976e12f1a..36f2db4125 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CONTAINERD_VERSION = 1.5.9
> +CONTAINERD_VERSION = 1.6.2
>   CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>   CONTAINERD_LICENSE = Apache-2.0
>   CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
