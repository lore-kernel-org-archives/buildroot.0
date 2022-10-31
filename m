Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AC7FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 15:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F2CB60C29;
	Mon, 31 Oct 2022 15:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F2CB60C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wq92YpN5gV7f; Mon, 31 Oct 2022 15:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37BB960BE1;
	Mon, 31 Oct 2022 15:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37BB960BE1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 615671BF20F
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 15:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B89B817AB
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 15:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B89B817AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Oh-Xou8yUr2 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 15:02:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF53281756
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF53281756
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 15:02:15 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46-20020a9d0631000000b00666823da25fso6923223otn.0
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 08:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OJQUQ4hR5qWh95m3HOZxfpr/yJ53X4iKUTQ05B8cVPQ=;
 b=OCO7j81CWl3k44RrrAEzmPNz2w//TRrTaBy1YXl/PQXxrspsh20UChcEUpbq/b7P2S
 nCBuEjgpJTgOnEHdt69h6mG8/EfNVxtQXYtRRJlMUSn0BgGPdxwMLo4ZT67XFA6eNGbT
 qs1EszvSz9GBdzhwPKl92ArS59mNzMB9u/BBmypztJ+j5ASufPnDCYuLicEDzlAM0kTe
 w/6RuqM0zijBydLAh0/ow0T783FuGweh2xMZmj/v1Css9HZpG0tqNVzS+92Wc1RVQSzp
 Pw1GAU/MGGibkNI/dj4JhJ9w5u7xmyFMkMTIillvNyRCBdTECpPYqWfAbnE0l6uNG5to
 q8kg==
X-Gm-Message-State: ACrzQf3+IrHaB3/NezxN4msujH3U5hK70ePyjhLTOimg8Kql4Ojyfyzk
 IMGxVBdY8X23RSERh1CtluDWVj1cwt62xt+LJJXB0w==
X-Google-Smtp-Source: AMsMyM6mgq1m5Fp9ncCMH9tOa2EDjaM0Cz9hgQtIkkl9OGk/oyKpopTqBnZdacf9Ptp1fny5TtXylJQavuXD1U5I+20=
X-Received: by 2002:a05:6830:33e1:b0:655:e771:f572 with SMTP id
 i1-20020a05683033e100b00655e771f572mr6956995otu.245.1667228533338; Mon, 31
 Oct 2022 08:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221031114643.6648-1-tim.gover@raspberrypi.com>
 <20221031123928.GB1058960@scaer>
 <CAAvKZ67N24Hj7ejxQ7zueOQbsqq8WNNgLiZauM7GkMHLhN=kYw@mail.gmail.com>
 <20221031131444.GD1058960@scaer>
In-Reply-To: <20221031131444.GD1058960@scaer>
From: Tim Gover <tim.gover@raspberrypi.com>
Date: Mon, 31 Oct 2022 15:02:01 +0000
Message-ID: <CAAvKZ64EqSECNwwx_AkBdicncUDXj1qFgzYM6cmrtoKA-kbeVA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OJQUQ4hR5qWh95m3HOZxfpr/yJ53X4iKUTQ05B8cVPQ=;
 b=aSnqFFTWCH4Zq50bz9V+I+y6O/SBip2tAB63BrVvlPw8TNeef036Rchkd3/wiyVOA4
 rvTv+HNujgyTTowZpA1BPGZDivp/TpZGVVdXkNrELG41UrKfJcCtotU22/Cjbcc1BiJl
 g9oGJje01UZ9h7dWKGI+z/reUQE88Q7ct0nH4rMi+P1/yeVL7v6IFc42rADtbGcKyLJM
 BsjFBfefrH2k2rcdGoQnt+ZXU0v46H2ylC/dDWnLSBClSxgEyhD014mTCdus8zCw+K+9
 4Kv9dIszd2DV20LxLTXCFiJ7nGfN8JqoSDS5xp8/23NsaGysBHVxrDAhaBYUMo5/oRrr
 pPaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=aSnqFFTW
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: add
 overlays/README
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
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Oct 2022 at 13:14, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Tim, All,
>
> On 2022-10-31 12:52 +0000, Tim Gover spake thusly:
> > On Mon, 31 Oct 2022 at 12:39, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2022-10-31 11:46 +0000, Tim Gover spake thusly:
> > > > If a custom os_prefix directory is specified then the Raspberry Pi
> > > > firmware probes for the README file in overlays directory.
> > > > Since the README file is small let's include it, otherwise,
> > > 197KiB is _not_ small. In fact, the README is bigger than every dtbo,
> > > and accounts for ~25% of the size of all dtbo combined.
> > Good point. Would you be happy with simply creating an empty or small
> > README file (a note indicating the purpose of the file) ?
>
> Just touching the README should be enough I would say.
>
> > > > the firmware won't recognize the overlays directory if the user
> > > > later moves it to an os_prefix specific sub-directory.
> > > What is the goal here, in the context of Buildroot, where we only
> > > install one set of overlays?
> > > If a user moved the overlays, they already have a script that does that,
> > > so they should also ensure that script properly prepares config.txt to
> > > specify the proper os_prefix, and so it is just a matter of adding a
> > > 'touch' on the README in the same script.
> > It's fairly common for non-expert users to modify the output of a
> > buildroot image
> > without re-building the image themselves. Adding a README file reduces
> > the risk of them being tripped up by this difference in behaviour.
>
> So, if I read you correctly: non-expert users know they can move the
> overlays to a sub-dir; they also know they have to set the os_prefix
> accordingly in config.txt; but they don't know they have to create a
> README in there? ;-)

We've found that many industrial customers prototype their software
on Raspberry Pi OS before using Buildroot or Yocto to create a
dedicated OS image. Using os_prefix + a GPIO conditional is
a common pattern and it would be nice if this worked as easily
on buildroot as elsewhere. I've resubmitted the patch with a zero
byte README. If anyone wants to create a really small image then
they would remove unused .dtbo files or just have a fixed DTB.
Therefore, I think the overhead of having a single empty README
file should be acceptable.


>
> Sorry, I am still unconvinced.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
