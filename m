Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EABC001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 15:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6C6283F99;
	Thu, 10 Aug 2023 15:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6C6283F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9C6sMQ_vPPd; Thu, 10 Aug 2023 15:25:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C874A83F95;
	Thu, 10 Aug 2023 15:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C874A83F95
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E262C1BF4D7
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 15:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB2FE83F95
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 15:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB2FE83F95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MB1ylquQftqd for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 15:25:03 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 051A983F89
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 15:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 051A983F89
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 272CBA035E;
 Thu, 10 Aug 2023 17:25:01 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 0B1DD801EC;
 Thu, 10 Aug 2023 17:25:01 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 77A62100136;
 Thu, 10 Aug 2023 17:25:00 +0200 (CEST)
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Date: Thu, 10 Aug 2023 17:25:00 +0200
Message-ID: <2160318.Mh6RI2rZIc@kilian-aisec>
In-Reply-To: <13322713.uLZWGnKmhe@kilian-aisec>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <20230809193855.60c6b89c@windsurf>
 <13322713.uLZWGnKmhe@kilian-aisec>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2808
X-purgate-ID: 154282::1691681100-827FC7B6-E8E48257/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691681101;
 bh=1LRFyIVX78A9ClSFozGmne0Z9TQLUy2AaBGYJKLE8NU=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=f2NkaGV5jUMgrHd7wMRaawQzM9uVfKuwcJOQWW8KwggNQWU5fIwIWr8NcRodjVA8U
 yQtYJ81Qx3pD3XqeVzHQ2nFTNIJYWEzn2C3JFE9TyTfx32sZq/0jEni5VtoMDn6BvE
 nfw0O4nCprgpNeFKW6O4MwgrN1O9XXFlRihqWcbZLSzX9Ccyyd3EdrDnnnVgEjUDxC
 I0TBZ+MYIe4LTt6Ps3V873kd40NOU7UXa8plLPwSFRh7YutErzBa0L89EZbXCSuvNq
 VrmOVn2hlVlHtp7QV9PQsc8U0AXfukX0VWw/5CcGPohjZHqghTzpTCAIeCU5vntaix
 fEl6vq3/vKyMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=f2NkaGV5
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

[--SNIP--]

> I still have some other problem with the build at the moment, where I have
> to look into (might be my very own fault - the errors about unknown vector
> instructions are back for some reason). But as soon as I have questions or
> news, I will send an update to the ML.

It actually was not my own fault regarding the errors about unknown vector 
instructions. It seems that the core of the TH1520 SoC - the Xuantie C910 - 
implements a now obsolete version of the RiscV vector extension, namely 
version 0.7.1 (see [1]). However, only past gcc version seem to have supported 
this vector extension version. Recent gcc versions seem to not support it. 
Regarding the Xuantie C906 core, I found out that there now exists some -
mcpu=thead-c906 option (see [2]). However, I was not able to successfully 
compile a dummy example with one of the v0.7.1 vector instructions myself, 
using that option.

Then I also found a RiscV toolchain, which has some "rvv-0.7.1" branch 
(https://github.com/brucehoult/riscv-gnu-toolchain). However, I was not able 
to build it (may be my own fault). But anyway the branch seems very old and I 
am afraid, if I try to use it, I may run into other issues.

So I decided to accept that I currently have a gcc which does not support the 
old 0.7.1 version of the vector extension. Therefore, I disabled vector 
extension support in the kernel config. This is part of my current 
beaglev_ahead_defconfig:

BR2_GCC_VERSION_13_X=y
BR2_GLOBAL_PATCH_DIR="board/beaglev-ahead/patches"
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglev-ahead/linux.fragment"

The linux.fragment file overwrites the vector extension settings:

CONFIG_VECTOR=n
CONFIG_VECTOR_0_7=n

Now, there was one more error in the custom kernel code: One function's 
prototype and its implementation did not match, causing a -Werror=enum-int-
mismatch:

https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/drivers/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_linux.h#L338

https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/drivers/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c#L6144

I changed the prototype accordingly and put a patch for this in my board/
beaglev-ahead/patches/linux directory. After all this, it continued building 
till the end.

Now I don't know, whether the compiled uboot, kernel and rootfs would 
function. I would have to test this. But to do so, I guess I would have to 
figure out how to assemble these parts into an image and how to flash it into 
the eMMC of the board.

Best regards,
Kilian

[1] https://ftp.libre-soc.org/466100a052.pdf
[2] https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/RISC-V-Options.html


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
