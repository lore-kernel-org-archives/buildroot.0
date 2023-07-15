Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E96C0015E
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 19:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1E4E819D2;
	Sat, 15 Jul 2023 19:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1E4E819D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRtFP7hMlq4b; Sat, 15 Jul 2023 19:49:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 222328175A;
	Sat, 15 Jul 2023 19:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 222328175A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57F891BF2E5
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 313368175A
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 313368175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysJr1d2ZedWP for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 19:49:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70C768148F
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70C768148F
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 19:49:53 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id B3AA5A03D9;
 Sat, 15 Jul 2023 21:49:51 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix02.mail.de (Postfix) with ESMTP id 97CF7A03C3;
 Sat, 15 Jul 2023 21:49:51 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id 38608A01B2;
 Sat, 15 Jul 2023 21:49:51 +0200 (CEST)
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Date: Sat, 15 Jul 2023 21:49:50 +0200
Message-ID: <9137639.CDJkKcVGEf@kilian-aisec>
In-Reply-To: <20230714234440.46a85e82@windsurf>
References: <20230714064413.11433-1-kilian.zinnecker@mail.de>
 <20230714064413.11433-3-kilian.zinnecker@mail.de>
 <20230714234440.46a85e82@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 710
X-purgate-ID: 154282::1689450591-B97F8647-C5B7DD25/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689450591;
 bh=YZEckPfm6Y37xUJUDXIkIOK2AQNbLPiPM5sYJyG8KdI=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=DXPYXDn1y4uKEFh2LsdnIDdV9JS2x8Ivx32sXsmJ9p57spnXKYyQsG/pg7+RAtNDc
 kTKNo8owbHa7qP8jO9qehsRjTOcwcyyjmq0Aim+BvIytkI3y1D2NaHEQdXC3LhAczT
 HjroTwsUw7ciOuTabKkD/Lj5Q6txlU5KzyOWSQIZsR8trSK/craKfXAYtVW61QV+oA
 Y5MQuO2e9qdIFU3Enj2ImSYuzbd7NZkj13tIbKWIlL9qb10uCUY7b+py1pAXR+2cJS
 swsnuy4h3LiyfSuf4ey7fQKPeErOmsDvzxJ3x8xfXvWfyNC7gueUaXyp2hFTJtTAzw
 Gz8gHJ3w/F82A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=DXPYXDn1
Subject: Re: [Buildroot] [PATCH v6 2/3] configs: add rock5b/rock5b_defconfig
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> The commit title should be:
> 
> 	configs/rock5b: new defconfig

Thanks, fixed  in v7.

> > +BR2_TARGET_GENERIC_HOSTNAME="rock5b"
> > +BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
> > +BR2_SYSTEM_DHCP="eth0"
> > +BR2_USE_WCHAR
> 
> Not needed, especially since it has probably no effect.

Thanks, also fixed in v7.

> > +BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
> > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment
> > "
> > +BR2_PACKAGE_AVAHI=y
> > +BR2_PACKAGE_AVAHI_DAEMON=y
> > +BR2_PACKAGE_OPENSSH=y
> 
> Please drop those 3 options, we want a minimal configuration.

Thanks, this one as well.

Best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
