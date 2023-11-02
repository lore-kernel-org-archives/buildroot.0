Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F03C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 17:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8F45851ED;
	Thu,  2 Nov 2023 17:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8F45851ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j516ZPTDQLiO; Thu,  2 Nov 2023 17:02:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2181A85201;
	Thu,  2 Nov 2023 17:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2181A85201
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3AB31BF831
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C5C54351A
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C5C54351A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZniIUlQeZ_M for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 17:02:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B05A74350D
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 17:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B05A74350D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EED5E0005;
 Thu,  2 Nov 2023 17:01:59 +0000 (UTC)
Date: Thu, 2 Nov 2023 18:01:58 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231102180158.5696121f@windsurf>
In-Reply-To: <20231017104015.1492775-2-adam.duskett@amarulasolutions.com>
References: <20231017104015.1492775-1-adam.duskett@amarulasolutions.com>
 <20231017104015.1492775-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698944519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iojJbuLLXHonMe9Y6hV4bgTGJjIHeZ77Bezv6z4goSI=;
 b=jnXA7MbKrNXMn64H6Z2LygAxKR7OPfhuReW4vct0zJL5yj5pz9Yoix8hvOmPoA8qQHbEqM
 wBqWxNlyJPk6G23MWEGuxj9dSM/52l5AhCk2U5uC+obE1HIV0Z/LFMqurZg8lYzuU5Uu0Q
 4bugJI8Y6UPZzM3GOj0kCHdVjws+FYa15MQWuYG+RhbVEpivLb50Jul+q8QCKaCMnO2EDu
 fmhaGgqnd9HvcNG7I6XwR5ubJEOUC++eMr8hrLwAD9pzHGMQ/IntoEYw0I4BwlU3MJ4UCr
 EOewD3dxQT1EKbG4bcLPojCAAOi0HwObE9EhiAcrIwNi7x0NSdDCUuj7pJ0XPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jnXA7MbK
Subject: Re: [Buildroot] [PATCH 2/5] package/mender-grubenv: Fix per-package
 building
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 17 Oct 2023 12:40:12 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> -define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
> -	$(MENDER_GRUBENV_INSTALL_I386_CFG)
> -	$(MENDER_GRUBENV_INSTALL_EFI_CFG)
> -endef

So presumably MENDER_GRUBENV_INSTALL_IMAGES = YES is no longer needed?

(No need to resend for that: can be fixed when applying, I just want a
confirmation)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
