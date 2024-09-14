Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF65C0218F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 10:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8F2B40179;
	Sat, 14 Sep 2024 10:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVEfqlBrfSvo; Sat, 14 Sep 2024 10:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 842C2402E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 842C2402E8;
	Sat, 14 Sep 2024 10:15:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47F8A1BF846
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42BB6408BF
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frTFuFHN2QHM for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 10:15:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE9B9408BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE9B9408BD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE9B9408BD
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 10:15:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id ECBE078050C;
 Sat, 14 Sep 2024 12:15:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 12:15:23 +0200
Date: Sat, 14 Sep 2024 12:15:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZuViO3UQsJTVgwb5@landeda>
References: <20240831120833.2915529-1-dario.binacchi@amarulasolutions.com>
 <20240831120833.2915529-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240831120833.2915529-3-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726308929;
 bh=1G0/3H8wKMEwnbANRXkSNqY8KnhAlerxpmig9r0M9NU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AY7VU/yS01Qw5tdnU3FnlMmU8YUmUsD4qLX/QBZZpVlcYZFGoNanUbpEKb731FDoF
 J438Ce4p2haliysvWAkNCL5JXypTMvMayOu7yxldbcjLTYiMJn15yRIIYx0eMLwUyr
 4CTKN0vayH/bCbk8SWFp2/dq/fDHOwUd/4Y7Va9e18mduU/h+Yp7yKDr0F4A7Arq7z
 kvhQ38RZ6uNiDUu7NO2vOmkxcVV8hFO1bAMhqc/iymM85BMJayMa059b4AnNezoG3n
 h3F0hjGDPTY0F9DUG9BQn53FgaogJeVV45zNCM0OCQanryM5NHnkgoPKWtjVGa7RNi
 Ye8EGP4lOevbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AY7VU/yS
Subject: Re: [Buildroot] [PATCH v4 2/3] configs/stm32f746_disco_sd: new
 defconfig
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
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-08-31 14:08 +0200, Dario Binacchi spake thusly:
> The commit adds support for STM32F746G-DISCO board. The discovery kit is
> a complete demonstration and development platform for STMicroelectronics
> Arm Cortex-M7-core-based STM32F746NG.
> 
> Board support package includes the following components:
> - mainline Linux kernel 5.15.165
> - mainline U-Boot 2024.07
> - default packages from buildroot
> 
> Link: https://www.st.com/en/evaluation-tools/32f746gdiscovery.html
> Co-Developed-by: Waldemar Brodkorb <wbx@openadk.org>
> Tested-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

As we've discussed at the dev-days, this configuration generates a
system that is not entirely stable: after a few commands, the following
ones fail to run.

This happens whether you use the 'u-boot' partition, or not, as
suggested by Thomas. In the first case, one can run more commands than
in the second case; in either case, the system is quickly unstable. As
Waldemar suggested, this is most probably due to memory being quickly
fragmented.

One suggestion that emerged during the discussion was to move the kernel
to the flash, and be XIP, so that more memory is free to run commands.
Of course, the internal flash is only 1MiB, but there is a Q-SPI flash
that is 16MiB; if that one can be memory-mapped, then it would be
possible to have a XIP kernel, and keep only the rootfs on the SDcard.

So, for now, we've decided to drop the configuration.

Thanks for the explanations!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
