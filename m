Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217F0C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B353660BCC;
	Mon,  3 Jul 2023 19:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B353660BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6gehgKVOJ-C; Mon,  3 Jul 2023 19:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF4B860AAD;
	Mon,  3 Jul 2023 19:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4B860AAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3541BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71B4E606A0
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71B4E606A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDHAwlVye1Oq for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:01:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4673B60AAD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4673B60AAD
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:01:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d686:7886:a85d:fb8a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 37E672003C1;
 Mon,  3 Jul 2023 21:01:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jul 2023 21:01:13 +0200
Date: Mon, 3 Jul 2023 21:01:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Message-ID: <20230703190112.GD2510@scaer>
References: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688410879;
 bh=1AVxotpTIejG2HXzJpK8lTVfjtbxDoK+urZMf523M4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RVtUBlq51XMG8uuIrEvF9TTHGY/2Y7x7LK8XC31aKTdSECu+udQ4YLyxmMSmivDZn
 4OW16bkifargeWe2wck2fLMVbCFk6nOoBsJ3WnqS7rd0FmqDMfezumvDzwd8iVrK8p
 HNphXNRi/E9FOtRWTNJu6N8s9VltcVcNYq8Pka2kO3ZxKE2KFdlJXK4UxrpK16485T
 b3AsAwlKMeGFUP0nJYrdsvr0Ffpmz3DLAvSgD3aS5N5cKnGKMISm3awZl/pnkotAHf
 ePSqM0XT8+42Z1mkmaTLLFMTnv+wzEfc+FZqp6MzVqRMEUnMLcZ7ZI+UmzmB5PGdWK
 NqzVBs199dj3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RVtUBlq5
Subject: Re: [Buildroot] [PATCH 0/3] Add support for the MCF54418 Coldfire
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jean-Michel, All,

On 2023-06-29 07:31 +0200, Jean-Michel Hautbois spake thusly:
> I have a custom board which uses a MCF54418 and I want it to use an
> upstream buildroot (for all the good reasons ;-)).
> From what I can tell the only Coldfire processor currently supported is
> the MCF5208 which does not have a MMU.
> 
> While trying to add the processor support, I faced an issue during the
> host-gcc build when the MMU configuration is selected, because it makes
> it compile the multilib part.
> 
> Sadly, a commit [1] removed the GCC ARCH configuration which was used to
> determine if the architecture is "m68k" or "cf". I have re-introduced
> this configuration here, only for the MCF54418 case for now as I am not
> sure if it is my real issue or not. What I can tell is that when I have
> the BR2_USE_MMU selected, the host-gcc fails and it passes when I add
> the proper architecture.
> 
> [1]: eda11417be m68k: remove BR2_GCC_TARGET_ARCH

Since commit 1/3 will need a more detailed commit log, I've marked the
series as changes-requested on Patchwork. Which means that my comment
on patch 2/3 is mott: you have to squash commits 2 and three together
when you respin.

Regards,
Yann E. MORIN.

> Jean-Michel Hautbois (3):
>   arch: add support for mcf54418 Colfdire
>   board: add the qemu board support for mcf54418
>   configs: add support for the 54418 qemu defconfig
> 
>  arch/Config.in.m68k                   |  9 +++++++++
>  board/qemu/m68k-mcf54418/linux.config | 23 +++++++++++++++++++++++
>  configs/qemu_m68k_mcf54418_defconfig  | 19 +++++++++++++++++++
>  toolchain/Config.in                   |  1 +
>  4 files changed, 52 insertions(+)
>  create mode 100644 board/qemu/m68k-mcf54418/linux.config
>  create mode 100644 configs/qemu_m68k_mcf54418_defconfig
> 
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
