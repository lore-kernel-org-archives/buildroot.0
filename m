Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67682C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 20:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 064D68349A;
	Sun, 23 Jan 2022 20:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IMTi0xVHi53u; Sun, 23 Jan 2022 20:51:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45C5183EA3;
	Sun, 23 Jan 2022 20:51:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9029F1BF285
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 20:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A76040147
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 20:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57LVAJAvJ2-y for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 20:51:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 304E540105
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 20:51:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a491:f028:92d2:337e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2EA255FF88;
 Sun, 23 Jan 2022 21:51:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642971112;
 bh=z65L3efK6Wp3WtUrEu+iWQcGcjhhxQ3oATDXEagGWPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H5hOkkHXOYA+HEPHjZ9Iz+M0AG1Mte9BhTwohOLWgkWANIY6YnGEr5cr0ZVd0omqL
 5pFpB/PsjxzoMoMnzJvXenZj36PTgDs6XIJEINiJBB8bTJtQKVUuWWceZH8nRH7++r
 ARmIiM8Cz6YEYJI8jwn0JJ/eaq2Y3x7yAaLApy5w2WJobYIWLi8MyjboIq2D8Qz5hg
 v/zoDwxIPKC9kRJbmFoxLmwrvjzDu36cJ7Q40ccEwYLTUCKJ67XIL9QLWnDi5JI1EF
 x+qOL0uLfx/PHGpSPUmgk+HkhyI1zmXJXpxMtXgItaEm3RporlzZuWcyE22Rp3C5IV
 5HSL0nD82W+Fw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jan 2022 21:51:48 +0100
Date: Sun, 23 Jan 2022 21:51:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220123205148.GH2502@scaer>
References: <20220115160449.2292472-1-fontaine.fabrice@gmail.com>
 <20220119202351.GA3095239@scaer>
 <c4c033a6c8012a54043d4f1e28678834@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4c033a6c8012a54043d4f1e28678834@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: set --with-boost
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2022-01-23 21:03 +0100, Julien Olivain spake thusly:
> On 19/01/2022 21:23, Yann E. MORIN wrote:
[--SNIP--]
> >To be noted: riscv-isa-sim could also be configured with --without-boost
> >and the build succeeds.
> >Julien, do you know what ill-effect building without Boost would have?
> 
> The absence of Boost is removing the "Command I/O via socket" feature of
> riscv-isa-sim (-s command line option).  See:
> https://github.com/riscv-software-src/riscv-isa-sim/blob/v1.1.0/spike_main/spike.cc#L30
> It's generally not needed in simple use-cases.

Thanks for the feedback. :-)

Indeed, if Boost is not a strict requirement, it would be nice to be
able to build without it...

> My initial intent was to have host-riscv-isa-sim compiled without this Boost
> support.
> 
> The upstream riscv-isa-sim detection of boost seems a bit peculiar and does
> not
> really honor --without-boost/--without-boost-regex/--without-boost-asio.
> 
> Setting --without-boost alone on a system with boost will make the
> ./configure
> fail with:
> 
>     checking whether the Boost::ASIO library is available... yes
>     configure: error: Could not find a version of the Boost::Asio library!
> 
> Setting --without-boost --without-boost-regex --without-boost-asio will end
> up
> with a successful configuration/compilation, but with a binary linked with
> libboost_regex.so and libboost_system.so...
> 
> I believe this part could be slightly improved before setting
> --without-boost
> in the BR recipe.  I'll have a look into that.

The problem, as you said, is that if Boost is available (either already
isntalled on the build machine, or host-boost is puleld in by another
package), configuring riscv-isa-sim with --without-boost still breaks
with the message you pasted above.

But we can't guarantee that Boost (system or host-boost) is not present.

So, either we have a patch that fixes the Boost detection (and we push
that patch upstream), or we can only depend on host-boost and keep the
current status.

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
