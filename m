Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F3FEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 12:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D08360E3B;
	Tue, 11 Jul 2023 12:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D08360E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdvBuaItZacG; Tue, 11 Jul 2023 12:29:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FF3D60E8D;
	Tue, 11 Jul 2023 12:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FF3D60E8D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9432F1BF2C8
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 12:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B72B404E1
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 12:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B72B404E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Q9XlZ7C8y9G for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 12:29:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98299404A8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98299404A8
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 12:29:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 915A4C000F;
 Tue, 11 Jul 2023 12:29:26 +0000 (UTC)
Date: Tue, 11 Jul 2023 14:29:25 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230711142925.3051cd21@windsurf>
In-Reply-To: <CADvTj4pt0RjvYoF3Wvxa7QsPbNJQre7J3Vb8sp6ckvR86Yrvsw@mail.gmail.com>
References: <20230627072640.2437216-1-james.hilliard1@gmail.com>
 <20230627072640.2437216-2-james.hilliard1@gmail.com>
 <20230710200146.33aa4362@windsurf>
 <CADvTj4ruzjfhJ-Ns9rPYhrW4oGWGqCkf66gUjTT+DR+DB8C3Xw@mail.gmail.com>
 <20230711093249.73674060@windsurf>
 <CADvTj4r7QRpW3NaYQc+_iZ5Y1WnzBeMQsptvtrtTudDc47X12w@mail.gmail.com>
 <20230711100053.1d9d3671@windsurf>
 <CADvTj4p1kQLf9J=s_xqHVZVeSwHUVVMBSMHPJsA-JT2oHHNCrQ@mail.gmail.com>
 <20230711115458.34cc38a9@windsurf>
 <CADvTj4pt0RjvYoF3Wvxa7QsPbNJQre7J3Vb8sp6ckvR86Yrvsw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689078566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RSb7iPbG9oxPoiO9tJOfb6VlhNfLnNSg470LDCgzDF8=;
 b=aBxpnhWI2LnXgntHdtOOADDjmMzmH4qltBS9GHsaoMx8GyWS4UUrniFKghcTsiLoB8RoB7
 cumnIwL5zZoKPcnooNYhyxjVcPjUE78b5WqgIHOCr3lRu0ToE3F8KdqlY+lfTpLgHfhRco
 CdTQlcAhy9crajXL/9PJszm2HZO6qFWbQBxkaf5solo6xDOci3heTs7FCRDlO2CFM24Pkv
 pq8E6NAaDtFqAk4TnhboHr+Zm1IG2g6fTBZTME4MQpz1g9q6l27ivMlQO/rVbuA1msBsys
 3nyDrb6ZLQhgKnin2NaEL4Fn+VpL5Omypwll8vG/OPwLYpdD2OIay/ZRHJjXOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aBxpnhWI
Subject: Re: [Buildroot] [PATCH 2/2] package/python-terminaltables: fix
 build backend
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Tue, 11 Jul 2023 04:50:23 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > This is a bad idea, which causes even more confusion, as we don't
> > understand *why* you're making those changes.  
> 
> The build system is supposed to be poetry/poetry-core, not setuptools, poetry
> is the correct backend specified in the pyproject.toml, the sdist has
> a setuptools
> shim for backwards compatibility apparently, this shim isn't even checked into
> version control for the project so we shouldn't be using it as it's
> not really the
> correct way to be building a poetry based package.

This is the information that I would like to see in the commit log.
Right now this series only looks like useless change: we have a package
that works, you're suggesting to make some changes, but we don't
understand why.

You should probably realize that we are not in your mind, we don't know
what your "agenda" is and why you're proposing certain changes. So try
to put yourself in our position: what are the relevant information that
the maintainers will need to understand the motivation for my change,
and the implementation of it. And while doing it, you should consider
that we (maintainers, or at least, me personally) are relatively
stupid, so adding more context than less context is very relevant.

I think you have an "agenda" of where you want to see Buildroot
Python's support to go, and this is excellent. We really, truly value
this kind of long-term contributions that improve Buildroot. However,
to make this work, you need to communicate this agenda more clearly:
what are the mid/long-term goals, and how the immediate contributions
fit within those mid/long-term goals. This will tremendously help us
understand where you're going and buy your contributions :-)

> > Could you instead do what we suggest, i.e resend one single full series
> > that include all changes, including the final change of the PEP517
> > setuptools migration, together with a cover letter?  
> 
> I mean, this is just a bug that didn't get noticed earlier, I just hadn't caught
> it before I did my pep517 migration, the fix is the same whether or not
> the pep517 patch is merged.

OK. It isn't clear in your commit log which "bug" is that, and what is
the impact. For example, is this a "bug" serious enough that the fix
needs to be backported to our LTS branch?

> I've sent a bunch of patches that effectively do the same thing as this one
> which have been merged independently, so other than the dependency
> ordering I don't see how this is related to the setuptools pep517 migration
> patch. To me it seems that I accidentally created a bunch of unnecessary
> confusion by sending my setuptools pep517 migration patch too early when
> I should have just waited until dependency fixes like this were merged.

Well, your commit log says:

"""
We need to migrate python-terminaltables to the pep517 poetry-core
backend as setuptools is not supported.
"""

You say that setuptools is not supported, but it is clearly incorrect,
as the current package builds fine with setuptools. So my reading of
the commit log was that it was needed for the upcoming PEP517
setuptools migration.

> I'm kind of pushing back a bit here since making a giant patch series would
> just end up making reviewing/rebasing a lot more confusing IMO.

It's really not, as it allows us to see the big picture. And when there
is a series of 20 patches that we're not yet ready to merge in full, we
do merge the first patches to reduce the backlog on the submitter side.
But seeing the full patch series allows us to understand the big
picture.

Alternatively, just make it very very clear in the commit log why this
preliminary change is needed, and how it fits in the big picture of
where you're going.

> If this was a change that couldn't be justified independently I would agree
> that it should be in a series with others.

As it is justified today in its current commit log, it really doesn't
appear like it is justified independently.

> I think there also might be something wrong with how I'm managing my
> patch series with git as they seem to be significantly easier for others to
> manage. Every time I deal with a large series it feels like it's a lot harder
> than it should be.

Managing a large patch series requires a bit of effort indeed, but
shouldn't be that difficult. I suppose you are efficiently/aggressively
using "git rebase -i" to rework/rebase your stack of patches?

As said above, I think it all boils down to providing more context in
the commit logs as to why a change is needed and proposed. This will
help us a lot, and will in the end reduce the workload on your side
because your patches will be merged much faster, and with less back and
forth over e-mail to collect the missing information from you.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
