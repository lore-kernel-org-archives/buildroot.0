Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D8DC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 432FC831A9;
	Thu,  6 Jan 2022 22:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vR45gAyC8UQh; Thu,  6 Jan 2022 22:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A175381D4D;
	Thu,  6 Jan 2022 22:38:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AB881BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56EDF81D4D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gio49pjFyJa2 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:38:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80EF881A8E
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:38:19 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id m200so2637938vka.6
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RI/j5oDhbODz2vgKcgXSeuRKuzzcyvnES3ey5BqqtPw=;
 b=YqLlt7AcsdZ19kBqgsUT1xY16t7IZ2CBSD0RLZU3WEh63/DJhomIrJGYrdLJGKy8iO
 2115GHq2twVfu8sQvACb7X2lBFpn66YIZf5ue3rUjD97DjK8e+8FR5/fEs9jfmo1yIcB
 D0oBWJX9dMWYAYNaxjXhmV0GlyKeY59bZWdvHQ5CmK/3xLfhboFzSpUupB0n3nPVYvLB
 Bc21/CLnZe8WSTNMnWq26zSVbK5/JSFMEdihqUVNurcOxLy3GTbEKjESMxb4Hahk2fp4
 /oHBndGx18HcIGimcYTt9/DJg7YumA2eLivgfFkWGLoiPm1HAIdK2+kC945MIqgGqmu/
 wStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RI/j5oDhbODz2vgKcgXSeuRKuzzcyvnES3ey5BqqtPw=;
 b=ASMSYGgKJlzIYd1Q0tW6w2smPq0bdzTBPNNbp8ht54jSZFJVZiDyQi86CgtqZLI4mh
 ZwoEotuVbGAmQ6U7tuRFeUJX4qeoULDVrGFPLph2lNTHZSUIOIZ8j5dBAz6WbBrVoiMJ
 ucTM7f3U1aCWJmtrfGa5TBsmUiVjG53JIwhiXjIsn335H1n/4s6/pcG2yHsR2DkfzFO+
 KOGpZ5wXYsLotSvNPijNXKoa1slUadwdDKaTlQRsARkqxNzo6eCgN8oaZs8M05DFcNmr
 qY8co95EcLSbQdnTuz2mDXue8JO3n0DKEnmTd71zG6mJkoHsFtgdF1I8jZrxB+n44VYl
 nh7Q==
X-Gm-Message-State: AOAM530+biSCucmIicE2Bf/K1jEKGH4S5YwNdUPKSB2y8IDKrzsdIc6u
 Y9NIghUOi5+zdlXeclG+AfvW9rRoWUBClUZh
X-Google-Smtp-Source: ABdhPJy4/ZkqrMdEqijNN8cd+6cKdnObhxbV2q6RQ1iMDKBTeYvlNfpsY9gNS8HXHUoK6Q6EVHz4XA==
X-Received: by 2002:a05:6122:a07:: with SMTP id 7mr20826756vkn.8.1641508697813; 
 Thu, 06 Jan 2022 14:38:17 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id x190sm2093859vkf.56.2022.01.06.14.38.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 14:38:17 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id b26so7118405uap.6
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:38:17 -0800 (PST)
X-Received: by 2002:ab0:1ec4:: with SMTP id p4mr1419371uak.57.1641508697046;
 Thu, 06 Jan 2022 14:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-9-thomas.petazzoni@bootlin.com>
 <CA+h8R2qv7gBPc2KcgT=5tjDr475haSYMZwLzu4RbYFO3xV4-HQ@mail.gmail.com>
 <20220106232913.370ee876@windsurf>
In-Reply-To: <20220106232913.370ee876@windsurf>
Date: Thu, 6 Jan 2022 14:38:06 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rnx_wLmqtetBofM=PcxAV2qiyWUug9gjWxwawJ8CtD3g@mail.gmail.com>
Message-ID: <CA+h8R2rnx_wLmqtetBofM=PcxAV2qiyWUug9gjWxwawJ8CtD3g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 08/11] package/sentry-cli: re-add package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Thu, Jan 6, 2022 at 2:29 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Thu, 6 Jan 2022 14:04:56 -0800
> Christian Stewart <christian@paral.in> wrote:
>
> > I get a build error  with "make host-sentry-cli":
> >
> > error: failed to run custom build command for `libc v0.2.71`

> > /lib64/libc.so.6: version `GLIBC_2.34' not found (required by

> It build fine on two machines here. Could you provide more details
> about your host distribution? Perhaps provide a docker container that
> reproduces this?

I'm running an up-to-date Gentoo system at version 2.33.

Currently 2.34 is masked:

https://packages.gentoo.org/packages/sys-libs/glibc

I guess the host-rust packages expect at least glibc 2.34.

Best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
