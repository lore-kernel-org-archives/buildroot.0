Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82848C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AA8384089;
	Thu, 21 Apr 2022 19:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SitU-2pRMfWE; Thu, 21 Apr 2022 19:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CA2383689;
	Thu, 21 Apr 2022 19:12:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7668D1BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6388C40A6E
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmtLJLtoxJF2 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:11:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02CAD40131
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:11:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t6so4554915wra.4
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q5Qeou5scmklWQ+0LPYmJfXLUO4UnuXteZzjkVmAO/I=;
 b=L4sgiasNSm2W2drpZGMiT8wpsIAsfZAxuxMQjbaJgSN0bR/TW61iwhwd2pFnT2Fjho
 Fkb0s50sz9ojMBKJ5yOYy3edE5ED/qTcWeq9PyoOHsYDNkAcmcyObC3ivyzGKCph4I6V
 NX5XD2OmziBCBYPU8woGIbjHdl1x/c9cnTtqMv7UxOiFWZSFxB7B7+4+07YlDx4qiXUi
 oqHDsSDrz7Ukl0bx58vyYj1xOKOb8yBz/n/9CKYVuHbwEAhgyNnhsvrNZhgdjOSfAUZf
 6F10fw97YxtTtTzuGKjWoKY0ew8iZl+zW3SSp5vf1z5Dv7T+F8IcSWy6Q9uo2xK9XVhq
 yNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q5Qeou5scmklWQ+0LPYmJfXLUO4UnuXteZzjkVmAO/I=;
 b=T6X7342evP7uYU0JM6/4g3Mspil+WrmHsn1Rc6zurTi3ctcTI0+uvMNQJy0LeubmV4
 BoF2BqTR3++fnhoCYSZRcofTazDCzs3vlQt37gfcxNW7nH4v71Ce0KHXLh4E7qg/j/23
 wufMEjj/hwjm3S+3tX/sRANjrCI7P4wTImfDh5/PvSI6gvs3C7dIWbMWfVFTQ3YQpa3P
 eB9ouTu/syAc80jOL3BFjBAMZ61p9LEqkzFwl6u3CSZ6Cb0BN8a3VLBemlZ6dzAnFXMU
 KM7vyQQNiyHTSD3dgYWBpoc+m/0sYXwllM6sON/Y3vfFj1/zR4ue/+kLplEdK8EJGLeK
 svLQ==
X-Gm-Message-State: AOAM531cM46XFwuikxV3/M2kVDHxoeDcVPgq6vPzM98eu6n/1ImnBgEa
 oA4qYuAhk6HISUHS06pBpMlnkQ==
X-Google-Smtp-Source: ABdhPJznTLjboXveKX6kMJzKjJ/mF3Zp33v08vrt8anJF+Gtdi0YjjVXvZ4qdPJiKOoG/YXz+W00CA==
X-Received: by 2002:a5d:4f86:0:b0:20a:b08a:ff8b with SMTP id
 d6-20020a5d4f86000000b0020ab08aff8bmr839804wru.91.1650568316259; 
 Thu, 21 Apr 2022 12:11:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a5d6ac5000000b00207e90b2869sm2936247wrw.91.2022.04.21.12.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 12:11:55 -0700 (PDT)
Message-ID: <3caf87e9-ec9d-02b0-c6a3-afefeb1a1763@mind.be>
Date: Thu, 21 Apr 2022 21:11:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220415184942.575667-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220415184942.575667-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: cpupower needs
 dynamic library
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/04/2022 20:49, Fabrice Fontaine wrote:
> cpupower needs dynamic library since its addition in commit
> f1863ede94c29e120d7ce900f7cce211f1e8633a to avoid the following build
> failure:
> 
> ld (ld-elf2flt): -shared used without passing a shared library ID
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/16f41b9169bd76352c2f2ed8c6239ad371b3a30e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/linux-tools/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index f459b41762..791f2c085c 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -7,12 +7,16 @@ config BR2_PACKAGE_LINUX_TOOLS
>   
>   config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
>   	bool "cpupower"
> +	depends on !BR2_STATIC_LIBS
>   	select BR2_PACKAGE_LINUX_TOOLS
>   	select BR2_PACKAGE_PCIUTILS
>   	help
>   	  cpupower is a collection of tools to examine and tune power
>   	  saving related features of your processor.
>   
> +comment "cpupower needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
>   config BR2_PACKAGE_LINUX_TOOLS_GPIO
>   	bool "gpio"
>   	select BR2_PACKAGE_LINUX_TOOLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
