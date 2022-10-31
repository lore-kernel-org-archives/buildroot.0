Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ECCC38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 13:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2E3840240;
	Mon, 31 Oct 2022 13:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2E3840240
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id muFN3UNDEZ9j; Mon, 31 Oct 2022 13:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2675E40230;
	Mon, 31 Oct 2022 13:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2675E40230
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 834FC1BF401
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 13:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A1B7404E9
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 13:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A1B7404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyCgnXEPgfrU for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 13:15:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA1CD404BA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA1CD404BA
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 13:15:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 30595B0056A;
 Mon, 31 Oct 2022 14:14:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 14:14:44 +0100
Date: Mon, 31 Oct 2022 14:14:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tim Gover <tim.gover@raspberrypi.com>
Message-ID: <20221031131444.GD1058960@scaer>
References: <20221031114643.6648-1-tim.gover@raspberrypi.com>
 <20221031123928.GB1058960@scaer>
 <CAAvKZ67N24Hj7ejxQ7zueOQbsqq8WNNgLiZauM7GkMHLhN=kYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAvKZ67N24Hj7ejxQ7zueOQbsqq8WNNgLiZauM7GkMHLhN=kYw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667222089;
 bh=i5bwrmV7SSHv4z9Affe1qnScz41RZ1SmxTvm/NxZzhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ohlgGJNzoj1J8e7oQYi+P9Qn9FvJiWYBVAM85vobeWiDSh3qtC7HnKowv7kmq5s8q
 G1zZB80zIinMOAWgDE8aopS7+/htFOHzd3BaFSLjKsymYTfl2pFZp+XaS2pKPPqagk
 yCDNIs5LlPfofYo8o+rxVQ5FPluWVFJ6U0hfuQKsDg3lukx5jTx9A5vm+x/fajKw3u
 WkaPab/RjxgKB7StdVmNywxWw850MsOKcCG77KRF/aS7SR+NCWkOjzABJ6ytJ5o1rX
 ijrf0JNF01BlNfD8YiQ0gkwmE5H4e6UoOXubBdhM7usvaP3CbEmN7BO8Lv+n0PL8nf
 UoGt1XrGQUTjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ohlgGJNz
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: add
 overlays/README
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
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tim, All,

On 2022-10-31 12:52 +0000, Tim Gover spake thusly:
> On Mon, 31 Oct 2022 at 12:39, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2022-10-31 11:46 +0000, Tim Gover spake thusly:
> > > If a custom os_prefix directory is specified then the Raspberry Pi
> > > firmware probes for the README file in overlays directory.
> > > Since the README file is small let's include it, otherwise,
> > 197KiB is _not_ small. In fact, the README is bigger than every dtbo,
> > and accounts for ~25% of the size of all dtbo combined.
> Good point. Would you be happy with simply creating an empty or small
> README file (a note indicating the purpose of the file) ?

Just touching the README should be enough I would say.

> > > the firmware won't recognize the overlays directory if the user
> > > later moves it to an os_prefix specific sub-directory.
> > What is the goal here, in the context of Buildroot, where we only
> > install one set of overlays?
> > If a user moved the overlays, they already have a script that does that,
> > so they should also ensure that script properly prepares config.txt to
> > specify the proper os_prefix, and so it is just a matter of adding a
> > 'touch' on the README in the same script.
> It's fairly common for non-expert users to modify the output of a
> buildroot image
> without re-building the image themselves. Adding a README file reduces
> the risk of them being tripped up by this difference in behaviour.

So, if I read you correctly: non-expert users know they can move the
overlays to a sub-dir; they also know they have to set the os_prefix
accordingly in config.txt; but they don't know they have to create a
README in there? ;-)

Sorry, I am still unconvinced.

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
