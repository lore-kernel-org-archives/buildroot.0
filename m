Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44B5C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 378604056B;
	Sun, 11 Dec 2022 20:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 378604056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wM2gb2yBzuG; Sun, 11 Dec 2022 20:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84C2840569;
	Sun, 11 Dec 2022 20:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84C2840569
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0741BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6651380C00
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6651380C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0tOxP0z-2vt for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:54:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBB0480BF8
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBB0480BF8
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:54:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4351BE0005;
 Sun, 11 Dec 2022 20:54:30 +0000 (UTC)
Date: Sun, 11 Dec 2022 21:54:29 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221211215429.22afbcbe@windsurf>
In-Reply-To: <20221211152153.1833386-1-giulio.benetti@benettiengineering.com>
References: <20221211152153.1833386-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670792070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMGVXA+05A7ghdqVvmBPbeSZ/G5cp0E8U/QoFXlsq68=;
 b=mx2yZqaolQ815RKPdh/Y0Gru1XtG0Y18/vOAc1zPyPioUSfneXZd/VaSZ6Q6hMapSRgnzr
 4WT4REHNXICdvDih97xxKRlbaWZ6ay823epH3LnpRNJ//D+3vqk3rNfxdtWkwskyFKXGGs
 JtWX3dvc8tee4t07imeQ0j1yYL3rZBHQt0neh2wEw6D8Isxpwb83P1CokgAb1mY04gqyAC
 b+Wqm8RstZBjQ0VvR+DHwLsW3XxXJhXA+T4mt5KQDiQh8pQehOiTkKAHPXEvceGI6tVIGY
 omy9Zx1Vuy/nVCgc5dTLI1pdl5O2xdKmkN+3dHF8kOZkQzZLwhUbEfYpPfj/PA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mx2yZqao
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump to latest version
 to build with Linux version up to 6.0
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

Hello Giulio,

On Sun, 11 Dec 2022 16:21:53 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add pending patches upstream[0] to fix build failure. Patches fix build
> failure with Aarch64 and Linux 5.18/5.19/6.0
> 
> [0]: https://github.com/bootlin/mali-driver/pull/4
> 
> Fixes:
> http://autobuild.buildroot.net/results/6f073fea149533a294dd838ce8373185236fe1d4/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...ernel.h-fix-build-failure-on-aarch64.patch | 54 +++++++++++++++++++
>  ...ence.c-fix-build-failure-on-dma_resv.patch | 53 ++++++++++++++++++
>  ...ence.c-add-local-dma_resv_reserve_sh.patch | 38 +++++++++++++
>  ...ence.c-add-local-dma_resv_add_shared.patch | 43 +++++++++++++++
>  ...ild-failure-with-Linux-version-6.0.0.patch | 49 +++++++++++++++++
>  5 files changed, 237 insertions(+)
>  create mode 100644 package/mali-driver/0001-mali_base_kernel.h-fix-build-failure-on-aarch64.patch
>  create mode 100644 package/mali-driver/0002-mali_kbase_dma_fence.c-fix-build-failure-on-dma_resv.patch
>  create mode 100644 package/mali-driver/0003-mali_kbase_dma_fence.c-add-local-dma_resv_reserve_sh.patch
>  create mode 100644 package/mali-driver/0004-mali_kbase_dma_fence.c-add-local-dma_resv_add_shared.patch
>  create mode 100644 package/mali-driver/0005-Fix-build-failure-with-Linux-version-6.0.0.patch

I have applied, but what I did is that I merged your pull request in
the mali-driver project, and then turn this Buildroot change into a
simpler version bump.

Also, while at it, I granted you maintainer rights to the
github.com/bootlin/mali-driver repo so that you can directly push
things there: you're de facto the person looking into this currently!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
