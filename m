Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895F5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 17:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 412E460A42;
	Sat,  4 Dec 2021 17:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzQF2v_HF1DG; Sat,  4 Dec 2021 17:25:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9634F605ED;
	Sat,  4 Dec 2021 17:25:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B06A91BF40B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 17:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC15982998
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 17:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hbHOE2-sy1K for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 17:25:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8948382907
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 17:25:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 816AA5FF6C;
 Sat,  4 Dec 2021 18:25:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638638708;
 bh=0ZTIWgVdG7PwGSBOLHi9McNbl4iqdPC33P66n1yDgF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l/Iy8DHH9L+Gqg7YSoyBRL0/k9MjFf9rAqHC2kncIzuvQgDHtFhIXYZFCA8gTQaB0
 39qyonMtlwslGnNmjGSRjpUC46loovqmgHC6w8BzSRDIGM70A0piJ2k2ENWq3Y8Io5
 KVUPvPyebthvjPnMAWe0v1Ot2J3BX1tG3CtwXma7sE/1F1wXiWjvNVyLtnhSIKfJPo
 kRbOVM28TX4Cl+klJWXvHhwZBRfYEV+OMyTAtCqpM6szu3JpvNAkdqF97I2xZfoLG5
 pYsm5XzKf3AebjbAno71EDMreIGQ7tQvhghIzyRgLixwI86orXDV0vGm+R8MT+rtFv
 Kn8Wi7psQc9Kg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 18:25:02 +0100
Date: Sat, 4 Dec 2021 18:25:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20211204172502.GA472627@scaer>
References: <cover.1638573387.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1638573387.git.yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 0/3] package/mender-grubenv: fix breakage
 after grub2 rework (branch yem/mender-grubenv)
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
Cc: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2021-12-04 00:17 +0100, Yann E. MORIN spake thusly:
> The grub2 rework to support multi platforms in a single build, broke
> mender-grubenv.
> 
> This small series, a joint work kick-started by Adam and slightly
> reworked by me, is a proposal to eventually fix that mess.
> 
> ----------------------------------------------------------------
> Adam Duskett (2):
>       boot/grub2/Config.in: add symbols to represent legacy and EFI boot
>       package/mender-grubenv: fix grub module checks
> 
> Yann E. MORIN (1):
>       package/mender-grubenv: fix modules list help and variable

Series finally Applied to master, thanks,

Regards,
Yann E. MORIN.

>  boot/grub2/Config.in                     | 22 +++++++++---
>  package/mender-grubenv/Config.in         |  7 +++-
>  package/mender-grubenv/mender-grubenv.mk | 57 ++++++++++++++++++++------------
>  3 files changed, 59 insertions(+), 27 deletions(-)
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

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
