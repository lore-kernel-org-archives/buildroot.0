Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1130DC07545
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 19:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF4296FB33;
	Tue, 24 Oct 2023 19:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF4296FB33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pm7e5cLbGgk; Tue, 24 Oct 2023 19:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF30E6FB3A;
	Tue, 24 Oct 2023 19:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF30E6FB3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6491E1BF377
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 19:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39C044EE3A
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 19:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39C044EE3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qvk4veUPmgK for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 19:07:58 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A80544EE36
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 19:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A80544EE36
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:b634:9dd0:c5f5:6564])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 28899B00535;
 Tue, 24 Oct 2023 21:07:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 24 Oct 2023 21:07:47 +0200
Date: Tue, 24 Oct 2023 21:07:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Message-ID: <20231024190747.GB2607@scaer>
References: <20231021213800.GG2607@scaer>
 <e1ef03a2-8f5f-4cd3-a433-e180eb3203d5@othermo.de>
 <20231023162506.GV2607@scaer>
 <6024766d-548e-c9ce-a0a0-2aaeb4396461@igalia.com>
 <PH1P110MB1603AA64767C75F0971FFB339FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <4528d9f7-78ee-1576-37d7-236476d3874f@igalia.com>
 <PH1P110MB16038C63A3D4037B53F502499FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <12dadf47-47c1-d158-b6f9-1f15991553e4@igalia.com>
 <PH1P110MB1603BACCE9A528FF031B049A9FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <8c44f1f6-7ef7-487b-db22-b396497e2a68@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c44f1f6-7ef7-487b-db22-b396497e2a68@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698174474;
 bh=53O/60O0d0LHoJE+JefBc0nNkVSGPe++YXstrPBBaC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ucbl9LcjnEYH3IWY2ggRQVAlsuJh9gKHkIVv08K/YYKMvHiUBmYV3S6tr8Lt8x9C2
 qoo2l0sGybZtU86O9+VG6LZP/+g84I1ljc4Sfndud1dv9rrCddWR+6j9ntJFQuj5qc
 gxNurUr7BqsJW1uUvTehUhn7+/MPL9Qi/lDW9oYgSEhc8XZhSopyFQ3rZ16iVRwMGN
 7ocp5126X3QOlBiLAr/ajQsy1Rjb7hyv1CsWUJihOa1OcZIwKkFGuHR98vRkzIdiF1
 opCZT0mM+SDCKjospdB0OL6WaI817MkojyyQJ0DLLfrGmdzutd0Oa5MS1UU3KH2u5I
 YsvIsn7CNn4Rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ucbl9Lcj
Subject: Re: [Buildroot] [External] - Re: [PATCH 1/1] configs/raspberrypi*:
 stop setting powersave as the default CPU governor
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
Cc: Martin Bark <martin@barkynet.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Vincent Fazio <vfazio@xes-inc.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Carlos, All,

Thanks for all the back-n-forth on the subject, I think interested
parties expresed their view, and here's my last take on the topic, see
below...

On 2023-10-24 17:28 +0200, Carlos Alberto Lopez Perez spake thusly:
> On 24/10/2023 17:17, Vincent Fazio wrote:
> >> That is not true. Upstream RPi-OS defaults to the ondemand governor. The
> >> kernel boots with powersave but there is an init scripy that swichts it to
> >> ondemand as soon as the board boots unless the user press the shift key.
> > Sorry, I wasn't very clear here. When I said upstream, I meant
> > "upstream RPi kernel", which default to powersave.

Exactly: the people responsible for maintaing the kernel for the
raspberry pi are the upstream for that kernel. They have decided upon a
default behaviour they want the kernel to have, so this is what we're
following too: it's rpi-upstream's decision to default to powersave.

> > RPi-OS does
> > have a mechanism to switch governors post boot.

RPi-OS is a debian-based distribution using the rpi kernel; they are a
downstream of the rpi kernel, like we are. RPi-OS have done their
integration to switch to using a different behaviour, using a startup
script (or a systemd unit, that's equivalent); they haven't decided to
change the kernel configuration (AFAICS from this thread).

And Buildroot is not RPi-OS.

Besides, some people have started to rely on the fact that a build with
Buildroot will use the powersave governor: Vincent explained a use-case
for which such a default makes sense; on my side I also use (have used)
rpis with powersave because of thermal stability.

> > Again, I think the biggest issue is just informing users and
> > letting them choose the right solution for their deployment.
> I'm all in for informing users and letting them to choose a default.
> 
> On the other hand a default selection has to be made for those users
> that don't care or don't have time to read the documentation.
> 
> And I repeat: RPi-OS defaults to ondemand governor because they change
> the governor on boot with an init script.

Exactly: they have an init script; they do not change the kernel
configuration.

> The governor powersave is only used for the first seconds of the boot
> process and is opt-in the rest of the time (the user has to press shit
> key meanwhile booting to keep it).
> 
> So the current status quo is this one:
> 
>  1) RPi default CPU governor of mainline Linux kernel: schedutil or
> ondemand (depends on the kernel version)
>  2) RPi default CPU governor of RPi-OS: ondemand (powersave opt-in if
> user press shit)
>  3) RPi default CPU governor of buildroot: powersave
> 
> Why buildroot would want to have a default of powersave that not even
> matches what RPi-OS does?

Because we are *not* RPi-OS. We are not matching against RPi-OS; we are
using rpi-kernel upstream decision.

In another email [0], you wrote;

> The reality nowdays is that all buildroot RPi users are actually running
> with powersave governor by default and I bet 90% of them don't know it.

If they did not notice, then doesn't that mean that the rpi is behaving
good enough for them, and that they in fact do not need the extra speed?

And again, here's a repeat from a previous comment of mine:

The defconfigs are basic configurations that just demonstrate the basic
behaviour of a board, with minimal to no tweaking to deviate from
upstreams. Users are suposed to take those defconfigs, and adapt to
their needs. If they want to change the governor, then they can provide
a startup script that enables the required governor.

[0] https://lore.kernel.org/buildroot/4528d9f7-78ee-1576-37d7-236476d3874f@igalia.com/

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
