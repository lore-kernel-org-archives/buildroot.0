Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2689C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 10:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 818FE84266;
	Thu, 24 Mar 2022 10:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3ChA98P7hJo; Thu, 24 Mar 2022 10:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F4A484263;
	Thu, 24 Mar 2022 10:09:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32B521BF2C7
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 10:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 220AD84262
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 10:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bbCJkiQUpQ8s for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 10:09:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1142B84251
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 10:09:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9911:ddfc:be7c:3131])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 56C8419F5B2;
 Thu, 24 Mar 2022 11:09:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648116552;
 bh=1Qw33pZKi5IYtQ1vuSa6AdWo2/KbqKnYiClwBEr/54U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lFBwRPVRusMUgtlUWuMvBsIxLs6bH6WA0v3UAuSzZrlgt15S2Co0NOfyyHvdu2CyN
 fAmzqxLetcsB8J4rofCQ18Uirm0DNCgzturylEAPTYNNddjt34yMdOzxB5bWWRJAqO
 hwBYCIpWgx4MYQNmnp/jMAd9UkQIq8WPHjPrIvoBTujfvHHrdshL4HEhHqnnyudid2
 SKWgcwGCHwzVEwrVqs21m9EcrM5pc/Rz33KizZlMpQePoOf+6lZQk3mEzjXtu4QQYX
 nap6uw/uMCvhh7dwY6BD8quFQcjC68cWhPkZ22J8TCCAH+R+JVAwnMLhxCWidryVLI
 zAqwASVrZuadA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 24 Mar 2022 11:09:06 +0100
Date: Thu, 24 Mar 2022 11:09:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20220324100906.GC3649946@scaer>
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com>
 <20220324082433.GA3649946@scaer>
 <be8ccaa597e343698f32663cfb937c2a@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be8ccaa597e343698f32663cfb937c2a@AcuMS.aculab.com>
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

On 2022-03-24 09:15 +0000, David Laight spake thusly:
> From: Yann E. MORIN
> > Sent: 24 March 2022 08:25
> > 
> > +Peter: candidate for backporting as a security fix
> Probably not - the security fix is the code that actually
> initialises the RNG.

Not sure I understood... As Jason explained, we have so far been saving
a seed from an RNG that is probably partially deterministic; that is the
security issue.

The way we are seeding the RNG fundamentally does not change, because
we are not crediting any entropy with whatever we put in there. So,
whether we write something, anything, or nothing at all, has no impact
on the strength of the RNG.

As far as I understood it, at least.

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
