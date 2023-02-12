Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9CDC05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 11:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F4460E2E;
	Sun, 12 Feb 2023 11:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8F4460E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BqJ4948vX_ty; Sun, 12 Feb 2023 11:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E575060E29;
	Sun, 12 Feb 2023 11:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E575060E29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2E01BF599
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 11:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAA62818C9
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 11:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAA62818C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ByLyp5ZW9-_k for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 11:06:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D87D9818AC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D87D9818AC
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 11:06:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 19F3F5FFA0;
 Sun, 12 Feb 2023 12:06:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 12:06:12 +0100
Date: Sun, 12 Feb 2023 12:06:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230212110612.GN2796@scaer>
References: <20230211184346.1192333-1-james.hilliard1@gmail.com>
 <20230212091914.GJ2796@scaer>
 <CADvTj4pWs_a+Qbx8ZWZKoUY+H1vJpTEpdZF7Ruz6inV8eCXV-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4pWs_a+Qbx8ZWZKoUY+H1vJpTEpdZF7Ruz6inV8eCXV-A@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676199975;
 bh=AyUa704hZKQmW2ApJQuBUdpnBhDkKfml1xZUO6VfGAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I1qLUy5dwYFEEDmgsegOO/SmV16JlPNXaZXkT3bglJ82sk8jY2AXx0UvDog3T5Ii9
 bISWikhngDsaVsD47bxyW//DOhuDOETVzvPBSBG+prm4RKFx68VboNBLZ5ngYpHzOu
 W73822sBzTbamoJd5CtanyxL7Mi8w3ns6oOucdsGzRoq1UvlPS3eOAlGICrLtbkcX0
 o1u5/xnQsdcgivzZ89HNOprr/Iu6fzat1AdTUG7moIWz4l0Em0v5AHEQ/gdxBL5h+z
 HIre4LBOqSMsR6IUQTMi1CGqtOFVNVtuXntTOzXvAkuUHy7wclWRJufiZNdVmzXAJb
 ztQhzAcsuQAFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I1qLUy5d
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: fix rule order for legal-info
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

On 2023-02-12 03:12 -0700, James Hilliard spake thusly:
> On Sun, Feb 12, 2023 at 2:19 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2023-02-11 11:43 -0700, James Hilliard spake thusly:
> > > This command relies on the clean/prepare operations being in a
> > > specific order.
[--SNIP--]
> > However, in the legal-info case, the rule is definitely not
> > parallel-safe, and we do really want it and its dependencies *not* to
> > execute in parallel in fact.
> >
> > Indeed, all PKG-legal-info rules will emit a little blurb that is
> > appended to the manisfest.csv, with commands like:
> >     echo 'PKG,VERSION,blablsablab' >> manifest.csv
> >
> > So, if we run that in parallel, this is going to explode [1].
> Hmm, might just need a flock operation when doing the manifest.csv
> file echo append.

Except we probably want, no, sorry: we do want, that the manifest to be
reproducible (and alphabeticaly sorted), which would not be guaranteed
with an flock.

> We do something like that for downloads already:
> https://github.com/buildroot/buildroot/blob/2022.11.1/package/pkg-download.mk#L113

Careful there: the flock is to protect against a concurrent Buildroot
build, not an internal protection (although it also serves as an
internal protection, when two packages have the same dl dir, like mesa3d
and mesa3d-headers).

> > So, I believe in this case, we do not want to use :: rules, but really
> > ensure that legal-info and all PKG-legal-info rules are never run in
> > parallel, *and* that they are executed in the order they are listed in
> > the prerequisites.
> 
> Well legal-info can take a while to run so it might make sense to make
> it work in parallel.

I understand that, but I still think legal-info should produce a
reproducible output, and that can't be guaranteed if all we change is
using an flock around the manifests.

Also, legal-info is probably run after a complete build, so the overhead
of downloading, extracting, and patching, ahs already been paid during
the build.

We talked about legal-info during the dev-days, and one idea that
floated was that we need to generate an SBOM of the build, and the
closest we have now is legal-info. The SBOM should always be generated,
and I believe legal-info should awlays be generated, so the overhead
point would be moot (but would be replaced by the overhead of running
legal-info for every builds...) More needs to be dug on that topic...

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
