Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DADEB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 21:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E313260B4E;
	Sun,  2 Jul 2023 21:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E313260B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGkGSz0ZMpjV; Sun,  2 Jul 2023 21:05:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B2060A92;
	Sun,  2 Jul 2023 21:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21B2060A92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1251BF296
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 21:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55EEC40474
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 21:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55EEC40474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IJlWVIgEwR6 for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 21:05:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BCA64046D
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BCA64046D
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 21:05:48 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 6E690A064A;
 Sun,  2 Jul 2023 23:05:47 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id 542C780154;
 Sun,  2 Jul 2023 23:05:47 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id AF9BEC00AC;
 Sun,  2 Jul 2023 23:05:46 +0200 (CEST)
To: buildroot@buildroot.org, Andreas Ziegler <br015@umbiko.net>
Date: Sun, 02 Jul 2023 23:05:45 +0200
Message-ID: <13297217.uLZWGnKmhe@kilian-aisec>
In-Reply-To: <b0bc0426b400fa2f5402bdf85703a132@umbiko.net>
References: <mailman.173.1688221173.139798.buildroot@buildroot.org>
 <12237337.O9o76ZdvQC@kilian-aisec>
 <b0bc0426b400fa2f5402bdf85703a132@umbiko.net>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3168
X-purgate-ID: 154282::1688331947-B67FEC09-98E5CA11/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688331947;
 bh=PtBWb6iabNyudlfEqjckEWoiKJ+8BmVHho7gq+iVy58=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=w55tESeUiG2bWNVBUkeY25KUhqOE0yy4cVjnfgrrVXlZ9z8dIyCewVXOKejRh4o80
 0K5X9U5stN5+STUzFT4/BaCs4nmAeC9+vTQdOURawYU1s0B92PgI0ngAVeQ6DgfdN9
 ICM+RLhiQJCYWbVTPOMi/Td3vo5kYE5XNC1/umQ/238KJ6FFLSY5CPV22Q4LvKztMf
 FZBWRJmXe6Zowy3QiImaE6vfergZh6MVlY7nz9W7FR7WhuNdUrlcn/3knFprfULH6c
 H7rkmFkSaZSk+T+nc++SVcYoiHueqfhqnYxB/erW58j/74jPiY+9hbLMDUJBaNgLQI
 5FUbXqGKixc/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=w55tESeU
Subject: Re: [Buildroot] [PATCH 1/3] package: add rockchip-rkbin package
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

Hello Andreas,

> Using an email program may or may not work. Sometimes the message is
> mangled in collaboration between email client and patchwork. Usually you
> send the mail from the command line, using git send-email. The
> information is buried somewhere in the manual [1].
> 
> Excerpt from 'Notes to myself':
> 
> (This is a staging tree, actual changes reside in a different place.)
> 
> In case of a revision, revert the last patch
> # git reset --soft HEAD~1
> # git restore --staged <relative-path-to-file>
> 
> Or checkout the relevant file(s) to overwrite the changes:
> # git checkout <relative-path-to-file>
> 
> Make changes, add and commit
> # git add <relative-path-to-file>
> # git commit -m "commit message"
> 
> New patch references the last message on the buildroot list
> # git format-patch -v2 -M -n -s -o outgoing origin/master
> --in-reply-to=<Message-ID>
> 
> Edit patch description, check if 'v2' in subject line exists. Add
> version information below triple dash (---).
> 
> Determine CC list
> # utils/get-developers outgoing/*.patch
> If that lists only the TO address, try additionally
> # utils/get-developers -p <packagename>
> 
> Send patch
> # git send-email --to buildroot@buildroot.org --cc <package developer>
> --cc <other interested party> outgoing/0001-<commit message>.patch

Thanks a lot! I just resend the new version of the patches, but I accidentally 
did not address them directly to you as well. They are on the mailing list.

> > Also, is there a way to add a flag to the Config.in of uboot, which
> > makes a
> > "depends on rockchip-rkbin" if the BR2_TARGET_UBOOT_BOARD_DEFCONFIG
> > equals
> > "rock5b-rk3588", "evb-rk3588", or "neu6a-io-rk3588"? Or is it
> > beneficial to a
> > an option like BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN?
> 
> There is something comparable which handles
> BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE. If it works like it is, just keep
> it.

I added a corresponding option for the rockchip-rkbin dependency.

> > +if BR2_PACKAGE_ROCKCHIP_RKBIN
> > +
> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_RK3588_DDRFW
> > +	string
> > +	default "rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin"
> > +
> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_RK3588_EL3FW
> > +	string
> > +	default "rk3588_bl31_v1.38.elf"
> > +
> > +endif
> 
> This is highly unusual, normally definitions like these should go into
> the .mk file. And yes, I know you need them later in the defconfig.
> Tells me that the uboot configuration is highly convoluted ... Any
> chance to use generic names (e.g. ddr.bin, bl31.bin) in BINARIES_DIR,
> put them in clear text in Config.in and defconfig and perform the
> copying of rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin -> ddr.bin in
> the .mk file?
> 
> Any thoughts from others?

Since I "hard coded" the commit id of the git repository for rockchip-rkbin 
inside the .mk file anyway, I think it is only consistently to then also "hard 
code" the binary filenames into the .mk file as well: After all, the names only 
change, if someone changes the commit id inside the same .mk file.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
