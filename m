Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0406CD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 20:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7C1540182;
	Wed, 10 Apr 2024 20:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcBLL8C8Ac5J; Wed, 10 Apr 2024 20:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9254E4036E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9254E4036E;
	Wed, 10 Apr 2024 20:10:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA3B91BF4DD
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3A494052E
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfIjQ7aqWPgN for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 20:10:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED1E94052C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED1E94052C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED1E94052C
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 20:10:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D03891BF204;
 Wed, 10 Apr 2024 20:10:14 +0000 (UTC)
Date: Wed, 10 Apr 2024 22:10:13 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240410221013.10b6fb48@windsurf>
In-Reply-To: <ca3fa476-0679-496f-989d-e070724da1ee@mind.be>
References: <20240404124329.768546-1-thomas.perale@mind.be>
 <20240407231500.2248bc22@windsurf> <ZhRCOocYgxC-C5GL@landeda>
 <ef73b0da-0127-4d58-b195-bb09c36bf39c@mind.be>
 <ZhbKkdeV6FEARag-@landeda>
 <ca3fa476-0679-496f-989d-e070724da1ee@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712779815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=whUSqu+fMNoEUN1B5txTZ8ZTLsMs3VrDLaj5vBGcTqo=;
 b=Q78OZSwK3OySZxyqHb0rPZzHKfgYxXc5Zj9SbD+SPSWOI3Q7g5eB05x4QF7hchcZhmTaRY
 ZRSZD1ZBd4rFCkriJ3Ph5W55N4nzqHpNXQboWEyIqN8DwxVhPKFRBK2iI3UF1Q3U0F9ROq
 jD5U3FFCaZmNphDf55JfXzCd+DsHgnzb56WvmmSQkbpjIOZBxj3S/Ppj03ISAu4XbRQ4Np
 7ZfwsRdsxDKQxa35wnxyffr7XY/8mlEMdlVofWbQHL4zHdiBLYFDX/UvlWJJjBuyOUVLCA
 u9X8OneWrjyZSmcbyCm9+g3E46ZyQhv1dbaysLnKGe9F+eqFGIuMzVF5BfN1Ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q78OZSwK
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@essensium.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 10 Apr 2024 21:26:09 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > An SBOM is totally worthless when generated on the developers machines,
> > as the build environment there is uncontrollable; it is useless during
> > development as well [0]. An SBOM only ever makes sense when generated in
> > a delivery pipeline, like in a CI/CD pipeline.  
> 
>   Huh? It's equally worthless as the images created by Buildroot then. Those are 
> also uncontrollable. Of course, you have no guarantee that the SBoM corresponds 
> to the image that gets shipped to customers, but that's not really relevant. You 
> can still use the SBoM to see which packages get installed, which patches are 
> applied, which CVEs apply, which licenses are used, etc.

Yes, I agree the argument from Yann here is a bit dubious, but do we
care?

>   And anyway, I don't think it's very relevant if this SBoM generation happens 
> on a developer machine or in CI. In either case, I don't think we want to rely 
> on a host-installed Python version.

Why?

> > We should now drop printvars.  
> 
>   OMG, I completely forgot about show-vars! But indeed, we still need to keep 
> show-vars. And we should drop printvars.

We don't care about backward compatibility?

> > Another example, is that (AFAICS) there is no dedicated way to describe
> > reverse depdndencies in cylonedx, except by injected an arbitrary
> > property, which means that it does not really fit... show-info provides
> > that.  
> 
>   True.

So, how do you propose that CycloneDX replaces show-info, if CycloneDX
cannot represent all information that is emitted today in show-info?

> > More generally: there is information that belongs to show-info, as it is
> > usefull for generating various reports, that have absolutely no meaning
> > in an SBOM,  
> 
>   What kind of information would that be? show-info and an SBoM are pretty much 
> the same thing: a list of packages and their properties.

Well, see above?

> > and so there is no reason to inject those in cyclonedx just
> > because something else may need it. That's what show-info is for  
>   Anyway, for me replacing show-info is not the most important thing, it's more 
> a nice-to-have. What I don't want is to generate CycloneDX by post-processing 
> the show-info output, because it turns out that that is still fairly complicated 
> and it's just easier to directly generate CycloneDX from make.

Why is it "fairly complicated"? It sounds to me that post-processing
show-info into a simple and nice Python script to generate CycloneDX is
not at all "fairly complicated" but rather "fairly simpler" than doing
it in make.

Even from a pure architecture point of view, it makes a lot of sense to
have a Buildroot-specific show-info emitted a JSON blurb with as much
information as we want (we don't need to comply with any standard), and
*then* have post-processing tool consume this Buildroot-specific JSON
blurb and turn it into CycloneDX, SPDX, whatever people want, by using
the relevant information provided in the Buildroot-specific JSON blurb.

So I'm sorry, but your argumentation is not convincing at all :-/

> > And as Thomas said, if show-info is missing data, we can easily add it.
> >   
> >> - For legal-info, it's quite obvious that cyclonedx should basically replace
> >> that - though legal-info currently still does a number of additional steps
> >> (e.g. collect the actual source) that cyclonedx doesn't cover. I also think
> >> the manifest.csv file makes a lot of sense. I'm not sure how to solve that,
> >> but I can imagine that there could still be an explicit legal-info target
> >> that consumes the cyclonedx file and does some additional steps.  
> > 
> > Or the other way around: cyclonedx consumes the output of legal-info.  
> 
>   Again, it's going to be much easier to generate everything from make rather 
> than post-processing the output of legal-info and show-info.

Do you have some real argument to back this affirmation? Python code
is typically much more readable than make code, and it's easier to do
text manipulation in Python than in make.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
