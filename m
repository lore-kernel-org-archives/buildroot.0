Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A06EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 07:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10130400D1;
	Fri, 11 Aug 2023 07:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10130400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7KPtcrnE9_bg; Fri, 11 Aug 2023 07:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34A1240144;
	Fri, 11 Aug 2023 07:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34A1240144
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4171BF228
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 07:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5377560AAE
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 07:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5377560AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SCiSAlNH1-M for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 07:07:34 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30B4760AAD
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 07:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30B4760AAD
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 7391DA081F;
 Fri, 11 Aug 2023 09:07:32 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 584A3A00E2;
 Fri, 11 Aug 2023 09:07:32 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 1FF5BC002F;
 Fri, 11 Aug 2023 09:07:32 +0200 (CEST)
To: buildroot@buildroot.org, Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 11 Aug 2023 09:07:31 +0200
Message-ID: <4849938.31r3eYUQgx@kilian-aisec>
In-Reply-To: <CAOCHtYhA0Msco4rEQvRB9PYsMT1VgUdvaeuTwLiByCS1tZ+R7w@mail.gmail.com>
References: <2691942.mvXUDI8C0e@kilian-aisec> <5712460.DvuYhMxLoT@kilian-aisec>
 <CAOCHtYhA0Msco4rEQvRB9PYsMT1VgUdvaeuTwLiByCS1tZ+R7w@mail.gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1348
X-purgate-ID: 154282::1691737652-A6FF9C09-54E25926/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691737652;
 bh=QBAStyrMf7tBB1U1xr2UNhBSSUcKqIMMKMrVfSCoTFY=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=OLRIEMT0a/Wd5qz0Z5UHdOilj5RBvL0Ui5LzL8YwmxdsB8UEJYSmTpJzgbs+uvo8K
 /+xbQSrwVeyFy51l/Px9YaIAI8s1nYrHcx7gqK/9TW/34v8vs53GTUyvS/D4m94OFH
 smJZbGGLxanyXWIDz8kc9RG9vk+NjOWCaDWULhDFhcIXsoIIC0K3VbuEE4038ZV8uh
 p1SyGNpyafCx07le/1FsWPADO9ejG2aCwQmINM0v/8Fr3FpcfbZ3mi/zeSK6F9BoFA
 gKgv8gq8gnZYQpnl2lEM9Wsd4Xi2bd9D5MOvhNiWVid4l2zzIbQQ5Oe8AkUXN4h/UD
 Hfq1/WZXarJFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=OLRIEMT0
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Robert,

> > > You 'need' two magical closed source bins:
> > > 
> > > https://git.beagleboard.org/beaglev-ahead/xuantie-ubuntu/-/tree/master/b
> > > ins
> > > 
> > > light_aon_fpga.bin
> > > light_c906_audio.bin
> > > 
> > > light_aon_fpga.bin: "aon" is an `Always On` fpga binary used for power
> > > management... If you don't have this, the board will boot, but things
> > > like cpufreq don't work..
> > > light_c906_audio.bin: Probably Audio, never really tested it too much...
> > 
> > If we need these binary blobs, I think we also need the licensing
> > information about the blobs. We had a similar case with blobs from
> > Rockchip for the Radxa Rock 5B. Can you tell what the license for those
> > blobs is? Do they originate from another repository?
> 
> They are pure 'blobs', sadly they are just listed here:
> 
> https://github.com/beagleboard/xuantie-yocto/tree/Linux_SDK_V1.1.2-light-bea
> gle/meta-light/recipes-bsp/opensbi/opensbi
> 
> no license or any other info..

The commit, which adds the binaries seems to contain the email addresses to 
some developers from alibaba (from some added patches) and one alibaba service 
email. Would you mind if I kindly ask them about the licensing status of the 
binaries, i.e., whether they can provide a LICENSE file?

Best regards,
Kilian



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
