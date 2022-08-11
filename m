Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E41C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8907960EA1;
	Thu, 11 Aug 2022 20:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8907960EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AuwgxckzQ1g7; Thu, 11 Aug 2022 20:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A614660E32;
	Thu, 11 Aug 2022 20:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A614660E32
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 082441BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1C4C4013B
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1C4C4013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 43SAW9g066dL for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:34:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB10E400E2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB10E400E2
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:34:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9755120004;
 Thu, 11 Aug 2022 20:34:41 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:34:40 +0200
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20220811223440.7f672edd@windsurf>
In-Reply-To: <20220803192229.0356e729@windsurf>
References: <20220717200407.1400318-1-thomas.petazzoni@bootlin.com>
 <IA1PR12MB62105EDFE310AD93A55A33B6A18D9@IA1PR12MB6210.namprd12.prod.outlook.com>
 <20220718091350.4b968717@windsurf>
 <IA1PR12MB62107029D82ADA688CF7C210A18F9@IA1PR12MB6210.namprd12.prod.outlook.com>
 <20220726152108.3470eb7d@windsurf>
 <IA1PR12MB6210D4881185B436788BF05EA1969@IA1PR12MB6210.namprd12.prod.outlook.com>
 <20220803192229.0356e729@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660250082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XlFw6tF6uMvwqfD3xvS2ZsUJKhP0oMLgMewUoyasjI0=;
 b=HWTyUb33SW5LnfBhDEEfwLQ5cw11UFsUnWisoQjFetBlPSw049sImRPUmk0kvtYcxrGDj0
 DKG00uUfZ56YwTGYFFIyEqVkW4BIGwl/I6/pJo0kTacyG9apLfpeZgcnfMkYpLZnSU7jyC
 /53m28H1XFnZaQHHGm/pwaVZDl2J1Yu5TM+55IJZFnnJNydDPDXncc2ZzjiPi1n7EsV2+H
 fijrhCpKwIchwtjRgm8/jou+9h2m4Z3jPCOzNLd9K0/JVSh6L9uPboLe26rXPdYKnoidRM
 FKfs/pniJvus1b11s+z+hzgoPrWpig37BVnBgTyiNypBDAfFidi0SH7XBDK1gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HWTyUb33
Subject: Re: [Buildroot] [arc-buildroot] [PATCH] arch: remove support for
 BR2_ARC_PAGE_SIZE_4K
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

On Wed, 3 Aug 2022 19:22:29 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> > So, right, suggested change of explicit setup of "common-page-size=max-page-size"
> > is a good fix as it is compatible with older Binutils (before the change
> > referred above, i.e. before 2.38).  
> 
> Could you provide the patch?
> 
> Keep in mind that this block of code:
> 
> # Explicitly set LD's "max-page-size" instead of relying on some defaults
> ifeq ($(BR2_ARC_PAGE_SIZE_4K)$(BR2_ARM64_PAGE_SIZE_4K),y)
> ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
> else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
> ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
> else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
> ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
> else ifeq ($(BR2_ARM64_PAGE_SIZE_64K),y)
> ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=65536
> endif
> 
> in arch/arch.mk, has been recently modified to be used for configurable
> page sizes on ARM64. So, if we decide to add
> -Wl,-z,common-page-size=XYZ, it also needs to work for ARM64 (I think
> it should, but I just want to warn that this code is no longer
> ARC-specific).

Do you think you will be able to provide a patch to fix support for 4K
page size support on ARC in Buildroot?

It is not really a major feature of Buildroot, and it's causing some
build failures in our autobuilders, so if no fix is provided, we'll
probably end up dropping support, as proposed by my patch posted on
July 17.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
