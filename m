Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FC4C27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 19:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27A16410C4;
	Wed, 26 Jun 2024 19:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dg_Eh9vNE0BS; Wed, 26 Jun 2024 19:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D5640EBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65D5640EBE;
	Wed, 26 Jun 2024 19:32:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC361BF41A
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 19:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02F1E83F12
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 19:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfvxhL9hhqtj for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 19:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8792483F11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8792483F11
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8792483F11
 for <buildroot@busybox.net>; Wed, 26 Jun 2024 19:32:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 897B713F879;
 Wed, 26 Jun 2024 21:32:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 26 Jun 2024 21:32:20 +0200
Date: Wed, 26 Jun 2024 21:32:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZnxsxFK_KDUDM652@landeda>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-5-ps.report@gmx.net>
 <ZnqUPBAcDbB7ND64@tl-lnx-nyma7486-2>
 <Znql0FCAPG8jP+Lx@tl-lnx-nyma7486-2>
 <20240626103623.7d7412c0@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626103623.7d7412c0@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719430345;
 bh=99Y4qrjHEfroskEwsMr1W364eX9ydDwH6h0CKswvA4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XG8tQeODAv128wBPOFZUwBVwl3WGsXvwjpYJtksBNifJ1+/wD/9JjlZ85ClnQugtm
 3cLY2yPaSTGBoeCBA3WhaT8iIGAxt6NccViPbvwYj2QJBSfCwcTVzNlWrpR9tOuJrB
 40XvKxcTkE6lm/kWnm5gQMCmF48lFMTfhGnBNo2NZfzUXSDvZGj0QF40oGPCgYZki3
 8XZpXw30g+52iBdlkqdC0rRVPQMLSATT5xRjMYilmSa4hoSt2/iFxkTQkFNwFlQaOI
 6cviUAXKnmc+nsO7skRV4820KZVWOrzMOPSwdYIG0t+ZU8bdCM7n5U2w4sZzldtwzu
 cSOooevfTN2NA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XG8tQeOD
Subject: Re: [Buildroot] [PATCH v2 5/5] package/xz: convert to cmake build
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
Cc: buildroot@busybox.net, yann.morin@orange.com,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

(To avoid confusion: Yann@home speaking here)

On 2024-06-26 10:36 +0200, Peter Seiderer via buildroot spake thusly:
> On Tue, 25 Jun 2024 13:11:12 +0200, yann.morin@orange.com wrote:
> > On 2024-06-25 11:56 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > > On 2024-06-12 15:57 +0200, Peter Seiderer via buildroot spake thusly:
> > > > Convert to cmake build with the following autoconf options without
> > > > direct equivalent cmake option:
> >
> > The autotools build system is still operational, and still works. So,
> > what was the rationale behind that change?
> >
> > Was that a defence against another backdooring attempt? If so, I think
> > it should have been stated clearly in the commit log. Also, we can be as
> > paranoid as we want, but it is possible to inject a similar backdoor
> > in cmake as was injected in autotools, so switching to cmake just for
> > this reason is not rally sufficient...
> 
> No, as the first suggestion ([1], marked as RFC - missed the RFC marking in
> patch set version v2) predates the backdoor detection (but migrating away from
> autoconf/automake was discusses as one measure for backdoor avoidance),
> my motivation was the following passage from the NEWS file ([2]):
> 
>         - The CMake-based build is now close to feature parity with the
>           Autotools-based build. Most importantly a few tests aren't
>           run yet. Testing the CMake-based build on different operating
>           systems would be welcome now. See the comment at the top of
>           CMakeLists.txt.
> 
> And the amount of work done for the cmake build system seems to hint
> that xz is moving away from autoconf/automake towards the cmake system...

Note that there is also some effort toward a meson-based buildsystem:
    https://github.com/tukaani-project/xz/pull/120

> > Note: the issue I hit can be solved by passing ENABLE_NLS=OFF in the
> > host variant; we don't really require translations, so we can
> > unconditionally turn it off.
> 
> Seems my intermediate step from 'package/xz: determine all autoconf options'
> and '--enable-nls' unconditionally for the host variant was wrong...,

Also, forcibly setting BUILD_SHARED_LIBS=OFF for the target is probably
wrong. And using the target options for the host is equivalently very
wrong.

> care to send a patch (as you can reproduce the failure)?

Yann@work provided a very sinple way to reproduce the issue:

    $ ./utils/docker-run
    (docker) $ make defconfig
    (docker) $ make host-xz

So you could at least try that to reproduce on your side.

He also provided a suggestion to turn NLS=OFF, but that was suposedly
not needed in your case, so there is something to investigate.

When maintainers apply patches, they accept that it may break something
down the line, so it is not a problem that a patch had issues; they
guess the contributor tested as best as they could, and the
reviewer-committer do their best as well, so it was good to be applied.

However, when maintainers apply patches, they also expect contributors
to own their changes, and that they are pro-active in trying to fix
their change that caused the breakage, without swinging the effort to
someone else without at least trying to reproduce and investigate on
their side. After all, the contributor is in the best position to
investigate: they know the purpose of the change, and they have the
knowledge of the tests they did, so they know where to look at.

If maintainers can't rely on that expectation, then they can get very
chilly about applying patches as they know any breakage might not be
acted upon, and that the burden of fixing it will pile upon them to
increase the existing load...

Again, it is not a problem that the patch broke something; without
trying, we can know. There is absolutely no blame on you at all for that
patch! We are very happy for your contributions! :-)

Still, this carelessness in handling a breakage is a bit disapointing...

Anyway, I have now reverted that patch, as it was exposing another issue
with host-python3 (https://gitlab.com/buildroot.org/buildroot/-/issues/5)

When the cmake buildsystem is official, then do not hesitate to resubmit
an improved patch, based on the commit that was initially applied. If
you hit a road-block, do not hesitate to ask for further help, of
course!

Thank you!

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
