Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D06EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 17:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F014F606FF;
	Sun,  9 Jul 2023 17:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F014F606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4fBPim6UvKI; Sun,  9 Jul 2023 17:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CC95606ED;
	Sun,  9 Jul 2023 17:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CC95606ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62A941BF289
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 17:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A36C4059D
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 17:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A36C4059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqLzhIhXAW5Z for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 17:16:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 139644054E
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 139644054E
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 17:16:54 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 536B8A2D0F;
 Sun,  9 Jul 2023 19:16:53 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id 374DA80290;
 Sun,  9 Jul 2023 19:16:53 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id 00255A01A6;
 Sun,  9 Jul 2023 19:16:51 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 09 Jul 2023 19:16:51 +0200
Message-ID: <3238022.aeNJFYEL58@kilian-aisec>
In-Reply-To: <20230707075339.7207-1-robertoxmed@gmail.com>
References: <20230707075339.7207-1-robertoxmed@gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 365
X-purgate-ID: 154282::1688923013-737FC199-CB3622AD/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688923013;
 bh=f3/GmdvVJX1VhizJaZKoKgu2zrSHsgQY/nHQYLz6sA0=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=iYgIVGbv32098lCg5Qv79WI+7xTaVpevvJiAH0Bo/cSibmw6RtZZP61Bv2hojU5NH
 LzuMotTV4HNEIF514EOzlytQ3is5kz23MGUwp5x8PIIjtJEGc5bMBIzX0GXgQx9dr6
 eKg1HSDTRUeOfKtrjGkXHJRcwNHDhmTbb0539hYMeIEYf9eSJBx4oVGvTCjwizLcle
 tPKAzJnKdfR+8S3iAdcq1TkoycynPHBU3SMTnfVNpmTzLcSoq6hD8O2W1TbRmeesNl
 AOppbCyyQgW+rmGjIUfv0TrzXEEIh0hf0HZdPtwja2ZAWMeDNinX6ZBTMCPGQTbPtb
 oFV9gS7FPcwCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=iYgIVGbv
Subject: Re: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Bring back the
 configuration for the rockchip rk3399 built by firefly.
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
Cc: Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roberto, All,

> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"

The current buildroot release uses U-Boot 2022.04 as default. Why is there a 
different, older version of U-Boot used (or needed)? If there are no technical 
reasons, I would recommend using a recent (default) U-Boot.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
