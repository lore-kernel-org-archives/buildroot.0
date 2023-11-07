Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A22C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 20:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18B0040953;
	Tue,  7 Nov 2023 20:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18B0040953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqpf4m-81ujw; Tue,  7 Nov 2023 20:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 532DA4157D;
	Tue,  7 Nov 2023 20:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 532DA4157D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D38441BF291
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 20:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC01960B21
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 20:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC01960B21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9C-UptJVk_G for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 20:40:33 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ED9560B20
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 20:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ED9560B20
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 37DF713F86E;
 Tue,  7 Nov 2023 21:40:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 21:40:23 +0100
Date: Tue, 7 Nov 2023 21:40:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231107204023.GG229059@scaer>
References: <20231031120713.678783-1-giulio.benetti@benettiengineering.com>
 <20231101152114.GE114892@scaer>
 <26fabf07-fc17-421b-9cbb-fb721bf63374@benettiengineering.com>
 <20231103212151.GA2875@scaer>
 <579363d0-a242-444a-aecf-83f21b4e629b@benettiengineering.com>
 <20231107161539.GD229059@scaer>
 <829232c3-9456-4bf8-91dd-506cb7554649@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <829232c3-9456-4bf8-91dd-506cb7554649@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699389630;
 bh=0gDYrIyoCDgMa0dBkVixFAr7lSFuf508soOxHs0Hc5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h5htKmepDlvr0HOnG5rnUzxUWqS9+j4DoEmG7hT5gMTpISruIazyaI5ETRGbzJSMI
 UdnPSE96VHwpAqCzdCcGdrFArTiBToz5nhTRCmXlXEfPwjQcJ8h6c1qHf9OOf95SLO
 SnQk7Ze7zFCn+1S4Sr3RjXj/EP/XV1fOud51oCdOYSsK6FVFonb+bLVmKx+3S18PbC
 ddE6V8hUYXBhNF2FYOI+lENDu+NhieBIrU4O9EzQ7zKc9ga4r18CeDKAns6LJMZ5yc
 GslHsozM5vFKTbq1qYApU9qexFTG5pGFvpq6ubOqpOdw3lQ3FqSs8ygDMyjRhPE+tm
 12iH4s68mkzTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h5htKmep
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: remove .node
 files with different architecture
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2023-11-07 21:08 +0100, Arnout Vandecappelle spake thusly:
> On 07/11/2023 17:15, Yann E. MORIN wrote:
> >On 2023-11-05 15:27 +0100, Giulio Benetti spake thusly:
> >>On 03/11/23 22:21, Yann E. MORIN wrote:
> >>>Oh, I was just walking the "npm is a mess anyway, just ignore anything
> >>>from it, we don't care" road. If we take this stance, then
> >>>_BIN_ARCH_EXCLUDE is a trivial way to avoid the check-bin-arch issue.
> >[--SNIP--]
> >>Since npm rebuilding is not that easy and fast to deal with I've just sent
> >>this patch to temporary exclude the /usr/lib/node_modules folder
> >>as you've suggested(forgotten to add "Suggested-by: Yann E. MORIN
> >><yann.morin.1998@free.fr>").
> >>
> >>Later I hope to find time to deal with npm rebuilding.
> >
> >I think tht it might in fact be what we're doing already, as we use:
> >     npm_config_build_from_source=true
> >
> >in the environment when we call npm.
> 
>  I guess that even if the binaries for the actual target get rebuilt, the
> other irrelevant binaries that were also downloaded are still there and
> trigger the issue.

Yes, absolutely, and confirmed by experience. ;-)

I'm still working on that patch...

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
