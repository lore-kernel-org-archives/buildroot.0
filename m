Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA4FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 18:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE03D60B1F;
	Mon, 24 Jan 2022 18:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMwQzZC4QdeI; Mon, 24 Jan 2022 18:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0991B6061B;
	Mon, 24 Jan 2022 18:47:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D80511BF27A
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 18:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30DF440089
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 18:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zglMFlXueov for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 18:47:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DFC4415A0
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 18:47:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp4-g21.free.fr (Postfix) with ESMTP id A418419F5A6;
 Mon, 24 Jan 2022 19:47:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643050064;
 bh=z5mOa6BtSSiGjEZJBqXKfq8g8/+LnkqVjnYAj9iXEwQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cdOKvKPyz5Vcvtujzl/pkKIWP8KAWbrroHDr3nB7nv/8Oh7JHwA/H5NHTw3FqnUAE
 +e9XiBBn+4R8kMXUfj9Hpm9SV/p6iX6d9oYU+fXuLydDzLhfSNl2n5/5b4E5zsxbi4
 gg8f/RfLaNusEpChSpWtvSJrGiJcN5A/Hq0isVYxhcbimFOUe2B0YxmA8j41sMqSa7
 L51MLp7Cc1oPafhUYIgWdBb1KtgYrnG2CttXoXWITSVifJwp3Yuam7CSqJjC1xAwsp
 tQmjTLfY6nUgPvo76EftXxoAn+jbW2+tOWP2bhuV4Nk4uiWFgt2dS5dUhUylIXQXKc
 uCfwoTkT3Ea4A==
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
MIME-Version: 1.0
Date: Mon, 24 Jan 2022 19:47:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20220123205148.GH2502@scaer>
References: <20220115160449.2292472-1-fontaine.fabrice@gmail.com>
 <20220119202351.GA3095239@scaer> <c4c033a6c8012a54043d4f1e28678834@free.fr>
 <20220123205148.GH2502@scaer>
Message-ID: <51028e4dcbbad93168992ae30a6f8330@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
Subject: Re: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: set --with-boost
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, All,

On 23/01/2022 21:51, Yann E. MORIN wrote:
> Julien, All,
> 
> On 2022-01-23 21:03 +0100, Julien Olivain spake thusly:
>> On 19/01/2022 21:23, Yann E. MORIN wrote:
> [--SNIP--]
>> >To be noted: riscv-isa-sim could also be configured with --without-boost
>> >and the build succeeds.
>> >Julien, do you know what ill-effect building without Boost would have?
>> 
>> The absence of Boost is removing the "Command I/O via socket" feature 
>> of
>> riscv-isa-sim (-s command line option).  See:
>> https://github.com/riscv-software-src/riscv-isa-sim/blob/v1.1.0/spike_main/spike.cc#L30
>> It's generally not needed in simple use-cases.
> 
> Thanks for the feedback. :-)
> 
> Indeed, if Boost is not a strict requirement, it would be nice to be
> able to build without it...
> 
>> My initial intent was to have host-riscv-isa-sim compiled without this 
>> Boost
>> support.
>> 
>> The upstream riscv-isa-sim detection of boost seems a bit peculiar and 
>> does
>> not
>> really honor 
>> --without-boost/--without-boost-regex/--without-boost-asio.
>> 
>> Setting --without-boost alone on a system with boost will make the
>> ./configure
>> fail with:
>> 
>>     checking whether the Boost::ASIO library is available... yes
>>     configure: error: Could not find a version of the Boost::Asio 
>> library!
>> 
>> Setting --without-boost --without-boost-regex --without-boost-asio 
>> will end
>> up
>> with a successful configuration/compilation, but with a binary linked 
>> with
>> libboost_regex.so and libboost_system.so...
>> 
>> I believe this part could be slightly improved before setting
>> --without-boost
>> in the BR recipe.  I'll have a look into that.
> 
> The problem, as you said, is that if Boost is available (either already
> isntalled on the build machine, or host-boost is puleld in by another
> package), configuring riscv-isa-sim with --without-boost still breaks
> with the message you pasted above.
> 
> But we can't guarantee that Boost (system or host-boost) is not 
> present.
> 
> So, either we have a patch that fixes the Boost detection (and we push
> that patch upstream), or we can only depend on host-boost and keep the
> current status.

I proposed a small upstream improvement of the boost detection here:
https://github.com/riscv-software-src/riscv-isa-sim/pull/909

This should allow a clean host-riscv-isa-sim build in Buildroot using
--without-boost is all situations (i.e. host has/hasn't boost, br host
has/hasn't boost).

Best regards,

Julien.

> Regards,
> Yann E. MORIN.
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___        
>        |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There 
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   
> conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
