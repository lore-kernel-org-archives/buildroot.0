Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249EBC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 02:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9310F60AF6;
	Sun,  3 Apr 2022 02:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sbEYtFJglIY3; Sun,  3 Apr 2022 02:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AACE260A70;
	Sun,  3 Apr 2022 02:33:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C82FC1BF38A
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 02:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3AB3817A8
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 02:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7N32TF4ZWPa for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 02:33:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB38A81759
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 02:33:42 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id a16so5503212plh.13
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 19:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7iyD+yT7IgiN1uL8hE0GaRnVTz5bUJCaVR+1FxUlYD8=;
 b=hTDi26phsUknmA6JHhek1pD7bECOIkYRMOIMdZm1Cub9r6CKo8k4mRHQ9jqrlZNUC2
 DR89CwZEKWmhia9A2OIutjV/4YeuaSmQk0vl4XOXrhA6kS5dDSEW/mXSP1K0gijlkOxl
 992fY6L/jLfXWk9xHuLytNZZctYejLJ2cKclJR5e479jC3mRacjJ1T0bs3EXQwOkPqDJ
 qZqiin4Cvdg5ZQvZvwRwjEqN1NzWeB7yslRKp9vPWfN9+bHFrM4YTzMIfbOsN18PVz3G
 Zkcya3fZQn/ptSIvWYuO0Dr3CwnZB+rbxhgUsBUgIdWkmpKIBw53Lk6cP1mUJUl1D9mM
 6gLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7iyD+yT7IgiN1uL8hE0GaRnVTz5bUJCaVR+1FxUlYD8=;
 b=1tFwRjMnBpEuIXYIx+t9571fmI905y/M5M1Ysqm2TwJY75acfe8sXkjCq8QhdNHTnQ
 THA0qMSJkYqAQmzIgcArDP4AioUVSsp/h06iwyECfoBCyONmaXecCbjmcLHAxVmL+x0K
 wZCQPOV4crqC9YKS9aX38wV5xrYzyHAdAeX2C8Vt2SCGbZHkL/jsBHhU0jL1r4VtNhKV
 ybXEUvuGi1WOMb9LTZB4U3Yiaku6m4vTgri9gMTCOv+dfddrhqPcB2kxr0HdiEBOnXvO
 x1oQuvXjqe5XEx+dQryLkzjv0EZv9+nl0aSzz8L8sN0ZQfD3tYMBHUmHEd3UHvXWDc5N
 5AAg==
X-Gm-Message-State: AOAM530KRuwCN0cs/rMCVLhbiNnyKlW7NXt262rmeAxVrCipMT8ryCWL
 SBXOYEZFhKVP/tikPI0F44XQYiyd/00=
X-Google-Smtp-Source: ABdhPJxubuzj5rWsgfEwtwEHEv2YTiEIKrFYRzAXdIHh21vj1z3oxlaRnrBYv86RHyUB1JJqAzTI6A==
X-Received: by 2002:a17:902:cf0d:b0:156:1cc:f08f with SMTP id
 i13-20020a170902cf0d00b0015601ccf08fmr17320371plg.42.1648953221811; 
 Sat, 02 Apr 2022 19:33:41 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:4a48:b937:33fe:a431:1d72?
 ([2600:8802:b00:4a48:b937:33fe:a431:1d72])
 by smtp.gmail.com with ESMTPSA id
 x38-20020a056a0018a600b004fafd05ac3fsm7742063pfh.37.2022.04.02.19.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Apr 2022 19:33:41 -0700 (PDT)
Message-ID: <761200bc-18e1-e94f-ae2b-cc874ebbb857@gmail.com>
Date: Sat, 2 Apr 2022 19:33:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
References: <20220322222106.42347-1-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220322222106.42347-1-f.fainelli@gmail.com>
Subject: Re: [Buildroot] [PATCH 0/2] External GCC12 toolchain support
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
Cc: opendmb@gmail.com, mmayer@broadcom.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On 3/22/2022 3:21 PM, Florian Fainelli wrote:
> This patch series allows us to use Linaro's GCC12 snapshot that can be
> downloaded from here:
> 
> https://snapshots.linaro.org/gnu-toolchain/12.0-2021.10-1/aarch64-linux-gnu/

Should I be resending this?

> 
> Florian Fainelli (2):
>    toolchain/Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_12 blind option
>    toolchain/toolchain-external/toolchain-external-custom: add gcc 12
>      version selection
> 
>   toolchain/Config.in                                   | 11 +++++++++--
>   .../toolchain-external-custom/Config.in.options       |  4 ++++
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 

-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
