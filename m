Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D77C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C9D40184;
	Sun,  6 Feb 2022 10:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ArYt_SjyKU3Z; Sun,  6 Feb 2022 10:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E44214016D;
	Sun,  6 Feb 2022 10:58:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A099F1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EABB60C21
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKD4EOdw9wby for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:58:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 946F560C14
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:58:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D1B471C0002;
 Sun,  6 Feb 2022 10:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644145095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bobcrhSwlZ6duo7dgifBvII++gif5Gdl8UINRiWignE=;
 b=RKXAAY1M2MJe+k62pV64U5zj+y3UEjXuadDBAiK2LcVg5p9XSMB1Yd69v8PA/Syq/xKsBO
 lxd+4Rayi5QsK/2REfaRoO8d58KtJjck7Fg+VJR/TD+YsKx/N7gesrUZLFazarTi6ZZag0
 V3VlIDDQa9rL8eZ/vaVfheyBTGefNylPlCtHG5P9iC1Qj6853mKyt8tqVyIiCBdiU6H7Rg
 o7OXVMuN0iAzmAkBSr9SS9DzhoZWzyJCVtOIPmmBad1EHTVMTH5OVkM1OgkjwlPBIHKhzv
 mxSlo2ebd4zlTthqQoK75xs+8zM7IkWhl7RYIFuyT3c8hJJNVnpnlPw5Fv+Lqg==
Date: Sun, 6 Feb 2022 11:58:14 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220206115814.3fe54f1e@windsurf>
In-Reply-To: <20220206090809.1532589-1-giulio.benetti@benettiengineering.com>
References: <20220206090809.1532589-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] toolchain: update gcc bug 99410
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Feb 2022 10:08:09 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Gcc bug 99410 reappeared in gcc 10.x while building belle-sip, but it's
> fixed on gcc 11.x, so let's update bug conditions.
> 
> Fixes:
> http://autobuild.buildroot.net/results/846597f3573d3b0d52e80627a9577d14b9348547/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  toolchain/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
