Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F335C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 16:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 814C6415AA;
	Sat, 30 Jul 2022 16:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 814C6415AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KjAzob9YQRgO; Sat, 30 Jul 2022 16:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CF4941526;
	Sat, 30 Jul 2022 16:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CF4941526
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7745C1BF84C
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F58C83168
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F58C83168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSRZQNZNVzeP for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 16:31:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6101E83134
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6101E83134
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 16:31:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7DFFA60133;
 Sat, 30 Jul 2022 18:31:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 18:31:28 +0200
Date: Sat, 30 Jul 2022 18:31:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220730163128.GY3168@scaer>
References: <20220727104751.2505442-1-thomas.petazzoni@bootlin.com>
 <20220727164057.GG1134587@scaer> <20220727194212.15785a79@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727194212.15785a79@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659198691;
 bh=I19174ksJAb1ZvRuWGZCQ/3gtaZJU2cQq8LEquVSeP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PZZJv2UvBmIZzL43ZA1HbgDss+BQ7cmMRIBt6g7pDijFRTzTz4POU/6S++tzhRwZS
 VzyQmXboI24frXFR6xsEB6caKb3LyxsvxRrxNkny9SijoWo8O8Mg8WJPER7OcWPaIF
 OwfVKe3KkRd1j2mPDeHlGA4Kna49Qe/1ZOyfaX5rCoZ+yztLODKkRTDasvPyj3I9Pw
 AskREdENVCOTq8i+DpIU5W9Bu5dfZT5h2bcit9BbgWP1j3qXfqSEcJHEwQzNmiQwG/
 PMVL82GKZAZNCLdQ2M2JQaISWTz1xZn3fTLdUOApO8mP3Bo0XBKdbaBspNWUIPdp0I
 SCO+y1hWLphYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PZZJv2Uv
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-rpath: send
 readelf error output to oblivion
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-27 19:42 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Wed, 27 Jul 2022 18:40:57 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > Of course, it would be nicer to only filter out those warnings, but
> > > filtering the error output without merging the error output into the
> > > standard output is tricky, so let's keep things simple. If there is
> > > really an error, readelf will abort.
> > Applied to master, thanks.
> Thanks! I must say I was kind of hoping you would come up with a way of
> keeping the errors displayed, while filtering the warnings :-)

That's going to be a little bit convoluted...

> But another issue in this script is that it doesn't have set -o
> pipefail, so if readelf fails, because the output is piped into another
> process, the script will not bork. Perhaps something to fix ;-) (hint hint!)

Using -o pipefail would not help, because the pipe is in a process
substitution:

    some-command < <( readelf blabla |sed foobar )

If we set -o pipefail, then the pipe will indeed fail, but the process
substitution will not fail.

So, meh.

However, check-host-rpath is slow as hell; it would highly benefit from
a makeover.

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
