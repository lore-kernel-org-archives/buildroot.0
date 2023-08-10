Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076B5C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 11:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A063083F02;
	Thu, 10 Aug 2023 11:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A063083F02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-L99VnFBily; Thu, 10 Aug 2023 11:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE68083F03;
	Thu, 10 Aug 2023 11:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE68083F03
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BFDE1BF34D
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 11:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 755CD40396
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 11:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 755CD40396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BK44NDJddlkQ for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 11:02:35 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 635EA400D1
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 11:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 635EA400D1
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 2B175A0646;
 Thu, 10 Aug 2023 13:02:33 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id 0FA2080172;
 Thu, 10 Aug 2023 13:02:33 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id A3DF7A042F;
 Thu, 10 Aug 2023 13:02:32 +0200 (CEST)
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Date: Thu, 10 Aug 2023 13:02:32 +0200
Message-ID: <1766550.VLH7GnMWUR@kilian-aisec>
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
X-purgate-size: 2213
X-purgate-ID: 154282::1691665352-027EA199-3C3B3FEA/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691665353;
 bh=7318wBarnCCjHD7CQVD/tSN3Ov9CXIXb4+npFXrBTk4=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=6CEJeIS/j9bK0WsVUd+XTvf4a8y6t4+0tdm1JvGVxY5Y4Q/hd0ewK04gfKF+zZoWi
 JGz22f7MeeM+FpmevkuwMDmsuj4I+WtZBrMPa9PwgZi6OHxWi6gW5c5Ge5C8bfhkKZ
 glPkSiKTcmST7Fk3fzF92mPSB9z6lAkraR5OsV0HCrw3ADdfaPDGNQ02OlXH1BLbYc
 MOrJsF34BcRX3z8CGn82ockgaIY7Bd+DmGu8BMPCqU2Bzb3vYxll42OWbVRUWQ1Tvq
 6heVvUxpZ+B5RHDzCzlJY/rbr+6mtWlU4S/Gn7RsDqswCUZztnh8o1DdWUbh3dJDlA
 LOyIHbjU5ohpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=6CEJeIS/
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

Hello Thomas, all

[--SNIP--]

> So my build broke until I changed to release-1.3.x. This makes me wonder
> about the current beaglev_defconfig: It might be broken since bumbing gcc
> to v12, but I actually don't know. I could try building an image for the
> beaglev later today?

fyi it seems that currently the build of the beaglev_defconfig actually is 
broken, as I suspected (current buildroot master branch). When I try to build, 
I get the following errors during starfive uboot compilation:

...
arch/riscv/cpu/mtrap.S: Assembler messages:
arch/riscv/cpu/mtrap.S:65: Error: unrecognized opcode `csrr a0,scause', 
extension `zicsr' required
arch/riscv/cpu/mtrap.S:66: Error: unrecognized opcode `csrr a1,sepc', 
extension `zicsr' required
arch/riscv/cpu/mtrap.S:67: Error: unrecognized opcode `csrr a2,stval', 
extension `zicsr' required
arch/riscv/cpu/mtrap.S:70: Error: unrecognized opcode `csrw sepc,a0', 
extension `zicsr' required
make[3]: *** [scripts/Makefile.build:301: arch/riscv/cpu/mtrap.o] Error 1
...
arch/riscv/cpu/start.S: Assembler messages:
arch/riscv/cpu/start.S:65: Error: unrecognized opcode `csrw stvec,t0', 
extension `zicsr' required
arch/riscv/cpu/start.S:72: Error: unrecognized opcode `csrw sie,zero', 
extension `zicsr' required
arch/riscv/cpu/start.S:347: Error: unrecognized opcode `csrw stvec,t0', 
extension `zicsr' required
make[3]: *** [scripts/Makefile.build:301: arch/riscv/cpu/start.o] Error 1
...
arch/riscv/lib/cache.c: Assembler messages:
arch/riscv/lib/cache.c:12: Error: unrecognized opcode `fence.i', extension 
`zifencei' required
make[3]: *** [scripts/Makefile.build:266: arch/riscv/lib/cache.o] Error 1
... and more ....

I also think that there is are similar issues regarding the beaglev_defconfig 
and the used, very old opensbi version and maybe also the used starfive custom 
kernel version.

I could try to bump the versions or add patches until it compiles again. 
However, I don't have a BeagleV currently at hand, so I would not be able to 
really test what I produced afterwards. So it might be better someone else, 
which has access to a BeagleV, has a look.

[--SNIP--]

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
