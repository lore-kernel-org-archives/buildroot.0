Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE781C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 13:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A854A84AE9;
	Wed,  1 Nov 2023 13:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A854A84AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXskaGMKmD52; Wed,  1 Nov 2023 13:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E32368489B;
	Wed,  1 Nov 2023 13:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E32368489B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A01D81BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 13:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8734F7039B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 13:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8734F7039B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZiJqn15NBey8 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 13:43:16 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A64A70399
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 13:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A64A70399
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:67d2:c63c:7c2a:c31])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 960E519F57B;
 Wed,  1 Nov 2023 14:43:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 Nov 2023 14:43:10 +0100
Date: Wed, 1 Nov 2023 14:43:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: * Neustradamus * <neustradamus@hotmail.com>
Message-ID: <20231101134310.GD114892@scaer>
References: <20231015123504.189034-1-fontaine.fabrice@gmail.com>
 <87r0lhocxl.fsf@48ers.dk>
 <AS8PR10MB7427D308C41CF4B40A594100CBA7A@AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8PR10MB7427D308C41CF4B40A594100CBA7A@AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698846194;
 bh=JKRjAp/GJi+Sh7D+yecWZofEYgU/Vgn7tKPnbDq3u8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ce5EEgWixsTseMRC0TBDgdLFTztzsQPBdBoU0qVD3kXqVysCYWSXVwqPoU+TWeFed
 0CHK5OMGq2KkWztfqhfO3DlgIFdhje2dsqQ2pONpv+HptQmCWrfz9Rwb78RBo66ayZ
 Qj2//vjmd14GB65xpG9tcRrMjFZ29n0IGUfeAxmRKqxhoCcfJsZvjTePEqNNw14ELE
 NbRPHkwpR1NximneE0hh820xOI/6g/gCWTGDsl9Lg4OqH4mtuI+Lpw7CuTZIFbx2nZ
 xY9OWSJfoBubRKd0dfsgOTcdroJUCes0yl0LHbjzZFl3m0np5kHbw/Kkodwo93Ohzt
 JuuUgOT+cwmYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ce5EEgWi
Subject: Re: [Buildroot] [PATCH 1/1] package/ksmbd-tools: security bump to
 version 3.4.9
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neustradamus, All,

On 2023-11-01 13:23 +0000, * Neustradamus * spake thusly:
> There is now a 3.5.0: https://github.com/cifsd-team/ksmbd-tools/releases

Thanks for the report. Will you send a patch that does the bump?

Regards,
Yann E. MORIN.

> Regards.
> 
> Neustradamus
> 
> ________________________________________
> From: buildroot <buildroot-bounces@buildroot.org> on behalf of Peter Korsgaard <peter@korsgaard.com>
> Sent: Thursday, October 26, 2023 13:12
> To: Fabrice Fontaine
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1] package/ksmbd-tools: security bump to version 3.4.9
> 
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
> 
>  > Fix two security issues that reported by ZDI.
>  > https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.7
>  > https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.8
>  > https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.9
> 
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Committed to 2023.02.x and 2023.08.x, thanks.
> 
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
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
