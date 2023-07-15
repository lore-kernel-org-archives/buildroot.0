Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94146C001DC
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 19:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A252819BE;
	Sat, 15 Jul 2023 19:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A252819BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8RqGCx8599a0; Sat, 15 Jul 2023 19:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F058148F;
	Sat, 15 Jul 2023 19:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87F058148F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 288D81BF2E5
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01B798148F
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01B798148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXocnMfAbYKQ for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 19:51:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4732780BD3
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4732780BD3
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 19:51:24 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 8DA1BA014C;
 Sat, 15 Jul 2023 21:51:22 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix01.mail.de (Postfix) with ESMTP id 71764801AB;
 Sat, 15 Jul 2023 21:51:22 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id EA282A0124;
 Sat, 15 Jul 2023 21:51:21 +0200 (CEST)
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Date: Sat, 15 Jul 2023 21:51:21 +0200
Message-ID: <5851324.MhkbZ0Pkbq@kilian-aisec>
In-Reply-To: <20230714234703.78d5acc9@windsurf>
References: <20230714064413.11433-1-kilian.zinnecker@mail.de>
 <20230714064413.11433-4-kilian.zinnecker@mail.de>
 <20230714234703.78d5acc9@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 731
X-purgate-ID: 154282::1689450682-C0B48647-FC173900/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689450682;
 bh=bLEkABs66XFRbbmayH1AuZZWdP5v5v56DhAt9Fwp5ao=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=iiyX6tmJYWvEfEMQ8eIOEGKNboPuH/UUrj3d7KuyA8Ubz2RBYNdSGEVv3wKeVWlIO
 PSpaIYfG6pmxIN51mpPMhAQaKrYG8BdEdUPI2xWxuXYC8kHcqK/ur2SfXjLZOQ2Q9M
 E9MvLiV/6ORfqBopzMrzKPq8b27w6oX0uFS0GSumT/xSs21Ox99sWK9znGIxdHKtSs
 u3UOJUV41Oh0gwwpDHLUbZxiN9De57hKloSdkB4/Av0HOYtU3/dFxbq7dQdJ4eCtEh
 4D+hvcJJ4qQkgXdUiXcG0RMGEbxd74tgUtnd0lmJ++M0d1v6z0R1bgRSeF8RGTArIV
 nGHas/9jwF9tQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=iiyX6tmJ
Subject: Re: [Buildroot] [PATCH v6 3/3] board/radxa/rock5b: Add sdcard image
 scripts
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

> > Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> 
> This should be squashed in the patch adding the defconfig. Indeed
> without this, the defconfig doesn't produce anything that can easily be
> booted.

Makes sense. In v7 the files in the board directory and the defconfig are one 
commit.

> > +rm -rf "${GENIMAGE_TMP}"
> > +
> > +genimage \
> > +  --rootpath "${TARGET_DIR}" \
> > +  --tmppath "${GENIMAGE_TMP}" \
> > +  --inputpath "${BINARIES_DIR}" \
> > +  --outputpath "${BINARIES_DIR}" \
> > +  --config "${GENIMAGE_CFG}"
> 
> Perhaps you could simply call ./support/scripts/genimage.sh directly?

Yes, totally right. I fixed it.

Thanks and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
