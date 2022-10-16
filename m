Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F625C433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 18:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAEE7409F1;
	Sun, 16 Oct 2022 18:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAEE7409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TZS7V28SmDU; Sun, 16 Oct 2022 18:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7533E409BE;
	Sun, 16 Oct 2022 18:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7533E409BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 565711BF41D
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 18:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31AAD40120
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 18:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31AAD40120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rJcMvWbFyfE for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 18:46:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9753400BB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9753400BB
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 18:46:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a23d:25f5:317d:1e3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8B79913F86A;
 Sun, 16 Oct 2022 20:46:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Oct 2022 20:46:07 +0200
Date: Sun, 16 Oct 2022 20:46:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221016184607.GN2503@scaer>
References: <20221015005611.4054933-1-james.hilliard1@gmail.com>
 <20221016162654.GL2503@scaer> <20221016163543.GM2503@scaer>
 <CADvTj4rWp4_G_eBqcCoT4Y7Z40=DkeZ215MyUAXKksOu8aXazQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rWp4_G_eBqcCoT4Y7Z40=DkeZ215MyUAXKksOu8aXazQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665945969;
 bh=OxaZIAOB6zOj5o9VPVd/fPJYTdseMyYEoRymPGz+lJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EiPIxbjEHxq8YRLUUdhRQjsfMQwTFfBS/r9NMYwTkVsFV6Ew/VyitD0dmwJ6bu77a
 s46THd+mPIJfkQswgtnY0Qixf2oZVjjyw3Nig8gRSta0FCnOTX+1JcleBvIbz7cssS
 rOV9C5RhSAvFzVJJ6CCkrxUV8UElyG/64ANAE/Pn3TlHXxI3D3mIYdfbkWooYATR2J
 QPhQM1lrxOQMYdog2/PzAfclkflexWCfDwKk/mUBAIJScI9CDgKpsp8xnMz9PsWdks
 bSEB8ASdaQjToDwZsIO9Hewtj021so+ll7fu8XOsHY027AtjBVbhXCxBZRNwmqd7B9
 BvGoSCL1ueH6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EiPIxbjE
Subject: Re: [Buildroot] [PATCH 1/1] package/Makefile.in: set .NOTPARALLEL
 for MAKE1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-10-16 12:53 -0400, James Hilliard spake thusly:
> On Sun, Oct 16, 2022 at 12:35 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > > > -MAKE1 := $(HOSTMAKE) -j1
> > > > +MAKE1 := $(HOSTMAKE) --eval .NOTPARALLEL:
> > >
> > > Packages that do not build in parallel do not because their rules assume
> > > the ordering is kept.
> > >
> > > I don't see how replacing -j1 with --eval .NOTPARALLEL: would cause the
> > > ordering to be restored.
> >
> > Ah, it's in the --shuffle documentation, not in the .NOTPARALLEL one (and
> > reading .texi source is not my main ability).
> >
> > Still, I think my proposal is better, because it is more explicit.
> 
> We don't want to modify the shuffle value

In this case, yes, we do want to disable shuffling.

Packages that do not build in parallel, do not exactly because of the
build ordering. So far, we resorted to just forcing -j1 for those
packages, because -j1 hid away the build order issue.

So, shuffling them even in -j1, would cause build failures.

And as you said, and as the make manual states, .NOTPARALLEL disables
shuffling.

I.e., technically, those two lines are equivalent (assuming make 4.4):

    MAKE1 := $(HOSTMAKE) --eval .NOTPARALLEL:
    MAKE1 := $(HOSTMAKE) -j1 --shuffle=none

Except the latter is explicit about its goals: single job and no
shuffling, while the former is only explicit about not parallel (also I
do not like that --eval, it feels horribly weird, especially with the
trailing colon).

What I am saying, is that I prefer we explicitly disable shuffling,
rather than rely on the implicit behaviour of .NOTPARALLEL.

Finally, my proposal only appends --shuffle=none if it finds --shuffle
in MAKEFLAGS. If it is not present, we do not need it, either because
we are make 4.3-or-earlier, or we are make 4.4 without shuffling.

> as it's useful for
> reproducing failures,

This is irrelevant to set MAKE1, because with MAKE1 we know the build
ordering matters, and that we explicitly state that we do not want to
be bothered by it.

> although there's currently a bug which doesn't set the seed correctly:
> https://savannah.gnu.org/bugs/index.php?63215
> 
> Using .NOTPARALLEL should ensure the shuffle value is still passed down

Sorry, but .NOTPARALLEL disables shuffling, so I am lost: why would it
matter to have the seed passed down?

> so that it appears in the failure message(once that bug is fixed) while
> still disabling parallel build for the parallel incompatible package.

Parallel-incompatible packages are incompatible exactly because the
build ordering does matter to them, so we do not want to shuffle them.

> We want to be able to reproduce failures by passing the shuffle seed to the
> top level make invocation.

This is about debugging our dependency issues, not about the packages'
Makefiles.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
