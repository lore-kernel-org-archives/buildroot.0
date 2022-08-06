Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1C5C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2B0F82CDE;
	Sat,  6 Aug 2022 22:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2B0F82CDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Affa0THYpH3p; Sat,  6 Aug 2022 22:29:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B6228271A;
	Sat,  6 Aug 2022 22:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B6228271A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABD0F1BF580
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84DF6402BC
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84DF6402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kMa0FbE04mHk for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:28:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23175402BB
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23175402BB
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 22:28:59 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id h28so5170872pfq.11
 for <buildroot@buildroot.org>; Sat, 06 Aug 2022 15:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=WcvFOoTXFPMoIh5+e5XvA0u+xQxXC9eGV4A7oXIJVOU=;
 b=rLB28MQB1s6pPQEEV4WiIFAt3DeMHPLvBgurUXpJbcjcJjzbTul8gzwJPEDeHzC/n+
 PBJIEACChX//ofHfATzQmQakT/E2pj9nAExx3htb1W8Wl+6/rVinYXyRCIQzoituRddV
 5Jewi9fNAKXNIbHpbvGsxuCWN9pYR+wy1YLM6Pp/mR7UhtoWL4ED7UxRwfOc56BgtYJM
 1wd1Xv+XndynepFX0oAbybh1Pl79WhCyym6ZcbmnR3RoAwzVRmW8/Uk+95aH4lCN7SYa
 Nfo44awzRjqrm6WAyuGH3fS4FFohkSOAUnlYpCcUW2Xo6HybNRuVOLCGdE2x5yI98YBn
 U6Iw==
X-Gm-Message-State: ACgBeo19ji+WoRbR0AEf6pxAks4vFl5xCz4v4owG/T1dmzmJGb6f+QPL
 IpoWd6THdiqd2jTBHZXyOu9gnt5w+uMXVv5vL4Q=
X-Google-Smtp-Source: AA6agR7iym4jynGmD1JUpAWYLaAxD4l2MZ75ceATBBEfUTFqFggHYUZWHQjd2XUy/gxcdgHxJ/Oy9g6KxTDM21C6fbo=
X-Received: by 2002:aa7:9386:0:b0:52d:c0e5:51ee with SMTP id
 t6-20020aa79386000000b0052dc0e551eemr12445310pfe.49.1659824938477; Sat, 06
 Aug 2022 15:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220806224338.0159e15c@windsurf>
In-Reply-To: <20220806224338.0159e15c@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 7 Aug 2022 00:28:46 +0200
Message-ID: <CAEyMn7ZtrsEdo18p2pjvdhrROnSemX2spZyxN8Tj67RLTcZG-w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=WcvFOoTXFPMoIh5+e5XvA0u+xQxXC9eGV4A7oXIJVOU=;
 b=ZHNSXRUp6xfrw7Xbs0yB3wVAUZZkJbR/jCzIKZQOR25h46U5YwE45bZaeOChuZ/4aS
 k7CwlByAnqKatWIR4vfUo40yif1ydBZVRY0S1MQVEQC8FbK08oO+zT/FXHXk1VY6DniV
 6b5a7YDG2DQ2QFUTK+8OhGs4z3k6qkRnP7k0H4F9xYTAc7R6cbSz6JqwxCqvYfqAD4mq
 NUlEIyQ4T96tqsRt4aIQHDQQ9M/GFon9CCVEdVYbxdQGNkw91Q43ucOQtuoqHz9P7CW+
 R+IwymnBzpCPB3Pd6INrIn10+tpZwGByPE7nbktmQSZPw1cU9M0jgAM6bviVqn7EGvhW
 t68A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZHNSXRUp
Subject: Re: [Buildroot] Buildroot defconfigs about to be removed
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Filip Skoneczny <fskoneczny@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Peter Seiderer <ps.report@gmx.net>, Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

[snip]

> kontron_bl_imx8mm_defconfig -> -lgnutls -luuid missing when building
> U-Boot. Strange thing is that host-gnutls is definitely built before
> U-Boot, but it doesn't find it. for libuuid,
> BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y is missing
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053608

This is the first time I have been informed about this build failure.
I am surprised that I did not get any mail about this.

I must confess that I could have guessed that this would be the same
error as with the kontron_pitx_imx8m_defconfig. My fault.

Nonetheless I will fix that and send a patch.

-- 
Heiko

> friendlyarm_nanopi_r1_defconfig -> U-Boot needs Python 2.x
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053547
>
> friendlyarm_nanopi_neo_plus2_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053545
>
> friendlyarm_nanopi_neo_defconfig -> U-Boot needs Python 2.x
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053540
>
> friendlyarm_nanopi_neo4_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053537
>
> friendlyarm_nanopi_neo2_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053533
>
> friendlyarm_nanopi_m4_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053529
>
> friendlyarm_nanopi_m1_plus_defconfig -> U-Boot needs Python 2.x
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053526
>
> friendlyarm_nanopi_m1_defconfig -> U-Boot needs Python 2.x
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053522
>
> friendlyarm_nanopi_a64_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053520
>
> friendlyarm_nanopc_t4_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053518
>
> bananapi_m64_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053420
>
> bananapi_m2_plus_defconfig -> U-Boot needs Python 2.x
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053415
>
> bananapi_m1_plus_defconfig -> U-Boot needs Python 2.x
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053412
>
> bananapi_m1_defconfig -> Device Tree syntax error
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053409
>
> arm_juno_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053341
>
> amarula_a64_relic_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053333
>
>
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
