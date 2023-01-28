Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08061C636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 22:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8946B404EB;
	Sat, 28 Jan 2023 22:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8946B404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8J3OwlOwGFa; Sat, 28 Jan 2023 22:36:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB8FF40498;
	Sat, 28 Jan 2023 22:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8FF40498
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8098A1BF44C
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 676B0813DF
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 676B0813DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kKM612FOdlBc for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 22:36:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DA75813C9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DA75813C9
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:36:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 503EAFF806;
 Sat, 28 Jan 2023 22:36:00 +0000 (UTC)
Date: Sat, 28 Jan 2023 23:35:59 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230128233559.32a07c80@windsurf>
In-Reply-To: <20230114003646.1540536-1-giulio.benetti@benettiengineering.com>
References: <20230114003646.1540536-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674945360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8M0IMKJ6C6T0va0ESnx98WhZLcQlF84AnqyYAojey4c=;
 b=HVEhN1B0uLV/GexHGkcWlBipiZu5miPTwlxspOckZcU+huKtifqfQgPDMtyUR4jYUazjJx
 QvbmaHELDX5vOHywd+0wHhvhdXnkpiRlcST/G9/JNzt5361C7hnoD/fb8lp70FWaCk4/mL
 CRJ+h617urdTA/o3tL0885kUlktA/dSb8fcH0v21ENArmyOVR3ar/NsiSBEpw2tKn6woo2
 DvRXstIHAHrHb9VbEmSbVPUhX+4FDfB/mhJ5bH/T4jVMmARRiotETMAd2k/a3xS6YEBD6y
 YYIUKg71/EfqZm2RaK3IZTCTHaUCCfa4Gsov9atotdyT7J3pZ2cTaxH9+2V2UA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HVEhN1B0
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump version to 3.13.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Jan 2023 01:36:46 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libfuse3/libfuse3.hash | 2 +-
>  package/libfuse3/libfuse3.mk   | 2 +-
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
