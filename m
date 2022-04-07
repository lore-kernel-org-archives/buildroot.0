Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B49C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 00:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F191640BAE;
	Thu,  7 Apr 2022 00:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fjiJDHuYM4h; Thu,  7 Apr 2022 00:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1719F408E6;
	Thu,  7 Apr 2022 00:32:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A63421BF35F
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91C0183EEB
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:32:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hfuo3eQB2Nmz for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 00:32:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A87E983EE1
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 00:32:12 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id t2so6877735qtw.9
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 17:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXOF3kudcm1x4FIVUoaOJFhxxRopQyIgCBF8hbC+aeY=;
 b=RI8RcGXQRGmlfZFVUgFIGa53Bs3R73ANJJLb9yQUqqvpZ1COHIldz/ihVGo86X8Zdy
 X81wCjsiSX4U1vyufVXWYS47yKTlFuOJINeqOC25A994zuPr5ytCkWnO1y5qX/9WBy8F
 tuGv+IoU/RXg7UrnRU22aubzkLQtzBk7X+2gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXOF3kudcm1x4FIVUoaOJFhxxRopQyIgCBF8hbC+aeY=;
 b=oIgwmv/F0/LwVRVpg/NXxkxM6Jl4OJ3jvWlouMs4V3/zth4F+xObbf4SS0oOqahx9p
 5JnFWbx1HYtN6U9XdxrjOGK2dcCrQmPBZkanj1U4MkTyNVJ/2uqIi44bElpYZGEubZ+N
 yKVZCQx+z7qRtNC69vhCq/zKxRLOwWPkEga3aNH5PY0tM3pMGuS4aT/cG8/rmCO7jBff
 vj46J55qiIIa4EAe0PWwH70cj7TpvD2P9Gn5Ek7b0xdgZY2cOX9Mhphy5sR7LFrWV8t+
 9WwHaHWbbPMXNjYevkui3GpPV5evlBxGQ1IpgJLvgxI69DS/tvYwU6LEXBmFfzykDQhO
 cDpw==
X-Gm-Message-State: AOAM532nqBBM+Bj6ijlg7pAChM61czs9ILFEbtGTF4YDYmRblI1BXBby
 5yW6jX0pZDKNA79uDIwjkC8xEFTUXrTakTY7BMdt3ISs
X-Google-Smtp-Source: ABdhPJxofIC3eV0OdwXMAslCMJwhdkhTwpWeNwWBudHzXx0iei5qUGn7mF7d9yTHHZimMh3WWGYEQ+6Xzv3kxV83HVI=
X-Received: by 2002:a05:622a:4cd:b0:2e1:ec2f:8c22 with SMTP id
 q13-20020a05622a04cd00b002e1ec2f8c22mr10013290qtx.494.1649291531444; Wed, 06
 Apr 2022 17:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220404091256.683581-1-joel@jms.id.au>
 <2ddab288-a57a-18ed-c392-d6695dd68e89@mind.be>
 <20220405195545.GH2354230@scaer>
 <CACPK8XdO5j7QP==fPWwywp-m=FM9K9eOyLrpoNtvRHJrdq+M0w@mail.gmail.com>
In-Reply-To: <CACPK8XdO5j7QP==fPWwywp-m=FM9K9eOyLrpoNtvRHJrdq+M0w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Apr 2022 00:31:59 +0000
Message-ID: <CACPK8Xe-sn+w5veLz=btiK6uWWjwYDHeiXX=5Knfn3y__HBjbw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: Backport patch to fix
 linking on powerpc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 6 Apr 2022 at 02:05, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 5 Apr 2022 at 19:55, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > Arnout, All,
> >
> > On 2022-04-04 22:17 +0200, Arnout Vandecappelle spake thusly:
> > > On 04/04/2022 11:12, Joel Stanley wrote:
> > > >Commit 192dfc68c0e4 ("package/zlib-ng: fix build on powerpc") turned the
> > >  Peter just backported this one to 2022.02.x...
> > > >Power8 optimisations off to fix a build issue. Instead apply a patch
> > > >from the develop branch upstream to fix the issue.
> > > >
> > > >This patch is not yet in a released version of zlib-ng.
> > > >
> > > >Signed-off-by: Joel Stanley <joel@jms.id.au>
> > >  Applied to master, thanks.
> >
> > Err... Why would we enable the POWER8 optimisations when the target is
> > not a POWER8 ?
> >
> > Backporting the patch seems correct, but the enabling/disabling the
> > optinisations should have stayed, I believe...
>
> Taking a look at the cmake configuration, there's dozens of options
> that provide optimisations. It looks like it does detection of
> features:

> I suggest we let the zlib-ng build system do its thing to ease the
> maintenance burden of keeping the flags up to date.
>
> I also welcome someone double checking my analysis, as I may have
> misunderstood something.

We can ignore my ramblings, because I was looking at the latest
'develop' branch. The cmake configuration in the 2.0.6 release is
quite different. I'll send a patch to reinstate the settings we had.

Cheers,

Joel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
