Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DB7C0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D7118408A;
	Thu, 27 Jul 2023 21:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7118408A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8UwrPYP-D4lj; Thu, 27 Jul 2023 21:17:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A5AA84084;
	Thu, 27 Jul 2023 21:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A5AA84084
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE28F1BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7BC5613CD
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7BC5613CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCCXpbkQ2yPk for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:17:20 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AC62613CB
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AC62613CB
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7AC22000A;
 Thu, 27 Jul 2023 21:17:17 +0000 (UTC)
Date: Thu, 27 Jul 2023 23:17:16 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230727231716.5555bf9a@windsurf>
In-Reply-To: <20230727180309.2108530-1-james.hilliard1@gmail.com>
References: <20230727180309.2108530-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690492638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SfX9UdNXDjVUkyKnfmg4AhFLKdwXraWUlsqBuI1qqL0=;
 b=dDUMlZnY2OpWIgNBCGYTTAcJ5P92kej4lfxsIr/o/ZJa4L3LLsUdnabM/8KtauO+FyeE3I
 Et08noKZUGgUJv2wXfM7X5McTmIjj1emdMPG2Ru1qyT9FptyQNYjLGRNcEh8yMvZ2NBbOa
 Gxe5/XIvzYXoi1uDErNo9iOi01zCR0xiOXFhC9lUnCnFr+hb38HFGeEuzbEcmpdHOMtY+l
 WLYZBhsLsXFiotqu/NzYyo1nDDx76qBv4ESM8hrnnCMwFN5NNO2Tf3655iHMfdybncnKPM
 wP0kWOiWVpBn2QoqEcviCfve299+OyG+/OCIVDR5UeWPGluDkDirjm8nnoBg6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dDUMlZnY
Subject: Re: [Buildroot] [PATCH 1/1] package/weston: select the seatd daemon
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

On Thu, 27 Jul 2023 12:03:09 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> When we updated weston to version 12.0.1 the only supported launcher
> was the libseat based launcher.
> 
> For this launcher to function correctly when used with weston we also
> need to enable the seatd daemon.
> 
> Fixes:
> [libseat/backend/logind.c:660] Could not get primary session for user: No data available
> [libseat/libseat.c:76] Backend 'logind' failed to open seat, skipping
> [libseat/libseat.c:79] No backend was able to open a seat
> libseat: could not open seat
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/weston/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
