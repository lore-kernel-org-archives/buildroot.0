Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02BDC04A6A
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 22:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A0AD41E84;
	Fri, 11 Aug 2023 22:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A0AD41E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QramYG5E9w2l; Fri, 11 Aug 2023 22:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6869241ECA;
	Fri, 11 Aug 2023 22:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6869241ECA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACB521BF5F6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 860884063E
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 860884063E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u_N9Pviy9rZs for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 22:29:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0418B4059D
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 22:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0418B4059D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A62C40004;
 Fri, 11 Aug 2023 22:29:03 +0000 (UTC)
Date: Sat, 12 Aug 2023 00:29:02 +0200
To: Roberto Medina <robertoxmed@gmail.com>
Message-ID: <20230812002902.5ce271b0@windsurf>
In-Reply-To: <88906c88-9597-4f1d-a5d2-244337ac0fdf@gmail.com>
References: <20230710212151.574040-1-robertoxmed@gmail.com>
 <20230710212151.574040-2-robertoxmed@gmail.com>
 <20230808230609.0eaa80e8@windsurf>
 <88906c88-9597-4f1d-a5d2-244337ac0fdf@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691792943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=trLcNfcZM6aI5NGGgBehJ4Kh7aAEiV013X7DXRihJa4=;
 b=VXQTfOpsh1Rof/nI6ik2xhMecdZRF4cuP5Kg6etLko5LG2aorMfdD8CxMIc0Oeby9L7kZZ
 6fR8tWnaUAA5F+SSJMNe9XdohtohbKSejtc8OfOGM+TFhEWxWSPnaPP8fSHzLlXJQksnte
 8dLyId7Ii98iclW6VDyKz4kr0T3Dk8sxvTiNZPi6+sSxXyQfOEEKI5sQJndphGuO+JPZMw
 UxVkuIrka1ALyUAEUWBpgyBmD3kLVe1nZsfHeIq+LI9DMBGdMJPbL7ssQiJNfMxPS/ti6P
 PbwqlLTRayNHBd7jyi74jxLNjRl9pCb0FMvdtzBm0h1yJql4BkfIIef53okyqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VXQTfOps
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/roc_rk3399_pc: Bring back
 and update the configuration for the rockchip rk3399 built by firefly.
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
Cc: kilian.zinnecker@mail.de, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Aug 2023 18:28:43 +0200
Roberto Medina <robertoxmed@gmail.com> wrote:

> Thank you for your reviews. I submitted a v3 for review but I will 
> answer the following here as well.
> 
> On 8/8/23 23:06, Thomas Petazzoni wrote:
> > Why this custom size rather than leaving the default?  
> 
> If I leave this value as default I will get the following error:
> 
> Copying files into the device: __populate_fs: Could not alocate block in 
> ext2 filesystem while writing file "stm_core.ko".

This indeed means that what's on the rootfs exceeds the default
ext2/ext4 filesystem image size, so increasing it is fine.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
