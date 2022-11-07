Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5034FC433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 17:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDED440761;
	Mon,  7 Nov 2022 17:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDED440761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBWHld4dbNFr; Mon,  7 Nov 2022 17:33:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF5A74031E;
	Mon,  7 Nov 2022 17:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF5A74031E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9D951BF2EF
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5086817C3
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5086817C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdQwHUcAAsbA for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 17:33:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49AB5817C0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49AB5817C0
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 17:33:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1dd2:f7fa:6fba:b565])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5A6DF19F5C7;
 Mon,  7 Nov 2022 18:33:47 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 18:33:47 +0100
Date: Mon, 7 Nov 2022 18:33:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221107173347.GF3918838@scaer>
References: <20221103224539.692322-1-thomas.petazzoni@bootlin.com>
 <20221103224539.692322-2-thomas.petazzoni@bootlin.com>
 <20221106150330.GY3918838@scaer> <20221107085200.4b2eb2ed@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221107085200.4b2eb2ed@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667842431;
 bh=x48gl7JwA3TJG38JCFaDwLlp82ScOOiQDwYZz0rqbZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jkhIrJya+1kYmswTlYyNfN9hy9DVacKf9qCSmyj1pwgfw+JLN7E8H7kC0heXKrmXb
 UUqzB4w5dtaYIridDAdVAgCxVvRd/m71OLpSrFH9DpG3HExoYrSLzduOAPeZYRcm1j
 b9QhmBcX9xTKO5y0z0b/JiIdooKtbVHogStpFzGjLprw/AOSKriCO43Uhv/1KrwYF+
 y6TyAE9UuGAAauANrL+Yp+XFeIZitGu8Y9OopiJnMJWJFk200aEj2xgiCYxt2iG+RY
 fxh7mOtCQ3BhZee4qjNq/YQi9BRFrTYWVPAv8UhpumpqDsRfjZbsOS8GDKTz/7Zmtr
 y64Pk7ZeFsbrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jkhIrJya
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

On 2022-11-07 08:52 +0100, Thomas Petazzoni spake thusly:
> On Sun, 6 Nov 2022 16:03:30 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > I am not a fan of dot-directories, because they get hidden, especially
> > since BR2_DL_DIR can be set in the environment and point to a long-lived
> > directory.
> > 
> > Instead, I would just call it 'cargo-home'. If that's OK, we can change
> > when applying...
> 
> I don't feel strongly about it. I used .cargo because that's how the
> default CARGO_HOME folder is named in one's $HOME directory. Also, it
> makes sure there is no potential conflict with an hypothetical
> cargo-home package. But overall, I agree that I also don't like it
> being hidden. We could also name it br-cargo-home, so that it doesn't
> really look like a package download directory.
> 
> But really, I don't feel strongly about it and $(DL_DIR)/cargo-home
> works fine for me.

I liked the br-cargo-home, so that's what I renamed it to.

Applied to next, thanks.

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
