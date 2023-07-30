Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DD6C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D0760D4D;
	Sun, 30 Jul 2023 10:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D0760D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PuzJNki8EqKe; Sun, 30 Jul 2023 10:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E911A60A5D;
	Sun, 30 Jul 2023 10:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E911A60A5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 016FA1BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE016410E7
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE016410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iZT8tojb-SF9 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:12:42 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A569410D5
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A569410D5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2923D240006;
 Sun, 30 Jul 2023 10:12:38 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:12:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730121238.6fcf8661@windsurf>
In-Reply-To: <20230730065829.695017-1-bernd@kuhls.net>
References: <20230730065829.695017-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690711959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFU6zpxTo6R9GP2Ij9SzVY9mRTH72TSQO2nycZSUPFo=;
 b=PkEHaeb0SbS07ko78gLmErcZ3TJGkb6s4OJHkzgV2cPqND+7a+b3Yhb6D0pC1gB4T0bn7Y
 xvHd94ZA2cdWfO8R7q1wXiK0msDU5V1JLUbR/M9lLPoYMH5g2veZxrCBpZSBDb2nOZ3Eto
 su0OsbIDuU2Z6EV9XU+A2718RxkN1ZECjBOzc5X34wzLRTztVv0DPXCCxFV8v5P5ck5Qvx
 Joni+W4R2E8sQmskKKYGioWITpiPy2UFzGv0U35pndiXhuARAlD7PmYQhY29UsJj7YZW8T
 E2gIHddoLOLBGpPuBO4FXgdWadjbYnSMuXHZ2+zGDsmehULe1qfZxL/id2x1nA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PkEHaeb0
Subject: Re: [Buildroot] [PATCH 1/1] package/mbpoll: bump version to 1.5.2
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
Cc: Jon Ringle <jringle@gridpoint.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jul 2023 08:58:29 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://github.com/epsilonrt/mbpoll/releases/tag/v1.5.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mbpoll/mbpoll.hash | 2 +-
>  package/mbpoll/mbpoll.mk   | 2 +-
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
