Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA144C3DA66
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 18:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BDE0612BB;
	Wed, 23 Aug 2023 18:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BDE0612BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LYElBI3n574x; Wed, 23 Aug 2023 18:39:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 944D560E00;
	Wed, 23 Aug 2023 18:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 944D560E00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 706B81BF343
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 18:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FC5E40562
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 18:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC5E40562
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kl1u0q9cns-2 for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 18:39:28 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D22E40182
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 18:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D22E40182
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 94965A065E;
 Wed, 23 Aug 2023 20:39:26 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 4642F8029A;
 Wed, 23 Aug 2023 20:39:26 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id E6018240A24;
 Wed, 23 Aug 2023 20:39:24 +0200 (CEST)
To: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 23 Aug 2023 20:39:24 +0200
Message-ID: <12269243.O9o76ZdvQC@kilian-aisec>
In-Reply-To: <CAOCHtYiTr1rKdoxBDZ1Y6xVcTXJFtkXuGOGdA7hLF55LuJrdOg@mail.gmail.com>
References: <20230821223337.9402-1-kilian.zinnecker@mail.de>
 <20230821223337.9402-3-kilian.zinnecker@mail.de>
 <CAOCHtYiTr1rKdoxBDZ1Y6xVcTXJFtkXuGOGdA7hLF55LuJrdOg@mail.gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1308
X-purgate-ID: 154282::1692815966-A2FFC6B4-60AFF17A/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692815966;
 bh=W0tgtUXqVjm4202HfqiGemBEDQVTvEOICdNodAMbdxQ=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=S5JR15a1OyT7sG/+TArR39hhoNvRD0JEL/V/UYtPVGVT4Fz3CzzGvUF7HqSHHPQYz
 RcOCiwxIGIzNwRc4SpDObAwTvWBq8q2o7dW5TLnFBJgZMkPEwfcvu6APyeUjbxiXsM
 F20VVYz8AHJYgetaw2PkskjaTdZ/OqcUEa1dwRZKcSjRXnhF4B3kumtXwReJ8L1O2q
 1E+ASn9e1zUf+1RgjbQ8YsKAddauY0wpFViJZlpJTURaOXEJvXPTxjeZPavrdjs1xy
 NpJPTijzy4E+3t5vl5QELuc+rpceDY+0CJi1GY0JokuZbUKWsLxotrIpN5LSimIkct
 08hN5KP9n5/yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=S5JR15a1
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/beaglev_ahead: new defconfig
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

> > +diff --git a/board/thead/light-c910/light.c
> > b/board/thead/light-c910/light.c +index 8d5478e916..1448db974e 100644
> > +--- a/board/thead/light-c910/light.c
> > ++++ b/board/thead/light-c910/light.c
> > +@@ -2282,6 +2282,7 @@ int board_late_init(void)
> > +       light_usb_boot_check();
> > +       do_firmware_load();
> > +       ap_peri_clk_disable();
> > ++      (void)env_set("bootcmd", "fatload mmc 1:1 ${kernel_addr_r} Image;
> > fatload mmc 1:1 ${fdt_addr_r} light-beagle.dtb; setenv bootargs
> > root=/dev/mmcblk1p2 rootfstype=ext4 rootwait ro console=ttyS0,115200
> > earlycon clk_ignore_unused net.ifnames=0; booti ${kernel_addr_r} -
> > ${fdt_addr_r};"); +       return 0;
> 
> uhoh!! I was hoping extlinux.conf in the file system was enough, we
> need to fix this in our u-boot branch so it just scans for
> extlinux.conf (distro_boot)

That would be great! I currently changed it such, that a boot.scr is loaded 
which then contains the bootcmd. However, if it was possible to not have to 
patch the code, that would be great. For now this also works and I can 
continue, so that there is no hurry. However, please send me a note once you 
changed it, so that I can change my patches accordingly :)

Best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
