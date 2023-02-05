Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5901EC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098AD60669;
	Sun,  5 Feb 2023 12:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 098AD60669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcipjkwUS2ql; Sun,  5 Feb 2023 12:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41E8660760;
	Sun,  5 Feb 2023 12:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41E8660760
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C70D1BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25B9260701
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25B9260701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BefwsYARhZPL for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:19:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC42060669
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC42060669
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:19:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A9DC240002;
 Sun,  5 Feb 2023 12:19:37 +0000 (UTC)
Date: Sun, 5 Feb 2023 13:19:37 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230205131937.05c15418@windsurf>
In-Reply-To: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
References: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675599579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koWytQr3lh+cmnwPXKxW8UrzGYvVXudLyIG0H/hT3Pc=;
 b=Q7QWVhMMQrMA8fIH0QoqMThbohW1XfpVe2G9v56KG5FISgHXBlhnjTq9qkJkVz8KHS492R
 vwkrH7g60xA0RFPlLDqgYHoftMMcTzUDm+TVkrs7wWUjshlTWUrlYtq1xu+aOJHxQQdODa
 pq/LYx8J2gqLRtFQzbmO506Yw6aMyMvtN/+R8nUOTEDdPUf529zE8CUcDtk2v1CowIKfor
 BsfhUUM4BNu8AhzHlwwPSd33gFTfxBWO0aJlJbhCA+p1+dlBFblndSJWA7alvsWmdAqA3o
 zzJumUzMcLrkVXJht5IZcLAGVKPOe7I6PSsrkEo0b6CnFL8tWKP0CNg3GpvbMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q7QWVhMM
Subject: Re: [Buildroot] [PATCH 0/7] Bump Linux,
 U-boot and ATF versions for olimex_a* boards
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  1 Feb 2023 23:32:34 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Giulio Benetti (7):
>   configs/olimex_a10_olinuxino_lime_defconfig: bump Linux to 6.1.9 and
>     U-Boot to 2023.01
>   configs/olimex_a13_olinuxino_defconfig: bump Linux to 6.1.9 and U-Boot
>     to 2023.01
>   configs/olimex_a20_olinuxino_lime2_defconfig: bump Linux to 6.1.9
>   configs/olimex_a20_olinuxino_lime_defconfig: bump Linux to 6.1.9
>   configs/olimex_a20_olinuxino_micro_defconfig: bump Linux to 6.1.9 and
>     U-Boot to 2023.01
>   configs/olimex_a33_olinuxino_defconfig: bump Linux to 6.1.9 and U-Boot
>     to 2023.01
>   configs/olimex_a64_olinuxino_defconfig: bump Linux to 6.1.9, U-Boot to
>     2023.01 and ATF to v2.8

All applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
