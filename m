Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB08C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 21:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D64EF40AF5;
	Fri, 22 Apr 2022 21:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKFrzrGZV2Xx; Fri, 22 Apr 2022 21:17:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB9164046D;
	Fri, 22 Apr 2022 21:17:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 393E81BF336
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2787F610B6
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:17:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SgrOiG6SO2d for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 21:17:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F4B160EFA
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 21:17:55 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id bg9so8287347pgb.9
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 14:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rUL03+AL1OSMOo8/VhqGoVuA4LXxaItva7gPtVPv6a8=;
 b=OMLYfE6T5dws3OBvc8QtwfvmMRRnBlf87H7XCjhG3XfCHo/rKNXPYfkDn9l1YWpecF
 uwa+byBjbOwFQDwQZwYdGULHbNwM2AzXBZTKHmrnrP0xrM14BE8vrJ1Mnlq5Ja5TEefd
 9ugVofO+RkT070kT58nwQgffAtbB15cBJSFWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rUL03+AL1OSMOo8/VhqGoVuA4LXxaItva7gPtVPv6a8=;
 b=5k9bKExXK6zPbUk5dL1itG4ytj3ExrcxNaWrc6MnczHsySpMoiYU78CIAR4FPzKiQY
 hymmMXuohwJivB0r2K0UzCcSUJNmrzCbJX9P7irA3l2yZ6eePgsYUDjTuPh817Z7aUq/
 q9nIpbxv+MlZ7OTWB3XlFZoryzaDpcTikToO7n1d1A0r97ymoiix7wUACLPZELYvW0gz
 AcXko256PKbMazLF7+p75T+FMEJ/PYVi8ACyNKm+hs3QywAZ/t/FHFIfYFV8UgdDFrj1
 DcVIYxOai+hw+DKgG2ViqvppzwUBzqWJv3Hm9zCKvszjmQAPoPvkfIsh+w5Ea08M/vcL
 VuOg==
X-Gm-Message-State: AOAM532f7ODd7gW7k/pcnKNiqpAWmhsvXLYHk6vkofRChA9KVou4yp6m
 I9kV/o5Yfro3WcV7GtIqZhhbJPpzEkgqPipM/SEgMA==
X-Google-Smtp-Source: ABdhPJxiKlq0CZkkx8Uh6au67xtA5MaW6S4OE8Fsf0q9WsHrenDoWxKy7OtdKBGDeXtpPSu42ltLnO3Uy9y8SfizyVg=
X-Received: by 2002:a05:6a00:1895:b0:50a:6a91:e833 with SMTP id
 x21-20020a056a00189500b0050a6a91e833mr6996402pfh.26.1650662274733; Fri, 22
 Apr 2022 14:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220131145555.2819020-1-michael@amarulasolutions.com>
 <e7701dd2-5636-2891-0e47-7a518c1dc961@mind.be>
 <CAOf5uw=rqEpd5eC-tjV=bNAqwE7-VS152GByK_KZ58TCrZTbfw@mail.gmail.com>
 <b8664feb-5b6b-9261-62ab-4743a01b7721@mind.be>
 <c2c70fd1-3bce-8dae-8f38-8dcb16d2f833@collabora.com>
In-Reply-To: <c2c70fd1-3bce-8dae-8f38-8dcb16d2f833@collabora.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 22 Apr 2022 23:17:43 +0200
Message-ID: <CAOf5uwn9bAEHaqL_uncBadwaDKhzRYd1EDqkOKx0God3hR1PTA@mail.gmail.com>
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Subject: Re: [Buildroot] [PATCH V3] board: Add support for iMX8MN BSH SMM S2
 PRO
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Ariel

On Fri, Apr 22, 2022 at 9:22 PM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
>
>
>
> On 2/12/22 09:42, Arnout Vandecappelle wrote:
> >
> >
> > On 12/02/2022 13:36, Michael Nazzareno Trimarchi wrote:
> >> Hi
> >>
> >> On Sat, Feb 12, 2022 at 1:10 PM Arnout Vandecappelle <arnout@mind.be>
> >> wrote:
> >>>
> >>>
> >>>
> >>> On 31/01/2022 15:55, Michael Trimarchi wrote:
> >>>> Add initial support for iMX8MN BSH SMM S2 PRO board:
> >>>>
> >>>> - Linux: v5.17-rc1
> >>>
> >>>    I'm a bit uncomfortable to add an -rc version. But I guess it can
> >>> be updated
> >>> as soon as 5.17 is released.
> >>
> >> Ok, I will then wait
> >
> >  No, what I meant to say is: it's OK to do it with the -rc, just make
> > sure that you update it to the release version when it comes around
> > (which will still be another 8-ish weeks).
>
> Support is now almost completely merged upstream for kernel and u-boot.
> We could update the patch to pull from:
>
> * linux: v5.17 (audio for this board is enabled in v5.18-rc3)
> * u-boot: v2022.07-rc1 (released on Mon 25 April 2022, 2 days remaining)
>
> We can update later on the linux release to include to whole support and
> at least we can get rid of the custom u-boot repo/branch.
>

Ok, sorry I was busy. I will resend them with your suggestion

Michael

> Regards,
> Ariel



-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
