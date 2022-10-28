Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCC1ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D935410D2;
	Fri, 28 Oct 2022 06:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D935410D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrZSNX8138FJ; Fri, 28 Oct 2022 06:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E4EC410C8;
	Fri, 28 Oct 2022 06:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E4EC410C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1811BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 623EB81353
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 623EB81353
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jf7KpnhDrT2M for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:47:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D5F581321
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D5F581321
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:47:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 162AF40010;
 Fri, 28 Oct 2022 06:47:03 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:47:02 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221028084702.3659ace8@windsurf>
In-Reply-To: <bab58c04544d0247bce855c8b984ce0d5349def4.1666935387.git.baruch@tkos.co.il>
References: <bab58c04544d0247bce855c8b984ce0d5349def4.1666935387.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666939625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICEUKqPUP7hy7NgKydTDE8RvhDlNRPqiz06SsSV/Wko=;
 b=P6J4C1ch9fKxT6D21zo/5pji2Vgw8WhaS1LB8Ff9pY3SO1Tsz/RSaNF+7T2zid21D3u1QK
 TacqFVbDnzZcweITXlxSenlL/oo9VRBbVlhlxLeD0z97uxiTZ1+koHyte+ohZ8A0eNL1be
 GftdY8I+EBmVkonlQQzH9gXlIlYNELoMTTtQ5NapQZYb4Rm8KVZksaF786AK4qZIw3kCK5
 HTCdOKnHNpafWNGlwFKWetM0h8yvyU8hcF2mFdXfgojSY74xnpLedmtA8IcsDbqpDMdqOZ
 oMAsCMAZWQKo1kDj75Ctyn8NLGmHGWbuiZCvp39KWjqxkbj23rJCtlnZvSfrHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P6J4C1ch
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: don't enable SSP
 by default
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@busybox.net, Heiko Thiery <heiko.thiery@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Oct 2022 08:36:27 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> SSP support requires support in ATF platform code. Not all platforms
> implement plat_get_stack_protector_canary() hook. The result is build
> failure:
> 
> (.text.asm.update_stack_protector_canary+0x4): undefined reference to `plat_get_stack_protector_canary'
> 
> Commit cf176128ec4 ("boot/arm-trusted-firmware: add SSP option")
> originally introduces this issue. But then commit ccac9a5bbbd
> ("boot/arm-trusted-firmware: don't force ENABLE_STACK_PROTECTOR") hid
> the problem by effectively disabling SSP for all platforms. So only
> after commit 09acc7cbc91f5 ("boot/arm-trusted-firmware: fix SSP
> support") the issue showed up.
> 
> Make SSP an opt-in for platform that actually provide the
> plat_get_stack_protector_canary() hook.
> 
> Cc: Sergey Matyukevich <geomatsi@gmail.com>
> Cc: Dick Olsson <hi@senzilla.io>
> Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  boot/arm-trusted-firmware/Config.in | 1 -
>  1 file changed, 1 deletion(-)

We had a quick discussion with Peter Korsgaard on IRC a few days ago
about this, and I do agree making this opt-in is the right solution, so
I've applied. We'll see if other maintainers disagree :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
