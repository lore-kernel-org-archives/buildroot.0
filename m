Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF04CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 17:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27B35605DE;
	Wed, 10 Apr 2024 17:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiPkBtLqMYEE; Wed, 10 Apr 2024 17:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F7BF605E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F7BF605E8;
	Wed, 10 Apr 2024 17:21:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 803091BF32A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 17:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CA0580C3A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 17:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvOTSxLuBIAA for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 17:21:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8B4C80C25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B4C80C25
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8B4C80C25
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 17:21:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F084D13F81D;
 Wed, 10 Apr 2024 19:21:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Apr 2024 19:21:21 +0200
Date: Wed, 10 Apr 2024 19:21:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZhbKkdeV6FEARag-@landeda>
References: <20240404124329.768546-1-thomas.perale@mind.be>
 <20240407231500.2248bc22@windsurf> <ZhRCOocYgxC-C5GL@landeda>
 <ef73b0da-0127-4d58-b195-bb09c36bf39c@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef73b0da-0127-4d58-b195-bb09c36bf39c@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712769687;
 bh=lPjO862RQK2DFHVKQ+KtANY2eSu29HKBS5IPyeoNJ4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f5WuFEyxienFVFahiIbswQpgdpLbOig33IqaKlWoci3nQTo42CmwbXYmV0Ii3r62e
 ELUAd++L/R7pH+B5wzNW2m+i88Jaq1Jvx8VtzDrpn2D2UBhmVPEAo/rMTKfub76vZw
 mbXbASEl/S2eHDmLC6vNIjTbik6a/NWcDktdWidJQpmncDgvP1XxbCZh1xCSphcjPD
 BlJ0I7u+z722qo1/zluMB1xwJzr0Umffg2Cuw4qi3w2s9L3VbObWKBNE3pKjzslNPJ
 DlpAIH2YnjOYXKDDuNErBysIHcVDZVQXJBv6iS9Lm+KhMZX+Z/NQ75NECkPzLnF02J
 dQp3PPabElBFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f5WuFEyx
Subject: Re: [Buildroot] [RFC PATCH 0/5] Support SBOM in CycloneDX format
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
Cc: Thomas Perale <thomas.perale@essensium.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2024-04-09 14:17 +0200, Arnout Vandecappelle spake thusly:
> On 08/04/2024 21:15, Yann E. MORIN wrote:
> > On 2024-04-07 23:15 +0200, Thomas Petazzoni via buildroot spake thusly:
> > > On Thu,  4 Apr 2024 14:43:24 +0200
> > > Thomas Perale <thomas.perale@essensium.com> wrote:
> > > > This RFC patch series propose to add support for the CycloneDX
> > > > SBOM format.
[--SNIP--]

> > On 2024-04-07 23:15 +0200, Thomas Petazzoni via buildroot spake thusly:
> > > My initial reaction is whether it is really the right solution to have
> > > "make" spit out the CycloneDX format, or whether we should use "make
> > > show-info", and then process the JSON output using some Python script
> > > to generate the CycloneDX SBoM.
[--SNIP--]

> On 08/04/2024 21:15, Yann E. MORIN wrote:
> > This was also my reaction: when I introduced show-info,
[--SNIP--]

On 2024-04-09 14:17 +0200, Arnout Vandecappelle spake thusly:
>  My premise is that we should (in the longer term) _always_ generate the
> CycloneDX SBoM as part of the world target, so without needing a separate
> "make cyclonedx" step. I think we need to kind of force people to generate
> SBoMs, so there is no excuse not to have it.

An SBOM is totally worthless when generated on the developers machines,
as the build environment there is uncontrollable; it is useless during
development as well [0]. An SBOM only ever makes sense when generated in
a delivery pipeline, like in a CI/CD pipeline.

[0] except in the rare cases of those developpers explicitly looking at
or working on the SBOM: evaluating the SBOM, fixing bugs in the SBOM
generation tooling, adding SBOM-related metadata...

>  This has a number of implications: it has to be quite lightweight (because
> it is called for every build), so that basically limits it so make and shell
> (I didn't like the idea of "always build host-python"). It should also be
> possible to generate it without internet connection on condition that a
> 'make source' was called before (that's why the license list in
> support/misc/cyclonedx-spdx.mk is stored in the git repo and not downloaded
> while building). On the other hand, the cyclonedx generation can depend on
> the presence of downloads and build artifacts, if that is needed.
> 
>  On that background, with the addition of cyclonedx, we now have 5 things
> that do somewhat similar things: cyclonedx, legal-info, show-info,
> pkg-stats, and printvars.

Forget about printvars: it is unusable and legacy. We have show-vars
instead, which does provide a reliable extract of the internal
variables (except for those that need a $(@) or $(@D) or such, because
there is no actual target in that case, and thus it is not possible to
properly extract the internal state of variables).

We should now drop printvars.

> So a second goal is to try to unify all that in a
> single mechanism. And because cyclonedx is a standard, it makes sense to me
> to try to use that as the primary mechanism, and make the others derivations
> from it.

The nice things about standards, is that there are so many to pick from.
;-)

SPDX is also an SBOM standard, which predates cyclonedx by 6 years. It
is more mature (older!), so why don't we settle on that instead?

> - For show-info: as long as the same information is available in the
> cyclonedx file, we can simply use the cyclonedx file and deprecate show-info
> (possibly with a conversion script, which is allowed to be written in
> python, but might even be possible to write with jq, to convert to the
> legacy format).

I strongly disagree. show-info has other usages than generating an SBOM,
and contains a lot of info that does not belong in a SBOM. For example,
as you noticed, the package infra is mising in cyclonedx, and there is
no reason to add it there, while it has its place in show-info.

Another example, is that (AFAICS) there is no dedicated way to describe
reverse depdndencies in cylonedx, except by injected an arbitrary
property, which means that it does not really fit... show-info provides
that.

More generally: there is information that belongs to show-info, as it is
usefull for generating various reports, that have absolutely no meaning
in an SBOM, and so there is no reason to inject those in cyclonedx just
because something else may need it. That's what show-info is for.

And as Thomas said, if show-info is missing data, we can easily add it.

> - For legal-info, it's quite obvious that cyclonedx should basically replace
> that - though legal-info currently still does a number of additional steps
> (e.g. collect the actual source) that cyclonedx doesn't cover. I also think
> the manifest.csv file makes a lot of sense. I'm not sure how to solve that,
> but I can imagine that there could still be an explicit legal-info target
> that consumes the cyclonedx file and does some additional steps.

Or the other way around: cyclonedx consumes the output of legal-info.

> - For pkg-stats, it turns out that DependencyTrack already covers a large
> number of features that we have in there (CVEs, obviously, but also upstream
> version). Some very buildroot-specific things are not in there (e.g. the
> package's infra) but it could be possible to add those to DependencyTrack.
> - For printvars I have no solution, I guess it will have to stay.

See above: we should drop it in favour of show-vars. But yes, this wil
have to stay, indeed.

>  So, why is it not a Python script based on show-info? Because I want the
> CycloneDX file to be _always_ generated, which means no Python. And
> processing JSON in shell is horror, then it's better to just generate it
> twice.

As I said above: it does not make sense to always generate it, because
it is only relevant when it is generated in a controlled environment,
like a delivery pipeline for a delivery tag (or such), and not during
development on developers machines.

[--SNIP--]
> > > > - [ ] Find a solution to handle versioning. The "version" property
> > > >        should be incremented every SBOM generation.
> > Also I don't see how that versioning works.
>  In my understanding, the version should be updated every time you edit a
> CycloneDX file. So we always generate version 1. It is updated by tools that
> _process_ CycloneDX, e.g. to annotate with additional information.

Ah, so there are tools that have to run on the cyclonedx data after it
has been generated, because they need to inject data we have no way to
know in Buildroot?

This means that those tools can very well consume show-info to generate
the final cyclonedx, to begin with...

>  IMHO the cyclonedx file should be bit-for-bit reproducible, so this must
> _definitely_ generate the same version.

I do agree that it should be reproducible, but then I don't see how this
articulates around the "version property should be incremented every
SBOM generation."

Note that, if the version really has to be incremented every time the
cyclonedx data is generated, we could just use the UNIX timestamp, with
milli- or microsecond precision, which is in practice going to be
monotonically incrementing. It's not going to be a sequential +1 every
time, though...

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
