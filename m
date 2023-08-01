Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B665C0015E
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9626611B7;
	Tue,  1 Aug 2023 21:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9626611B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kFasnfxUg__u; Tue,  1 Aug 2023 21:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2250A6116B;
	Tue,  1 Aug 2023 21:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2250A6116B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A88451BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0443E81423
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0443E81423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tqyOXDjZaSRh for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:26:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF71E813EF
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF71E813EF
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3FE51C0002;
 Tue,  1 Aug 2023 21:26:05 +0000 (UTC)
Date: Tue, 1 Aug 2023 23:26:04 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230801232604.61fcdd16@windsurf>
In-Reply-To: <20230731154739.1371164-2-neal.frager@amd.com>
References: <20230731154739.1371164-1-neal.frager@amd.com>
 <20230731154739.1371164-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690925166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSJOThTTduU+tWN7GZR5q5VT0yZGehLdJ7Bzheuy7CE=;
 b=PHEF5RjAX9/NVgt+4+joyY1G+9LC3NZxzq/RUoygLBsGWlYxq0dMmwYu0zTSryNZ8CRX7f
 OytHueFfT6/cHlQsUHl97Okm7Ag0noN30OysEletYZ6bBBPm8qlMeH5Rzzv4Ob5u1eQaZx
 ijH0d+4/X3Y/4BkAZRnYbfb/IdwQxFSasOVj7O26g3QWygOODUA8NwwgU9DJvjANvhQvxr
 0ntsJPPxSUv1y4Ik0ESmXEx0pN7dkEYPn4wja+lYScQ4T4/o9A9eWu01sdfeRnoel3mrGT
 vcTw0cUvQrsd3LLa4kUXi/8s2+efLUZQGIbFu8ZlXCuTbEYKdoMhUQLjJonRbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PHEF5RjA
Subject: Re: [Buildroot] [PATCH v2 2/2] board/versal: fix atf build failure
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
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Mon, 31 Jul 2023 16:47:39 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Binutils 2.39 now warns when a segment has RXW permissions:
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> 
> This causes the following build error:
> aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
> permissions.
> 
> This patch applies the upstream boot/arm-trusted-firmware/v2.6 patch already
> included with buildroot to solve the problem.
> 
> Fixes: https://developer.trustedfirmware.org/T996

Same comment as for PATCH 1/2, so I changed to:

    Fixes:
    
      https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556395 (versal_vck190)

when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
