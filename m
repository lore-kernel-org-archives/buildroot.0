Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D894C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 18:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08C44043D;
	Thu,  6 Jan 2022 18:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhj9E8F_28J3; Thu,  6 Jan 2022 18:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E351E405AA;
	Thu,  6 Jan 2022 18:52:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD4531BF2B4
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 18:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9CE9405AA
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 18:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JAfKKsPQ9Spu for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 18:52:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4F724043D
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 18:52:11 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 r7-20020a05683001c700b005906f5b0969so4124528ota.5
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 10:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2KB8KiY+2usHc4oTx+X8oa5D8bBIIhT+EyHa/69BhXw=;
 b=h5u8P+kUEsoP6hPdbS5IF5/HSBZZ0i0A7t2xhXk6TjuprW5gn8020gewrz//TbCBUk
 ZGB12+MrKA6d3Infa6VgGgoVks1D2Y1cKiHSFMLMC1g/7AGNYJd0GTkCf6zzvRXQgvyQ
 8ceMLFqC5eUSFG2jFKemHcIYG5lP/y56OCundlGFFV7X+GjHeBZ6EpZ6Kc1AOPOZAwBP
 MboA1XM90Lqw7R4cxNqeuSUKRY3Jlc3MSUeKrMRdNUaZcfyERjgn4gNXpNepBXxiUF7G
 x5G4pG9owIGwnecckp33fXwP8UKpj3jv50oydHTaf3LcvLolmvvj5GifgX6NNtBhtSjC
 4RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2KB8KiY+2usHc4oTx+X8oa5D8bBIIhT+EyHa/69BhXw=;
 b=fr6icLzMnFnM4YrhiYORSjIAQ+qDJwEkbjqg5vs5DinzA1SCyyAbDaBX5WCSDXHRP5
 OmGTH5JYKc0Jxatv0tP28BFIKpl4t+iOidpBEYji3DAuhe3ljjKbBrRVpZU97KMnL1CF
 Ad6xcptITPow1PTNwQjrbGALwoV6OisinIGyqOX8H9Gbr6Owwwr2CxH28x5a18/Axpxd
 fZnX5flCALDyZiJiXzK6VQanXhgu6qoB3Lmn++unWFFAAEJUM5rYswsLHBI8OkinnRxk
 rogVxI0bOmvcqeYuWtVoAnVRhbbEsUBFalE+Py4G2OFaZHAmZ88ASSyHqaWbZpNL5f09
 gORw==
X-Gm-Message-State: AOAM5322LBl56WF7YyPE12BkyXz55NKU+HLNarJx7C1DuSt2vfojLOsJ
 5PcXHi3dbOhzC0CT0BsP7hoif13UTyQSFSj9RpM=
X-Google-Smtp-Source: ABdhPJx6LVZY5jNkP/R2Hdu8G2YKqa2qTLpyjjXPhBm28Qy1rTVTVrV20QRg06uybhoDNmAqh5NIX43gkpKwQjdWS3k=
X-Received: by 2002:a05:6830:2aa7:: with SMTP id
 s39mr44413731otu.151.1641495130868; 
 Thu, 06 Jan 2022 10:52:10 -0800 (PST)
MIME-Version: 1.0
References: <20220106062407.3131530-1-james.hilliard1@gmail.com>
 <20220106185923.0cb1bb9c@windsurf>
In-Reply-To: <20220106185923.0cb1bb9c@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 6 Jan 2022 12:51:59 -0600
Message-ID: <CADvTj4q5R0TweMiHhtk_7XM6XT3u5mQ3_TF+m_M_D34Or6r1iQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 1/4] Makefile: only check
 _FINAL_DEPENDENCIES are selected
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot <buildroot@buildroot.org>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jan 6, 2022 at 11:59 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed,  5 Jan 2022 23:24:04 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > _FINAL_ALL_DEPENDENCIES includes _FINAL_PATCH_DEPENDENCIES which may
> > not need to be selected in kconfig in cases where building is not
> > desired, so only check that _FINAL_DEPENDENCIES are selected.
>
> Could you expand the commit log with some specific details of which
> packages/dependencies are causing issues? I haven't followed the
> problem and it's not obvious to me what this patch is fixing.

It's needed for this series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=279567

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
