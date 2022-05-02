Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7595C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43949415C4;
	Mon,  2 May 2022 21:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqMO3KOMzMYs; Mon,  2 May 2022 21:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9DE141579;
	Mon,  2 May 2022 21:50:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAE1E1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6D93404E9
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgrgeCuCQrbO for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:50:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A5D2403BF
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:50:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gh6so30229964ejb.0
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H3f2CNnFq17uF8R0G8cYM/17p/t00FNDsshxpF1knjM=;
 b=enxeIzLFzxMUUt2+VuWPxUgvKWtJQymORE7S4YQz3AC7VlFS9FLe5OjL+yM4MeN+XH
 lVaw5nwEb2Jqm5h3Xn+DiQ2jsUlFGS9WOrinrsTzYaIrD6rEsukIW2qwRwbGtyBT4T3u
 ZPgMycwkw+gZltz9q1TNHWnY/h8CnzVP1gp2LW8FrPhFS4C1rIYBX+2SLAhBYAI2RrCP
 NJIPc8nco2Gp1OFDzffd3tj3VMsyEta+IIxpBIy4NLqHLpADiXkfp6QsKEM5PrWqL2Wp
 ees2hQKvORkXdUIC0nEK51J5saWnjbAxWlxTZCxE3P/ZywaA3/wrJ19Wy+QjViPQz3Iy
 VaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H3f2CNnFq17uF8R0G8cYM/17p/t00FNDsshxpF1knjM=;
 b=2sGSGJ+YXkKlLSww2YP+lgRWq8v4OhwCjxUd9AC4dQk1xT3yU7VVNngVz/sIe2foAg
 Dk0y7oS1GYDe0UW0tOHA5Uld6DUGTaYNsp3hRs0onTrJIwGedQxmZO5kHLgBKQufSsel
 Z/XQSWm+Lugw9+/+840mtRnY3nmRvFmhoaeGloaQYe7FKcHjZZACH3IRa5ASgiNxdf2K
 KDJdePoz8bsEpY6YlHphZY4qCyJHdVudXzCBSBwQ2KBmyo/CZ+D+zg0rW4roj1Z8rvAl
 ao7TpUD83PnfVA7GgXo8OVaxaiIwKg5t92IIHYrAW3IrHAQC173LE3XKvf/V9iRxAk64
 3k3g==
X-Gm-Message-State: AOAM5323OzwlUh4UztXSK8HYtshXb3KvDknBCdcvncYzntu5qBtFbF94
 GpTkJBUU/sOrxNhLe1aW7C5ycQ==
X-Google-Smtp-Source: ABdhPJzhuauNPxMrNRV3vnhea0T1xlHu1TLox/BscQJf3u9cElSFCRpHp/RGz9wuHro+cnvbQTyOvw==
X-Received: by 2002:a17:907:6d9d:b0:6da:7d4c:287f with SMTP id
 sb29-20020a1709076d9d00b006da7d4c287fmr12345301ejc.741.1651528217248; 
 Mon, 02 May 2022 14:50:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g7-20020aa7d1c7000000b0042617ba63b1sm7156296edp.59.2022.05.02.14.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:50:16 -0700 (PDT)
Message-ID: <38031ecd-06e5-867d-bb1a-a5835da3eef3@mind.be>
Date: Mon, 2 May 2022 23:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220429230412.788645-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220429230412.788645-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-python: fix flit-bootstrap
 python-installer dependencies
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/04/2022 01:04, James Hilliard wrote:
> We should not exclude the host-python-flit-core dependency when
> building host-python-installer as it will be needed when migrating
> host-python-installer to use flit-bootstrap.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/pkg-python.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index e9de5cb8d3..7aff3b745c 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -243,8 +243,9 @@ ifeq ($$($(2)_SETUP_TYPE),flit)
>   $(2)_DEPENDENCIES += host-python-flit-core
>   endif
>   else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
> +$(2)_DEPENDENCIES += $$(if $$(filter host-python-flit-core,$(1)),,host-python-flit-core)

  No. The intention was to keep this simple, and not add any dependencies from 
the infra for the packages that would otherwise create a dependency cycle. So I 
removed this patch, and instead added the dependency explicitly in patch 2.

  Regards,
  Arnout

>   ifeq ($$(filter host-python-flit-core host-python-installer,$(1)),)
> -$(2)_DEPENDENCIES += host-python-flit-core host-python-installer
> +$(2)_DEPENDENCIES += host-python-installer
>   endif
>   endif # SETUP_TYPE
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
