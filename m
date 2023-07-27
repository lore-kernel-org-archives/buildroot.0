Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3ACC0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83496813BB;
	Thu, 27 Jul 2023 21:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83496813BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzjIbHQXHzUn; Thu, 27 Jul 2023 21:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADABB8176C;
	Thu, 27 Jul 2023 21:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADABB8176C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE7261BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 889D941FF3
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 889D941FF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPkGvjPi1G9j for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:13:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4744340328
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4744340328
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20ED060002;
 Thu, 27 Jul 2023 21:13:47 +0000 (UTC)
Date: Thu, 27 Jul 2023 23:13:46 +0200
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230727231346.494ecf2b@windsurf>
In-Reply-To: <20230727203652.975942-1-vfazio@gmail.com>
References: <20230727203652.975942-1-vfazio@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690492432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2jTBDejIvs8emeb92+EP0QNQeqs8s4LsY7efMF0yTwk=;
 b=mlj7HVO5xmW7oVqXnJgaQ2dQArkycMYH2vHw0E/InOuwKyYDwyyBTUIx3ZR75r5ZqrFXUX
 Qdj3T41X7rwqMrTDoxOTo2zeXdZv/Z3OyKGaHLQJCKne+wNDIh54Dp01JSLrBtOoVYuYR0
 O2enJpv6GNfjvx+tSdZ5WWOIgQzwOu7LD1t+up7gQHuObxAjPxCPCD9Mpk3sgIPvMp3+9Z
 K6zTXbLcFUKzV8EnWarvI2VKe3PpiKJCIlaAQsWRNsyUok5QQmma2YzhZFx4SPIUQAHbaJ
 6jvSXRFUPVReBa7ZcNohE8cRYDeeK5V8wkbJRG96nXGZC8Umz7ag9kdNhMzl4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mlj7HVO5
Subject: Re: [Buildroot] [PATCH 1/1] arch/Config.in.x86: drop AVX512 from
 alderlake
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

On Thu, 27 Jul 2023 15:36:52 -0500
Vincent Fazio <vfazio@gmail.com> wrote:

> Alder Lake CPUs have AVX512 support disabled [0].
> 
> To prevent potential issues, remove the AVX512 support advertisement.
> 
> This puts Buildroot inline with the GCC options [1].
> 
> [0]: https://www.intel.com/content/www/us/en/support/articles/000089918/processors.html
> [1]: https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html
> 
> Fixes: e7b94130 ("arch/Config.in.x86: add sapphirerapids, alderlake, rocketlake")
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  arch/Config.in.x86 | 1 -
>  1 file changed, 1 deletion(-)

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
