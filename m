Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDEFC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 21:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E61240E07;
	Mon, 17 Feb 2025 21:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEBy3ax0rPfo; Mon, 17 Feb 2025 21:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFD0C40E31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFD0C40E31;
	Mon, 17 Feb 2025 21:53:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E2BF72
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 21:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DE2B80DC2
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 21:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLNJHfT-nLZ2 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 21:53:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36BD280D38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36BD280D38
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36BD280D38
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 21:53:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A2E2E19F57B;
 Mon, 17 Feb 2025 22:53:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Feb 2025 22:53:45 +0100
Date: Mon, 17 Feb 2025 22:53:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Z7Ov6egJB6PjUBfD@landeda>
References: <20250216170350.397879-1-yann.morin.1998@free.fr>
 <d0b96b79-52ad-4893-871a-025127a7e96b@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0b96b79-52ad-4893-871a-025127a7e96b@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739829230;
 bh=C1gPm0pOewGoL3t6K1gvf1oJ/9HIltua/YpSCWi9M90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uKWFPanRKTm4Qvw9gvJXHrLLEfeXuz3zMPU+U3H86VlwkguJcGMOV5/ur9REEEAPT
 JhGhfSgQRhWVuB5BKfE3l80dqZ4W1J5VaOTDnpq6GWSAFwIs7+ohKukPkr2iNffXPH
 g2izRveqjM7syeD87S7A7Fa3qmZgmkXjhgenhnNqePA++bnKhyK8BGUoI7dvr+j1Cu
 /LO9TZaRd0i/22/D+hgwnnMlNI83pe9R1ZKMmZptoOuMfo+DqwKmGZaOY8WLpLT+Cb
 eEkwk+gI6wPuj5noSrLzrIU77voPbhkU7MK3+9cA8Ufz62zv4RPpUCQWNJXgCEkl2o
 Oic/xZ6UUd+XQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uKWFPanR
Subject: Re: [Buildroot] [PATCH] utils/docker-run: allow explicitly setting
 of docker/podman/...
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2025-02-17 21:54 +0100, Arnout Vandecappelle spake thusly:
> On 16/02/2025 18:03, Yann E. MORIN wrote:
> > Currently, our docker-run helper will decide on its own whether it
> > should use docker (preferred) or podman (fallback). s introduced in
> > 9a629f5129d6 (utils/docker-run: allow running with Podman). In case
> > both are installed, it is not possible to exercise the podman case.
>  To be honest, if you have both installed, then you probably want to use
> podman because most likely "docker" is just an alias for podman...

That is probably a false assertion you are making above: podman
impersonating docker is an additional package, at least in Fedora.
And indeed, I have both podman and docker installed, and docker is
definitely not podman.

> > Allow the user to force the one to use, by setting the BR2_DOCKER
> > environment variable. If that is set and does not exist, exit with
> > an explicit error message (rather than rely on the failure when
> > eventually exec-ing the specified command).
> 
>  Unfortunately, in commit 8aad67f1575f1d8a9c90ccd70302e9a6823cf794,
> _someone_ already introduced the BR2_DOCKER environment variable in brmake
> to tell it to run 'make' inside the container... Its use is not
> incompatible, but it means that if you set BR2_DOCKER=podman in your
> .profile, brmake will _always_ run in the container...

Meh. Use of unbuffer was one of the stupidest things I did. Indeed, when
using brmake, one is not very concerned about seeing logs as soon as
they are emitted, so one can very well accept that the '>>>' messages
be slightly delayed. After all, they are only bufferred for so much (8K
in glibc, that goes by relatively fast with all the output of a clasical
build...)

I think it would have been much more elegant to actually allow use of
"./utils/docker-run ./utils/brmake", as this is a construct that is
already advertised to run our checks, "docker-run make check-package",
or even just basically "./utils/docker-run make"...

I would wager that "BR2_DOCKER=y ./utils/brmake" is not in wide use.
Would that be acceptable to revert 8aad67f1575f1 and drop use of
unbuffer? I've just checked, and that works (but of course, any
still-bufferred output could get lost on Ctrl-C, but that's probably
a non-issue while using brmake...)

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
