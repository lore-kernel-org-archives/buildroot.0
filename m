Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63511C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 20:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE6B260BCD;
	Thu, 10 Feb 2022 20:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03pXkPhXRXtY; Thu, 10 Feb 2022 20:37:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE07460B89;
	Thu, 10 Feb 2022 20:37:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B25F1BF398
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F7B40129
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-T9i2ftInwH for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 20:37:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08D6240122
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 20:37:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d4e:c6ab:895c:dfc8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9F9DA13F895;
 Thu, 10 Feb 2022 21:37:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644525443;
 bh=xoi7F4COAzO8ldXOpUJfBUol9A8xco0qj3QDlAytYiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gw1xgrGpygGgBv0uwTXLfQFo5rxprFByCMox0zIJRTc74f6cbrr0V58lJ63vgt6qP
 ELaRABLujjhp1sFNJpfMgEwzKO1Z5H5eD1mu7eHZ9gghcBZjqeWEQ8HCBOBdteW+Ex
 fSnhtyyVJUEVvRGypvqBqNnmbWxKNkWuA/SCU/2PUNXncIoZepwRMBgRI6iCUwEwgm
 hX/gdNv34VaAJIWSWuhL1D0eigL189r0EUt7fG3xadkzPOuhom2BTp/TxFuvfpoXul
 qH+TwgDcnOAiaySKHdN8KQASg4AsDAaZcUgK4k87c14a7EEs5lDWQ6m/ez0ev8ADUk
 EpBeCgP0M/cvg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 21:37:19 +0100
Date: Thu, 10 Feb 2022 21:37:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220210203719.GA3752867@scaer>
References: <20220209165213.4498-1-peter@korsgaard.com>
 <20220209213312.GE2249818@scaer>
 <2cba2cd6-ca70-6336-f2fe-60649a0f1a0d@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2cba2cd6-ca70-6336-f2fe-60649a0f1a0d@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 000/107] Drop python 2.7
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

Arnout, All,

On 2022-02-10 18:15 +0100, Arnout Vandecappelle spake thusly:
> On 09/02/2022 22:33, Yann E. MORIN wrote:
> >On 2022-02-09 17:50 +0100, Peter Korsgaard spake thusly:
> >>Python 2.7 is EOL since April 2020 and almost all packages support
> >>python 3, so drop it before the 2022.02 release.
[--SNIP--]
>  I did a bit of grepping for leftovers and found these:
[--SNIP--]

Yeah, I knew we had missed a few things, and Peter had already noticed a
few in the cover-letter, but we needed to move forward quick, at the
risk of breaking things.

After all, the post-rc1 period is actually to fix things we broke! ;-)

> The ones in gst1-devtools.mk and omniorb.mk look important, the rest is just
> cleanup. qt5webengine is also a bit worrisome...

For qt5webengine, IIRC James and Adam were working on it, and may have a
pending change ready?

I was thinking maybe about this:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=284619

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
