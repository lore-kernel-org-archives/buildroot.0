Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09B9C3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 11:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47E3B41815;
	Fri, 12 Jul 2024 11:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QselFLAeqfx; Fri, 12 Jul 2024 11:10:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2378E41868
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2378E41868;
	Fri, 12 Jul 2024 11:10:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC2191BF3F4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A64C341868
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQNYeCRqp2RA for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 11:10:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47F0841815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47F0841815
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47F0841815
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 11:10:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDDB8C0004;
 Fri, 12 Jul 2024 11:10:50 +0000 (UTC)
Date: Fri, 12 Jul 2024 13:10:49 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240712131049.3337ce12@windsurf>
In-Reply-To: <50c765a8-eaa3-4394-8ad3-61ec65959c66@benettiengineering.com>
References: <29a51211-e273-4b28-ba3c-648df58b83c3@mind.be>
 <20240711191539.90650-1-giulio.benetti@benettiengineering.com>
 <20240712090956.24409852@windsurf>
 <50c765a8-eaa3-4394-8ad3-61ec65959c66@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720782651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rE6kQJ22skIOurbTknBFUM23YaVXjvjEKr0R7jRcE3k=;
 b=h9Kyk/Ypn8oI0N5Y7uJaKoqe9N57QrRKhu4dJRbJs2PdKnSbejPyIuvw83o6GYtkW5NTI/
 mE7zUFApFfyzzQ8uDdVXMBm6JQd93HfrzWDqQq+kHF6ysEbpTlrw+4Cvq41Av1347hRTSK
 isr9l0CTmwcFLlTiToGahovSJdKNLCSQMCvPBnQcaKvcbjnSiRXrMIKVfmJAtYyO3idCAw
 ISifqMCWpoaHcbrXLQ5b6hVe5H4mGWTJJA6XkDQ5FWdFTnBKOsfLwQ8AN6hOSeIiFvlchW
 dlLgqYcFJkmZ4NOGNl69RIvqCVNo/UX9OIck7v0D7oX/Z9/puXcwXEZRMeR2JA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h9Kyk/Yp
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2024-07-11
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Jul 2024 12:43:23 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This defconfig works at me:
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6"
> BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> BR2_PACKAGE_SUNXI_MALI_UTGARD=y

So, it was my fault. I didn't have BR2_PACKAGE_SUNXI_MALI_UTGARD=y, and
I just did "make sunxi-mali-utgard-driver-patch". But due to
BR2_PACKAGE_SUNXI_MALI_UTGARD not being enabled, SUNXI_MALI_UTGARD_REV
was empty in:

        ln -sf $(SUNXI_MALI_UTGARD_REV)/series $(@D)/patches

So indeed, having a defconfig with the right package enabled is
important in this case.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
