Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E820AC001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 09:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DE80417C1;
	Sat, 12 Aug 2023 09:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DE80417C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPb6QY4dPsUU; Sat, 12 Aug 2023 09:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53189417CC;
	Sat, 12 Aug 2023 09:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53189417CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CB461BF863
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 09:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35EFC82034
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 09:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35EFC82034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v26-mN9QUE1q for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 09:51:50 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04DE281F04
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 09:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04DE281F04
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 4D6D8A05A5;
 Sat, 12 Aug 2023 11:51:48 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 3417A801B8;
 Sat, 12 Aug 2023 11:51:48 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id CA800100135;
 Sat, 12 Aug 2023 11:51:47 +0200 (CEST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Date: Sat, 12 Aug 2023 11:51:47 +0200
Message-ID: <10318595.nUPlyArG6x@kilian-aisec>
In-Reply-To: <CAOCHtYiuJimX-pF-hUhuK35X+63eE1GJbK=xAZOR73gb8iZkog@mail.gmail.com>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <CAOCHtYjoouGOSwOy1Fh4muYnU3E-yY6jp8GOcy1f=MhCaaAx8w@mail.gmail.com>
 <CAOCHtYiuJimX-pF-hUhuK35X+63eE1GJbK=xAZOR73gb8iZkog@mail.gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2294
X-purgate-ID: 154282::1691833908-5DFFD7B6-97379F4A/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691833908;
 bh=ROxl++X1w2Vz8AV+jDFWKHD8CO78MP/OrNDU3zrJgDA=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=QsGqZQD9lC0Tx108J+4LYPx32f9QjLrDDsOuCTaCnMq1psoVji+mIv4loJM8bthY1
 WopFXaFrSyeJ+P8QmKWfymfuLrqPl3jcGE3fa83O33+GBB+3jFCqF6I1mCpvVS5Czx
 MLjTM5YGVHMAiL3mRSG+ar/WpoeZlzoR9AvpKt7gv6VVa5awemrruRFAVC/UaLrROX
 kw0ZUi41fyZjZg5V7Uga329e6xL0dvE76SuTPto1EOjzpfevaAaiu1vig6dyM+jBhX
 gLdsvm1/hkbm+j30U8zp9PaAE4ZIsYvP8hDZ5Nvo/elStXWKoBdQlhfMR4Q1qb4fah
 VBn0WPvEk4cug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=QsGqZQD9
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
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Robert,

thanks for all the information you provided so far! It is much appreciated!

However, I have to digest all of it, as I am not so familiar with a lot of 
thinks and I will ask some "stupid" questions ;)

[--SNIP--]

> Okay Kilian, these all build with
> x86_64-gcc-13.2.0-nolibc-riscv64-linux.tar.xz

Where exactly do I find kernel.org's x86_64-gcc-13.2.0-nolibc-riscv64-
linux.tar.xz toolchain? (Yes, my questions are that stupid ;)) Should I prefer 
it to the gcc 13.2 toolchain build by buildroot natively?

> opensbi:
> https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-opensbi/-/tree/0.9-> 1.1.2-ubuntu u-boot:
> https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-u-boot/-/tree/beagl
> ev-v2020.01-1.1.2-ubuntu linux:
> https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/tree/beagle
> v-v5.10.113-1.1.2-ubuntu
> 
> For bandwidth issues, please use the github mirrors directly in
> patches for buildroot, as these are push mirrored from
> git.beagleboard.org/ , at worst they lag by 10 minutes after a new
> commit
> 
> opensbi:
> https://github.com/beagleboard/beaglev-ahead-opensbi/tree/0.9-1.1.2-ubuntu
> u-boot:
> https://github.com/beagleboard/beaglev-ahead-u-boot/tree/beaglev-v2020.01-1
> .1.2-ubuntu linux:
> https://github.com/beagleboard/linux/tree/beaglev-v5.10.113-1.1.2-ubuntu

Yes, I saw the notes about the mirrors on github on the beagleboard gitlab 
page. I will use the mirrors!

> Verification ci image, available for the next 14 days..
> 
> https://git.beagleboard.org/beaglev-ahead/xuantie-ubuntu/-/jobs/13303
> 
> ```
> voodoo@hestia:~/Downloads$ unzip xuantie-ubuntu-1.1.2-13303.zip
> Archive:  xuantie-ubuntu-1.1.2-13303.zip
>   inflating: deploy/boot.ext4.xz
>   inflating: deploy/fastboot_emmc.sh
>   inflating: deploy/mac_fastboot_emmc.sh
>   inflating: deploy/root.ext4.xz
>   inflating: deploy/u-boot-with-spl.bin
> voodoo@hestia:~/Downloads$ cd deploy/
> voodoo@hestia:~/Downloads/deploy$ sudo ./fastboot_emmc.sh
> ```

Great, thanks! So this is then meant, that I can use it for myself to see that 
my board boots with this and I can also look what is done in the scripts, so 
that I can reproduce that in the buildroot board support?

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
