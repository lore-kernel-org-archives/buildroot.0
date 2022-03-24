Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B09AC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 10:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB9F340309;
	Thu, 24 Mar 2022 10:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUuaKWyx0Uwc; Thu, 24 Mar 2022 10:39:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B48C3401F5;
	Thu, 24 Mar 2022 10:39:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A83781BF2C7
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 10:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97BFB401F5
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 10:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGDmj4uVTw90 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 10:39:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B828F4015C
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 10:39:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9911:ddfc:be7c:3131])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9EE0F19F5A8;
 Thu, 24 Mar 2022 11:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648118383;
 bh=2AqRHBCBn1V+SpxznTXsq2NE0Kyv75fvFYVeFeKd6dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mFvXshn4d1TTcZF2c6uXadzEhY/I5TzSKghkC+YmjCSXr7MK4YTpT7UrG71Dt0xYP
 TQJsYG68sKUH9zj2IAaSnqdheexvwZPVrTDqRZ/Y9gKsy5sjL0ct2t+HydtyV4JaA2
 Me6vQwjjcs5Fn6Gete8CJ/DUjnb4nIXWE6iqM98xeNvttBsanJL8MdsjTs+iEVbSyu
 gnT8RPSodyZnncxyzgsnH9mpFaS8NxOQyuOk/N9nmM5kXGbhsGnSA4unswUbuk7fXR
 AQUi+S1gHO18B+V2GeYY6qpAOPJYIpntP6u9Ct2UTh46sEzVleIZF1w7d7vnaM9Lut
 A0WVuO+8tM7Hw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 24 Mar 2022 11:39:39 +0100
Date: Thu, 24 Mar 2022 11:39:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20220324103939.GD3649946@scaer>
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com>
 <20220324082433.GA3649946@scaer>
 <be8ccaa597e343698f32663cfb937c2a@AcuMS.aculab.com>
 <20220324100906.GC3649946@scaer>
 <b36b2f5bd49645729508e9980a6ed488@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b36b2f5bd49645729508e9980a6ed488@AcuMS.aculab.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed
 with new seed when saving
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

David, All,

On 2022-03-24 10:25 +0000, David Laight spake thusly:
> From: Yann E. MORIN
> > On 2022-03-24 09:15 +0000, David Laight spake thusly:
> > > From: Yann E. MORIN
> > > > +Peter: candidate for backporting as a security fix
> > > Probably not - the security fix is the code that actually
> > > initialises the RNG.
> > Not sure I understood... As Jason explained, we have so far been saving
> > a seed from an RNG that is probably partially deterministic; that is the
> > security issue.
> I'm pretty sure the seed is also saved during shutdown.
> So a normal startup doesn't rely on the seed saved by the startup script.
> (Although is would be better to use a background script
> to save after (say) 30 minutes of operation.)

The problem is that a lot, if not most, embedded devices are never
properly shut-down; instead, they are, intentionally or not, brutally
electrically powered off.

In that case, the seed that is saved at boot is what is going to be
reused on the next boot. And currently, that seed is weak, because the
output of the RNG at  boot is mostly predicatble.

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
