Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A9AC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D02CA40BDC;
	Wed, 22 Feb 2023 14:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D02CA40BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7mj0ldrj0_t; Wed, 22 Feb 2023 14:52:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13EA2415BE;
	Wed, 22 Feb 2023 14:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13EA2415BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3798F1BF589
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 117EE415AE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 117EE415AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hrbTT6Sp-se for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:52:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E75EF40278
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E75EF40278
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:52:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0C49C1BF20B;
 Wed, 22 Feb 2023 14:52:36 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:52:36 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230222155236.3f6e3ba8@windsurf>
In-Reply-To: <20230222103242.755918-1-fontaine.fabrice@gmail.com>
References: <20230222103242.755918-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677077557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qA9YObEw1Iwai8y43wz81Pn7jZsnZdJcsbm0eONSwXw=;
 b=dSTnr9L5HZi2lVqGU8TIl2K7N7pDTYBTCMHI7r95K+9OsfhPupp0MOgvJ7KNq7B7xpo9HE
 afBdY4wxUfDzaaDkA7qJ2qwqDP0/cIUCNj1zosqLt99skvxF+tOnREUlsEIShNqzPbT8jc
 beDllO2GW1h3Lc/RFdPNlVA+aEJv4RAebDB51xzo4B2wxT6F5kPhalBpdVnt+nFT7vPzr7
 9krdDyRnr71OS+4CjTKSbE6siAK/gEo6Kk8l+E2+o0kP8T8A2mjBlWoE+2w1Up8B3QvgNf
 WcozQ0/FAu1x2Y737TpOKTpciY9QIjCfOZnvuc9+7xrmn+AkLvLw+jxO23K/vw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dSTnr9L5
Subject: Re: [Buildroot] [PATCH 1/1] boot/at91dataflashboot: disable
 stack-protector
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

On Wed, 22 Feb 2023 11:32:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable stack-protector to avoid the following build failure:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabi-ld -T elf32-littlearm.lds -Ttext 0 -n -o DataflashBoot-1.05.out objs/cstartup_ram.o objs/at45.o objs/com.o objs/dataflash.o objs/div0.o objs/init.o objs/main.o objs/stdio.o objs/asm_isr.o objs/jump.o objs/_udivsi3.o objs/_umodsi3.o objs/led.o
> /home/buildroot/autobuild/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: objs/main.o: in function `main':
> main.c:(.text.startup+0x834): undefined reference to `__stack_chk_guard'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/502c54be4978e628724d72ee2a75d4c5e0a6ace8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  boot/at91dataflashboot/at91dataflashboot.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
