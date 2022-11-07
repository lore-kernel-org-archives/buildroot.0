Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D13EC4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B2A819B8;
	Mon,  7 Nov 2022 22:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30B2A819B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xdv1ApZM2fAI; Mon,  7 Nov 2022 22:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4463F818AC;
	Mon,  7 Nov 2022 22:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4463F818AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 310821BF955
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFA0D60BF4
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFA0D60BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNfpmJ6iFBl2 for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:09:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75D7460BF1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75D7460BF1
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:09:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32F0D40002;
 Mon,  7 Nov 2022 22:09:26 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:09:25 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221107230925.73bb92d9@windsurf>
In-Reply-To: <20221106222042.648813-1-fontaine.fabrice@gmail.com>
References: <20221106222042.648813-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667858966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NSqR+EKXpedvr5Lz3Ow3tI5I78fIns57voDI9TH/l0=;
 b=QmK3hMwCGIpj3rzj7YgbT7+GDdiHtq7lUhZ2Qgt86Ec0MJ2WQKDuHLoym8CH56tZcGTdiE
 4xBc4FgdB6QAYo1Eejyxolm5Q0067mjDC2rqODmycc6hx/a9BRkl/CmKdzn0tSHTRseLQ9
 v+N20+Nu0JnYX5PVYEWxWYTpVcIFu9vfMj8/tfIvqoNSFRV/0vr0BgkXM8Z3eRVTIwgCOk
 9PvnH7BUwxkR+EkedzBxMaDrSkZ+dPmA4fuLtqJb7SVVvHsYsd9grqHeRYXcr7QS6VRwqq
 Ut5sk43GxOW9gQbmznQTk5HoLUKQw7qcCX5SnsZE553rlrCEdTBr5H9q8LGobg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QmK3hMwC
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: fix static build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Nov 2022 23:20:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Pass TARGET_LDFLAGS (which contains -static) to fix the following static
> build failures with gpio, iio and pci:
> 
>   LINK     lsgpio
> /home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/../../../../arm-buildroot-linux-musleabi/bin/ld: /home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
> /home/autobuild/autobuild/instance-8/output-1/build/host-gcc-final-10.4.0/build/arm-buildroot-linux-musleabi/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'
> 
> [...]
> 
>   LINK    iio_event_monitor
> /home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/11.3.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: /home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
> /home/thomas/autobuild/instance-2/output-1/build/host-gcc-final-11.3.0/build/microblazeel-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:88: undefined reference to `abort'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f202eb843ef331939f5f12325bdbf2d0d664a7ce
>  - http://autobuild.buildroot.org/results/504ec8be1ebd15c5da09f8b90bb723a58d4c58c5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/linux-tools/linux-tool-gpio.mk.in | 2 +-
>  package/linux-tools/linux-tool-iio.mk.in  | 2 +-
>  package/linux-tools/linux-tool-pci.mk.in  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks. However, aren't some of the other
linux-tools also affected by a similar issue (tmon, cpupower, etc.) ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
