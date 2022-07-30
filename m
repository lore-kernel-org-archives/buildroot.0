Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D70C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 12:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54B1184056;
	Sat, 30 Jul 2022 12:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B1184056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGZw5by53rda; Sat, 30 Jul 2022 12:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B968403C;
	Sat, 30 Jul 2022 12:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65B968403C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25DD31BF391
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F42068403C
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F42068403C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8EF1ybP8VYo for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 12:22:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02AEB81D18
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02AEB81D18
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 12:22:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3124560129;
 Sat, 30 Jul 2022 14:22:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 14:22:16 +0200
Date: Sat, 30 Jul 2022 14:22:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220730122216.GT3168@scaer>
References: <20220101214034.2152144-1-giulio.benetti@benettiengineering.com>
 <CADvTj4r09-gBxrbbJCd-gXCaOzZsMGUgv=E-SELMUieGdTorcA@mail.gmail.com>
 <229dd860-e5ff-64a4-f97e-00cc3de26075@benettiengineering.com>
 <b48adde2-4418-178c-0148-ef7d46cdfe4a@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b48adde2-4418-178c-0148-ef7d46cdfe4a@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659183741;
 bh=zTYViV4q+lbQ+bfIyvJxtzxeVzkN4J24B8yNtbiosLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=grx7tU2WlIsXe9fp5YMYXGKiXQhM1oNn0vY/VDS3Jcd/3Um96P9dUC9KM0qjIMEuG
 CAPNSH1ic+jy/aW1/ox+PjTAoa9g2Fu4VceZsM7usZXQrSYFJT3ZVRzSD7AY/va1Rb
 5Wok2KmbfwBpUTpHMsPC8VmVrmFMshARFlNwN8dIyHhQiEHpsd+mbvz2YgJja8Vpdr
 4gZE6yMKoB+hOL5aId6qCs5tsDbFDeYuYsrvNhFY+iT1jy4Tdsd3As6/uNwL5G2Dmv
 aI7aM8oWnnUOiWPcES3fKIGVklmKdqeWTwV+lUwgBJk+c+ikoMgyGglhMbdw2a4wJG
 58LU96/li4t+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=grx7tU2W
Subject: Re: [Buildroot] [PATCH] Makefile: disable 'printvars' and
 'show-vars' recipes for Make 4.3
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
 James Hilliard <james.hilliard1@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, Giulio, James, All,

On 2022-07-27 10:38 +0200, Arnout Vandecappelle spake thusly:
> On 26/07/2022 23:52, Giulio Benetti wrote:
> >On 21/07/22 05:55, James Hilliard wrote:
> >>On Sat, Jan 1, 2022 at 2:40 PM Giulio Benetti
> >><giulio.benetti@benettiengineering.com> wrote:
> >>>Make 4.3 is buggy and leads to a "Segmentation fault (core dumped)" when
> >>>calling 'make printvars' or 'make show-vars', so let's refuse to execute
> >>>those recipes if Make 4.3 by adding 'check-make-version' recipe as
> >>>depedendency of 'printvars' and 'show-vars' as suggested by Yann E. Morin.
> >>FYI autobuilder threads seem to die when this gets hit:
[--SNIP--]
> >Do you have an autobuilder failure link?
> >So I can reproduce it here and find a work-around for it.
>  It's the autobuilder script (from the buildroot-test repository) itself
> that crashes. I suspect it isn't able to send in its results after that.
> There is a separate process for each autobuilder instance, but I don't think
> they are restarted when they crash so eventually all instances will die.
> 
>  Note that this is only invoked if a reproducibility error was detected.
> 
>  @James: do like Thomas, install an earlier make on your system :-)

That will no longer ne necessary, as we now have a working workaround
for that, that I just pushed:

    5c54c3ef3db2 Makefile: workaround make 4.3 issue for 'printvars and 'show-vars'

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
