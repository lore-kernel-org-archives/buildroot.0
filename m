Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C1FC07545
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 20:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D191270637;
	Tue, 24 Oct 2023 20:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D191270637
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvwZ07o9Luzv; Tue, 24 Oct 2023 20:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C44070635;
	Tue, 24 Oct 2023 20:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C44070635
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 469191BF470
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 20:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F0BB84CEE
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 20:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F0BB84CEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDAgOk1ClDRi for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 20:53:27 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDE9C84CED
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 20:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDE9C84CED
Received: from bl14-19-118.dsl.telepac.pt ([85.247.19.118] helo=[192.168.1.10])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qvOOq-006jTw-1P; Tue, 24 Oct 2023 22:53:16 +0200
Message-ID: <004cba7d-2c39-a504-b4cb-9030424f4ac0@igalia.com>
Date: Tue, 24 Oct 2023 22:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
 <20231024190747.GB2607@scaer>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Organization: Igalia S.L.
In-Reply-To: <20231024190747.GB2607@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=msMH4fkx6V2eCiD8QyQro5nNQOtnCH0nhi2qT10sj10=; b=MI+bKYSB6sXWu9MqdP/+NEBnTq
 vg+DL3AZ+yiDdXqzWsxDXGz58wk9l9TcXSD8WExdrKOI/GRj/Foao3u0vOoF2fuybfqhHWgNKksNx
 OXdOS+VGbASxCntEwZAFXD40JJ7e7CRfb9GcJL/x1mmFPx+lFReIr3FL3M3TQ1t7UA0OR9XxrfDx5
 O+eDXG+bP4M3I6WUgErX/f1+b09Boz0Yu/IvcyqNSgiYYRx3k97i4poNqvxu9SN71kWl0RbKViGL0
 lm2Bd8Zgo/mEoRvoVfKLnrE3ekolcHj3AswHj13hnq+USkwq/BO9T8rwFQWXfFuRHTtzVwRz6J6as
 Yfh4tC9g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=MI+bKYSB
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

On 24/10/2023 21:07, Yann E. MORIN wrote:
> Because we are *not* RPi-OS. We are not matching against RPi-OS; we are
> using rpi-kernel upstream decision.

rpi-kernel upstream decision can't be considered alone. They just do
this because they have an init script that later changes the governor to
ondemand on RPi-OS.

They are not defining those defconfings thinking on other downstreams
than RPi-OS.

I think they are committing a mistake by doing that: the kernel
defconfig is not the right place to set such behaviour. They should be
setting powersave as default from the debian/rules of the kernel package
instead.

And I think you are committing another mistake by taking their
defconfigs as something that should be the default or is thought for
other downstreams than RPi-OS.

It makes *zero* sense to have powersave as default without that init
script that later changes it.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
