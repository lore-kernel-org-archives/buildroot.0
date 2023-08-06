Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6A9C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 13:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 320BF4056A;
	Sun,  6 Aug 2023 13:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 320BF4056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9HN7V5liyByl; Sun,  6 Aug 2023 13:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DF4F408EF;
	Sun,  6 Aug 2023 13:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF4F408EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BABA11BF3C0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8870560AC3
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8870560AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-DP__KjYfT7 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 13:33:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78C8260B96
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 13:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78C8260B96
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87570FF802;
 Sun,  6 Aug 2023 13:33:09 +0000 (UTC)
Date: Sun, 6 Aug 2023 15:33:08 +0200
To: Nicolas Boichat via buildroot <buildroot@buildroot.org>
Message-ID: <20230806153308.4c0cf791@windsurf>
In-Reply-To: <20230806121729.3552502-1-drinkcat@google.com>
References: <20230806121729.3552502-1-drinkcat@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691328789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L97VLyFzaDS8Y2f7B+auk+Rn+VhnMY5cnXm5TvGQMJk=;
 b=kBjjRNxMf+vHO5Il2AYepBjYU/mG4DUFJaAwmG/ZXE/rU29BkraEHIWcB+GALbOGONAyNZ
 ImxJRdAO6Wnzx5U5vUokVm2eNeclmg11Lzmu5wNB3mAB+Ak11rJJEBLz9iUO2/GpZJXtAZ
 2aW3sXq8WyZ002rIfbJJvnx8M1nRnULT+oahKFoWfY79wYIL8gLM4NVTncG65tlwRxcRny
 eVau0iXPPMxfJl066y6ZFWswqXYdkW0xpEHvUCNjzTtSwxMl7uFqHyeTMIRxKVBRnhwlCe
 /mOMWGTXwIBiyOvBQqQpRtgU6i0voAuVnmCcGD5mSfYXuc+bm9xWLEfXIrwylQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kBjjRNxM
Subject: Re: [Buildroot] [PATCH 1/1] package/screenfetch: Add mawk/gawk
 dependency, and upstream detection patch.
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
Cc: Nicolas Boichat <drinkcat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nicolas,

On Sun,  6 Aug 2023 12:17:29 +0000
Nicolas Boichat via buildroot <buildroot@buildroot.org> wrote:

> screenfetch requires an "awk" implementation: add that to dependencies.
> 
> Also, upstream would only use an executable called "awk": pick up
> upstream patch that can autodetect awk implementation, so that
> "mawk" can be used.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@google.com>

Thanks for the patch. One question below.

> diff --git a/package/screenfetch/Config.in b/package/screenfetch/Config.in
> index c0e7100f38..00248bafcf 100644
> --- a/package/screenfetch/Config.in
> +++ b/package/screenfetch/Config.in
> @@ -2,8 +2,12 @@ config BR2_PACKAGE_SCREENFETCH
>  	bool "screenfetch"
>  	depends on BR2_USE_MMU # bash
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> +	depends on BR2_PACKAGE_GAWK || BR2_PACKAGE_MAWK # runtime dependency

Would the "awk" implementation from Busybox also work? It's the awk
implementation that we use by default.

Also, just like bash is enabled via "select", we should if possible try
to do the same for the awk implementation. I don't know if something like:

	select BR2_PACKAGE_BUSYBOX if !BR2_PACKAGE_GAWK || !BR2_PACKAGE_MAWK

would work (of course, assuming the "awk" from Busybox is good enough).

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
