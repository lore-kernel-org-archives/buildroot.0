Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D905CA0EE8
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 07:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D913440AEB;
	Fri, 30 Aug 2024 07:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6ob-6B8fzpC; Fri, 30 Aug 2024 07:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2F0140446
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2F0140446;
	Fri, 30 Aug 2024 07:33:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E42F1BF846
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 07:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AA80406FE
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 07:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seDMbD7qHUQc for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 07:33:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84B0C40626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B0C40626
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84B0C40626
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 07:33:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B9FC913F86A;
 Fri, 30 Aug 2024 09:32:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 30 Aug 2024 09:32:52 +0200
Date: Fri, 30 Aug 2024 09:32:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZtF1pHPZqUkUit8N@landeda>
References: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
 <20240822183742.3550055-2-dario.binacchi@amarulasolutions.com>
 <20240823181741.499173f2@windsurf> <Zs4x6LWMJfdWqApz@landeda>
 <20240829234737.38039ef5@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829234737.38039ef5@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725003178;
 bh=aRn/rMDNf3AdoFJIXpW2tZB9pzADOg4yhnWRqNQ24a4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pteFCfBFeEBszH44PE0pGeGjmRRm2w3E0xNHztP6iNahuxVjC1v1uidTjVlu9TP5d
 EyyzAfW2W8XrpQB4vdQ8qtR6yEuacigoM7MBL7MpylxNUgOOOfqGJNCNF8isCeBVA8
 82L74oLs8dBy+1UBySGgAQpYWlpHty4pqjkNQDVaOdeNSusySjnOitwhpZK+y6zSOQ
 Kk98ngIqW8L+nEq5LqIys0FQL6JWMj/nmywPAK8e7jrIneyQao707XVBR5yZtZGJkR
 L/nhE/IuUMrKJWwwBpGO+dCGaFB4pr4VS7udhj9XrPv5IHAQRNT4W64vfFFyXLlKF5
 +B1edHGYnMJgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pteFCfBF
Subject: Re: [Buildroot] [PATCH v3 1/3] package/tinyinit: new package
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-29 23:47 +0200, Thomas Petazzoni spake thusly:
> On Tue, 27 Aug 2024 22:07:04 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > As Dario already pointed out, that was my suggestion to drop it from the
> > init selection.
[--SNIP--]
> I understand your point, but:
> 
> (1) It is really unclear for the user that they have to chose "None" as
>     init to be able to use tinyinit (tinyinit is proposed with depends
>     on BR2_INIT_NONE)
> (2) Due to (1), Dario has added a "tinyinit needs BR2_INIT_NONE, i. e.
>     no init system installed" Config.in comment, which I also find odd

To me, it really all looked very obvious, exactly thanks to the comment.

tiniy-init is also not a reaper, which dos not really make it an init
either...

Note that tini does not install itself as /init or /sbin/init, but just
as /usr/bin/tini (and a symlink in /usr/libexec/docker/docker-init);
tini is also a reaper.

> So while I understand your point that tinyinit or tini don't need as
> much infrastructure/logic as busybox init/sysvinit/systemd/openrc, I
> find the current way they are presented to be very weird (but I can
> live with it).

Then I think we should also organise the selection list, like:

    Init system
        *** General purpose ***
        ( ) BusyBox
        ( ) systemV
        ( ) OpenRC
        ( ) systemd
        *** Special purpose, read help ***
        ( ) tini
        ( ) tinyinit
        ( ) Custom (aka none)
        *** My br2-ext (in /path/to/my-br2-ext) ***
        ( ) my-init

(br2-external entries are added by support/scripts/br2-external).

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
