Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A410FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B33660E6F;
	Tue, 19 Apr 2022 20:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Xq_jXAJ4azH; Tue, 19 Apr 2022 20:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C55C60E49;
	Tue, 19 Apr 2022 20:41:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F0CF1BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53D8D40A9D
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0gA0uGNjZje for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:41:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75485404D7
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:41:01 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id s18so35402633ejr.0
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5ag1UPuCaZBobqmCI73Pjp0RnA8I5XDXGPY47EMiuKI=;
 b=QGc7W08ByLIyXzeboQsxbOR7lKpjtOcSg0P0x+9kxHn1tt1LAxzeTcXZKvU/ierFMe
 lPCSR8HNiT0IAwdld+TN6e1D03KLKodgE/xFBxLrE2PITm9/G/ZO+bbwb2D7KMWXYqhL
 x9NRsXkthY6kWTh0mXmXNYye1TYCHmTMe0rjK4MVhQmnz6FRfdbsc5XmkjeI6fpeaKox
 TKF6Ij3vGvGTx3tUgfBqC15SzjitHZhv1//Lxf0z8mVNnWg7m5eiIuU7E9cy4DLhV8SY
 5qup0IIrjQhTFWS03F6XmD+XRpFtohT1vGqHtjo4Ewv6tQPClbZYtJQhV/k4xSTKenhE
 6TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5ag1UPuCaZBobqmCI73Pjp0RnA8I5XDXGPY47EMiuKI=;
 b=DSXwQA/FCVkvZ7OpULNRBEXaf3+Bryo06gouthL2IYsOj41sdZ7p2TLn3QNln0lWdJ
 PMusV5EO8CHsPvHbvje3jHuie9oXNXR4+kE6YMOh5758dQdMvCBidJzI1rH87SdeJzjC
 GtatHHXlFFjXj3CU4dGRGBLf2eqVBaMEVUTQh0eN/UirRiQlJzLhu/sI0+me5a8A7iHA
 dkMQIyimtRNaSLieg57tWckorOmDIabDdHWEP3SLZpLBBh9bE+Q62enr4uC14nfJMhlT
 kcoFzv3wqFSJzG33Lx0D805T6yT/CrWQ3eDqzXxcK2+2yO+0AI4uFNvSqIFwj9hKqhFy
 S6lg==
X-Gm-Message-State: AOAM5337smXWPnEoGv14UaBsPNaSORyeHa2dBcpQe2nK0fL/n+ekw9Fc
 AjOINk5XfqTfvNCA7jEHm3xKMWSngTGqXA==
X-Google-Smtp-Source: ABdhPJzMMx7KNa28xPIMHwMxi6K+H4aXwnbxpKoPQjBgUUbkmS2nLno6YTVphT21H/FKO2R6Fm8F3Q==
X-Received: by 2002:a17:906:f20a:b0:6ef:b9a3:3ca9 with SMTP id
 gt10-20020a170906f20a00b006efb9a33ca9mr8675904ejb.693.1650400859669; 
 Tue, 19 Apr 2022 13:40:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r3-20020aa7cb83000000b0041b573e2654sm8898931edt.94.2022.04.19.13.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 13:40:59 -0700 (PDT)
Message-ID: <b1139dc5-9d2f-50bf-2aa4-006117da4cc3@mind.be>
Date: Tue, 19 Apr 2022 22:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220414203059.1818820-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220414203059.1818820-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/php-apcu: needs threads
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
Cc: =?UTF-8?Q?Herv=c3=a9_Codina?= <herve.codina@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2022 22:30, Fabrice Fontaine wrote:
> php-apcu needs threads since its addition in commit
> 8ddeeffa186d8bce875ac713c1e71483c618842a:
> 
> In file included from /home/buildroot/autobuild/instance-3/output-1/build/php-apcu-5.1.20/apc_lock.c:20:
> /home/buildroot/autobuild/instance-3/output-1/build/php-apcu-5.1.20/apc_lock.h:41:11: fatal error: pthread.h: No such file or directory
>     41 | # include "pthread.h"
>        |           ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/314405423aeece5ee55d76ec5c4fa1919e7ee853
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/php-apcu/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/php-apcu/Config.in b/package/php-apcu/Config.in
> index 6338980222..f8e1eb17bb 100644
> --- a/package/php-apcu/Config.in
> +++ b/package/php-apcu/Config.in
> @@ -1,6 +1,10 @@
>   config BR2_PACKAGE_PHP_APCU
>   	bool "php-apcu"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	help
>   	  APCu is an in-memory key-value store for PHP.
>   
>   	  https://pecl.php.net/package/APCu
> +
> +comment "php-apcu needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
