Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B55DC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D75E34099E;
	Wed,  8 Feb 2023 15:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D75E34099E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmRCrDOwwb7o; Wed,  8 Feb 2023 15:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF53F409A7;
	Wed,  8 Feb 2023 15:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF53F409A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F7CD1BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43DC582018
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43DC582018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LCamo4Vo7YgT for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:56:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 149D682016
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 149D682016
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:56:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B62BA1C0006;
 Wed,  8 Feb 2023 15:56:06 +0000 (UTC)
Date: Wed, 8 Feb 2023 16:56:05 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230208165605.73b2b986@windsurf>
In-Reply-To: <20221231101451.521367-1-fontaine.fabrice@gmail.com>
References: <20221231101451.521367-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675871767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bzjzrQNCNwDa2K2jDsG2fyRAnEdT3mp49RZ5kbwAgLU=;
 b=hvFUOyu1tl8M+KX7nKvuGpUMt6YvNay26xxKjbCti3cQkWrWS8z36pyJnr+1DaioggDiI9
 Q40zkGTgcfesRJawyyJ3VuFLd73YKYhmgVBqalysfT+kA7UgN2E5Kn+bUxt5EZM6RP38hf
 cf1N1fcLMVLHVWzOwdpis7oqufwfy4PrByR1GacXrO2IMe8z4yo5Xms0OgR4nauEnD+tJo
 vy7ckquuwhvQfhgTyHdyKvk9QV12+yWBuGL/v+h19+sMeIIw5Y35cHqtxyOmTsLq7KQgRS
 ZHizncnMKGgqUJMeJSiCAtJP1ocYhM87/S9fKMV84Fl0Me3L6lxgA5e3EduYUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hvFUOyu1
Subject: Re: [Buildroot] [PATCH 1/1] boot/afboot-stm32: disable
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
Cc: Lee Jones <lee.jones@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 31 Dec 2022 11:14:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable stack-protector to avoid the following build failure:
> 
> /home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld -T stm32f429.lds --gc-sections -o stm32f469i-disco.elf stm32f469i-disco.o gpio.o mpu.o qspi.o start_kernel.o usart-f4.o
> /home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.o: in function `main':
> stm32f469i-disco.c:(.text.startup.main+0x3b0): undefined reference to `__stack_chk_guard'
> /home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.c:(.text.startup.main+0x4c0): undefined reference to `__stack_chk_fail'
> /home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.c:(.text.startup.main+0x4ec): undefined reference to `__stack_chk_guard'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fa6ffab24c3998f21034ab24e8d2852cacde08c1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...003-Makefile-disable-stack-protector.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch

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
