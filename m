Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA27C3DA66
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 18:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E82D7612C4;
	Wed, 23 Aug 2023 18:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E82D7612C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXo6BNNTfIcY; Wed, 23 Aug 2023 18:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C8260E00;
	Wed, 23 Aug 2023 18:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29C8260E00
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D83651BF343
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 18:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0E7960E00
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 18:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0E7960E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3AEKLU6YUcM for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 18:43:02 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AC1060B2A
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 18:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AC1060B2A
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 3AE19A080C;
 Wed, 23 Aug 2023 20:43:00 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 1F3A38029A;
 Wed, 23 Aug 2023 20:43:00 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id CFCB12409F9;
 Wed, 23 Aug 2023 20:42:59 +0200 (CEST)
To: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 23 Aug 2023 20:42:59 +0200
Message-ID: <4852937.31r3eYUQgx@kilian-aisec>
In-Reply-To: <CAOCHtYj+02YWQy7pTPwK=LH96fW4cRgPhXS0cE+CXHNmwZtL-A@mail.gmail.com>
References: <20230821223337.9402-1-kilian.zinnecker@mail.de>
 <20230821223337.9402-2-kilian.zinnecker@mail.de>
 <CAOCHtYj+02YWQy7pTPwK=LH96fW4cRgPhXS0cE+CXHNmwZtL-A@mail.gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1398
X-purgate-ID: 154282::1692816180-E99476B4-EB1BAD7D/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692816180;
 bh=jSw4vA6bGofbWKsqsPXXBpbmsLy3hS1pdSgWB7LPh/k=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=yug03OqCQiyxmUg02yt85z0ErNvAUu9sMFFIMtvGqE+W/TRfadpI1ht37ts6aS9AB
 fuagebVUEC2ky4OJM9F6mhs0B5yRqvqhwByzrTvRCtsKTYt6oHvxbspXiTU5XgykfE
 m4KhyY1kk3ZwS+KaIfOoLPW+WPyUafpsblmP4fwTHwy6oZQp7Z+QH91QMK1maaJMYs
 NukpwcANJ0c6evPqjOBalgXnrgtD5jGnDrJ+OCI9Lgn2Fjlcwgylagx1z6hhxIYQDL
 0FwoiN4tpLGQZHuo6FZ87jA95lTSvO8saKLyR3nWa+pDWsZOXz0jD+6ds9U9b9sNUZ
 nz6A0cZGPqdBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=yug03OqC
Subject: Re: [Buildroot] [PATCH v1 1/2] package/xuantie-bins: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Robert,

[--SNIP--]

> > +++ b/package/xuantie-bins/xuantie-bins.mk
> > @@ -0,0 +1,27 @@
> > +#########################################################################
> > ####### +#
> > +# xuantie-bins
> > +#
> > +#########################################################################
> > ####### +
> > +XUANTIE_BINS_VERSION = 604d86f6eb261ab9e53e987852e3aa397b4b16ad
> > +XUANTIE_BINS_SITE = https://github.com/beagleboard/xuantie-ubuntu.git
> 
> Oh, this might be too fast moving of a git repo for this package..
> I've created a new repo for just the firmware:
> 
> https://git.beagleboard.org/beaglev-ahead/firmware
> 
> Since we don't have a source/changelog, Versions will be in different
> directories based on the SDK release (1.1.2) today:
> 
> https://git.beagleboard.org/beaglev-ahead/firmware/-/tree/main/light/1.1.2
> 
> I've also added all the other boards from the repo, the `light-lpi4a`
> is for the https://sipeed.com/licheepi4a

Ah great! I will change my patches accordingly. And I will also then integrate 
that these binaries are then actually used, i.e., actually loaded during boot. 
One more question about the binaries: We still don't know the license for 
those. Did you get any information about this? Or would you mind asking the 
people you got the bins from, whether they may add a license?

Best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
