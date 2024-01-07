Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AA4C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 21:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECEB580FAD;
	Sun,  7 Jan 2024 21:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECEB580FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvLEoiQFdKGF; Sun,  7 Jan 2024 21:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F9CE81004;
	Sun,  7 Jan 2024 21:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F9CE81004
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A0731BF381
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 21:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CA7780FAD
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 21:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CA7780FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_NINkNOtdWp for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 21:13:42 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E483980F5C
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 21:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E483980F5C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B7465B0055A;
 Sun,  7 Jan 2024 22:13:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Jan 2024 22:13:33 +0100
Date: Sun, 7 Jan 2024 22:13:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZZsT_YP2YxbjzJiN@landeda>
References: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
 <20231205235919.510051-4-adam.duskett@amarulasolutions.com>
 <87msth1ofj.fsf@48ers.dk> <ZZqUtsil3DTT20FN@landeda>
 <20240107210325.2712e100@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240107210325.2712e100@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704662019;
 bh=1TvSfBWZ9rzaDFBAYs7Wyqh/xXzdQ4MtygKcOtx74b8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f+b0FjDPJ+BtPU8RXw2/8o55gEMR4UADiFoqxrbO9YemLZkdfgD+h6Q9+2963z212
 aax6NlZrhKbIwrk1nHzXW9R5tXGpura3kzabDu67va5JCNUV8bnrw3HVk84ZUHPu8D
 44VgMViiQpI6Xk9R/RZY96TroqggM0f57OCxb1rhpLK2bywXFrUQU2Xlrs2rR9ZEUj
 z6psdQnlU9AJRzi1bJMFKzadkZhhVDYoj0Go0kyoIKndDysWnITjzkqKMghxnI9Ff/
 P1F42cUVw50zo63KLkiE7NGxNiJtQ9ppz3upQCxCnuHP+kOJ87veY3laEQcqAuaLLC
 5qhIt4D5jeO1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f+b0FjDP
Subject: Re: [Buildroot] [PATCH 3/3]
 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch: New
 security patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-01-07 21:03 +0100, Peter Seiderer spake thusly:
> On Sun, 7 Jan 2024 13:10:30 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > Looking at the code, I doubt it is a security issue, in fact. It's
> > probably just a memory leak, as the free() is replaced by this function:
[--SNIP--]
> > So, Object->Colors leaked, but I don't think it was a "security" issue.
> Matter of judgment if a (very theoretically) denial-of-service/out-of-memory is counted
> as 'security' issue ;-)

Sure, but the affected code is in the gif2rgb program, not in the
library, so the effects of the memory leak are limited to the time the
program runs. gif2rgb only handles a single intput file, so it is
short-lived, and the leaked memory is reclaimed once the program is
reaped.

Also note that the program does an exit() right after freeing that
memory; it does not ensure that any other allocated memory is freed
before exiting, so there might anyway be more memory that leaks.

So yes, it's better do free memory with the semantically corresponding
funtion (GifMapObject() -> GifFreeMapObject()), but it would have real
difficulties getting classified as a security issue *in this specific
case*.

The only way this leaked memory could cause an issue, is if the program
is not reaped. But then, if someone is able to attack the system by
leaving zombies around, whether those zombies leaked memory or not is of
no concern. So I think, but of course, security is so difficult that I
may easily be wrong.

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
