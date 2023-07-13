Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA19C001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3697E4050C;
	Thu, 13 Jul 2023 20:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3697E4050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ID2wnLdHsAxk; Thu, 13 Jul 2023 20:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74F8640497;
	Thu, 13 Jul 2023 20:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74F8640497
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DD671BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12E4D41C0A
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12E4D41C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gm0q4gf2APHA for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:58:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7108341B4F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7108341B4F
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:58:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60B53FF804;
 Thu, 13 Jul 2023 20:58:50 +0000 (UTC)
Date: Thu, 13 Jul 2023 22:58:49 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230713225849.6ff97822@windsurf>
In-Reply-To: <20230608191301.3527479-1-bernd.kuhls@t-online.de>
References: <20230608191301.3527479-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689281930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psh3ahRCiw06ku+Wzd6IBg9qT7+C+/GVCsdKdxQJsk0=;
 b=MxAyl41nAyzrtSS/+aaAPYCJ8gge8vezxC5uGEkzHeu13PUz5aRcFhPwhb1Nn9tQym9K48
 o5oeKWEyHiovjMkyoLcxL6pyhNb5g43drHTx/C1mmnnpd0hCgKQbnGsQEkMCWF7C24z5F3
 Ntao2chHzwSobgXeWs2mL4/DXDBnX6hMCERFJ4Q23QANnNLCpC1JRRxT1ILM+CK273LuzP
 cdiRGsO7vebwtT/b+dvkmggmFLmBzINOsZQrb/aTl1fAkkGwbk3QXf0CCYlW6gIHHkvzBn
 tbWLx89IQpKwD7xk27f0v+sRmkeoXER+AudTl0ZTzi+01HkxA8coVHTGzL//NA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MxAyl41n
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20230515
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

On Thu,  8 Jun 2023 21:13:01 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated license hashes due to upstream commits:
> 
> - copyright year bumps
>   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/LICENSE.amdgpu?id=d0598c3b82f24f3ed811f5505f4090924c4da626
>   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/LICENCE.qat_firmware?id=24c9df9b942518717dd53966712df69ac35c8b90
> 
> - other changes
>   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/LICENCE.qat_firmware?id=588dd07134daf4b0f6f74698f24eeb74ebe90012
>   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/WHENCE
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/linux-firmware/linux-firmware.hash | 8 ++++----
>  package/linux-firmware/linux-firmware.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
