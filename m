Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8047A606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rPE00lyz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA7F240609;
	Tue, 27 Oct 2026 08:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhMuFcUDpJBK; Tue, 27 Oct 2026 08:43:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1EACB4052D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793090634;
	b=LAHTT39IXY6C7yB8lobD5OgpjWmKQbfA82aWYD9VgBCkeA0Hcudar6E8GvsqiMsyEmCU
	 QAco/KJY6FJEVIkusihONTxbVN9+KqA55GjRgC4lDBudLsJhyamkDOcVguzAFH/5SOKiL
	 Tk53vMu02E7IM3n8kO8UC74grdr8LXFGgHaDKCGui2qiMvV+rxIKDbLGjeqhU0E2bFSwW
	 JWVA/FPaiTTjICzC4busrBiNSUKOuk9FNkjberPfLaPTSymvkCTGxGnpYZapOJSVl7oYs
	 nSSxzuRpkElug5h5VqOQ//oq3O68yW2KWfv6eDvOi6ZbVEIMCthNLmehlmKPbmn0bng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793090634;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=sZPwa0/eccJeDDKXkgR5gkGAZxc2dHq2sDyl9+XjW6s=;
	b=Wwi2aaJCmN18C8D/k5ZIf/rZGIJoSKLrFQTwP2E3SiqfnfDpYv8mTPpd7DvZMAHyyklt
	 3qOj147ShLBSb4pGg5KqlDyOYii4wTPb+twzpQKrss7bOgHsQyjYiaxPkSYHK9YGnKUmz
	 w74T2owMdQiDiq1yqHkbhZR7GMLPB3lOM4vvUttJzxE8g3mRq9uQ8BXS7lD6I0Tj8db9n
	 mgA2In7aDE7am8JxDq2JGtZy6oabdqeh0ESOrJipgB57l3DqE1UXyEiV61juhvwCjwsdD
	 KXG791betpPRHxBYIsebKwB3PHpd1w/thu8i8iJz2YQ7QI5AyMya9p/eNooXx3nI+sw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793090634;
	bh=sZPwa0/eccJeDDKXkgR5gkGAZxc2dHq2sDyl9+XjW6s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rPE00lyzq/nJDb+WaOjMfvTXuhtFBP9+Bd6XFOfz9qUYeHDmRHEB3oQTInBEg6aut
	 YQP3xDyPtf/Jj6qg+Lv/28Mtr5wVh0CAmBFEAqVh1Q5MXoIA9b+RtWOmXX33Rj+cuT
	 pTtza/EqbEEXZfIuzBDpnSweaEVRiu5hdIFg/Av0fZv1rdy6wXCBPvfIDfPYnUjT4/
	 vqmSJkuG/K4SX8MXKnCz6SWwsuUDryQXvfjfoWAxBJLw3zwk3KIeMw+QR505Y9ly1F
	 TVdZeJJIHlUXUQCsRJKToqh7NQLLb64bzkzPnBnbY5EVQGC+X9cd6dKsXr/qLyKN0h
	 JGeTJH7SOg1ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EACB4052D;
	Tue, 27 Oct 2026 08:43:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFCBAB91
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1CE240188
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zugYNMntF3Q8 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 08:43:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DD38F4017B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793090631;
 b=Q8qWlU4JeOS1RmLIYMBQUDAEL4eFnwmsR3XvdB0ybrguZbwDnptn+9ZXUr1QirUxyovq
 Z7Sk3n+4+DsBSYz8TgscIHHWwOW6Oktf7lr0dLh7mTdamYHczHOfomG+pAqTwctXa+NJR
 nWTqwDz40PhIBJqg0CtKYF/lpo2c1sJSxOhzcFM5OWD+TLzl1nVVDmAerVZ//+/XeU3Cj
 1qJvRcIJrnnOZ47+OWZ9FZ93dV0qkMjNByWd51f1AxTzrw8jX6LrvD6GWt1mkvn2TY5nJ
 vaRHXz81x0HtBwJ+Y9WOCjcl6UY21wnOy3XkzAnlRV1rcCzdztO7ANAN7z5/fEsex4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793090631;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=Rj+FvDt+MoM/1Z8ongwPPsq2MhGl/xnEw8/NY1eiWdA=;
 b=FMiyil8eewCxG++kW7jFJn23xbHiv3LxPhibvDn+XKlegy2FaVG3hcp/odGT/TnNab/N
 UeoW0O77hhRIoftG35NIRG4XY36R/Z7iTseKVexcrzdolI+lg7p8magMvqsCwMNq+RJb2
 6N/B5WfJ3LYaSWnTJL6edPpy8cAHs1O3oZzdoHcRkfAjIJcceCzyi+SeTdpDl7b0cwIC3
 0NmoQTGk/bEa0N3kMLpy/P0yqE6Ub9qXzBA2880rqDq5d00FF0hqETqHmX5MCHNmnJ7IN
 aSTO5X7uaE+IslcKzx4+ERUlG1O1ph0LAvX1ia8Wba4+WzUrVQHCFCxKerGoKXpTMOg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=UrmGx07G; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD38F4017B
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:43:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 254F9B97A38F; Tue, 27 Oct 2026 09:43:45 +0100 (CET)
Message-ID: <3b706023-e0dc-47e5-a59e-939a55d4bd38@rnout.be>
Date: Tue, 27 Oct 2026 09:43:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jezz@sysmic.org>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
 <b8668097-6cd6-49b9-befd-c0ae3f99514f@rnout.be> <auBf7VXw8uPQfI2X@windsurf>
Content-Language: en-GB, fr-BE
In-Reply-To: <auBf7VXw8uPQfI2X@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 27/10/2026 09:26, Thomas Petazzoni wrote:
> On Tue, Oct 27, 2026 at 09:14:26AM +0100, Arnout Vandecappelle wrote:
> 
>>   BTW, the original idea was to always have a separate source and build
>> directory (where the source would be under output/source and the build
>> remains under output/build). For the (hopefully few) packages that _don't_
>> support out-of-tree build, we'd rsync from source to build.
> 
> That was the original idea indeed.
> 
> That being said, I don't think the number of packages that don't
> support out of tree build will be just "a few". I suspect that the
> significant majority of generic-package packages will not support out
> of tree build. So for those, we would now rsync, while we currently do
> not have to.
  We only have 612 generic packages. And the biggest of those (boost, flutter, 
any others?) probably do support out-of-tree build.


  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
