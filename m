Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A570C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 20:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CED8403C1;
	Sun, 23 Jan 2022 20:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_wwJtivaq86; Sun, 23 Jan 2022 20:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A884403B4;
	Sun, 23 Jan 2022 20:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E84A1BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 20:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68A7B4014C
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 20:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuphoDKwurO7 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 20:03:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3DDD4012E
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 20:03:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp3-g21.free.fr (Postfix) with ESMTP id C41C513F89D;
 Sun, 23 Jan 2022 21:03:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642968201;
 bh=8j5G4lmNwOUpUUqJxBcw7fxNQILcaoqFU7zhxNuk9Cw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H1hx500Il1jemX8WnyDEmvsVRPiCPFK3TUQ0kQkAwsTqVzAiBWW+22DE++AwUgyJL
 NCtwG4d66s3Uw+AmJX6CH588KrEgLXko0aeB7hj2jK9pevTTm4ejUTa2nA8eE2NfYf
 WwxIn2PfG+avhqKhOgGHig60anYP/CY+qWfpmHK/SyY6y1bTi1WTFEHR9p3EX822BK
 cDNv46+hdayN3/pdGdgr9kAOkeWREu2hIUSdRpjxEPbrdsVXS7l5G1Jz//ROMwW0hm
 94mPxwEmmUMVI9zMgnhtjdorItZwgO2KUP6/4QrO/WFLbK/ld/qgsq3CUteHooOO3+
 p5CwkH3H6rw2Q==
Received: from [37.164.138.195]
	by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 23 Jan 2022 21:03:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20220119202351.GA3095239@scaer>
References: <20220115160449.2292472-1-fontaine.fabrice@gmail.com>
 <20220119202351.GA3095239@scaer>
Message-ID: <c4c033a6c8012a54043d4f1e28678834@free.fr>
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

Hi Yann,

On 19/01/2022 21:23, Yann E. MORIN wrote:
> Fabrice, All,
> 
> On 2022-01-15 17:04 +0100, Fabrice Fontaine spake thusly:
>> Set --with-boost to avoid the following build failure when a non 
>> working
>> boost version is installed on host. This failure is raised since the
>> addition of the package in commit
>> ea033cecf990ed3f86619647523a9ad2ccb09adb:
>> 
>> configure:5559: error: Could not find a version of the Boost::Asio 
>> library!
>> 
>> Fixes:
>>  - 
>> http://autobuild.buildroot.org/results/855b66b86d979cc922b947da932b0e2388481263
>> 
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  package/riscv-isa-sim/riscv-isa-sim.mk | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk 
>> b/package/riscv-isa-sim/riscv-isa-sim.mk
>> index ee9067d304..90eed93c36 100644
>> --- a/package/riscv-isa-sim/riscv-isa-sim.mk
>> +++ b/package/riscv-isa-sim/riscv-isa-sim.mk
>> @@ -9,5 +9,6 @@ RISCV_ISA_SIM_SITE = $(call 
>> github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA
>>  RISCV_ISA_SIM_LICENSE = BSD-3-Clause
>>  RISCV_ISA_SIM_LICENSE_FILES = LICENSE
>>  HOST_RISCV_ISA_SIM_DEPENDENCIES = host-boost host-dtc
>> +HOST_RISCV_ISA_SIM_CONF_OPTS = --with-boost=$(HOST_DIR)
> 
> To be noted: riscv-isa-sim could also be configured with 
> --without-boost
> and the build succeeds.
> 
> Anyway: applied to master, thanks.
> 
> Julien, do you know what ill-effect building without Boost would have?

The absence of Boost is removing the "Command I/O via socket" feature of
riscv-isa-sim (-s command line option).  See:
https://github.com/riscv-software-src/riscv-isa-sim/blob/v1.1.0/spike_main/spike.cc#L30
It's generally not needed in simple use-cases.

My initial intent was to have host-riscv-isa-sim compiled without this 
Boost
support.

The upstream riscv-isa-sim detection of boost seems a bit peculiar and 
does not
really honor --without-boost/--without-boost-regex/--without-boost-asio.

Setting --without-boost alone on a system with boost will make the 
./configure
fail with:

     checking whether the Boost::ASIO library is available... yes
     configure: error: Could not find a version of the Boost::Asio 
library!

Setting --without-boost --without-boost-regex --without-boost-asio will 
end up
with a successful configuration/compilation, but with a binary linked 
with
libboost_regex.so and libboost_system.so...

I believe this part could be slightly improved before setting 
--without-boost
in the BR recipe.  I'll have a look into that.

Best regards,

Julien.

> Regards,
> Yann E. MORIN.
> 
>>  $(eval $(host-autotools-package))
>> --
>> 2.34.1
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
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
