Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492A1C25B48
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 15:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCD1B4EF4D;
	Tue, 24 Oct 2023 15:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCD1B4EF4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHwla7yvT0bg; Tue, 24 Oct 2023 15:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 163D44EF49;
	Tue, 24 Oct 2023 15:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 163D44EF49
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBE781BF3F7
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 15:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B18554EF49
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 15:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B18554EF49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fhy5872ePzYX for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 15:28:18 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB26C4EF14
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 15:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB26C4EF14
Received: from bl14-19-118.dsl.telepac.pt ([85.247.19.118] helo=[192.168.1.10])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qvJKF-006YJY-7D; Tue, 24 Oct 2023 17:28:11 +0200
Message-ID: <8c44f1f6-7ef7-487b-db22-b396497e2a68@igalia.com>
Date: Tue, 24 Oct 2023 17:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <20231020142041.25503-1-clopez@igalia.com>
 <20231021213800.GG2607@scaer>
 <e1ef03a2-8f5f-4cd3-a433-e180eb3203d5@othermo.de>
 <20231023162506.GV2607@scaer>
 <6024766d-548e-c9ce-a0a0-2aaeb4396461@igalia.com>
 <PH1P110MB1603AA64767C75F0971FFB339FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <4528d9f7-78ee-1576-37d7-236476d3874f@igalia.com>
 <PH1P110MB16038C63A3D4037B53F502499FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <12dadf47-47c1-d158-b6f9-1f15991553e4@igalia.com>
 <PH1P110MB1603BACCE9A528FF031B049A9FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Organization: Igalia S.L.
In-Reply-To: <PH1P110MB1603BACCE9A528FF031B049A9FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZTl9NMj3ONHxTpLwDGUGOasV43QawtjWzh6nioCXxC4=; b=SVaqRkihfdN8VDKfHp7vXOHyc3
 enatk8wDOw8sSbSlkPqhS4cOiGlxL7ic/qjwXAxH9VV5dyYOmiQj5YrO152RceUivLFgqBIVb3WL7
 Izf5mxHjPGZEmgfi2cYncW0WVW4/C3laBn5i/bT1d5b5BRyPnaM5cVj8By5p0k5UI9KHMWWnMmMf5
 D9OPeSaie5UoAe9204EPVR/qq7/F1U8UYpHxdTpr/Sz6fFOhGxc+uYIQ8pW7r2pPA3JCh5GyzVoaj
 0uVfxOL4wvlqok9/+8lGP64bYLZnpqkLR0d9jdDHK+5d6AJYyVTwVJwqZOMnh2xtxqyp8hetJB84q
 Af2qfygA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=SVaqRkih
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
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


On 24/10/2023 17:17, Vincent Fazio wrote:
>> That is not true. Upstream RPi-OS defaults to the ondemand governor. The
>> kernel boots with powersave but there is an init scripy that swichts it to
>> ondemand as soon as the board boots unless the user press the shift key.
>>
> 
> Sorry, I wasn't very clear here. When I said upstream, I meant "upstream RPi kernel", which default to powersave. RPi-OS does have a mechanism to switch governors post boot.
> 
> FWIW, we use vanilla arm64 Debian Bookworm on our RPis and had to tackle this problem too, so I do understand where you're coming from.
> 
> Again, I think the biggest issue is just informing users and letting them choose the right solution for their deployment.
> 

I'm all in for informing users and letting them to choose a default.

On the other hand a default selection has to be made for those users
that don't care or don't have time to read the documentation.

And I repeat: RPi-OS defaults to ondemand governor because they change
the governor on boot with an init script.

The governor powersave is only used for the first seconds of the boot
process and is opt-in the rest of the time (the user has to press shit
key meanwhile booting to keep it).

So the current status quo is this one:

 1) RPi default CPU governor of mainline Linux kernel: schedutil or
ondemand (depends on the kernel version)
 2) RPi default CPU governor of RPi-OS: ondemand (powersave opt-in if
user press shit)
 3) RPi default CPU governor of buildroot: powersave


Why buildroot would want to have a default of powersave that not even
matches what RPi-OS does?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
