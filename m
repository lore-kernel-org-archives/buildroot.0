Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58059C001DF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 18:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 009EA81448;
	Wed, 26 Jul 2023 18:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 009EA81448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqNWdoCfwTM7; Wed, 26 Jul 2023 18:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48BC581EB7;
	Wed, 26 Jul 2023 18:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48BC581EB7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9334F1BF421
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 18:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C80660F23
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 18:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C80660F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_aQ0ueBmHL0 for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 18:28:59 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82FA060BC7
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 18:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82FA060BC7
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id AFDF3A0EA4;
 Wed, 26 Jul 2023 20:28:57 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id 9374980171;
 Wed, 26 Jul 2023 20:28:57 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id D00A0A0367;
 Wed, 26 Jul 2023 20:28:56 +0200 (CEST)
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Date: Wed, 26 Jul 2023 20:28:56 +0200
Message-ID: <4498335.LvFx2qVVIh@kilian-aisec>
In-Reply-To: <3751483.kQq0lBPeGt@kilian-aisec>
References: <20230714064413.11433-1-kilian.zinnecker@mail.de>
 <20230714234326.1ab918e8@windsurf> <3751483.kQq0lBPeGt@kilian-aisec>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1645
X-purgate-ID: 154282::1690396137-9D67D199-A102ED31/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1690396137;
 bh=M1dPuwGabQRywgGY63CXDSr3SxPlyx9YNss8ZXAzx3U=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=P418QQfXj/dGcoNK9eT7tIET5ZRGP7ogPG8nHbgMl5N3SZUkHnkf0hwk2vIJa5yz7
 zmu1p8NzFaJ0bc1IF+TMfqYFgZo3m1YabNRMMZ4i02TV5OQsTHCKftwQLSZg346Ay2
 8ppan0r1xV83iQjmam6zN3xVrUZdBruuouCp2ZkzYniZSyKj3Fv3o6TkvQ9kZ5tBnn
 ik7jHGQp+5lIgD6Fz0HbX5EHj7K8BpQnyeJAVpoGKjNrGVrHBdnad8lX4/LWo5nIFB
 QJeEEqaEdJq5fyp1uhydV6ZG3js0eyCDURRPSxbepHTDnuV8XTdixNGFsjhhXhxwqD
 3kcAR/Bxgr0NQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=P418QQfX
Subject: Re: [Buildroot] [PATCH v6 1/3] package: add rockchip-rkbin package
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

Hello Thomas, all

> > > +ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
> > > +ROCKCHIP_RKBIN_REDISTRIBUTE = NO
> > 
> > This is the problematic part I believe. What is the license of this
> > stuff? Without any license, nobody is allowed to redistribute it. So as
> > it is, all images produced by Buildroot with this package cannot be
> > redistributed, making them quite useless, unless it's used by a
> > hobbyist building his own images for his own usage, without any
> > redistribution.
> > 
> > We have the same issue with some Amlogic blobs I believe. Blobs are
> > annoying, but they are even more annoying when there's no license
> > attached to them that allows redistribution.
> 
> Well, that seems to be unfortunate. I guess then, there is no point in
> integrating all this into buildroot, if the binaries are not allowed to be
> redistributed?
> 
> I wrote an email to some of the Rockchip contributors of the rkbin
> repository, asking them what the license is, regarding the binaries. I hope
> to get an answer soon, and that a LICENSE file is added to the repository.
> Let's see ...

Rockchip uploaded a license file to their rkbin repository:

https://github.com/rockchip-linux/rkbin/blob/master/LICENSE

It does allow redistribution of the binaries. I made an 8th version of the 
patches, removing the "ROCKCHIP_RKBIN_REDISTRIBUTE = NO" and adding a 
"ROCKCHIP_RKBIN_LICENSE_FILES = LICENSE". I sent the patches to the buildroot 
mailing list. Are there more things, which would need to be fixed, or would 
this be sufficient to add this board support to buildroot?

Best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
