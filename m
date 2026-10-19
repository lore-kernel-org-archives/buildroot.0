Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E026CCCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 12:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0B4F40613;
	Mon, 19 Oct 2026 12:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUxnKubmLej6; Mon, 19 Oct 2026 12:24:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BD38540611
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792412640;
	b=XVXyI/Ovzu+SgNadVARIsTlLFwAMtMPIeBReYByhxAIiX8X3Zhjex1cQikYRGx/cNBVr
	 LToLETNJpWSH91u7AMyP4kwBvCoIzMBglLGKzKx25QP77Scd4OjDteP9Cnrdi8Ej4RADv
	 HbhV/Lhrm7BnZgWborZENLedont1wG9vx1OH7HTp5IF0W+nQsDnYwfEkQ25xwEI7XlIAt
	 lzswGLpJLvgv7ztyBD42xsgy6/U8wbdyxhLrHseKVRraU9bmS5jOJSs2Ick7u66rdGMNu
	 9u6skB3dVLBiw+KTM9+gOeM+DG9ucDmhHdvi9/0SnqcRKA9tUHVJefWAvQNDbXY3a9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792412640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Lvvuqs+q1EeMLQFNM+F5PaDYUHfBuqxc0Csgrrc5De0=;
	b=hSV+lj4qga/DrS7XPet7SphAZ/K0zjPQDaR18P8U/dfy0bk/d08zFD36r+Kt6ivzUyHl
	 ej+0tNLUeKsouylbh3B+yU8BVYKLyctZwcFomZFqe+PNvl2vOogIeC37nf1Sgf6GQAbbB
	 Ww67YS4qcRhxV65mR4kgR3M0CpE47PkBvLd4FHZyZTvrnp4TujJ575i0pRi0WXU3KY4oY
	 vny+wM6UFTjSoyxln+O5Bqnl6+ZyUwB4AWsZ7UgoHdlMQHoC4DVuRoU/i7EtHHaUQoxxj
	 IPea01J9zqVpLk67RdjGlJuxGhftmewW+FjkpE7JEQX4+vs6Q1XfTmK8pHdWE5h92jw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792412640;
	bh=Lvvuqs+q1EeMLQFNM+F5PaDYUHfBuqxc0Csgrrc5De0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WQ5DAvx40TI0Si8F6pEz1dgp25dAa/twaYrtiarnWO7Tgo1AEs/VwR7PotwzrRqKw
	 Hiqr6aDtij/RhgdthSM7J9Gav2a/be1ADVfXRRIdZXFCppkJh3TSKn+NUqnqS8HidQ
	 DC0sPK2lr8vUs0bySpyrt08cXPbIXdBTKtVfucaSq3Vl1ks//QYIXuLm60fOTwhqUS
	 Xh6ICrToyMrpJcBM7ewNP1pAkgiHInsHXEdNDjfhNiMssku6ORpm/XX+HFw9giPG3/
	 mf6XDp6U4UIaqYPBcA7Az0mrRXqUzG3L5F0fvpFJOczNchcU6RADb7NmmoZAhFvjK8
	 UxuMC2TZXO0GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD38540611;
	Mon, 19 Oct 2026 12:24:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8669722B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 789C160634
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyJ83Hj-k5qt for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 12:23:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CEF0E605EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792412637;
 b=LawU7Tzf68c6HzmFlOWJ88AhbadN3g+9WmRXbaHYi2sNhPcY8Tk74YD/p806BGoVcwTp
 fYAMlq0NLm7oDNT3iQf96C6SqZX8lkd71lYAAonMOvEjocb/Aur3x2bBxazGULS0BxWN6
 42YGQbiMqISocnmYPTmqDnipSykXYox3CxD2H4UiROA0G7pJhgkjdT8XAzUdntRfI4bUy
 qK9g0OGwobFgjJmzEPAT5KzIEHCVPSqchDt4VA0qMdp557jgB7iBFDNBPy3V3YNlAayVk
 1sAJ6+1NI6cQhM8iJYzgQMhHjur68gnZxWIUUe/hbtjeNjr4mw6e1DfJPwJJuWSjzSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792412637;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=xjy8t6IWF1u+qCWGw70BNvFGkRfZQvn/Xqm9CedYuKs=;
 b=eRXmZ+yeWEZyoiOZDRfpTWbjF7PCv7QBmntq3e/gFBS3MieSm01L5SnhzJXf9ozxdCAT
 +9cBIckdwOIJEol7R/3qjjBA0xD7r4I2fbA6Y1cl1qPXVWgRL25U/32FMgLHuNX9YvSHA
 Gl+lttuCrVQXRWUJXoz4+MFRiKOA9uTRa5ctV8w5BXKuLRcgsHCLfHIyQlq/Y0vTFqshP
 SCuibvcMlU6sHwFcMKkqFNmT+qyKo5N0AJjNjq4uD++lD3EN1U4T7gPFHASJnO8ocKdg3
 nzhalsP32gXaVWrP5cESTLRzlSLfP2OSt/XOMqrbrbZex0U1j7Znspo3FelGGVK7STA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bi2DudEM; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEF0E605EB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:23:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 34F111A125E;
 Mon, 19 Oct 2026 12:23:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EDE1060582;
 Mon, 19 Oct 2026 12:23:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 078671032865C; 
 Mon, 19 Oct 2026 14:23:46 +0200 (CEST)
Date: Mon, 19 Oct 2026 14:23:45 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org, 
 Adam Ford <aford173@gmail.com>, Bernd Kuhls <bernd@kuhls.net>, 
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
Message-ID: <atYLM_NKiCwSpJSU@windsurf>
References: <20261018160651.349981-1-j@j-ernberg.se>
 <atUtmzafWnVtVm-t@windsurf> <atWwZGNSjbN0GrwD@landeda>
 <atXItOiRRP2j79zR@windsurf> <atXov2HEcIiVzCAU@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atXov2HEcIiVzCAU@landeda>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC PATCH] package: {libgl, libglvnd,
 mesa3d}: Propagate libglvnd GL provider to libgl dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 19, 2026 at 11:54:07AM +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2026-10-19 09:40 +0200, Thomas Petazzoni spake thusly:
> > On Mon, Oct 19, 2026 at 07:53:40AM +0200, Yann E. MORIN wrote:
> > Yes, because right now we have:
> >         [GL-using package] -> libgl -> libglvnd
> > And separately
> >         mesa3d -> libglvnd
> > which means that [GL-using package] can be built before mesa3d, except
> > that libglvnd doesn't provide *all* what is needed to act as a GL
> > provider, for example it doesn't provide dri.pc.
> [--SNIP--]
> > > I wonder if should further have this:
> > >     [GL-using package] -> libgl     ->     libglvnd
> > >                               \-> mesa3d -/
> > I'm afraid I don't understand your diagrams :-/
> 
> * libgl depends on libglvnd
> * libgl depends on all actual GL providers (like mesa3d)
> * actual GL providers (like mesa3d) depend on libglvnd

But what are you describing here? How it _should_ work, or how it
works _today_?

Because today the part:

* libgl depends on all actual GL providers (like mesa3d)

is not there, and that's precisely the problem.

That being said: it is odd for mesa3d to provide dri.pc. This means
that if you have multiple OpenGL providers... they would all provide
their own dri.pc, overridding each other?

> > > ... even though the libgl -> mesa3d would be here just to ensure build
> > > ordering, and there would be nothing from mesa3d that the [GL-using
> > > package] would use at build time in practice. I think...
> > And that's where you're not correct, and that's the whole point of
> > John's patch in the first place. Check out his commit log for details.
> 
> Sorry, I don't have the thread history here; only digest-subscribed.

Welcome to the world of lore/lei :-)

https://lore.kernel.org/buildroot/20261018160651.349981-1-j@j-ernberg.se/

> IIRC, one of the reason to bump the nvidia-driver back at the time,
> besides the bump itself, was that the newer driver was glvnd-aware.
> But this has stalled.
> 
> Also, eventually, there are tricks to actually have multiple GL
> providers, when one uses br2-external trees, so even if GL providers
> bundled in Buildroot do not play nice with glvnd, it does not mean
> out-of-tree providers can't use it...
> 
> > Essentially, I'm trying to figure out whether we should:
> > (1) Fix this libglvnd issue by adding more complexity
> > or
> > (2) Re-simplify everything by dropping libglvnd entirely
> 
> Well, no longer my call to make anymore. I was just providing a
> recollection of what I remembered from back then.

Indeed, but I wanted to see if there was anything I was missing.

On my side, I believe I would be in favor of (2), i.e dropping
libglvnd.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
