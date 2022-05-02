Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4400C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F31581819;
	Mon,  2 May 2022 21:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R1PpNjKljLih; Mon,  2 May 2022 21:52:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0DF5813CB;
	Mon,  2 May 2022 21:52:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD1B31BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB21181366
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZX8cnfM4zI1 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:52:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28EB0813CB
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:52:35 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m20so30113895ejj.10
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/TxKbNIfHuLue3rjtuP1WemxZ+VpMqjC3aPJZJGiJpE=;
 b=Lg0gJF9LvLYwKODfxBQKstqM1qgK793jt8Y7BJhXQsxJ3Xtu9zZqMtOSgTMLsAwg5M
 6hobFq3yVuvRkY+73Ou6yoBbIL+0NbWH9Qn7yw0bN80eOQUiBN0SNHbrMl72jrjLK66j
 Re2EykibvLkISvzZNZnR3Gf+wTaAjLOvwh7Jg4u38Ex/+ZzGXYftL3ZpA6ceuwq0lkTs
 4u019ps0JTgawzHEFeoMI6AA9Ju5+BnUMRl1yN4c5E+hEv4xsg23TAtpzA6nlt5syV60
 GcqNDx8chRLSlBQ6ltaViABdy7Dw8SMMUxSXTvt/sbLufoWQbZyYYo6ugXrfUF9FvO7k
 8gzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/TxKbNIfHuLue3rjtuP1WemxZ+VpMqjC3aPJZJGiJpE=;
 b=Plh3leY8971EhLYMqVKOQvCtH9PYvIUfDDmeotq8KvNZ9azxbbn+4BhJjsRW+4kilp
 3ZyFGMztZs1IGRTjsxM610hemUdOvOcVn39tZks0oUIBCRLMvJ/FPEjKU30HGk8EZjZG
 0tdWxlMf3iH8Gtl9cFf1javWBqzXF+1gfqxvc3/moLA99p+XEorBE1uUBcn79aoS3y9e
 J4NVv0lWJBgRs4XuIr+ostwRJqYzbq7iz5LD16s5RPlMc5tmfDulP77AqoQUuOJUh3fK
 S0VQDdo9E3Y2t70DgVuERBm0kMKtknQGYkrT6bRmlymU9r677VGlXLK9ohxh0GRhYMSk
 rRPA==
X-Gm-Message-State: AOAM5334sombln1URyU7KWtuUoKNUnB9plNiQlwkZpgvGzX9Qe//l5Qg
 4MYa5iCpwHRonpUZdldWBDYW9g==
X-Google-Smtp-Source: ABdhPJzMf9X1axsCPYBf6PNWAzItUq+LRDYwHFg4dr0WYdC0Ko3I8k1FwkMvZI7eZRy7pYdjgY/bXA==
X-Received: by 2002:a17:907:d29:b0:6f4:87d4:ecad with SMTP id
 gn41-20020a1709070d2900b006f487d4ecadmr710755ejc.166.1651528353475; 
 Mon, 02 May 2022 14:52:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hg21-20020a1709072cd500b006f3ef214e24sm3941329ejc.138.2022.05.02.14.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:52:32 -0700 (PDT)
Message-ID: <01a55147-99b5-ffdd-b371-5be373b0234e@mind.be>
Date: Mon, 2 May 2022 23:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220430233629.1376415-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220430233629.1376415-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/rockchip-mali: fix build failure
 due to missing URL
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
Cc: =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/05/2022 01:36, Giulio Benetti wrote:
> Github rockchip-linux doesn't provide libmali repository anymore and the
> only up-to-date and maintained repository I've found is JeffyCN/mirrors
> branch libmali that provide the identical situtation we were at with
> previous repository, so let's switch to JeffyCN repository. This fixes
> a build failure while trying to install rockchip-mali.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rockchip-mali/rockchip-mali.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rockchip-mali/rockchip-mali.mk b/package/rockchip-mali/rockchip-mali.mk
> index 6200191a73..848682229d 100644
> --- a/package/rockchip-mali/rockchip-mali.mk
> +++ b/package/rockchip-mali/rockchip-mali.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   ROCKCHIP_MALI_VERSION = 721653b5b3b525a4f80d15aa7e2f9df7b7e60427
> -ROCKCHIP_MALI_SITE = $(call github,rockchip-linux,libmali,$(ROCKCHIP_MALI_VERSION))
> +ROCKCHIP_MALI_SITE = $(call github,JeffyCN,mirrors,$(ROCKCHIP_MALI_VERSION))
>   ROCKCHIP_MALI_LICENSE = Proprietary
>   ROCKCHIP_MALI_LICENSE_FILES = END_USER_LICENCE_AGREEMENT.txt
>   ROCKCHIP_MALI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
