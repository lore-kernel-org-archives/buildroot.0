Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECD2C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86BA241886;
	Wed,  6 Jul 2022 21:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86BA241886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZaHlLQfCSlQR; Wed,  6 Jul 2022 21:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C224161B;
	Wed,  6 Jul 2022 21:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55C224161B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D765D1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1BD040C44
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BD040C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOxyOU-zPGIs for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:20:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4D544049A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4D544049A
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:20:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BAB66240002;
 Wed,  6 Jul 2022 21:20:28 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:20:27 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220706232027.023a9db9@windsurf>
In-Reply-To: <20220628175528.315928-1-bernd.kuhls@t-online.de>
References: <20220628175528.315928-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657142428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwDtTLkCnzUVSWcjgn+p/JlgjLll7WolocbEWWLrgCs=;
 b=ElxrOiIvaQy1+7uf9J5zq/D0yU3TnQQrC0kX+Cx62sL0n4QKgDpeLcJoOQ000zDyICB2qf
 WPw2Sf5/TpUGuq1mkF8lrlgikuQ/S1Z0ZTg7hi0sp/aw4EofMGFHhbAjV6JDuhpfBR1m2X
 IuwSp4t8eRGkby0qD5tN2YusNAd8fXJmmpHS2dTCNrZF+M5k39wFeWaKhlJXlpysRy+6nu
 3OpyyLcW91bVf+ZV0hTkjMfQJ5yI7D+gatJF97pxzrnBYGicLOMGw9Tq+5jPtumW2AgS5n
 QjYra86Pfv/ihdnsi7Rl5F3eJ5SA+22oewJgcsZ/AG7TB/GqteiOs6NCNv2ijA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ElxrOiIv
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: bump version
 to 1.8.1
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

On Tue, 28 Jun 2022 19:55:28 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://lists.x.org/archives/xorg-announce/2022-June/003168.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
>  package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
