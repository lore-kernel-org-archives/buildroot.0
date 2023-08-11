Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF43EC001B0
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 14:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6539F81DEF;
	Fri, 11 Aug 2023 14:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6539F81DEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cz1qm3UkXET8; Fri, 11 Aug 2023 14:49:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8055F81CD0;
	Fri, 11 Aug 2023 14:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8055F81CD0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3E81BF379
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 14:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA0CB60B01
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 14:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA0CB60B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id we6-X8YcaFYx for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 14:49:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9929160A5D
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 14:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9929160A5D
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7B66240007;
 Fri, 11 Aug 2023 14:48:59 +0000 (UTC)
Date: Fri, 11 Aug 2023 16:48:58 +0200
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230811164858.36987e01@windsurf>
In-Reply-To: <2160318.Mh6RI2rZIc@kilian-aisec>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <20230809193855.60c6b89c@windsurf>
 <13322713.uLZWGnKmhe@kilian-aisec>
 <2160318.Mh6RI2rZIc@kilian-aisec>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691765340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LR0OS44upfYTmYEI0HocOth7VcnZxBtKzP2y3FTUOJE=;
 b=VUhew0pqyh0ELyqtg+9Grr35xm4gHcSHZlfaC8pycEX1NKVK3G+PR1hwogn9i55waawoqQ
 fnWRWCFg4utMdWvURF8qz65lXaAQt4Lh54uvlsQPnirBeeI0pjmEU7i3U7RtYb+0Vrx10P
 rLbSEe3dpUdNsC9nMYmN+E7kYHJEOqzdJEYlNoT17x+8migsmRYaf6mxF4KVi7VOe7vtz/
 Pt54iFG2O5rhnzqBUb1Vt4qeDRm0FnrjZlUWMQ/Ce2fPF2BN45PIBj7uhyxT9xE2UcWkG0
 PcYMbFaBTdRBRZgVnxE+hrU9pEmIzB8OOY4suojFxblWzfF5kCWVAz6WHBSoRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VUhew0pq
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kilian,

On Thu, 10 Aug 2023 17:25:00 +0200
Kilian Zinnecker <kilian.zinnecker@mail.de> wrote:

> It actually was not my own fault regarding the errors about unknown vector 
> instructions. It seems that the core of the TH1520 SoC - the Xuantie C910 - 
> implements a now obsolete version of the RiscV vector extension, namely 
> version 0.7.1 (see [1]). However, only past gcc version seem to have supported 
> this vector extension version. Recent gcc versions seem to not support it. 
> Regarding the Xuantie C906 core, I found out that there now exists some -
> mcpu=thead-c906 option (see [2]). However, I was not able to successfully 
> compile a dummy example with one of the v0.7.1 vector instructions myself, 
> using that option.

From the gcc documentation, it seems like there is no -mcpu=thead-c906,
but only a -mtune=thead-c906, which only changes optimization
"details", I don't think it will do anything in terms of supporting a
non-standard vector extension. However, I'm not an expert in RISC-V
extensions, so maybe I'm wrong on this.

> Then I also found a RiscV toolchain, which has some "rvv-0.7.1" branch 
> (https://github.com/brucehoult/riscv-gnu-toolchain). However, I was not able 
> to build it (may be my own fault). But anyway the branch seems very old and I 
> am afraid, if I try to use it, I may run into other issues.

I also don't think this is a path worth pursuing.

> So I decided to accept that I currently have a gcc which does not support the 
> old 0.7.1 version of the vector extension. Therefore, I disabled vector 
> extension support in the kernel config. This is part of my current 
> beaglev_ahead_defconfig:
> 
> BR2_GCC_VERSION_13_X=y
> BR2_GLOBAL_PATCH_DIR="board/beaglev-ahead/patches"
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglev-ahead/linux.fragment"
> 
> The linux.fragment file overwrites the vector extension settings:
> 
> CONFIG_VECTOR=n
> CONFIG_VECTOR_0_7=n

This seems like the right thing to do, at least in a first step.

> Now, there was one more error in the custom kernel code: One function's 
> prototype and its implementation did not match, causing a -Werror=enum-int-
> mismatch:
> 
> https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/drivers/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_linux.h#L338
> 
> https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/drivers/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c#L6144
> 
> I changed the prototype accordingly and put a patch for this in my board/
> beaglev-ahead/patches/linux directory. After all this, it continued building 
> till the end.

The Vivante mess, meh.

> Now I don't know, whether the compiled uboot, kernel and rootfs would 
> function. I would have to test this. But to do so, I guess I would have to 
> figure out how to assemble these parts into an image and how to flash it into 
> the eMMC of the board.

I only briefly started looking into this. Let me know if you want me to
summarize my findings.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
