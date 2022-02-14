Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A96FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE0EC60B8D;
	Mon, 14 Feb 2022 20:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rzx7xFV7bb2e; Mon, 14 Feb 2022 20:36:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20BE8607E3;
	Mon, 14 Feb 2022 20:36:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4665E1BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 343C141484
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXWzo8DiXRAH for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:36:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02E754136C
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:36:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:892f:28b2:cec5:360f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0FF6320036C;
 Mon, 14 Feb 2022 21:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644870992;
 bh=UuAX5iWQ5YQHQAkWLwb/NrXo8PYFX48YMNdDyJwTXTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NI2iqrDNTY+HcHaEaEtcfC45tskTbEiQR2irZIk/CJY10X8aZ5ZMO5NAY07yumm3R
 jJdnhM+KRb2fLF/KwYPdHaR5c51dEUQBnPLt8Ar3+p/PC20GcbBwbgkVMkTH8chaqv
 nwtI5iFdLrxWTYTda+tYbF2zi89KA1NOXWsJEDF8CyKEJfiYKf00zov4PR+8+jsBRR
 xvhh35qVe2ff3j0/eGrF2aSnC7tv7BLDv/s/10d6PKSmqjOPD+lfEJ2IgRUXIUS4Ru
 tpcdz51j1tr+DWfVB//msTqIZ/GNlnIZAWL19wPIgDd00ebYoqAgMSjA6PLP2CkyTl
 iAGTvqIgy2jAw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 14 Feb 2022 21:36:24 +0100
Date: Mon, 14 Feb 2022 21:36:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220214203624.GA248243@scaer>
References: <20220202171035.1740791-1-giulio.benetti@benettiengineering.com>
 <20220202171035.1740791-2-giulio.benetti@benettiengineering.com>
 <c3a9cf08-fb79-580d-f1e6-79ef28b46263@mind.be>
 <cb93cb6a-c8ae-0975-6ae0-14ad369de9e2@benettiengineering.com>
 <6edcbc6d-c9bb-e802-48f1-d4866a698aa9@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6edcbc6d-c9bb-e802-48f1-d4866a698aa9@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs/roc_pc_rk3399_defconfig: expand
 rootfs size to 120M
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
Cc: Danilo Bargen <mail@dbrgn.ch>, buildroot@buildroot.org,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-02-14 21:13 +0100, Arnout Vandecappelle spake thusly:
> On 14/02/2022 01:03, Giulio Benetti wrote:
[--SNIP--]
> >It is because of modules(30M) and linux "Image", it's not compressed, so
> >it's 25M. So only for Linux+modules => 55M, plus the few other
> >stuff(Busybox+libc etc.)1M
>  Yeah those giant aarch64 default configs are mightily annoying...
>  I'm thinking, perhaps we should just bite the bullet and move the default
> ext2 size to 120M...
>  Peter, Yann, what do you think?

ACK.

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
