Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E775C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C814408C9;
	Thu, 10 Mar 2022 21:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0-XYRGsod34; Thu, 10 Mar 2022 21:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BECD40888;
	Thu, 10 Mar 2022 21:23:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75BBD1BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7085860B09
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnExy9S0QIe9 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:23:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8048E60B52
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:23:06 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id r13so14953737ejd.5
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3WduRviL+p1K0P8yru4YlLgZi83wv7cuC6bX3GiA+XE=;
 b=V29dyVQtVZhXvk9raWjFaQswKGbfTlLJqErcPSeYSTQJKS7uIXBVAXorPrNuwQkKYB
 AEmmj6Zh0GWJMvfR/HyQmg7YXLlhdiY4Nln0q9XU47ZLQmLi9QYkbi9jP2+Q2B/ZgR+w
 7ZYqyLK1Dgrk4CgCYs4dgNE/R3HiGVXwRhDdnZpYMx817dsKVfitWOq9qeHJ8O8yz+zJ
 LXyQ2wEVuP0Dp+Znz+z03exsyvR7vliAcpovi/7T4nC6H8z7pVCngjTnPssoW5DZuMQR
 NmGAiYoLX8MRAgWLzEp4cw5zGS/lAj5GSXd4P0yuCkwqrJTnNlmcSsV/xgESDVztXggN
 6bBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3WduRviL+p1K0P8yru4YlLgZi83wv7cuC6bX3GiA+XE=;
 b=WajHW0yHXCtofIQixt4ZuZB37i7x9UNuH3Cnx9byWaLV2HdnpLZoRhdVzkcsHJGaMw
 Da/sYESgHYZccjH897mqanX68VMiDKGdZK6LZ6kqNnC9t0N1tf9vuYAzrjsrRlGih6RB
 wcbkLFpgzgnpgIRp9JySiQh/8yTjyEyO3foOjiBlqRTYiD4ab6kynVbrF6qsMuhEWGrO
 B6ShtDK+QVdyoGElsLf5P7ZEF5vs/lSqzuft8k6CG+3YoLAV+VqEmd0loKQQQVNqQoC1
 rsafCk0BjV6W/FapLkOrFRr2hPI36ZIuNoZ17+PPTI55FNL6qTXAeM2olU45du4SPXnk
 G04g==
X-Gm-Message-State: AOAM531muw9zBtFQPacnUlLLPF+bpPUvzWFOVz92QkUnCGtm9ac6hf3P
 Iq2GSnFqrKdNxUg2OeR1ffnHHg==
X-Google-Smtp-Source: ABdhPJxW3PqMQDpbgWQ/9ZHuxOw9/CwQ/pqgYFg+p5tPg4Z63XoDwbR+P4CwdESLWDsB4ywzqxqyzw==
X-Received: by 2002:a17:907:1b27:b0:6d9:ceb6:7967 with SMTP id
 mp39-20020a1709071b2700b006d9ceb67967mr6111587ejc.186.1646947384762; 
 Thu, 10 Mar 2022 13:23:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 20-20020a17090601d400b006caff964e30sm2230996ejj.19.2022.03.10.13.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:23:04 -0800 (PST)
Message-ID: <7417e8c3-fb16-f276-33f3-65ee8b4f0b22@mind.be>
Date: Thu, 10 Mar 2022 22:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220208213514.7141-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220208213514.7141-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] support/scripts/gen-bootlin-toolchains:
 add s390x toolchain
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



On 08/02/2022 22:35, Romain Naour wrote:
> s390x support has been added since toolchain-builder release
> 2021.05 [1].
> 
> [1] https://github.com/bootlin/toolchains-builder/commit/4bbb52a6a30a340a30722bc170467aa6fa4adbe6
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/scripts/gen-bootlin-toolchains | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
> index dc173fa949..f9dd9da9a8 100755
> --- a/support/scripts/gen-bootlin-toolchains
> +++ b/support/scripts/gen-bootlin-toolchains
> @@ -162,6 +162,10 @@ arches = {
>           'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_64', 'BR2_RISCV_ABI_LP64D'],
>           'prefix': 'riscv64',
>       },
> +    's390x-z13': {
> +        'conditions': ['BR2_s390x', 'BR2_s390x_z13'],
> +        'prefix': 's390x',
> +    },
>       'sh-sh4': {
>           'conditions': ['BR2_sh', 'BR2_sh4'],
>           'prefix': 'sh4',
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
