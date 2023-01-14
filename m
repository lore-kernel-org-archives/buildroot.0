Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DF4C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 14:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A13819F6;
	Sat, 14 Jan 2023 14:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A13819F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxts-I5XNuDS; Sat, 14 Jan 2023 14:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A4468198D;
	Sat, 14 Jan 2023 14:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A4468198D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 559AE1BF316
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 14:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30DDC8198D
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 14:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30DDC8198D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLbEfiihmckQ for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 14:19:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F8D68195C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F8D68195C
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 14:19:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 640355FF33;
 Sat, 14 Jan 2023 15:19:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Jan 2023 15:19:12 +0100
Date: Sat, 14 Jan 2023 15:19:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230114141912.GB2692@scaer>
References: <20221103224539.692322-1-thomas.petazzoni@bootlin.com>
 <20221103224539.692322-2-thomas.petazzoni@bootlin.com>
 <20230114135817.GA2692@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230114135817.GA2692@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673705956;
 bh=pvZY11W2mrXbx08KObBvPFicHDIXkQZjtWvNdpA9JlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TOXw8fDpvMa1p2YJ5ZbmmDtdAY10PEswOyBwWLPahYVJ/Hgt4QcN99vHnqvX04uiF
 iQL2cQ3nHaXRdwvkhqhdFRkED3dc3Bpho0dP6RNuFahh7r1BcheyF3jhN+/1Qm+jNC
 giDUQWWElIh01zDOFer/6xV2cW4bEbmBZl8AiqJqpBgVQHV9tZpEXNuKP6PLZVtmhy
 HhJ9eD1YB/ixJtlnN44bmSLK7RP96f3KTwJptVmvOCzYO2k8sHxsT94P26e5wDohay
 VcstoE4nYTjJ0rCE6xzcKJCn03U21jIGjVfANzxmc6c9ny/FEqAafjUly2duC7+tiB
 ctTRsH8rBpZNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TOXw8fDp
Subject: Re: [Buildroot] [PATCH next 2/2] package/pkg-cargo: move CARGO_HOME
 into DL_DIR
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
Cc: Moritz Bitsch <moritz@h6t.eu>, James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-01-14 14:58 +0100, Yann E. MORIN spake thusly:
> On 2022-11-03 23:45 +0100, Thomas Petazzoni via buildroot spake thusly:
> > CARGO_HOME is where Cargo stores its downloaded artefacts. See
> > https://doc.rust-lang.org/cargo/reference/environment-variables.html:
[--SNIP--]
> > To solve this, this commit moves CARGO_HOME into $(DL_DIR), so that it
> > is shared between builds and packages.
> Unfortunately, this causes breakage when there are parallel downloads
> (see below for except; full log as attachment).
> So, there are two solutions:
>  1. revert to a per-package cargo home, losing the benefit of a shared
>     cache, but trivial to implement
>  2. add locking ourselves in the post-process scripts, so that there are
>     never two "cargo vendor" running in parallel, which is slightly more
>     involved.

In fact, it turns out that doing the lock ourselves is relatively
trivial, so I'll do a few more tests and send a patch...

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
