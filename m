Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA95C19F2B
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 09:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CDFE83F91;
	Fri, 29 Jul 2022 09:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CDFE83F91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9T6j3enldE1k; Fri, 29 Jul 2022 09:12:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CEAE83F7E;
	Fri, 29 Jul 2022 09:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CEAE83F7E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 593FF1BF339
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 09:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23CAE60D69
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 09:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23CAE60D69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tfXeKSzeHja for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 09:12:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A643F60B32
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A643F60B32
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 09:12:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B91654000E;
 Fri, 29 Jul 2022 09:12:30 +0000 (UTC)
Date: Fri, 29 Jul 2022 11:12:29 +0200
To: Jagan Teki <jagan@amarulasolutions.com>, Marcin Niestroj
 <m.niestroj@grinn-global.com>, Suniel Mahesh <sunil@amarulasolutions.com>,
 Julien Olivain <ju.o@free.fr>, Davide Viti <zinosat@gmail.com>, Louis
 Aussedat <aussedat.louis@gmail.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Marek Belisko <marek.belisko@open-nandra.com>,
 =?UTF-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>, Mike Harmony
 <mike.harmony@snapav.com>, Filip Skoneczny <fskoneczny@gmail.com>
Message-ID: <20220729111229.4acffff8@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659085952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xP/1TaHp4nBPpbA69mGGi+hOhL6I+lpq6J+RHNQyF+E=;
 b=WIorQ62vtlZoBLuUBsPpbKI1qddkCfYR8g1T5/L0YAPk7ZKW5IzwuFDicoBhMDaWLNUHWe
 eRKCRZXMelCSaZYgI3Ne6YqGU8vOeKM2Q8M820EtDLVeXE5OSOR+h6r2EC/MzAZeHumR71
 kdkm2/9SWsK+sPFKHdhzQEq8bbSqNTEWabRPHIAuhXUTwepYM0eByF0cS36hpl72kKn9yC
 SEQwlMLykrvf65zIDpZ1Bc0XJ/E0PCjPbj6s5u6T+cmNvnm9KF+70I9wnxoGVU3Bu5hLRy
 r3QXvlVOBHXL+E8Pc6bS2BL/sh9Y5HLjXn8O9JJg9UxiufEO5DlrL8oXMBT5YA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WIorQ62v
Subject: [Buildroot] Help to fix your Buildroot defconfigs
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

You are receiving this e-mail because you are the maintainer of one or
several defconfigs in Buildroot, which are now failing to build in our
CI.

Could you please have a look at the failure (see links below), and
submit patches to address the issues affecting your defconfigs?

If you are no longer interested in maintaining your defconfig, let us
know, and we will remove it from Buildroot.

We would like all those issues to be fixed for our upcoming Buildroot
2022.08 release due end of August. Therefore, if we do not receive a
fix by then, the failing defconfig will be removed.

Here is the complete list of failing defconfigs, alongside with the
failure reason and the link to the build log:

pine64_sopine_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800954

pine64_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800951

orangepi_zero_plus_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800936

orangepi_win_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800929

orangepi_rk3399_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800927

orangepi_prime_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800927

orangepi_pc2_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800927

orangepi_one_plus_defconfig -> syntax error in U-Boot Device Tree
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800907

imx8mpico_defconfig -> syntax error in U-Boot Device Tree
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800735

imx8mmpico_defconfig -> syntax error in U-Boot Device Tree
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800730

friendlyarm_nanopi_r1_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800656

friendlyarm_nanopi_neo_plus2_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800653

friendlyarm_nanopi_neo_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800648

friendlyarm_nanopi_neo4_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800643

friendlyarm_nanopi_neo2_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800637

friendlyarm_nanopi_m4_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800634

friendlyarm_nanopi_m1_plus_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800629

friendlyarm_nanopi_a64_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800622

friendlyarm_nanopc_t4_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800619

bananapro_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800516

bananapi_m64_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800514

bananapi_m2_plus_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800509

bananapi_m1_plus_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800507

bananapi_m1_defconfig -> syntax error in U-Boot Device Tree
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800505

Thanks for your contribution to Buildroot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
