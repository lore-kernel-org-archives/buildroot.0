Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BB0EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 19:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F308179A;
	Sun, 20 Aug 2023 19:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F308179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Zd42YDBTu-8; Sun, 20 Aug 2023 19:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B833881750;
	Sun, 20 Aug 2023 19:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B833881750
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29E591BF403
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 19:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02E9160AFF
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 19:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02E9160AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Z7vYJmyJ-Mu for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 19:09:11 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B781760AFE
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 19:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B781760AFE
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id E5D00A0440;
 Sun, 20 Aug 2023 21:09:08 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id C7D6AA00E2;
 Sun, 20 Aug 2023 21:09:08 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 881BF240BC9;
 Sun, 20 Aug 2023 21:09:08 +0200 (CEST)
To: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 20 Aug 2023 21:09:08 +0200
Message-ID: <2899600.e9J7NaK4W3@kilian-aisec>
In-Reply-To: <20230820160831.GP1778688@scaer>
References: <20230820152011.81543-1-kilian.zinnecker@mail.de>
 <20230820152011.81543-2-kilian.zinnecker@mail.de>
 <20230820160831.GP1778688@scaer>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1969
X-purgate-ID: 154282::1692558548-80FF86B4-FCDA85BA/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692558548;
 bh=Y8MEwj4YZNynfu+W8Cyrf0ajmGQoamTCk2LL48aDsy8=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=dBYD5iyvWimwfSioopqLG4gabXYyHUTFj+rNYhAcVgw3dxNkMKr9/jTIqi769wBL8
 9I/kobu8UW4WRxCBbjUF9fNeJwhYYifH2ULWFy6tPU+g7q5oiokX+KyxN07qJWa3/L
 JjFw3LzJIQ1h11bxqEp3sBmtrgvGMWZF7yosuESk5dAKXRtJ1ImS5yufmMGL+0LJoA
 EyIucX8BVTqv6bV224q6zya9D+IX+ETz4EqY5+HdR/cHIorR/ufR/RPG5xdu2ACqj8
 +/pztz9piU/5H0WRjudoPMEw70Br4+9wtaYAl8zj+3NDhbjNHphNdZYBb+fpyF0mvD
 0FfCMo7rgTFGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=dBYD5iyv
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/rock5b: Add patches to fix
 gcc12 warnings
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

[--SNIP--]

> > +CONFIG_WL_ROCKCHIP=n
> 
> =n is not valid in kconfig to disable a symbol; instead, they must be
> unset:
> 
>     # CONFIG_WL_ROCKCHIP=n
> 
> See for example:
> 
>     board/olimex/a20_olinuxino/linux-disable-lima.fragment
>     board/solidrun/macchiatobin/uboot-fragment.config
>     board/stmicroelectronics/stm32f769-disco/linux-sd.fragment
>     board/solidrun/clearfog_gt_8k/uboot-fragment.config

Thanks. I changed it accordingly.

[--SNIP--]

> > +Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > +Tested-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > +Link:
> > https://lore.kernel.org/netdev/20220212090811.uuzk6d76agw2vv73@pengutroni
> > x.de +Cc: Jakub Kicinski <kuba@kernel.org>
> > +Cc: "David S. Miller" <davem@davemloft.net>
> > +Cc: netdev@vger.kernel.org
> > +Signed-off-by: Kees Cook <keescook@chromium.org>
> > +Signed-off-by: David S. Miller <davem@davemloft.net>
> 
>     $ ./utils/docker-run make check-package
>    
> board/radxa/rock5b/patches/linux/0001-etherdevice-Adjust-ether_addr-prototy
> pes-to-silence-.patch:0: missing Upstream in the header
> (http://nightly.buildroot.org/#_additional_patch_documentation)
> board/radxa/rock5b/patches/linux/0002-mm-page_alloc-fix-building-error-on-W
> error-array-com.patch:0: missing Upstream in the header
> (http://nightly.buildroot.org/#_additional_patch_documentation)
> 
> Also, it misses your own Sign-off line:
> 
>     Upstream:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?
> id=2618a0dae09ef37728dab89ff60418cbe25ae6bd Signed-off-by: Kilian Zinnecker
> <kilian.zinnecker@mail.de>

Thanks, I was absolutely unaware, that adding a signed-of-by in case one 
commits other's patches as patch files was necessary and also that an upstream 
link must be provided. I tried again - hopefully I did it right.

I send a v3 of the patch.

Thanks and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
