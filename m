Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A89C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 086CB60E8D;
	Mon, 13 Jun 2022 20:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SbVwxNhmUXB; Mon, 13 Jun 2022 20:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4558D60E48;
	Mon, 13 Jun 2022 20:22:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5421BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58D3282CF9
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOR97EjZMMuO for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:21:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C46C82CF1
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:21:57 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id me5so13309947ejb.2
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 13:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=7wEUT3rPN69gO41Ri4bKAfCT4BqcacFDsX3VhJjgS3A=;
 b=ftolBtVGmozAdHKfcBk4yTlHHromJEVWpB45DRfY4OXeQn4QZUZLRBvjk/omibv4yc
 fjdHnLITlTdXe5xpzKGBvgU+l2BrQsNhG1vFNtWvGNZZ6BBMe8QLa7Pf3I031fj8q6mA
 QGO+vLkqu/vZXMusSvBMbi2xAGkvnB/K1EiMHww+u/PdTVp9nniTeeyFnpDbj4EEx9ZM
 MmL3gyhvBlUyHT5gdaP+V7zVR2BYi7UXt5/bmbcKsLXxcpXINuGNryu+UGbHyNC7MFJJ
 ujKVrCX2AY9fgOVfCYqBNP92bL/Ws+rvmmyg4RiE6iPyQsGmyoKcKuK3jT7Xt2axWoYI
 HD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7wEUT3rPN69gO41Ri4bKAfCT4BqcacFDsX3VhJjgS3A=;
 b=zuqs7tzmEaFLRoc2DlLE7lCU2uwVsdxq+TeXbdoHFJKNSFLIt0q54KrIEFbys8R2VS
 +tVPPz3gBY2Gw/yO78Inewy4uPNnDMQIT+iLJXmoxHhAmD/WFSzA8hGETurHOWrW17nr
 e4gJ4wf2jH+wU8o6XEP8bIb+GRGIY33C4j+V/pRS/w0NtRgDHlFgpcsd8neeo3dLqW5L
 n3Qp5ePhyLausCeJ0fg1ca2W9T19pic0K1FaLHwxpIMoctzWfw4gHGWsN0MnQHDeQmkP
 Oq0IgHNOUyp5bXN9P1kXgE9hVEhEEhdIjjLu5mMeUptQCbbS6MGvl/BTC5bU3EsIxbt4
 3Bsw==
X-Gm-Message-State: AJIora/U3lK6dPobEslniy2yuuAR299H/L/LhTu2+l6m/T3okHpNhZkD
 AWEmyPliB9fBQpDIg0+lf4DB1w==
X-Google-Smtp-Source: ABdhPJyh9MPNOkPQEBFpr3m89K+AqGDhlFtvHOmibp/1oFbESyc2E1wXAJw5czQgd9OjfJj2SZuRZA==
X-Received: by 2002:a17:906:225b:b0:711:fe56:a8c1 with SMTP id
 27-20020a170906225b00b00711fe56a8c1mr1383170ejr.15.1655151715426; 
 Mon, 13 Jun 2022 13:21:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a170906640d00b006fee28d459csm4203190ejm.224.2022.06.13.13.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 13:21:54 -0700 (PDT)
Message-ID: <8f5abd9e-8959-2b00-548a-902d5c1ba1b1@mind.be>
Date: Mon, 13 Jun 2022 22:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220610010255.80277-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220610010255.80277-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.52
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



On 10/06/2022 03:02, James Hilliard wrote:
> Disable new unsupported bluez5-codec-lc3plus feature.
> 
> Drop patches that are now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ild-on-uclibc-without-locale-support.patch |  65 ----
>   .../0002-fix-detection-of-reallocarray.patch  | 287 ------------------
>   package/pipewire/pipewire.hash                |   2 +-
>   package/pipewire/pipewire.mk                  |   3 +-
>   4 files changed, 3 insertions(+), 354 deletions(-)
>   delete mode 100644 package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch
>   delete mode 100644 package/pipewire/0002-fix-detection-of-reallocarray.patch
[snip[
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
