Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BB3C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 13:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B238A404D0;
	Sat,  6 Aug 2022 13:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B238A404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FyjdRxfRRMPF; Sat,  6 Aug 2022 13:45:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA66D40289;
	Sat,  6 Aug 2022 13:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA66D40289
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0EB1BF2B5
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 13:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3788560B59
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 13:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3788560B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bo6s8_ae6MBy for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 13:45:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 200E960B54
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 200E960B54
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 13:45:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 177D91BF203;
 Sat,  6 Aug 2022 13:45:39 +0000 (UTC)
Date: Sat, 6 Aug 2022 15:45:39 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220806154539.5e90c79e@windsurf>
In-Reply-To: <20220717184246.GV2249625@scaer>
References: <20220717173510.1388390-1-thomas.petazzoni@bootlin.com>
 <20220717184246.GV2249625@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659793540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SUVEpdE0jID3wXF9UynUpOG0E7kDGVafisv208GQxjM=;
 b=LU5zKpTFWPGwhfLC3sQK86e67XIEP6zPOW68bB939XP6KeEa1dbIE2RAREm9MgNJZGyHXZ
 eST0Rfp/ccfwysXe6Xxn/yZM5RWzlzaoOyOYaZyvuvtWE5d8s3PzGmkjgckboyc8C0Rn4F
 HG07z7Q43f0fF9UzmRm8BXKdXPPNKGngZMH9XOHx7kajJSFQMb99gmdMNHBjpz20Had89R
 ZBfkucp5DiN1DbtKGv+FE4XRAbn3DjpPvYOmSUuD97a63oj1n5jyWIJtcUBtSf6hrIs/EL
 rXoBBcGteyY6UepmJKvmJNKiVdOS4RUjPtydbtabYr3sf9sTbpd+wpl8/IDsQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LU5zKpTF
Subject: Re: [Buildroot] [PATCH] package/alsa-utils: fix two build issues
 following 1.2.7 bump
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 17 Jul 2022 20:42:46 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +Commit 90f59671784a7e47b40485095cd66892d4840ed7 ("topology:
> > +pre-processor: Move the call to expand variables") modified aplay by
> > +unconditionally invoking features of the use case manager (UCM) from
> > +alsa-lib. However, alsa-lib can be compiled with UCM support.  
> 
> I guess you meant:  alsa-lib can be compiled with*out* UCM support.

Yes, correct. Thanks for fixing this!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
