Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB39C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 10:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC79240106;
	Sun,  5 Feb 2023 10:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC79240106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hcrd4sqrFOU; Sun,  5 Feb 2023 10:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4A21400EF;
	Sun,  5 Feb 2023 10:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4A21400EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D5D31BF3BE
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2412A415D6
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2412A415D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3v_1udpHdvF for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 10:16:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFDE0415D0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFDE0415D0
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 10:16:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.161])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id F211978034D;
 Sun,  5 Feb 2023 11:15:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 11:15:57 +0100
Date: Sun, 5 Feb 2023 11:15:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230205101557.GA2960@scaer>
References: <20230205081617.113018-1-bernd.kuhls@t-online.de>
 <20230205081617.113018-3-bernd.kuhls@t-online.de>
 <d57c991e-a8f5-bad2-e25f-7bfa03fa610d@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d57c991e-a8f5-bad2-e25f-7bfa03fa610d@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675592161;
 bh=3iqN0mqwuVz4+ONyaHpM4/lrcmI4a+Ri7o5MErjQE4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gKfTX3NnQ4m8/5vqxbkvH1vnMC6v9/DDnYqsFUI+Dooi84WJyN19lPTgJxiFFFSf/
 R4R701dMG9NokAYfl8hY4mX7jTjjV/J/TFk8IymJ/jHv5wagyIjwK01Z+McjgZR/67
 8wyDQCLpGDIqNNZAtUidYBS9a9YEaV/FDrjf2TiBxa78hHuMkW31waawOqwNtpX5Tv
 VqI3CWX6AxSYf309gQHP2Qlk40pPl2tHJcVfg4UsyF7jRqTN0tWEIY2Tx4/ZFt9oFI
 rm1ww4sIcvMxaGoWrNT/Le8zQaldX5Rmfk8yRkp6ZFlEwX2YxnFRAaLoS4gHmjih+6
 vLI921c/YbZvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gKfTX3Nn
Subject: Re: [Buildroot] [PATCH 3/3] package/freeswitch: security bump
 version to 1.10.9
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

Peter, All,

On 2023-02-05 10:01 +0100, Peter Korsgaard spake thusly:
> On 05/02/2023 09.16, Bernd Kuhls wrote:
> >Release notes:
> >https://github.com/signalwire/freeswitch/releases/tag/v1.10.9
> >
> >Upstream removed zrtp support:
> >https://github.com/signalwire/freeswitch/pull/1848
> >
> >Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Fixed the checkpatch warning and applied, thanks;

You only applied this patch 3/3, but patches 1/3 and 2/3 (likbks and
sofia-sip bumps) are marked as being needed first. So I've applied them
now.

Bernd, it would have been nice that the patch bumping freeswitch would
mention that it has a dependency on newer libks and sofia-sip versions.
Indeed, if the freeswitch bump is backported to a maintenance branch,
them the two other bumps will have to be backported too, and if that is
not mentioned in the commit log, that will not be obvious to notice.

Regards,
Yann E. MORIN.

> package/freeswitch/freeswitch.hash:2: separation does not match expectation
> (http://nightly.buildroot.org/#adding-packages-hash
> 
> -- 
> Bye, Peter Korsgaard
> 
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
