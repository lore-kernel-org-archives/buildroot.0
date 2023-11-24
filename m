Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1027CC61D97
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 08:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7998401AE;
	Fri, 24 Nov 2023 08:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7998401AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GgwwOVDC8zRH; Fri, 24 Nov 2023 08:43:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADEF841466;
	Fri, 24 Nov 2023 08:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADEF841466
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 726D01BF5AA
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 08:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B3BC613D3
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 08:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B3BC613D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXeczMiVcWw0 for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 08:43:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FC2B613CA
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 08:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC2B613CA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4753F1BF20A;
 Fri, 24 Nov 2023 08:43:06 +0000 (UTC)
Date: Fri, 24 Nov 2023 09:43:05 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231124094305.64c322bd@windsurf>
In-Reply-To: <CAHDQB6M3-hgq+Pdyz=fS3G=f4xh_OLJXLEmkfKZpi87qQEEqLg@mail.gmail.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
 <20231123000819.488595-3-adam.duskett@amarulasolutions.com>
 <20231123144454.50fd7944@windsurf>
 <CAHDQB6NSD3y2mwAZocqQ4Z4V6uD7LQaJ6hdp6xqHh7cB6_AYcg@mail.gmail.com>
 <CAHDQB6M3-hgq+Pdyz=fS3G=f4xh_OLJXLEmkfKZpi87qQEEqLg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1700815386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5YmyIi32bjeUzEjawLsVfZYqzQS74kAA4ZoctG1No0=;
 b=OuB6nwPcPIg/6+vR8KoEKyv0A0OqqjhuL5nAcqYydHY5J17M/Yg8lqJIuS8jneAs5gxc6w
 cXuzjV1nLKgueOfbt9VIR6K1E2+Ki/RwHazXxGalGCfLU+B5pQP0amO4APU1MvRbbQjT82
 ON3hUNxELz+4fN0cn/6i6fnacIuja3S1HNCUKP5uBtuyye8RC83kyfXR82+abdvcj9vttX
 a09quc2gBg23TcURczmQOv5tWpplH0KwWncqjZolxEPbA6jS/UXShDDPGU3q41wZ42Wzbj
 mjpDy3XoGWlE0PX7JCf8HfHePOFME+XltpktM9uTHVvcER81cPYqS6F/g/E43g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OuB6nwPc
Subject: Re: [Buildroot] [PATCH/next 02/13] package/dmenu-wayland: new
 package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 23 Nov 2023 12:13:32 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Forgot to mention, does it really matter if I use
> ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu vs what is there now? Does it
> not achieve the same goal?

Well in:

define DMENU_WAYLAND_SYMLINK_DMENU_WL
	cd $(TARGET_DIR)/usr/bin && \
	ln -sf dmenu-wl dmenu  
endef

the indentation was not correct, so I wanted to point this out. But
while writing this, I realized that:

define DMENU_WAYLAND_SYMLINK_DMENU_WL
	ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu
endef

was simpler and cleaner.

I'm not sure how you don't realize that doing directly "ln" is simpler
than cd+ln.

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
