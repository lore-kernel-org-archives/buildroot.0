Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C051C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 14:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D83E417AC;
	Sun, 17 Jul 2022 14:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D83E417AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uj-W_eOlYEtP; Sun, 17 Jul 2022 14:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F9134172F;
	Sun, 17 Jul 2022 14:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F9134172F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE9FE1BF281
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 14:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6BE240136
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 14:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6BE240136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iql8T9srL-PG for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 14:42:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BC9D40002
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BC9D40002
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 14:42:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4AE04780503;
 Sun, 17 Jul 2022 16:42:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 16:42:26 +0200
Date: Sun, 17 Jul 2022 16:42:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marian Ulbricht <ulbricht@innoroute.de>
Message-ID: <20220717144226.GT2249625@scaer>
References: <20220709164851.41050-1-ulbricht@innoroute.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220709164851.41050-1-ulbricht@innoroute.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658068949;
 bh=iaCZsroEHfRwSPUysowsrWwYGJgUikyTsRAJYyWrHao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rhVmgJDVYXrQGKsrQ40wnJsijxLxaVkmH5raErjr1CQ+fTlmuV0RkpSSsB4PINxrq
 Dy07+ZuQhYLypciBpfi3rCFmbdoKT6QnxfTU58fXdNksOih+7gtwMSAWXCtdYaq0R3
 bzgFzIgiRE7ksZhJlgrci0d2XwzNY4+I5dyRJtR7ezBztZIk7Q+ZVJGGJDvI+1Su91
 hVccUoGQsvINhXugNA87E7bI8qRNWH/ZYuZoEc1otqAL4JIFDRfJFCSU35LcVYKwv0
 Ofo/uNFnKIkcAn+5+Q8Cs0WMHDDVUpER6ejnxMquwY6RfU73S6yDqKgno2F3eiTR3t
 GTK1sNcWbmPAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rhVmgJDV
Subject: Re: [Buildroot] [PATCH] add support for mws4 board
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marian, All,

On 2022-07-09 18:48 +0200, Marian Ulbricht spake thusly:
> mws4 is an arm based nuclear probe hardware used from
> German government to monitor nuclear activity.

This is very interesting! :-)

It would be nice to have a defconfig for it.

> This patch adds all necessary files to build an image for this board.
> ---
>  board/ultratronik/omap3_mws4/mlo              | Bin 0 -> 54340 bytes
>  board/ultratronik/omap3_mws4/u-boot-old.bin   | Bin 0 -> 412600 bytes
>  board/ultratronik/omap3_mws4/uboot.env        | Bin 0 -> 131072 bytes

Unfortunately, we can't cary such binary blobs.

Indeed, I woiuld guess that mlo and u-boot-old.bin come from u-boot,
and so they are covered by the GPLv2-or-later, so we can't have a
binary-only distribution for those files.

Please also provide a way to build them from source.

If that is not possible, then do not ship them, and adjust the
documentation to instriuct the user that they need a board with those
already installed.

Which brings us to the next point: the board directory should contain a
readme.txt that describes hos to build for the board, and how to install
the generated image files omn the board. See existing boards for some
examples, like board/zynq/readme.txt or board/pc/readme.txt.

That readme.txt would also be the place to list pointers to reference
manuals or documentation.

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
