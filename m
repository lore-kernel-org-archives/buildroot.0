Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7886C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FC4582258;
	Thu, 24 Nov 2022 21:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FC4582258
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8HzPoo9efv4t; Thu, 24 Nov 2022 21:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DAA88209A;
	Thu, 24 Nov 2022 21:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DAA88209A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 287B31BF311
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0418040180
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0418040180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnkYK7QpK7nb for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:55:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2C32400EF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2C32400EF
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 21:55:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C65A340004;
 Thu, 24 Nov 2022 21:55:35 +0000 (UTC)
Date: Thu, 24 Nov 2022 22:55:34 +0100
To: Gary Bisson <gary.bisson@boundarydevices.com>
Message-ID: <20221124225534.5c8867f0@windsurf>
In-Reply-To: <20221116091248.755689-1-gary.bisson@boundarydevices.com>
References: <20221116091248.755689-1-gary.bisson@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669326936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wE6b2wMDyoqVqCt0wBkKVjPRoxfXgJ0FbDC5RZf4Quk=;
 b=bkutDQaVkL9JXanqhXEcGx4ztGqaApdbk9TkfPAy6fADzh4mgLna5Pyrjxmb0l9A859Ype
 9tWyo8ZeeD65uh/9yqsXp4VcFldIlfpiGkRgZ3pGJ0vZSBE3qK33yprRRq8eqqC+b6aQIW
 HX/9Ni1PHfYyS0E0iW4NIq4Nfw6ztinQwb859woZrqUX97JeATuD+a22dKiGLXPrSbiFL4
 Cd/N/SRXbchFyje9667FsAzcr4p5hrhHIYLpFdXkDGLi2/85lzTpJafbekrQs6yObAy4SW
 PIwFGGguvLXiNTeIn3uRk+rvzyHnbKAA2AGr5rWEGA6t84Xg8n/4oxcaawGVhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bkutDQaV
Subject: Re: [Buildroot] [PATCH] package/freescale-imx/imx-vpu-hantro: bump
 version to 1.27.0
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

On Wed, 16 Nov 2022 10:12:48 +0100
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> - Same version as NXP release 5.15.52_2.1.0
> - EULA/COPYING: update to LA_OPT_NXP_Software_License v39
> - No official changelog but the main addition is the support of skipped
>   h.264 frames
> - Add patch to fix kernel version test from the package
>   - Yocto doesn't need that workaround as it installs the kernel headers
>   - This is needed for NXP 5.15+ kernels (using DMABUF)
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  ...0003-Fix-Linux-kernel-version-header.patch | 45 +++++++++++++++++++
>  .../imx-vpu-hantro/imx-vpu-hantro.hash        |  6 +--
>  .../imx-vpu-hantro/imx-vpu-hantro.mk          |  2 +-
>  3 files changed, 49 insertions(+), 4 deletions(-)
>  create mode 100644 package/freescale-imx/imx-vpu-hantro/0003-Fix-Linux-kernel-version-header.patch

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
