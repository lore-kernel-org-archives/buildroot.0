Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C48C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B226540A67;
	Mon,  6 Jun 2022 13:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSdzgXWeFSyK; Mon,  6 Jun 2022 13:21:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8E3D401AE;
	Mon,  6 Jun 2022 13:21:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E61461BF2BC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDE89401AE
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULRwNEAotaQc for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:21:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82A7B40127
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:21:44 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id v1so18238862ejg.13
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=YICJEJASd9ZQPeNTqNxOgHymJewHE0y3UGYLuHu5gKs=;
 b=AqPVYVmXuub+gCb9A+Y0e1YxC/pjzQHqW7KnZdCKfVLXX75fqTBs9W4nj+UFNNkkJ4
 8nFjh8wP9axQTCt8ztolvqTnD7BucHIULmyyZLNjeSZEW33Oh7/dgJvn8RF6+ftllz8w
 0LloGHO/orgHvD4z6WoVsQqENXPuGMUhA6+GVUoXZWw/pIcDrnYs05myUlYSsFl6QAsu
 vu9vpBBXRX7B6q2MP5Pykr671//jWCPSrSybCO/AgmHtrEK513gOf9Yo1L9QfEoKu8w7
 mgc+oTxOcTfYYCpXs5kPXq/emdS5UgSQQ26Mm3ewpKHgb2by9xYgJfiUmL0GdHOWJSY2
 FSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YICJEJASd9ZQPeNTqNxOgHymJewHE0y3UGYLuHu5gKs=;
 b=0sX2UolREehWNyJIbKqQd09CKbcO6XdWXkOL+wdpubVPnw1Lg6L6qaoUEgTETKAQKB
 KNB6ZWxWwae1cc/536kQhBVYiuImHqXC2ywPubc5jKwSKvAhon1ZzkJHou1X4rgWEKBJ
 UcaHYWHq/f6pWI29bu5bu1CDC8q2iObgvmXGvXK3IcbPQ4aldxKwmmlQIkgycjpZZsK7
 DpBNmDFp2KOFwMIZdFkaFxYWicVi1369o1fAarOyX9WwM6f9/kaf6n8yu5AWj4/lohWu
 IZ98M6J747GpohwPkDHMxbjCn9/K6SWTp8CaHxNoZsSBaVlES+OKkel1gkOxvRvj4kxN
 OvnA==
X-Gm-Message-State: AOAM530adKvm8cwl804NWvw3Qq5Z9j931tV60TRodXTWtD5wBROdCsTq
 ApADFcIA7i+hVoZxvNV/HR7epg==
X-Google-Smtp-Source: ABdhPJyfPWr6cA4TmyBx/5g4CNjYy4WNIrm2noKuc/PUAF6g36XW58V2cREJCQivi436g5QvST3N6g==
X-Received: by 2002:a17:907:1b0d:b0:6ff:22a1:d58a with SMTP id
 mp13-20020a1709071b0d00b006ff22a1d58amr22153719ejc.293.1654521702590; 
 Mon, 06 Jun 2022 06:21:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a170906805200b0070b7875aa6asm4980421ejw.166.2022.06.06.06.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:21:42 -0700 (PDT)
Message-ID: <0a11575b-2dda-840f-bdae-c34819cd5b8d@mind.be>
Date: Mon, 6 Jun 2022 15:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220528213507.4149540-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220528213507.4149540-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] linux: update cip/cip-rt kernels to
 latest versions
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



On 28/05/2022 23:35, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   linux/Config.in  | 8 ++++----
>   linux/linux.hash | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index fd3605a559..0db94370ca 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -32,7 +32,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17 if BR2_KERNEL_HEADERS_AS_KERNEL
>   
>   config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> -	bool "Latest CIP SLTS version (5.10.104-cip3)"
> +	bool "Latest CIP SLTS version (5.10.115-cip7)"
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
>   	help
>   	  CIP launched in the spring of 2016 to address the needs of
> @@ -52,7 +52,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	  https://www.cip-project.org
>   
>   config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> -	bool "Latest CIP RT SLTS version (5.10.104-cip3-rt3)"
> +	bool "Latest CIP RT SLTS version (5.10.109-cip5-rt4)"
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
>   	help
>   	  Same as the CIP version, but this is the PREEMPT_RT realtime
> @@ -129,8 +129,8 @@ endif
>   config BR2_LINUX_KERNEL_VERSION
>   	string
>   	default "5.17.7" if BR2_LINUX_KERNEL_LATEST_VERSION
> -	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> -	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> +	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> +	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
>   		if BR2_LINUX_KERNEL_CUSTOM_VERSION
>   	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 3190813a0c..b8eeceef15 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -8,8 +8,8 @@ sha256  e03b777861fae559cb7ed635500cde305bc2ca34dee4dc2fe806de0060c87bdc  linux-
>   sha256  3cd6d4eeb3a5d1c906b35c08f0d602f329410c291233bee1a7a2b168c7378bbe  linux-4.14.278.tar.xz
>   sha256  59bcfd094ec26b03ca506199224cff53c13325e62d22bd4e31ef4ccafe7265a2  linux-4.19.242.tar.xz
>   # Locally computed
> -sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
> -sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
> +sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
> +sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
