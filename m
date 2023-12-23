Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D66C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 14:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D32C60E65;
	Sat, 23 Dec 2023 14:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D32C60E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id woBk8za2TAqv; Sat, 23 Dec 2023 14:25:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E27A160AC0;
	Sat, 23 Dec 2023 14:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E27A160AC0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 702501BF280
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4943741C33
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4943741C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQaDKOXSuvKm for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 14:25:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC4B541BE0
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 14:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC4B541BE0
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8794FF805;
 Sat, 23 Dec 2023 14:25:14 +0000 (UTC)
Date: Sat, 23 Dec 2023 15:25:13 +0100
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Message-ID: <20231223152513.75d7363f@windsurf>
In-Reply-To: <20231220111828.3421212-1-xiangyu.chen@eng.windriver.com>
References: <20231220111828.3421212-1-xiangyu.chen@eng.windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703341515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3nmUWi+Nr5nB9QF3/INqdhiwxdLahf/yqONkotWmWmI=;
 b=cu19mFg9UeDmCAoEE/fB+0rCsetPkkoox7LFo4eTehL5EeqJ/lSzvvKMUP5ZH7s4VuowFg
 XzlOLVJxHAYQLRyKVX/5AzlNUHEvbbPG+g/USctu33Msoz2Ce9caEwRD/EKAH5RMClLdYY
 S5WBoJM6Tq8Z+cL+EvIrMJvlPDSm8YhiH9eJc3R8FsOysZzf8Bw2kzkidqUoX9ckItZHDp
 LaNTqCPrtTIjPn6dPOgkcMYasBHvD0NGQ0U38rH/vdGK16ZgpFQ/J0BfOtbQxzQLCo9DF9
 P9J/QyxRoC/IKiz97pHcX4RDZD/IQ0NfjtKDHY+vfhE65lqFjBb8M++gbeYGwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cu19mFg9
Subject: Re: [Buildroot] [PATCH] package/unrar: bump version to 6.2.12
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

On Wed, 20 Dec 2023 19:18:28 +0800
Xiangyu Chen <xiangyu.chen@eng.windriver.com> wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  package/unrar/unrar.hash | 2 +-
>  package/unrar/unrar.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
