Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F55C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FF42405C1;
	Tue,  1 Nov 2022 22:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FF42405C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dc49KP2fdn-C; Tue,  1 Nov 2022 22:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B696340383;
	Tue,  1 Nov 2022 22:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B696340383
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D83A71BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADD88400EF
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADD88400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3r-3TI2C0lHN for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:40:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F06C40383
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F06C40383
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:40:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AFEDC60007;
 Tue,  1 Nov 2022 22:40:25 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:40:24 +0100
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20221101234024.27b5bc48@windsurf>
In-Reply-To: <20221007235002.79221-1-vfazio@xes-inc.com>
References: <20221007235002.79221-1-vfazio@xes-inc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667342426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxu4RJr7KG0XvguwRKOl/3r9atQGFLlR9I3iM/S6ye4=;
 b=EZR0Gs4MyemG6/uvyYG0zgG7JDR+SseI1tVNSnns85nVhzKe1YjB0c/TekovTVtlF0jOt9
 BVNVhi12l46vULMmgP2pUiFLdXKw13oXftjPK5FK2oXoy8zdGgyJFW1QVOigClzgTZQNoi
 9bM+kgW15HkEnV6z1Xf8pGyMCZcM/aLbV/zXmPEcSKUTT8TFL3XRx8qOWjCyjVPnUobrM6
 vAVuaf+lRICY0Q54rjtaqeXtWUlB0gD/3GDyTq08xKHtMaKoD9IRknTcGZ84Q4Bil6ay5B
 X/gzexzd7YCcwZBQrkmjW9TbGcg9GUIZAKsoyqa5a0RAZxtHsa3D/DPMyEU6Hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EZR0Gs4M
Subject: Re: [Buildroot] [PATCH 1/2] package/busybox: add patch to silence
 build errors
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  7 Oct 2022 18:50:01 -0500
Vincent Fazio <vfazio@xes-inc.com> wrote:

> As part of pkg-kconfig, the .config file gets regenerated after fixups.
> 
> When Busybox is built with per-package directories enabled, the
> toolchain is not available for Busybox's makefile to determine compiler
> capabilities so certain calls will fail and emit errors.
> 
> For now, assume the following are true:
> 
> Buildroot will not use GCC < 4
>   Skip a call to cc-ifversion to avoid the following error
> 
>   /buildroot/output/build/busybox-1.35.0/scripts/gcc-version.sh: line 11: /buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc: No such file or directory
> 
> Target system is linux
>   Skip a call to -dumpmachine to avoid the following error
> 
>   make[2]: /buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc: Command not found
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Hm, it's a bit annoying to patch Busybox for this, especially with a
patch that most likely cannot be accepted upstream because it's really
related to Buildroot details.

Do we have a better solution?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
