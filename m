Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80C1C07545
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 15:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76103415C7;
	Tue, 24 Oct 2023 15:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76103415C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PAETUr-OyVb6; Tue, 24 Oct 2023 15:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 880DC415D5;
	Tue, 24 Oct 2023 15:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880DC415D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 699FC1BF2C4
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 15:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 423C1415D5
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 15:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423C1415D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Nh4wo4W0Eql for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 15:00:34 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7944415C7
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 15:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7944415C7
Received: from bl14-19-118.dsl.telepac.pt ([85.247.19.118] helo=[192.168.1.10])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qvItN-006XEt-Jg; Tue, 24 Oct 2023 17:00:25 +0200
Message-ID: <12dadf47-47c1-d158-b6f9-1f15991553e4@igalia.com>
Date: Tue, 24 Oct 2023 17:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: es
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
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Organization: Igalia S.L.
In-Reply-To: <PH1P110MB16038C63A3D4037B53F502499FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O+JimzG215cUhmjGxJI01Ab4d9MeMJEpk6KKouEwLgs=; b=HCDNsYqA7jaovF2uBZ4xZFKnAD
 hlQ0lTSKdW6VnMjKQ1pnrkfrGENZP2vbqtoeyX2ZECTER7+hwwGbiGyZ4Xc+Zi0LHLujQRw/1Dw2w
 EK1ZZq3TshvQXqmbsNQHFt8Nk/f2KJLAhgbtg0bdHQ7ZQsOdxu3BVJkt4SlCqDLsWOLrpl6KMatMI
 23RpwIGAysrDEjatDQz4clt/qDbS7IBpVEzKMU45EsIu4D1Bidc/Rii4TJR3pCSfE+jRQ44/o17nG
 oWHEBcdbD9zrcn2arlx06Ut5Ol2LOVMnJ6GPcLNNr+lQ9Kf2QSPiGwiU5p6qThfBBAfb+tH1DT442
 lSM5+Nhw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=HCDNsYqA
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

On 24/10/2023 16:52, Vincent Fazio wrote:
> All,
> 
>> -----Original Message-----
>> From: Carlos Alberto Lopez Perez <clopez@igalia.com>
>> Sent: Tuesday, October 24, 2023 9:29 AM
>> To: Vincent Fazio <vfazio@xes-inc.com>; Yann E. MORIN
>> <yann.morin.1998@free.fr>; Marcus Hoffmann
>> <marcus.hoffmann@othermo.de>
>> Cc: Martin Bark <martin@barkynet.com>; Julien Grossholtz
>> <julien.grossholtz@openest.io>; buildroot@buildroot.org
>> Subject: Re: [External] - Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*:
>> stop setting powersave as the default CPU governor
>>
>> On 24/10/2023 16:01, Vincent Fazio wrote:
>>> Per Phil:
>>> We default to powersave to allow boards to be booted successfully when
>> higher clocks speeds are causing problems, e.g. with an inadequate power
>> supply.
>>>
>>> I have personally had issues booting CM3+ boards with ondemand
>> governors with ethernet plugged in when the CPUs don't have heat sinks on
>> them.
>>>
>>
>> I don't know why the rest of users should inherit a default that is meant to
>> address a corner case (CM3 boards without heat sinks) and that slows down
>> everything for them.
>>
> 
> RPis can be deployed in numerous ways, such as being seated in custom carrier boards,
> so I do agree with upstream when it comes to "playing it safe" and if your situation/design
>  proves out and isn't flaky, then you can opt-in to a more "aggressive" governor.
> 

That is not true. Upstream RPi-OS defaults to the ondemand governor. The
kernel boots with powersave but there is an init scripy that swichts it
to ondemand as soon as the board boots unless the user press the shift key.

So what is opt-in is to use powersave (the user has to press shift), by
default they run with ondemand governor (ondemand is equivalent to
shedutil, just older)


> I think the problem we can all agree on here, however, and it's a point you made in your
> upstream PR, is that it isn't advertised or clear that by default all RPis will be running on
> the powersave governor so people don't even know they may want to change it.
> 
>> What is worse, they likely won't notice they are running with the lowest
>> possible frequency.
>>
>> On the other hand, if we default to the Linux default scheduler
>> (schedutil) then the (minority of) users with overheat problems will notice
>> something doesn't work as expected (board stops working or the kernel-log
>> prints errors) so they can change the governor or put a hetsink if they
>> suspect overheat issues.
>>
>>>> I have argued with them that the place to do this change is not on
>>>> the Linux Kernel defconfigs but on their repository for RPi-OS
>>>> because other projects (like buildroot) depend on them. But they are not
>> willing to change this.
>>>>
>>>> So I think Buildroot should undo that change in order to keep the
>>>> Linux default CPU governor to the Linux's default one (schedutil)
>>>>
>>> Can't this be done by one of the following:
>>> 1) provide your own kernel defconfig file
>>> 2) fork the RPi kernel with your own changes and use that ref
>>> 3) add a kconfig fragment to switch the default governor
>>> 4) adjust the kernel commandline in config.txt with your chosen
>>> governor
>>> 5) use a startup script to change governors post boot (obviously
>>> doesn't fix the "must boot fast" issue)
>>>
>>
>> Yes, I know how to fix this on my build.
>>
>> But I'm trying to do a service to the community and change the default to a
>> more sane option. I'm actually not changing the default, just resetting it to
>> the default Linux mainline option (undoing the change that the RPi-OS guys
>> do for their product)
>>
> 
> It may make sense to update board/raspberrypi/readme.txt to call out that the default governor
> for the upstream RPi kernel is powersave and that if users want to change it how they may go about
> doing so.
> 
> I, personally, see value in the cpu governor kconfig fragment to "revert" to the default linux-stable
> governor if consumers want to opt-in so everyone doesn't have to reinvent that wheel.
> 
> I obviously defer to the BR maintainers about whether the rpi defconfigs should use it by default.
> 

I think it should be done the other way. Default to the Linux one
(schedutil/ondemand) and maybe document on the readme that if anyone
wants to use the powersave governor document how to do it.

Please note that RPi-OS also defaults to the ondemand governor by
default. Using powersave is optional (user has to press shift key while
booting the board).

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
