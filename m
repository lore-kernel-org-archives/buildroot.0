Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9FEC433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 19:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF8860FA0;
	Wed,  4 May 2022 19:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hp3-_OAreDpH; Wed,  4 May 2022 19:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1398860AFA;
	Wed,  4 May 2022 19:47:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 056911BF3BE
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6C6A416B6
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3flaK0lwhXnt for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 19:47:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CC6A41517
 for <buildroot@buildroot.org>; Wed,  4 May 2022 19:47:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kq17so4875464ejb.4
 for <buildroot@buildroot.org>; Wed, 04 May 2022 12:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8oRio3UujlLLeugX1TkpVcJwOBzaH1l52DM5Q5kNckg=;
 b=fHFcu9aySpze52aMTEtIyzFLGsRhYZBQmP482URjryjVIs74RLxnND0hmwfnsXQftT
 J1xGp3PAlPBrjo6K0cE+ah0MR76RFAWhFEA6j9w3ONoW5ZthmUzSjBPnDC0Z9ur6DsRG
 HNN8xkrONKzRGr26vrYmPtQXzSP5VvVBjGI6wmJfGSws0nBSMBW21bzcDm+dh0nppr69
 c2yzFpwHdcMJ1Z+VsAWBGZpSc8A0/2+sHIi+MUMGFonM6eUZ0NXgnyDoiy92DdMid3ns
 TQ3a6d4lK0gNb8BKvv3LZfkCb6zfUMQZNrHK2JpOkz/tU9AaPkn1l5hX6/eCtCGbPwt8
 lVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8oRio3UujlLLeugX1TkpVcJwOBzaH1l52DM5Q5kNckg=;
 b=nJOa931NaPop0NlYPTuFW1WCY9lwkfX2G/ewlk++ymrUpDdvHpQYODdBraNicCrFbq
 vE6hH/xKNKhA0MboNR0DKC6uQeVBvII8H2osQFbGuNzBziH/054CZI6xj+p+YeecgtRY
 yJRe0dZMkpVPOIqK6qbrdTFMkkXvTuu3dFzebw66ZhoWl86eF8ZBbZpHx5YCzw19Unds
 LqzfsNm4LeeGOXcQOV+y2u1P+9Op1SRz5A0dMGrTutJTqiMxi+JFmUyFSKWkCeXRfwoS
 6LOQcRMQLwuD9iOoHB/KbVGPEuRdGNuGfJdMRO8PJ95KFINbyrxlTXTW+RYYZ7MnSPVm
 ehbg==
X-Gm-Message-State: AOAM533wgpvtOUswBzUR+ACMwVUkHIXgERry+kNqQrvusnZsdgJccxPu
 PtfBoLHa/pTblW8WuWw57WkfVFPkHv78fw==
X-Google-Smtp-Source: ABdhPJxdnFO0DhReS0szhP2wOrNzj6aqH6uS5l4MHkxUecJ3K5ZJvVSWBeU6bOUBjh14BRZmJQtzLw==
X-Received: by 2002:a17:907:9625:b0:6f4:75e0:b712 with SMTP id
 gb37-20020a170907962500b006f475e0b712mr11289467ejc.229.1651693626674; 
 Wed, 04 May 2022 12:47:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gz14-20020a170907a04e00b006f3ef214e71sm5987506ejc.215.2022.05.04.12.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 12:47:06 -0700 (PDT)
Message-ID: <fafb56a9-fc8c-5ce4-646a-1f3b15467010@mind.be>
Date: Wed, 4 May 2022 21:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20220504082157.3212469-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220504082157.3212469-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15, 16}.x series
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



On 04/05/2022 10:21, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   linux/Config.in                      |  2 +-
>   linux/linux.hash                     | 14 +++++++-------
>   package/linux-headers/Config.in.host | 14 +++++++-------
>   3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 82f5675f6c..c37b4cd422 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -128,7 +128,7 @@ endif
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "5.15.33" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "5.15.37" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index cf7ccc5cc5..077bc4d4d7 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,13 +1,13 @@
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  da6d2cfa8b5b82d8a17b032a627fc1c7885097523c32cc8a4294745697d59b7e  linux-5.16.19.tar.xz
> -sha256  c30a17e6090f9ebf2d8ff58cd6c92c7324b1f4a8b3aa6a7f68850310af05a9c4  linux-5.15.33.tar.xz
> -sha256  dbef6a06325433481551cb8cfca9254d908d0ae950bc809f3da8ade00c485693  linux-5.10.110.tar.xz
> -sha256  9fbc8bfdc28c9fce2307bdf7cf1172c9819df673397a411c40a5c3d0a570fdbc  linux-5.4.188.tar.xz
> +sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
> +sha256  18bf091a2157faa8d92a1aba2ecb66b5124bb0e033fc7797343984e069a2c026  linux-5.15.37.tar.xz
> +sha256  82516a02bb52456f6e8057217dde6e02b78003b1e058117557c2ae9661696dfc  linux-5.10.113.tar.xz
> +sha256  288ca85fcdad18e950ccbe3d640594ee36d5aac226321ed935076fadb0cc0a3a  linux-5.4.191.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
>   sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
> -sha256  e86a55a89e1e28756b890b2b78f8b582d05cecb3509ff5c353e9534866468614  linux-4.9.309.tar.xz
> -sha256  100a9960fb2d8e079c9feeef640715a7fb749ed728a57e427f9e2443212e58f9  linux-4.14.275.tar.xz
> -sha256  bafff35102cc486ec2bf94c6d908be8e24017b2e4a1873f52f24c855eb220cd8  linux-4.19.237.tar.xz
> +sha256  fa2fb1fb5ba2e6ed99603063474804bd5fddeb8a5ad769d47786f82109e5c627  linux-4.9.312.tar.xz
> +sha256  e3dcacc2459c91586ae94121f54eb54a7cae9c424766fe20498169f682fd1b15  linux-4.14.277.tar.xz
> +sha256  4c6269d3c14e593151b035a55227110e632642d848032ef6992135c18488fe13  linux-4.19.241.tar.xz
>   # Locally computed
>   sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
>   sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 43a116974b..229c5a0ca8 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -382,13 +382,13 @@ endchoice
>   config BR2_DEFAULT_KERNEL_HEADERS
>   	string
>   	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
> -	default "4.9.309"	if BR2_KERNEL_HEADERS_4_9
> -	default "4.14.275"	if BR2_KERNEL_HEADERS_4_14
> -	default "4.19.237"	if BR2_KERNEL_HEADERS_4_19
> -	default "5.4.188"	if BR2_KERNEL_HEADERS_5_4
> -	default "5.10.110"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.33"	if BR2_KERNEL_HEADERS_5_15
> -	default "5.16.19"	if BR2_KERNEL_HEADERS_5_16
> +	default "4.9.312"	if BR2_KERNEL_HEADERS_4_9
> +	default "4.14.277"	if BR2_KERNEL_HEADERS_4_14
> +	default "4.19.241"	if BR2_KERNEL_HEADERS_4_19
> +	default "5.4.191"	if BR2_KERNEL_HEADERS_5_4
> +	default "5.10.113"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.37"	if BR2_KERNEL_HEADERS_5_15
> +	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
