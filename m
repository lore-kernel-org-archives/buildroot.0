Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C34C433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 07:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14E8B845C1;
	Thu, 26 May 2022 07:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NfdV9zRM_i6r; Thu, 26 May 2022 07:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AB0F845BD;
	Thu, 26 May 2022 07:43:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68F911BF20B
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 07:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C5C6142A
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 07:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ett-bagsqXVJ for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 07:43:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 824D56116A
 for <buildroot@buildroot.org>; Thu, 26 May 2022 07:43:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a096:527a:92bb:d0a5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8A61B13F85A;
 Thu, 26 May 2022 09:43:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653551008;
 bh=PN2oTuZ9cBlrMgWcl49d3Ymhf1yDCivs8RMC8X6gmfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oUE248O38Fvkl8gDgGIV+bxwBfoFBUmyvOsd78px6c8AAxoILZlzRa9rd8CEkPMWQ
 zWBwkoenh3MtOKD4Ns56M4cjXWjzPIrPhbX7wcMUw6+wLBk8d7Mkvnb0faRb8b1kwg
 thbfHvhI6jASTRVPMKHC/k6L1+D6P/bMkRwblMmbPL4eDOBJkQSIvbFWPpOFnhGTuL
 C8eWWzu49V/7qvNXHcCxJuQedWCqqvGs8+ZMMQmTJFuyeFbSj1bbD7/bLCZBXvGCEh
 jNlOlJk4iP8VlzgQvbeb+QCXVcFrZYJ+snny65cOiXozJemsCV8UWi8VySiFKuNMT4
 j6Y3XwQ2Bt8dA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 26 May 2022 09:43:22 +0200
Date: Thu, 26 May 2022 09:43:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220526074322.GA451036@scaer>
References: <CA+h8R2pE3Z8=fjUBYvXMZp5d3s_+FRQeh4Ms1W8E8eySfdtazA@mail.gmail.com>
 <20220525234312.643dfc03@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220525234312.643dfc03@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC] package/go: switch to gcc go instead of
 go-bootstrap
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
Cc: Joel Stanley <joel@jms.id.au>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-05-25 23:43 +0200, Thomas Petazzoni spake thusly:
> Hello Christian,
> 
> On Wed, 25 May 2022 14:07:38 -0700
> Christian Stewart <christian@paral.in> wrote:
> 
> > I propose that we switch to using Gccgo:
> > 
> >  - build gcc and/or use external toolchain
> >     - add flags to enable the "go" language in Gcc
> >     - GCC 11 or later
> 
> The problem I see with this is that many external toolchains do not
> provide Go support. While this will probably evolve over time, this is
> not something that we can reasonably require right now.
> 
> So I believe we probably don't have much other choice but to provide a
> path that consists in building Go in multiple stages: first Go 1.4,
> then a version of Go that is the last one that can be built with Go
> 1.4, and use that one to build the latest version of Go.
> 
> What do others think?

I don't much like that we do need a multi-stage bootstrap, but this
looks like the measiest path forward. Except that the second-stage
bootstrap golang compiler will have to be installed "over" the
first-stage one, so we'd need to be careful whether they would install
a conflicting set of files.

Then, long-term, the gccgo path looks the most forward-looking solution,
but it is probably a bit more complex to handle, as the gcc package is
not trivial to extend (but just enabling go should not be *that* complex
either, hopefully).

For internal toolchains, we alrady have a flag to enable C++; for
externa l toolchains, we also have a flag for C++, D, and Fortran. We
can add a similar flag for go. People usign an external toolchain
without go support won't be able to use go packages, the same they won't
be able to use C++ with an external tolchain that laxk a C++ compiler
(even though this is pretty rare nowadays, tbh).

So, in the end, maybe the gccgo path is not that scary.

Still, I wonder what go level gccgo provides: is it a complete
replacement for the golang compiler? Will we have (or do we already
have) go packages that can't be built with gccgo but require golang?
Or the ther way around?

If so, do we plan on suporting that case (e.g.: depends on GO_IS_GOLANG,
or even: depends on GO_IS_GCCGO)?

Or do we plan on using gccgo just to build golang?

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

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
