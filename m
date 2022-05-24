Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CD0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 19:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97EEA41B51;
	Tue, 24 May 2022 19:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sOFIhoIXPXkH; Tue, 24 May 2022 19:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3107141A5C;
	Tue, 24 May 2022 19:54:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7355E1BF28C
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 19:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6174D61248
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 19:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5d9NssSDiuk for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 19:54:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B2A9610E5
 for <buildroot@buildroot.org>; Tue, 24 May 2022 19:54:21 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-f17f1acffeso23574817fac.4
 for <buildroot@buildroot.org>; Tue, 24 May 2022 12:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3qVuk/8kUBbHHQVYtfSyHI2I6vJiDxGpbrsTuQxLtQU=;
 b=GjeR1xJJ+BAsCcZSnRTUdITTuFZhMIb670zGPHZpmBERxS7WZaQjWWfFpO+SWhRUcd
 LMQlAZaeARRzm8j9ReVNoeDgcSjqmA//3EToq26OwXNp4GVlF9PqRy9ilErDegLRC9Gk
 1SQHZPeTDzKLfDEMCXTfheiI2oYr7GKBrsh3/JTk6sQCUpbIzgxhxdWBetZH1VSyAOUp
 +aqLmPLJFHlOofucwUa8Rk44vx7IP1r3qIGGGovt+SNVz4DGBZCBdSDwZXxwGrKlVJ6r
 clsAPrsxVYOzfSZU6bgnQ/E8bSHW0AJTsDn+tmXJqUJbuFoKAaSfiIqZqCZHIWmum/kp
 QQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3qVuk/8kUBbHHQVYtfSyHI2I6vJiDxGpbrsTuQxLtQU=;
 b=gmuqm7HTtYDxXXnF5aZgCK6wMhDU5wGkoGrNpY0pB1azr/ot51XskuJ4dxpSzHj4N3
 FprV4bvgBmrUB3d2dFBssMds4fW87K38NhVSlnQKI62QqlFTIVwDyt2kmSRNROhgAkt1
 S533g61JV5SI9rwbUCfdRkZMpVl85KaNbZlZMehVk3/OPJ1yhQHCGNm4M0uZp+HkgAwi
 ztEytrdqR7mzgp2UiijmHe9AnZVlpZDyPIYY9BdGe8LS1L1C9sAwd353nIGm6B/ZopAq
 J+8dumSEAfpF0PNOdHeIbFTKkYWxXvjkNQDPt7uGMLuwH4gCJUTGVMmNKm2EjvRV6J5l
 xNpg==
X-Gm-Message-State: AOAM532dZMOySixGteD2Lc36HtXEyoR7Ws+h/o20//iPE76YUQtzSzAM
 tFnXy9lISR+risX/ptWYOfybCW7pelkqTwiv1VOWMSVB
X-Google-Smtp-Source: ABdhPJxp5D8WQ6qb6r9xXtl6ATnf8/gwrz1J+uZvsOFbhxbYYvb444P0JQdB8MieUFhLVQXUHa3cZNfvB+WC6Z6aHws=
X-Received: by 2002:a05:6870:fb8e:b0:f1:8e9b:f3d9 with SMTP id
 kv14-20020a056870fb8e00b000f18e9bf3d9mr3623216oab.99.1653422060392; Tue, 24
 May 2022 12:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <b07a637a-9842-7852-61c1-b7ca549b0c42@benettiengineering.com>
 <CADvTj4puraDuVBrgA_wDGAcHsMTMbioDuoveZScziQ1A2WdTqw@mail.gmail.com>
 <0886c6bf-316f-10c8-ba7f-7ba6d306478a@benettiengineering.com>
 <CADvTj4qRkBWM9Pv+bd8bPN-jJn0tXVzR3g7TfNLPq1uz3L=zsQ@mail.gmail.com>
 <b1c45001-9db1-7d36-15e6-630405d4a07a@benettiengineering.com>
In-Reply-To: <b1c45001-9db1-7d36-15e6-630405d4a07a@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 24 May 2022 13:54:09 -0600
Message-ID: <CADvTj4q+dvDwsLFZv9KDVDmf8an9+Nn_j+xXCgLYkF49p0eRwg@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] Can't reproduce libnss build failure
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 24, 2022 at 8:55 AM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> On 24/05/22 00:08, James Hilliard wrote:
> > On Mon, May 23, 2022 at 3:43 PM Giulio Benetti
> > <giulio.benetti@benettiengineering.com> wrote:
> >>
> >>
> >> On 23/05/22 02:40, James Hilliard wrote:
> >>> On Sun, May 22, 2022 at 5:58 PM Giulio Benetti
> >>> <giulio.benetti@benettiengineering.com> wrote:
> >>>>
> >>>> Hi James,
> >>>>
> >>>> I'm dealing with libnss build failure with host gcc on your asahi-mini
> >>>> autobuilder, the host gcc doesn't
> >>>> like -m64 option when linking [1].
> >>>>
> >>>> I've spent many hours trying to reproduce it on various dockers and
> >>>> finally on a VM with Ubuntu 16.04
> >>>> 32 bits but in the first cases I can't have any build failure, while
> >>>> with the latter I have a different error.
> >>>
> >>> It's an aarch64 host, not 32 bit x86.
> >>>
> >>>>
> >>>> Can you please tell me specifically which distribution and distribution
> >>>> version you're using on asahi-mini?
> >>>> I'm on it and I'd like to fix it.
> >>>
> >>> As the name implies it's asahi linux(arch based) on a mac
> >>> mini(https://asahilinux.org/).
> >>
> >> Aah ok. Thank you, I'm now building a docker container with buildx based
> >> on ubuntu 20.04 for linux/arm64, let's see if it behaves the same.
> >> I've tried with archlinux:latest but arm64 is not available, while also
> >> agners/archlinuxarm gives me problems.
> >> Crossed fingers.
> >
> > If that doesn't work send me your ssh pub key and I can just give you remote
> > access to the mac mini for reproducing/testing, I'm not really using it for
> > anything other than autobuilders at the moment.
>
> Thanks a lot for the proposal but after lot of trials I've been able to
> build a linux/arm64 docker with Ubuntu 20.04. I already see that gcc
> doesn't like -m64 option and I'm building(veeery slowly of course).

Yeah, figured it would be slow with emulation, FYI raspberry pi 4 is probably
a decent cheap system for reproducing aarch64 host build failures.

> So if I start to get mad for the slowness then yes, I'll give you my
> public key and access your mac-mini.

The mac mini is surprisingly fast at compiling for such a small computer,
the apple M series CPU's are pretty impressive.

I figured it would be good to run autobuilders on it to catch aarch64 host bugs
in case I pick up one of the more powerful apple aarch64 based systems
later on as a primary dev system.

>
> Thanks again
> Best regards
> ---
> Giulio Benetti
> Benetti Engineering sas
>
> >
> >>
> >> Kind regards
> >> ---
> >> Giulio Benetti
> >> Benetti Engineering sas
> >>
> >>>
> >>>>
> >>>> Thanks a lot
> >>>> Best regards
> >>>>
> >>>> [1]:
> >>>> http://autobuild.buildroot.net/results/dffa00b04f407715b04b1dfd8d9e5e4bc62b5ba2/
> >>>>
> >>>> ---
> >>>> Giulio Benetti
> >>>> Benetti Engineering sas
> >>>>
> >>> _______________________________________________
> >>> buildroot mailing list
> >>> buildroot@buildroot.org
> >>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
