Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930B7C00528
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 22:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 349C6414CA;
	Sat,  5 Aug 2023 22:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 349C6414CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P7U4edznPMjg; Sat,  5 Aug 2023 22:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DAE741514;
	Sat,  5 Aug 2023 22:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DAE741514
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 136231BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22DF360A7D
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22DF360A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C8hLhQHvDd4q for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 22:43:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADF5760A69
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 22:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF5760A69
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4022AFF802;
 Sat,  5 Aug 2023 22:43:52 +0000 (UTC)
Date: Sun, 6 Aug 2023 00:43:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806004351.6bb1d13d@windsurf>
In-Reply-To: <20230805213542.3588279-1-bernd@kuhls.net>
References: <20230805213542.3588279-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691275432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RVrMrx4RvxIJFk3TIeUpryvPu0zTJnPrma45MK0+Cw=;
 b=Z7QU/DJHiri9VYN6AFlNb5wzKdP+z9ewZ/wt4Ip7gDJUKwcP6m8dfnxH0ZQW/cfkpAf/uT
 Xcw65+kcVvGpgJm8cf1Eo6h6lYJO2ybqowxhPeEVGVN0jD2ixoh/hxR2691ms4i8FtwEZA
 oX+Uwl+yV94wesPG53cr4C5CnTBIkaPaxeZs9kprBPzxTS5VX5G1V/uTfxSYvnJ/Mfodis
 xYfXOJNarorymoLxZOQJDF8xu+SWdIX/hPww4P0n5yNGJ+dsfKfMP5IhZ5tFP2sgOSD0G9
 cB4DyoqqboVoGYiGVjhHHVYQdXrzSucdEwhejxBw+wkwlAe581H9JwSlfg/RQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z7QU/DJH
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20230804
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Aug 2023 23:35:42 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updated license hash due to various commits:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/WHENCE
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/linux-firmware/linux-firmware.hash | 4 ++--
>  package/linux-firmware/linux-firmware.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
