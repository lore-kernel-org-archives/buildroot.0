Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D648C6FA82
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 08:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C0F060E8D;
	Mon, 26 Sep 2022 08:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C0F060E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZqCpTppHYF1; Mon, 26 Sep 2022 08:00:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FB9F60EC6;
	Mon, 26 Sep 2022 08:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FB9F60EC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99A851BF387
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 08:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70564415E4
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 08:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70564415E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGM0SWBoTXVY for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 08:00:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A49E41769
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A49E41769
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 08:00:37 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id iv17so3894895wmb.4
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 01:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iGf6jgckoe4/R/DLS1oMrPh1Of6HCVIMbMvN7mmJVzI=;
 b=hH91Jvsc9uWh8ockrP7a3b9SNCqevQF+eSPRkDKqbkmDglj4Fcxlo7EquWVZbWcXFH
 BNtI11w+6ElrDf+ZXqraHpUrryzW68IXzPKleDYIMAL/INAozkJ/TWMiCuY5xsI3q2cC
 r6PLdLw9RuCyhClxvbe8cvSH9wAIWpuNJ88Yvs0F6CG7peMRarCiIxrbD9e3DuiZuaME
 WsMH4Zl9m+6EtfWoMBXj27yVO+KN8v2EKXf3hTre/qw+p2lVfXyamd16kjc/HOJjpFOi
 OriJ2TvhDWYug07ESyUW356LohwQm2alnYwBGEsAXPG470zqvsjFHovHEfCZm7NnEFRy
 O3mQ==
X-Gm-Message-State: ACrzQf3Gb3ZnkPvrCkio6avFdy69/MKJuKdFPSO/p+rJSLwsQkSM7nF0
 T2J5SpFUCsBvaaZn9FEe+sBeIVK8p7kKPdixKmA=
X-Google-Smtp-Source: AMsMyM7jtajnFW0ssb/067qdtHarbfabZ8TqEU2SgPgNVBM0lgCe9XnMopisgl5uONJMgWx7ggawLYm+K6Y65VPL4Hw=
X-Received: by 2002:a05:600c:4f53:b0:3b4:9aad:7845 with SMTP id
 m19-20020a05600c4f5300b003b49aad7845mr14120409wmq.159.1664179233149; Mon, 26
 Sep 2022 01:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Mon, 26 Sep 2022 11:00:22 +0300
Message-ID: <CA+U=DsooNt8A1eOOk28zChSsXj-QMVyPuJOvnGjLz+LjxR=Euw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=iGf6jgckoe4/R/DLS1oMrPh1Of6HCVIMbMvN7mmJVzI=;
 b=mT97DsrtegEWBGRmA/QfAYSh12gy8Fy+uzHPUQtpIsucJIcQiHbe3kTFhPmaVoNWyy
 Pez79Tl/enB+hTcHFgVJTyZH/PLe6S26Cae63eXsGxgINbjYGF13PkCm54kkFYf/QHMw
 ibHmJ6Bm6ytxh0DyEcpRyVODgn45whBPGBf7Oz8QrhCnbv+Q2USiovajHWj9NRDPXHbP
 B+oy/+zegas0Y2YXw5hwr4iHQbaoJfIouqKW5bTsRmy9EcB1mxCu7DFo9G7VsO99EVq/
 ELR+FklJ4nerpcjvR3tHdn7pwVl6gqqc8LBfGx9NLL8s8Kno6bmZ30aBw4bZiso4zJmJ
 cZ5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mT97Dsrt
Subject: Re: [Buildroot] [PATCH RFC 1/4] DEVELOPERS: add Thomas Petazzoni
 for nodejs
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 25, 2022 at 11:40 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>

Better nodejs support will make it interesting to bridge upper-level
JS devs with embedded for projects like smart-TVs.

So, thank you for the support on this :)

I'm still curious how a smart-TV would end-up looking like (with BR at
the base + nodejs + webkit + cog).
It satisfies the embedded needs relatively well.

Thanks
Alexandru

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 564149de0f..f82472bbb5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2902,6 +2902,7 @@ F:        package/msmtp/
>  F:     package/musl/
>  F:     package/musl-fts/
>  F:     package/ne10/
> +F:     package/nodejs/
>  F:     package/pkg-python.mk
>  F:     package/pkg-autotools.mk
>  F:     package/pkg-generic.mk
> --
> 2.37.3
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
