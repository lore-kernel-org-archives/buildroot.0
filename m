Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15403C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C681E841F9;
	Thu, 10 Mar 2022 21:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhDV1Lj5B9Ec; Thu, 10 Mar 2022 21:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2FB88137E;
	Thu, 10 Mar 2022 21:23:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F195E1BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0BDA41967
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5EDAxEFJAId8 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:23:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1280641908
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:23:57 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id p15so14945276ejc.7
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=5zeoC4BpgLKAnUpJvKKSd2h/JE+LFJEDylTT1cKjzyk=;
 b=bgK2nCsRy4kzomplKcQ9HRgyn+9ML2L37QVZWkU+haBX56XKxKANj/Fm1HiYL935Om
 9rOL18N/DZic+fKnvZNFWALo+N25vh4jwFVUOcs4S7N4B3igylWubq0+fAe0n6E+i/Mb
 HVNDsZHT5Z8q+sg3RdG2ZK2FLzZIkW/yo8+8EtrCVuBvVCTsiH2NIkw1rlZFc5y5eiKf
 tCUMwAhS7xqlFKH60LC7lAhXRv27yPQvgXe+LBWgt5PxENHiTnRGALMX7ExoHros//yN
 xwtC5M0ZjTfdHUnLtgZyOoIHX9y/rg19u4fmW14CUZamDfPMzZNhtvJRs38ZstEV8PSD
 gW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5zeoC4BpgLKAnUpJvKKSd2h/JE+LFJEDylTT1cKjzyk=;
 b=Mq/9Y1c6F/Q+FdvwO+r16qJLV6s54j6ypM9oSTvyZbN5yzzWFZ+oev8NN9Snd8H3gB
 Ls7558TkYR6ktdevvzGiTnaG+u9JLNn05lnQnzoXhcbCCohPrJz1/6Gry4EFUbOowEcP
 4M6aFs+K6gB9sPi/t2ZQI/Kwx0p1qF9HkHM90w91Tf4dkInfMXLYDvPEyJn9s22m8af1
 Re25TnDCfmOHcy13j4fDT07moID7BAugvTPvoi+Troydu3+PowML8+QbbkqteqUT2Znk
 qIGDNVQ1YWcRYhguj8cBRVCEzzkC3ZZPBNlssSZdKKki70yOj/s+klVFv4Ngt0m3SnV4
 Ctlw==
X-Gm-Message-State: AOAM533XqB/Xj2+k3ZkM7p8JilKMioAECwdeFrBAP8g5wJSR93TLjvlI
 jKRM42o2a0UZ4SNBy1faX/sp7g==
X-Google-Smtp-Source: ABdhPJzxxx4CFbox4yFAD/3K+K6UlELQuHTyEZFfJhd8V860xwp/1XQZlZhR4g5Ewl480nuvbTHQjw==
X-Received: by 2002:a17:906:a08b:b0:6cf:65bc:e7de with SMTP id
 q11-20020a170906a08b00b006cf65bce7demr5979765ejy.220.1646947436360; 
 Thu, 10 Mar 2022 13:23:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a17090637c300b006d8631b2935sm2182628ejc.186.2022.03.10.13.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:23:55 -0800 (PST)
Message-ID: <66a1b135-aeca-d245-f209-ce52a8e507c4@mind.be>
Date: Thu, 10 Mar 2022 22:23:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220214211051.22421-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220214211051.22421-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1 1/2] package/ell: bump version to 0.48
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



On 14/02/2022 22:10, Peter Seiderer wrote:
> - Changelog (since 0.47, from [1]):
> 
>    ver 0.48:
>      Fix issue with memory leaking from ICMPv6 RA.
> 
> [1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ell/ell.hash | 2 +-
>   package/ell/ell.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ell/ell.hash b/package/ell/ell.hash
> index cd724eae2d..4bde1ab677 100644
> --- a/package/ell/ell.hash
> +++ b/package/ell/ell.hash
> @@ -1,5 +1,5 @@
>   # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
> -sha256  4901a0baac4eb24163ceafb44fd448430361d25d8f17d89ff29f8b0b162b3eb9  ell-0.47.tar.xz
> +sha256  9894943042a5d6165d3e5cc354f92274fb1304004d02b4bee682ab6067cdbbd5  ell-0.48.tar.xz
>   
>   # License files
>   sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/ell/ell.mk b/package/ell/ell.mk
> index 3ce64b6f2f..267b44e5f0 100644
> --- a/package/ell/ell.mk
> +++ b/package/ell/ell.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ELL_VERSION = 0.47
> +ELL_VERSION = 0.48
>   ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
>   ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
>   ELL_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
