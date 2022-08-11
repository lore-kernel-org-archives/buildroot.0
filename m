Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D39EC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5F34401C9;
	Thu, 11 Aug 2022 20:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5F34401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ibOpL1m2hml; Thu, 11 Aug 2022 20:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C50A44013B;
	Thu, 11 Aug 2022 20:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C50A44013B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B8DB1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53C4941820
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53C4941820
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dScCA-tV3JHs for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:25:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B51417FA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26B51417FA
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:25:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 52F9B240005;
 Thu, 11 Aug 2022 20:25:28 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:25:27 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220811222527.30fff51c@windsurf>
In-Reply-To: <20220811133153.86866-1-bernd.kuhls@t-online.de>
References: <20220811133153.86866-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660249529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mF5/D5ARR8qKK/zCvPpkbLl8HRv2r3MSvbM6cPYE3jM=;
 b=JHcBKTIHgGcOd0mwuwyJKrmKeLHgQt9i0b9zwxzaIb3yBVqX4zrcAGOPD0s8DBuFdyeoxK
 pcPVRXsiRvF790Hpn+xvANMLlBC6X+58UzVPKlV/o0wMPGZ3Y1woNal71PNOQfbwsgrUk0
 mn8yw4zjZr5didhqfS3y0DsoQN5CRAwbl6yaJNUjJsRnxaZf/sursMj1GdbwekxlIrHaNS
 h7nsFMrGuJgcneD+8mX1/CmVmsGv6+aki49m1x2Gvla0KTDuxUI/L0qPCOSQxYsVNAFWyv
 BnLrpaDlQMMTVIX0U5AgqDMHwBjFIA4fuNQmlzdTywKPrP8akoHSFp5JtQXzDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JHcBKTIH
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.1.6
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Aug 2022 15:31:53 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2022-August/000683.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  package/mesa3d/mesa3d.hash               | 5 +++--
>  package/mesa3d/mesa3d.mk                 | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)

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
