Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92292C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 20:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F11AC60E1A;
	Tue,  4 Feb 2025 20:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qe_8ZrEr5SLT; Tue,  4 Feb 2025 20:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AC2F60E1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AC2F60E1D;
	Tue,  4 Feb 2025 20:09:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A791D12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 20:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9780C4013B
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 20:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFmtg1k97s8l for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 20:08:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 824E240B20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 824E240B20
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 824E240B20
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 20:08:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D5E405FFB1;
 Tue,  4 Feb 2025 21:08:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Feb 2025 21:08:49 +0100
Date: Tue, 4 Feb 2025 21:08:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <Z6Jz0X-SaDT86tHp@landeda>
References: <cover.1738575233.git.yann.morin.1998@free.fr>
 <fcd979d6868b3f34a4392bad6e7c3bdb100ce83f.1738575233.git.yann.morin.1998@free.fr>
 <8734guou56.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8734guou56.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738699732;
 bh=5kjg93Xi8C7yJAGWnuqD7rsqpoRyVLHJdpZ+xDVR0ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mq12g1fQyIIHxJ1cEeDyYP7hMsFFbshhI/DQfGj6L/JeOsZtqPC1xPTwFqG4fWOMG
 iRdivli8jsj4wAh1PyVlu3AyGg9cAJve6a9Kz+FU6BQU8gCG94A7HsmLAwQQGXUrNa
 gBVAiYG0bbdBC7JRGUFjCIs9abLFO4VCzF2aKrz+CwpPgxEsXo0t95fwTHkOATSBnh
 BFLiTprc4jZcgYQQmvxwmRfTYwM6WqFuMD+P97K6EGFvprGPC+QqCniMeuJYXmquBq
 ZMNxE9V03OMI2byEi0tO1vkBzt8M7Ni10EulDrzPhtWrOCao3SVEhp9W/RJeKGYhrP
 Bf6i5bYrS5IFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mq12g1fQ
Subject: Re: [Buildroot] [PATCH 1/3] Config.in: timeout earlier when
 connecting to download servers
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

Peter, All,

On 2025-02-04 11:56 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Add a relatively small timeout on connect for the few download backends
>  > where we can easily drive that setting:
[--SNIP--]
> It doesn't seem to be strictly needed for curl as it seems to use the
> happy eyeballs algorithm, but OK:

Sure, but the happy eyeballs algorithm does not help when the whole site
is down, where we want to quickly switch over to s.b.o.

Thanks for applying!

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
