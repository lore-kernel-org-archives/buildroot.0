Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA89D606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WCsmhsoC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F82D60DB9;
	Sun, 25 Oct 2026 11:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lcgCxJhJ6Pa; Sun, 25 Oct 2026 11:28:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8708760DD2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792927706;
	b=DUhyE2fK8RyYvmctVywS0GM1ri1z9RUxMr1cgv/sOzLFRo3ZT9COwKJ6J0XsXBfDlbDG
	 fswmZx8TX5m9dalzO7AypmZ4sS5BKGHfg4QxrvKmdjZEXcpxgcCAf+5fl+awbBqdOtaMJ
	 B+whfafMl917LNMyneH71U1Dpt3tPyTvyEvHu6iKIMT+5yd5STj1mIT+UMdJ7v31e1/NY
	 zDwKRiAAAe6SimEYWqhi1cmUtsH3wk6OI7cdZ/4FENSMTZoZ5JRAVcTxHTty2Aj1fumhY
	 cPYS0D1ursrTiAP9Yc/94Y/+hs4bLUR5neJWGZGilPHBf/1GA4TBryes4jUbq7hNKvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792927706;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+lLlbo2A521/gLA7+aYE9OwfI7BtUIsKrHVThgwcbW4=;
	b=GgeQk879nRdGhZPQJ/+rxcj+/1YQfnLkDgEp811MtMwelZRPlPHNGE4ct3LeZRCflyyT
	 XVrIYUY/yvG8kbj6LavCKJxLUu92Pa7nqPwaBnjt+c47wIjPctZsx7bsU5TBDGeLL1QjJ
	 FCOLmVynv6Gr9g1k6XqeA4n240sKnSVEMxsDx+OL2OnvxcqTllmBYsuyYcwn7b8D52mLW
	 3y+NCj2yKZbKH0o5hug4pvT/2rE/szqKn3VAeN3mmJdZkt0D9AHZXXVV3LE7fQIQgJALE
	 dje7m4/6ZndovP5t/e9riXSQ+VwQ1vhTmZUoPKxStuANz6tAsj8BIIM3Clc0ez5+1Zw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792927706;
	bh=+lLlbo2A521/gLA7+aYE9OwfI7BtUIsKrHVThgwcbW4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WCsmhsoCqa05RSJI4B35h/7/jNPYPDXpP2T6zA3ZZKxAvVx948Fd8JmHuQ35s++AS
	 38IJ0nyxRqUCXiEC2HgHkCCdICjd/c/R+jM57rs0J7kE+fqj9LmKUxNmmOzBHRrlF8
	 Kpz8bgsey//ZNCY+fHQhGQrN6PWkJy8ADiBpJvkovQdZgWPU5FF9kss2KxUCyo7672
	 i1p1O56nRxaCdSK0PV8bl4GArvErvx5dxGwcdGWuCD2Kbm4mrZSs+j7HdXgsGcT9Uv
	 1OIvG9OMb0BuNaNja8KdDFEDiLt1IsE8sMV4K8ksTHF+T0Qe9j90+PAlRo89UC4I4a
	 1rw8CDYzHSx+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8708760DD2;
	Sun, 25 Oct 2026 11:28:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C7083AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5256E816FF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkILFnxgbFct for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:28:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C1F73816FB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792927704;
 b=rcoLtzgeFjKSXzcrBFuCD8RAI4II7R1mJ5cGWZCLGKTDVX37CDzqw+GuCbl1ua7NITQw
 Yi2Cg2haP5WmaPKsLNqt9S1+WX9HIasq2O0uLg2trJvRfACI2d9Ivr219LIH6AESjgVpw
 WUGTfYKp8OzT5rNLBjs3DtRrpI+vR+MpCAKI30M3xs8eKGAZDSSN5Dry+t2fX/epnWupL
 vRFmd7uZL//nxrJRrausL5VIEXf5uQ1s1LC+KUEtWARGkL1Lea7q/XQSWnwzbrnmfDEpM
 T6rxMFRbGaBp66k7WetcwRsapTPgFbl3v8UC4YrZWpWJeOyAR+s2mQ8znWJmovSg9eg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792927704;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=1N6vFHXnRnWQRbgUco0uxLrUltS79KEeatY/91gXW00=;
 b=ZGzMVT8SXZ3xMa90DINy8MnyM3KAmgxPkf+gZgDqkrUXKP5zpxtKz4roqYVkvkg5mDUA
 DILb00v76dJrGuuE5KENHe1YTwT8oCrmCmCUQX0trORI6b9Yv0e38Oz0cmicZZxDzn07U
 dHOvWyH6hb9lHkjyK5DQ0ZOQ/GKuUtj/KOII//QvfvrFJQAG2h98YWtnT8M3hoZRmFAXC
 LBYdyM1ZGV8nj+6kgKJl7B642D3yQUzmvvJEJO65aMkt0aRS1ePvFRZv2VBL3yQNpWjp9
 bXNn5xbiG7UVEh6l93DTwrVAUlAXCjmKEe/QHVQ+kKuRwM0yWcta1MrM06PuCAMjBEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=arZuCxOd; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1F73816FB
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:28:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so500405f8f.0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 04:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792927701; x=1793532501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1N6vFHXnRnWQRbgUco0uxLrUltS79KEeatY/91gXW00=;
 b=1HSjMOH0dr19+D5uz3pmav0q9yMGCph7JPg02uWRwWPvArB3TlKRWqACxABaDYemm4
 mgsTG7siCIwiLggeSrQgxgeFI48TofTZijsGvC/aF3loczKPmsE9xaY8uUbfxGb0PXwb
 Xm8wbqhRzE2GNWc4JYjzNjXmaTuDiaUGqCHhmVN8dvLFKDSnevjjDg20EusNh7VprDYO
 n998aHD3A4yrGF4flBlki5TdVO+rYXaTJId8Ix2qB2eKsIjRfYSxo0tW76x4weTt4uEu
 PjaHgH8Ry26BU8+eKRc1W3r2p/5W1HVHriRw6BbGpjBlr30cT8bmwnDLSmD5r4mTG8Uy
 f92Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByczO17Lv4YcUb0SkHMRce6Q4peBb61SYDnnC4CdPcmQfneTp9pcTDqtB1T6x9F/uRlgWxqbGS3Dro=@buildroot.org
X-Gm-Message-State: AFq9FYLMBbUpnVlgC5hN0NDvfq9xcg6ua6cLufsfTlBnyZLO7Lr5B/1q
 cwZJhLyLJrl7vhE/4KdrE+OAsFkZ8I4YWQJYGTiX2KWoB2x7WGrKBSIwLcNANTaFdFM=
X-Gm-Gg: AYBFou2QjQtBlXFAvgdc+wvuXe9yGd3OiZd8ZQGU7d2XvHP50Sc2E/u8rE9+BaFn71l
 kZppKCKtnYdxQolgtxFGxxM4AiQNdndorH7X7vsJKSi7bQLSLKaPUBrMCfKVZ13/N5V9BF6VpbA
 WwkM4Cg5Ezvp/v5fbDjSIQNbFNBz1SLk/dTPv8qQgdt+t6Zwtoadpvx/OCo492O2CeYqzdD29qL
 +H8oRq/yx71uvrxXOYesh6il+5O9Ti14zd0Dg/OXq6I7RR6Q4Glqnkut3/fxsPuqVs2IkK/nN7S
 sj7/arHWvcAihPHCD0Kc1fcRfpx2KQ6xuxJ8pzIOzWJBJXOsVxThDUISgwMi3l1vWWU0G1w/8wc
 fjLkfy34WLsXIadwURi4u0erYnRJrwCXzte+8D8QYk9fOtOYR0dSI5QbQS/7Bnfn8YhrgPemzpA
 Q/Ewp9qBRT9qMaclLLlgChTp5ay4bVFP5W9iJN3X4OB+jLnzGbBHtE8COCwcaxiLfU6Tvi6Zwu4
 XUj8prBPUtA0kK6d8vgvtGqhZ2Scy5tI/hygHtgs0sg6S2m
X-Received: by 2002:a5d:64e6:0:b0:48e:3697:708d with SMTP id
 ffacd0b85a97d-48e3eb6119fmr8072069f8f.12.1792927700820; 
 Sun, 25 Oct 2026 04:28:20 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecdf9bdsm9506517f8f.55.2026.10.25.04.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 04:28:20 -0700 (PDT)
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Thomas Perale <thomas.perale@mind.be>, Fiona Klute <fiona.klute@gmx.de>,
 buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>
Date: Sun, 25 Oct 2026 12:28:19 +0100
Message-ID: <20261025112820.82675-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <1e670090-2e09-465e-b7d6-317b7d46881b@rnout.be>
References: <1e670090-2e09-465e-b7d6-317b7d46881b@rnout.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Arnout, Fiona,

In reply of:
>  Hi all,
> 
> On 12/10/2026 20:34, Thomas Perale via buildroot wrote:
> > Hi,
> > > In reply of:
> >> Hi Thomas!
> >>
> >> Am 12.10.26 um 17:41 schrieb Thomas Perale:
> >>> I'm thinking again about potential solutions since the issue we brought
> >>> upstream remained silent :-( [1]
> >>
> >> Yeah, I checked that too before sending this series. :-(
> >>
> >>> Do you have a slack account to give it another try there maybe ? (I don't have
> >>> one sorry)
> >>
> >> No, I don't. I guess we could poke that discussion again?
> >>
> >>> I think the actual proper solution to this is the following. Given an external
> >>> named "br-external" that has the package "foo" and a "buildroot" config that
> >>> has the "busybox" package enabled:
> >>>> ```json
> >>> {
> >>>     "bomFormat": "CycloneDX",
> >>>     "$schema": "http://cyclonedx.org/schema/bom-1.6.schema.json",
> >>>     "specVersion": "1.6",
> >>>     "metadata": {
> >>>       "component": {
> >>>         "bom-ref": "project-name",
> >>>         "type": "firmware",
> >>>         "name": "project-name",
> >>>         "version": "project-version",
> >>>         "components: [
> >>>          {
> >>>            "bom-ref": "buildroot",
> >>>            "name": "buildroot",
> >>>            "version": "2026.08-891-ge17cfc9b3b",
> >>>            "type": "firmware"
> >>>          }, {
> >>>            "bom-ref": "buildroot:br-external",
> >>>            "name": "br-external",
> >>>            "version": "...",
> >>>            "type": "firmware"
> >>>          }
> >>>         ]
> >>>       },
> 
>  This composition looks very elegant to me.
> 
> >>>     },
> >>
> >> Moving the Buildroot repository/version info from metadata.component to an element of metadata.component.components makes sense, if we want to leave metadata.component fields for people to provide info about whatever they are building using Buildroot. Then we'd need to provide some way to supply that info. But in any case I think that's independent of external tree info. :-)
> 
>  This is about the component name and version, right? I would say that this
>  should be provided by command-line arguments to generate-cyclonedx. bom-ref
>  would be derived from name by cleaning it up (replace everything non-alnum
>  by dash).

In this other thread I started discussing a way to provide the information of
the product owner without adding a ton of new CLI arguments:

https://lore.kernel.org/r/20261023115230.27888-1-thomas.perale@mind.be

> 
> >>
> > > Yes we can discuss that part later. Because I have multiple option I need to
> > lay down to think which one makes more sense.
> > >>>     "components": [
> >>>       {
> >>>         "type": "library",
> >>>         "bom-ref": "busybox",
> >>>         "name": "busybox",
> >>>         "version": "1.37.0",
> >>>         ...
> >>>       },
> >>>       {
> >>>         "type": "library",
> >>>         "bom-ref": "br-external:foo",
> >>>         "name": "foo",
> >>>         "version": "...",
> >>>         ...
> >>>       },
> >>>     ],
> >>>     "dependencies": [
> >>>       {
> >>>         "ref": "buildroot",
> >>>         "dependsOn": [
> >>>           "busybox"
> >>>           "buildroot:br-external",
> >>>         ]
> >>>       },
> >>>       {
> >>>         "ref": "buildroot:br-external",
> >>>         "dependsOn": [
> >>>           "br-external:foo"
> >>>         ]
> >>>       }
> 
>  This doesn't look good to me at all. AFAIU dependencies are supposed to be dependencies, not composition.
> 
> >>>     ]
> >>> }
> >>> ```
> >>>> The metadata section declare the project and its core component (buildroot +
> >>> externals), as its already the case with your patch. And then the dependencies
> >>> express what are stored in which externals, as its already the case for buildroot.
> >>>> I actually think that solution makes a lot of sense, even though it's not
> >>> obvious by just looking at a component to understand where it comes from.
> >>> But as we discussed previously nothing seems to fit that requirement in the
> >>> component definition yet...
> >>>> Again I wish I could give you a definite answer on how to handle this,
> >>> what do you think about this solution ?
> > >> I think dependencies are the wrong approach. I guess you can see an external
> >> tree as a dependency of the overall build, but recording packages provided by
> >> an external tree as its dependencies doesn't make sense: the external tree
> >> *provides* the packages, it does not require them. It's about origin of
> >> components (packages), not dependency between components. If I define a new
> >> package in my external tree and it later gets merged into Buildroot package
> >> dependencies don't change, only the origin of that package.
> > > I understand your point but the same logic apply for the 'buildroot' meta-component
> > it also provides a number of packages but in the current implementation all packages
> > Buildroot provides are registered as dependencies.
> > How I understand it is: "to have a full buildroot build the entire list of packages
> > listed as dependency is first required".
> > > I used DependencyTrack to kinda validate this behaviour. They have a tree style viz
> > of your project. To have it work properly with all the packages available under it
> > you need to add this dependsOn to all the packages similarly to what I described in
> > my previous email:
> > > https://pic.infini.fr/IkWJ9c5X/M9EqMt6b.png
> > > I think this is the kind of view we would want to achieve to show the hierarchy
> > of the project with externals ?
> 
>  Not really I think - that graph should show dependencies, like our graph-depends, no?
> 
> 
> >> I'm also wary of encoding that origin information in bom-ref, as your
> >> proposal does for packages. Bom-ref is supposed to be an opaque identifier.
> >> Nothing against making it human-readable instead of a UUID or other random
> >> string, but we should not use it to encode information that should be
> >> machine-readable.
> > > Yes here I just used as a way to improve the readability but I don't think
> > using an uuid changes the logic of the proposal.
> 
>  I don't see the encoding of the external in the bom-ref as carrying machine-readable information either. I think the idea is that the dependencies carry the machine-readable information. But then, they don't, because different kind of dependencies are mixed (actual dependencies and composition).
> 
>  I don't have a solution unfortunately...
> 
>  Regards,
>  Arnout
> 
> >> Where we're in agreement is that CycloneDX doesn't really have any suitable
> >> fields. That is why I used a property (where we can define our own), and
> >> suggested in my cover letter to register a CycloneDX namespace for Buildroot
> >> (which implies publishing property definitions). It's not as nice as an
> >> upstream field for "package repository" or similar, but that doesn't exist,
> >> and with a registered namespace it'd be well-defined, documented, and
> >> findable from CycloneDX documentation (and it'd let us clean up the current
> >> BR_TYPE).
> >>
> >> Best regards,
> >> Fiona
> > > Best regards,
> > Perale Thomas
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
