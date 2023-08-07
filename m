Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123B6EB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 11:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADDE3405F9;
	Mon,  7 Aug 2023 11:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADDE3405F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yz9jlJ-JzS-y; Mon,  7 Aug 2023 11:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD773404C8;
	Mon,  7 Aug 2023 11:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD773404C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 798011BF366
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 11:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AA2F40292
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 11:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AA2F40292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lZ236rB2IUr for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 11:47:02 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DAB1401A4
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 11:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DAB1401A4
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id A7CCAA0554;
 Mon,  7 Aug 2023 13:47:00 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id 7A462801A9;
 Mon,  7 Aug 2023 13:47:00 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id 1BB36A042A;
 Mon,  7 Aug 2023 13:47:00 +0200 (CEST)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 07 Aug 2023 13:46:59 +0200
Message-ID: <1940173.PYKUYFuaPT@kilian-aisec>
In-Reply-To: <20230726214300.GD3544423@scaer>
References: <20230726180433.7561-1-kilian.zinnecker@mail.de>
 <20230726180433.7561-3-kilian.zinnecker@mail.de>
 <20230726214300.GD3544423@scaer>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 804
X-purgate-ID: 154282::1691408820-3DFFB199-B4DB881E/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691408820;
 bh=3JNZ76UJkY+nD7kLnz1P0u0GE9P8YyTn+FH5G9LZ7q4=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=b6ZyRYfm7+a4mxSKunBE33LbUCPlanH6KaO6b9p6+Xp0XPw/euarLzcyjnnMdejIQ
 7IS0E17kW7kQKaiHNbkD0FsafVZX6rDDKwvd2305qs7s0VJwZtg2cQqoN6xPafe221
 +e5q4xxIQxZSnpgU9t8P4u/WdOk1YJO6nC+TBI5IAOEW7b7W3uHkhERAltr5TOFJXv
 zfDdGGCWFKLLAanqpnS9r/2bLZQ4tRd6FnR0QRqqUrmsrFCdbOWKzeCX5lVYfPPD01
 LcGoDYCOOpuJ7YF8tNE+9mwZh7ESk9XS77FgbqsSMZUPIJKkUrlfH7YKmQdh9LDk1W
 DDpE12aOcSsJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=b6ZyRYfm
Subject: Re: [Buildroot] [PATCH v8 2/3] boot/uboot: Add support for Rockchip
 binary blobs
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
 Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann, all,

[--SNIP--]

> > +ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
> > +UBOOT_DEPENDENCIES += rockchip-rkbin
> > +define UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
> > +	$(INSTALL) -D -m 0644 $(@D)/u-boot-rockchip.bin
> > $(BINARIES_DIR)/u-boot-rockchip.bin +endef
> > +UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
> > +ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME),"")
> > +UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/${notdir $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))}
> I've re-used the already-qstripped variables from the rockchip-rkbin
> package.
> 
> Also, I switched from using curly brances to the ;ore standard (for
> Buildroot) parethesis.

Yes, much better of course, thanks!

[--SNIP--]

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
