Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4515C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83A0941A63;
	Wed, 27 Apr 2022 19:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TpxNdpnLwRSd; Wed, 27 Apr 2022 19:01:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6FE41A62;
	Wed, 27 Apr 2022 19:01:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98C1C1BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8679F418DB
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNYVdndjH5BS for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:00:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 621FD41881
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:00:49 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id g6so5271762ejw.1
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DyZPTu1jHd7Y3InWws74voIO0fbW19Y2YArSl29dRa0=;
 b=LwUP8xEqiHovbxU2h0Gh84VeXeo6noU/KsR8NXV4j61rU/xWctIUqeY0Ua4Z/rH1tb
 2EoSYiJB+OahdHqROh537MiYBMFYhyNG38nOhS6DHNJpmfIWH6NT4xj7OLa+1FvtKyTX
 XPta+Owd5OOiCpMDKtmz8OrbwudbDa0AIxkeXqHB2u/36Syxt0UjdL5YSHYBeoSEuY2B
 9oZcEnSlGF3E7SbDt2d4PE7pPpFjthaifXcGr8xaBlVTz+MSxrcVSIKQewgbG6/m/oD8
 lt8y0o/X00/7ejBgyGyiwbl+orjQoyoFKZvWPZogaDm+Yo7Z0c2zESa//aQPAX6vy+Vl
 s/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DyZPTu1jHd7Y3InWws74voIO0fbW19Y2YArSl29dRa0=;
 b=z08MklJdtlsj2WTwffkZoHuYakTu2wZl2kWfdzSiGR40KpS3yVgHBU+ljt/tibCbNt
 /c++VJb0wF9IZvADAc8eLXOVM79+nugmzHEFPk2CGSZUlezF4gGdDo6nfHHVNwnDQ2UQ
 5vzAvDGzrMEcVJiz679ACOEgz+iF+8xINvhOavWkg6X6zEcEbptQQNAU03J8dc/2B8KR
 VvDrTn4iiV8lPdAEb9p2EtW1n4IaWqIFsVGfouWtQcjUqjfYgtIYDzgSfYeCB1aJWM+M
 CunWtNYjkrvarXijQ7LZGGBo6DJmofTnWsQW9Xtgz0xTHYRtIGxLK4Lm0wrR3bnLOzL+
 JQmA==
X-Gm-Message-State: AOAM533+D8lbak5Gh1p9uqJnI5+ZwYl0QBaehZG9ITc46fIpMQOi0Cbf
 Ctk1qo72hzOrnKP5qsgTw3ebJw==
X-Google-Smtp-Source: ABdhPJweVq1+1sMdC/nxDBjjCRx1gBw34uRyL3NhB3pRZHi1tf88Z5nowoprSShXR+EBkpR7AV/yTA==
X-Received: by 2002:a17:907:7f01:b0:6f3:d38b:1d1 with SMTP id
 qf1-20020a1709077f0100b006f3d38b01d1mr2150669ejc.142.1651086047636; 
 Wed, 27 Apr 2022 12:00:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a50fd8f000000b0042617ba63b0sm31523edt.58.2022.04.27.12.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:00:47 -0700 (PDT)
Message-ID: <dc06a171-ed10-eedf-1654-12dd1dd164bb@mind.be>
Date: Wed, 27 Apr 2022 21:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Florian Fainelli <f.fainelli@gmail.com>, buildroot@buildroot.org
References: <20220426173211.64840-1-f.fainelli@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426173211.64840-1-f.fainelli@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 0/2] External GCC12 toolchain support
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
Cc: opendmb@gmail.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 mmayer@broadcom.com, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 19:32, Florian Fainelli wrote:
> This patch series allows us to use Linaro's GCC12 snapshot that can be
> downloaded from here:
> 
> https://snapshots.linaro.org/gnu-toolchain/12.0-2021.10-1/aarch64-linux-gnu/
> 
> Changes in v2:
> 
> - rebased against master
> 
> Florian Fainelli (2):
>    toolchain/Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_12 blind option
>    toolchain/toolchain-external/toolchain-external-custom: add gcc 12
>      version selection

  Series applied to master, thanks.

  I was thinking that it would be useful to add an option 
BR2_TOOLCHAIN_GCC_NEWER and BR2_TOOLCHAIN_EXTERNAL_GCC_12_PLUS that selects it. 
That way, you can use newer GCC without changing Buildroot. Same for linux-headers.

  Note that the blind option can simply be _NEWER, but the user-visible option 
has to have the version explicit in it, so legacy handling can force the user to 
use the correct version when Buildroot is updated.

  Regards,
  Arnout


> 
>   toolchain/Config.in                                   | 11 +++++++++--
>   .../toolchain-external-custom/Config.in.options       |  4 ++++
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
