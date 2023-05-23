Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54C9C7EE26
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 16:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45C9681E6E;
	Tue, 23 May 2023 16:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45C9681E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bi4nhpYN7jFT; Tue, 23 May 2023 16:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7956C81065;
	Tue, 23 May 2023 16:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7956C81065
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0051BF371
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 16:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21C91417C0
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 16:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21C91417C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPPJZODqv6hh for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 16:27:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE053417EF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE053417EF
 for <buildroot@buildroot.org>; Tue, 23 May 2023 16:27:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c6ab:9448:2172:d8b3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 7D5462005A2;
 Tue, 23 May 2023 18:27:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 May 2023 18:27:49 +0200
Date: Tue, 23 May 2023 18:27:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Pesce Luca <Luca.Pesce@vimar.com>
Message-ID: <20230523162749.GI621937@scaer>
References: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
 <20230521170834.GA621937@scaer>
 <AS8PR08MB68702A3AC3BC40C1DDF695FE81439@AS8PR08MB6870.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8PR08MB68702A3AC3BC40C1DDF695FE81439@AS8PR08MB6870.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684859272;
 bh=apJl4kq1qL+EbYzUnxnNpO0HVJJsbHUJ2xFDj17vlWg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ESXt4WrDE2YEAUxnpmelarlRL1iMaJSqZg/UcEm64RaYSL+vPXwUInoWpdzQd938w
 Hfn3m3GaMTkyatAXUSCE83g3MCPHVE7rlHGBPDaxfypjkOPy0LbjsvIPerYT5wE9I1
 K6jODC2ZFXiFtwPohVMvtRSxe6HKCj4EPBB3ZNWAcRBKUd+EM3g4yLbdu+7hyntCrw
 IxFNoODr/6J8apcEJQmKBavvEdqYeevRHE/2Kk1BZDuQ+7lxwcrVyQCyrRc3CJ16zO
 Z+Wyxo4LB1hnsmsYs0kxEtvtc0p0EM3UkOKbccko/cSHF69dc2T2vH0hvX1CTBddzt
 Pe9Q7r+mwoNeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ESXt4WrD
Subject: Re: [Buildroot] R: [PATCH 1/1] package/libwebsockets: added option
 to (re-)enable external poll loop support
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, All,

On 2023-05-22 06:34 +0000, Pesce Luca via buildroot spake thusly:
> > Da: Yann E. MORIN <yann.morin.1998@free.fr>
> >On 2023-05-19 16:45 +0200, Luca Pesce via buildroot spake thusly:
> >> Since version 3.2.0, libwebsockets does not compile its external loop support
> >> code anymore. That code was put under LWS_WITH_EXTERNAL_POLL compile option,
> >> which defaults to OFF.
> >> Applications relying on that support need to turn that option on, so let's
> >> add it to the package.
> >So, as I understand it, before 3.2.0, this was unconditionally compiled
> >in, right?
> > If so, for backward compatibility, should we default this new option to
> > 'y' ?
> Well, it is not clear to me why in libwebsockets >= 3.2.0 the new option defaults
> to OFF, but it is hinting to something not so broadly used - the comment
> of the commit which introduced that change says something:
> https://github.com/warmcat/libwebsockets/commit/d3021980194991d175388115a65a4265bd155f36
> 
> So, I would say that the default should be n, and then let users enable it only if needed.
> Maybe the help text in the Config.in may remind that this support was unconditionally
> compiled in for version < 3.2.0.

Our policy is not to change the default behaviour if at all possible, so
I think this new symbol should default to 'y' (with a comment that
states "legacy"):

    default y  # legacy, was previously always enabled

> >> For example, when libwebsockets in enabled, mosquitto broker is built with
> >> websocket support, but its code requires LWS_WITH_EXTERNAL_POLL to be on -
> >> otherwise, it gives compile-time warning hinting to unusable websocket support:
> >>Then, should mosquitto also select this new option?
> It could, yes. It is not a compile-time requirement, but rather a run-time one.

Then yes, mosquitto should select it (otherwise there is a performance
regression).

[--SNIP--]
> >> +     help
> >> +       Enable external poll loop support code.
> > I am not sure I understood this "external poll loop support". Does it
> > mean that the loop must be handle by the application itself, rather than
> > bey libwebsocket?
> The library can be run on either its own internal loop (default behaviour) or
> by having its fds incorporated on an external one (so, the application own loop),
> using an application-provided callback. The latter is now under the
> aforementioned cmake option (see the cited commit above).

ACK, thansks for the clarification.

Will you submit an updated patch (default to y, and select from
mosquitto) ?

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
