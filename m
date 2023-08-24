Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACC6C27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5868141DAA;
	Thu, 24 Aug 2023 21:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5868141DAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhCPsPBynsyj; Thu, 24 Aug 2023 21:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7351441DAE;
	Thu, 24 Aug 2023 21:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7351441DAE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC9E1BF98E
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAF31415ED
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAF31415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JxE2WAKN6L4Q for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:20:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BCA5405ED
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BCA5405ED
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98ED720002;
 Thu, 24 Aug 2023 21:20:40 +0000 (UTC)
Date: Thu, 24 Aug 2023 23:20:39 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230824232039.38e05d7a@windsurf>
In-Reply-To: <20230808195753.19748-1-ju.o@free.fr>
References: <20230808195753.19748-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692912040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uVtQYO+lX6v/lSG8eAG+p0+ig8dDkp68R7mhupxXJjc=;
 b=QDF3rp2GxivvQQI2CKNA88yZR8IXhv4Ohg7nzeU/NWLQLMTJObPtakle1p53dfEYNeB9Fn
 G8wn2XWKNnUdOxyX0Ot6UAqQES5cdkWQaU0B0EkFnXM1DfuwctfSqDpQlc0zA/MzOzA24T
 hSJwd4xeN913Z7BSLjgt/PnRYfoHW9HUf5xgLR74/4zOuwkuE6XeOvSzdBK5vIMRyTS/Yf
 2mI5+SvPx+1iXAWTpcz2JGh0bZ5QHbTk6QzX3MFoWAt2OsweWiC3HBunZOK6Y3DS3fQgk7
 vvP0S8lmO9CWL/oNt0hi09wW/5W23/O6DxbcKkNQsGqWM0SHvRvaqa9zHmvMgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QDF3rp2G
Subject: Re: [Buildroot] [PATCH next 1/1] support/docker: add
 qemu-system-misc for riscv runtime tests
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

On Tue,  8 Aug 2023 21:57:53 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The docker image currently contains qemu-system-arm and
> qemu-system-x86. Each package contains the 32bit and 64bit variants.
> This has been sufficient for the time being.
> 
> The RISC-V ecosystem is growing rapidly. It is starting to become
> mainstream. To increase the diversity in Buildroot runtime tests,
> this commit adds the qemu-system-misc package in the Docker image,
> in order to have the commands qemu-system-riscv{32,64}. This package
> also contains other architectures (for example: microblaze, nios2,
> s390x, xtensa, ...).
> 
> For Debian package details, see:
> https://packages.debian.org/bullseye/qemu-system-misc
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Note: I have already two work-in-progress patch series using
> qemu-system-riscv64. I'll wait for this patch to be accepted, and
> .gitlab-ci.yml to be updated to use the image before sending those.
> ---
>  support/docker/Dockerfile | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
