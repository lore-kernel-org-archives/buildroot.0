Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B723DCEACFC
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 19:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7378440AE3;
	Tue,  1 Oct 2024 19:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXUX9SByGCUA; Tue,  1 Oct 2024 19:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DE8A40AEE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DE8A40AEE;
	Tue,  1 Oct 2024 19:39:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50B7B1BF28C
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 19:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FF55607FF
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 19:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AD6GtJlkeAlb for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 19:39:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72273607F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72273607F3
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72273607F3
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 19:39:20 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 541A5240B35;
 Tue,  1 Oct 2024 21:39:18 +0200 (CEST)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id 36895240557;
 Tue,  1 Oct 2024 21:39:18 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 0209B240BC9;
 Tue,  1 Oct 2024 21:39:17 +0200 (CEST)
Message-ID: <79cedd3e-c2a1-46f5-b6dd-c17c43a7217f@mail.de>
Date: Tue, 1 Oct 2024 21:39:15 +0200
MIME-Version: 1.0
To: Quentin Schulz <quentin.schulz@cherry.de>, buildroot@buildroot.org
References: <20240929151124.103921-1-kilian.zinnecker@mail.de>
 <2460269a-e521-4add-ac09-6bd1b0a7a872@cherry.de>
 <79861be1-00c9-4f61-baca-2a276683910e@mail.de>
 <05372228-2faa-4024-9be7-89e1b2ee07d0@cherry.de>
Content-Language: en-US
In-Reply-To: <05372228-2faa-4024-9be7-89e1b2ee07d0@cherry.de>
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 658
X-purgate-ID: 154282::1727811558-8DE3522F-B7C6181C/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1727811558;
 bh=HnXGtL83s4chE5Df0qa6USB/ovhDTtm186ux+O8K1B8=;
 h=Message-ID:Date:Subject:To:From:From:To:CC:Subject:Reply-To;
 b=cotEkPmkGwxxS8fs1Ocqv2eL1gFb4PL9L3euoQChn+Kt5+PWlnp5a1yjlh/PPWbg7
 WNdOEiZWdK0xPBYULGOUBAGXQAb/nAUgGMpJnqpmzqRkooUG+h/hAfd/3i4i54iyH1
 agO746uK2poPOCqY7SpjBqKpVsuJIxh6wAIU0GmCbsPrHpGRB4J4kVR0Pj3OrhmAh2
 V1FdUfkDJ6g27IgltiMDtKg9oIe/oIYCCjqTPhf5cy9RqOeQ5bCRNjm3fn5LmPmCVv
 NSF6SpJwBHtHjX8660heXrWp84gbj+PS7BFX20mqz09wYriu2yWRSuhvjzsVrRQXg5
 hlaulZO6N+YDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=cotEkPmk
Subject: Re: [Buildroot] [PATCH 1/1] configs/rock5b: Switch to mainline
 TrustedFirmware
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Quentin,

> I don't use the Rock 5B nor Buildroot for any RK3588 devices, so my 
> "concern" is the only thing I can bring to the discussion. Put as much 
> value as you want into this concern :)
> 
> Up to users/maintainers to decide, just wanted to raise that I found 
> this a bit odd :) Especially since it is possible Buildroot v2024.11 
> will be released before TF-A v2.12 is, meaning we'll need to patch both 
> master and v2024.11 to use the v2.12 version.

Ok, I understand your point. As mentioned before for me it is also ok to 
wait until TF-A v2.12 is released. I will resend the patch then.

Thanks and best regards,
Kilian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
