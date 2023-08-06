Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73522C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 13:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3FEA409F0;
	Sun,  6 Aug 2023 13:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3FEA409F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QxHLlZ1FAP18; Sun,  6 Aug 2023 13:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0583240997;
	Sun,  6 Aug 2023 13:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0583240997
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 233A31BF8C7
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8165C40201
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8165C40201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_AAUfcn9dqO for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 13:43:05 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 191BC40113
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 13:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 191BC40113
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBB8E60003;
 Sun,  6 Aug 2023 13:43:01 +0000 (UTC)
Date: Sun, 6 Aug 2023 15:43:00 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230806154300.310491c4@windsurf>
In-Reply-To: <ZM+YFazhq0X2JCwl@waldemar-brodkorb.de>
References: <20230806102554.46261-1-thomas.petazzoni@bootlin.com>
 <ZM+YFazhq0X2JCwl@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691329382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BmzqeJhwa+TbJI+VV6RqQ6kIuJodk7CQhdHGOJolpIs=;
 b=HvkTia5RHzNG6/Yw/GU5chlj8bBjj0Q3cUEH+sPJGwoChiipKNcuxWeCwzGMlXJmm5bbuv
 a8fGUqqWjTh8cirPk7EcLzv7iOcdFXbw+QZpBAwGPBTsLxB2P7JFKfJs316VgPIpfMUagh
 iJJYPa0hbV+T9z9mobwhEYT4OI+MZIMjoIsGwSF4l7i82LQEvppFFRIsM8HFAV2CJlBPSi
 IDXvp8824fnCvxD7Dg+M7xA9qs/LUjM7tqakjV/iIpMI1tr8AYuyR3K/fhahOKbn0L5dwD
 tU2aq4cuiiEfhjdtB4LkMO/NO8J2YP/Fs7Ww1bjLfJ709LH7BvxKiunhLPsOLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HvkTia5R
Subject: Re: [Buildroot] [PATCH 1/3] package/elf2flt: refresh patches
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Sun, 6 Aug 2023 14:54:45 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> I tested the series and it worked well for following defconfigs:
> qemu_m68k_mcf5208_defconfig
> qemu_riscv64_nommu_virt_defconfig
> qemu_xtensa_lx60_nommu_defconfig
> 
> You can add if you like a 
> Tested-by: Waldemar Brodkorb <wbx@openadk.org>

Thanks a lot for having tested the whole series!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
