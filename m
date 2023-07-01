Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BCDEB64DD
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8DE440AB6;
	Sat,  1 Jul 2023 20:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8DE440AB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 79ZyXayicjWF; Sat,  1 Jul 2023 20:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC9A640AB9;
	Sat,  1 Jul 2023 20:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC9A640AB9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21B7F1BF2B7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED8B94174C
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED8B94174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rAbCSMWSloPp for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:11:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A884C41744
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A884C41744
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:11:35 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5CD0240002;
 Sat,  1 Jul 2023 20:11:32 +0000 (UTC)
Date: Sat, 1 Jul 2023 22:11:31 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230701221131.13e403e0@windsurf>
In-Reply-To: <20230617154745.875873-1-romain.naour@gmail.com>
References: <20230617154745.875873-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688242293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9s9mdC/6KAL10n60M82OYsY9vgudXm5adwK96TkN4I=;
 b=CPPdKyKOLtC9SjQHcusuAiyNK6cnKTmEGpCoG1hOOxK3SqGFfmvvmyQH52hzRduj48KTKd
 aqd8Pyt+g4e6bUnK3Y7kPkkN5VRqnbNKVp2lX+AIV/b/+FNeyh2Vb4UaKSL1XoQoncCL4f
 6QDQMqK/yBDqZowUnOkz9Y5qXJC9X7b6rKhFyWttpSCILFy8INeFjxpamcWqg5+dpiunpV
 JnzzGlpWJe63rtk2IRxLd/Oiv6sey6LX9rWtMOgY4VGvtcVgrTx/lgHXAIsV5qFGzCEi35
 2l8NS8j2oadCNW6Wwk3XOVA4eE8ph2nAD6iEAa6mquLZCFi21uQrK5hIU4Xk4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CPPdKyKO
Subject: Re: [Buildroot] [PATCH 1/3] toolchain/toolchain-external: update
 Arm ARM32 toolchain 12.2-rel1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Jun 2023 17:47:43 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Updated to gcc 12.2, gdb 12, binutils 2.39, glibc 2.36.
> 
> Upstream changed version scheme previously based on the release
> date (2021.07) to a version scheme based on gcc version (12.2.rel1).
> 
> The runtime issue (Illegal instruction on some x86 host) [1] seems to
> be fixed since it can't be reproduced anymore on the same host.
> 
> The x86_64 host variant prebuilt toolchain is built on RHEL7
> (glibc 2.17) and is likely also be useable on OS versions like
> RHEL8, Ubuntu 18.04 or later.
> 
> The AArch64 host variant prebuilt toolchain is built on Ubuntu 18.04
> (glibc 2.27) is likely also be useable on OS versions like RHEL8,
> Ubuntu 18.04 or later.
> 
> Use the sha256 hash that is now provided by upsteam.
> 
> Tested with qemu_arm_vexpress_defconfig.
> 
> [1] https://bugs.linaro.org/show_bug.cgi?id=5825#c19
> [2] https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> I'm able to reproduce the runtime issue with "Arm ARM 2021.07" on the
> host testing the Arm ARM32 toolchain 12.2-rel1.
> ---
>  .../toolchain-external-arm-arm/Config.in              |  8 ++++----
>  .../toolchain-external-arm-arm.hash                   | 11 ++++-------
>  .../toolchain-external-arm-arm.mk                     |  6 +++---
>  3 files changed, 11 insertions(+), 14 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
