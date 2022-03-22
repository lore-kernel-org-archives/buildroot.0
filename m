Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0376C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 05:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A98840263;
	Tue, 22 Mar 2022 05:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGR2h3jPjBRf; Tue, 22 Mar 2022 05:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A130E401C4;
	Tue, 22 Mar 2022 05:46:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 423E01BF31C
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 05:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B933401B2
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 05:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JLNVA8vo3Iw for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 05:46:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C1CA4018C
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 05:46:43 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id e22so19062811ioe.11
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 22:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/mfWKMSZK1UgZEDUAHYM54df4uofWNnkM2QHOy4pCz8=;
 b=ktQVvYu1rJJtHFBtQIlHxiPOfA2RDzABjwihCLE6jt0PPVqawjHd2PrGMC/s7f31+W
 E4AcKS89nv0ILuns5gcTBApwAoeIMwaIejdvSDCbm2Bmnksqcz5nPg5NsQW/fugNQ+R2
 zCKoHHJ7B35gomRHAGdj2JIueXXSzWs7eeM2ffH1GSwvVGKNUU5spg6wETPQOS9bT1u0
 v5UgYpbplsN8pbZ2egkR9RdV0wsZpJsZHAp8vwXAvmJKgxVrLnKJWy3ARwqkZOmgPIft
 dLXIQE+21vOPkP5eTGRmnnfMYgLsQuD/YzylPsuILNT4YEhLU9z4Tqnj+4IEjX1uUeKP
 7zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/mfWKMSZK1UgZEDUAHYM54df4uofWNnkM2QHOy4pCz8=;
 b=BitOcLmTtMc3az4BY2jA0i00xl8WJJB0fjGr9sPGzQsKOL7OvgTbnkbFhv9zlhX7Ll
 6kXA1pUCOqqQph09yNT8+qCuM5yDkr8hs1WBpKr6huBebSFpfemldTf3TUbr9eNhafkG
 9rdvfdAI/n1zvtljMjZkdR9X3ZXYBEFCtGhyYIs7aL7wlgeR3JTL7OSdpxS0dfTC9cPi
 4FQnApPxw6RWHSMVuG/LSybX/KxisqWZscRYlG1HcekZPmhihVAm4Xz+dHsMwuBo0Tz5
 Xog92wEYhhksBe1QM1i6W67wbNai0Uw/TYycfNIW2aTKPW0kwJKGShm8KPiqyhaRkOcr
 zDtA==
X-Gm-Message-State: AOAM530UGUz4mIr4K17Dj+bbxBSt+7L8pXQOm/xW7aoQDvGTyUp9tA0l
 0Y6AtCkil6ksYGekrcTe2a/lv1mM1TF2KQ==
X-Google-Smtp-Source: ABdhPJzmKoUNtL4SDsHrncCniCcsEUjKOqKz8MxtZlY8ktXKD2/nXliTU0z6fEKyqEZF6O9SATtICg==
X-Received: by 2002:a05:6638:1649:b0:31f:61f6:35f4 with SMTP id
 a9-20020a056638164900b0031f61f635f4mr8212103jat.205.1647928002040; 
 Mon, 21 Mar 2022 22:46:42 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47]) by smtp.gmail.com with ESMTPSA id
 12-20020a056e0216cc00b002c841fec17fsm754005ilx.50.2022.03.21.22.46.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 22:46:41 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id d62so19050536iog.13
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 22:46:41 -0700 (PDT)
X-Received: by 2002:a05:6638:1611:b0:321:47a8:637c with SMTP id
 x17-20020a056638161100b0032147a8637cmr3302080jas.147.1647928001464; Mon, 21
 Mar 2022 22:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220322051448.2589854-1-christian@paral.in>
 <CA+h8R2qzrqF-1i9w1T0aCOp5MJCk_fPxPQFC+Uj7CsF9pgc3uA@mail.gmail.com>
 <CA+h8R2r3UYhf=gnsDhpNOtwgT0fdSNT_dQhowiX-zE8CK=NrUA@mail.gmail.com>
In-Reply-To: <CA+h8R2r3UYhf=gnsDhpNOtwgT0fdSNT_dQhowiX-zE8CK=NrUA@mail.gmail.com>
Date: Mon, 21 Mar 2022 22:46:30 -0700
X-Gmail-Original-Message-ID: <CA+h8R2q8zJ=aWGyiTqAfNorom=WmLnU67qRDeqwQB4hwotmgtg@mail.gmail.com>
Message-ID: <CA+h8R2q8zJ=aWGyiTqAfNorom=WmLnU67qRDeqwQB4hwotmgtg@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/go: bump to version 1.18
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On Mon, Mar 21, 2022 at 10:38 PM Christian Stewart <christian@paral.in> wrote:
> On Mon, Mar 21, 2022 at 10:18 PM Christian Stewart <christian@paral.in> wrote:
> > On Mon, Mar 21, 2022 at 10:14 PM Christian Stewart <christian@paral.in> wrote:
> > >
> > > The latest Go release, version 1.18, is a significant release, including changes
> > > to the language, implementation of the toolchain, runtime, and libraries.
> > >
> > > https://go.dev/doc/go1.18
>
> > I should note that this upgrade also will change a lot of the Go
> > package hashes...
> >
> > Due to the way the "go mod vendor" step works, there's some
> > incompatibility with the go 1.17 vendor format:
> >
> > go: inconsistent vendoring in /build/containerd-1.5.9:
> >         github.com/containerd/containerd: is marked as replaced in
> > vendor/modules.txt, but not replaced in go.mod
> >
> >         To ignore the vendor directory, use -mod=readonly or -mod=mod.
> >         To sync the vendor directory, run:
> >                 go mod vendor
> >
> > We will need to update the hashes and the archives for these packages.
>
> Something weird is going on here...
>
> https://asciinema.org/a/guJyOQeqbG5PIL1daVYQoyyef
>
> With containerd checked out at v1.6.1 with Go 1.18,

This was indeed an incompatibility between containerd 1.6.1 and go 1.18:

 - https://github.com/golang/go/issues/51285
 - https://github.com/containerd/containerd/pull/6605

The fix has not yet been released (for containerd).

... so we should delay updating Go to 1.18 until all the packages in
the tree support it w/ tagged releases.

Thanks & best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
