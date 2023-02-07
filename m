Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C492C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A51540B2F;
	Tue,  7 Feb 2023 21:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A51540B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vm9eaFvNRGZM; Tue,  7 Feb 2023 21:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F33B40B26;
	Tue,  7 Feb 2023 21:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F33B40B26
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AFE31BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1BA6416ED
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1BA6416ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8cdVjFfgX4F for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:50:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 577D74093F
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 577D74093F
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:50:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 28032240004;
 Tue,  7 Feb 2023 21:50:25 +0000 (UTC)
Date: Tue, 7 Feb 2023 22:50:24 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230207225024.768b301d@windsurf>
In-Reply-To: <20230207210934.3132539-1-angelo@amarulasolutions.com>
References: <20230207210934.3132539-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675806625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBAoi1hreupmAh467evmCo0S2EpqpH5+EVWoF26lmZk=;
 b=atQoD8J6IhUItGY+J9MIDcRSjNENTL7XKcaNr88KjX2oV5ECvRKspm3dwuyBpZJomQ+K+W
 oLyjLUXXE5QxU3FczstRwhaIOqfG29WltfalVkvvish3xzXhoodJc1r+UwzQBfCbJBSASr
 jRMw1VY4Z3tyWESezBiCjAJdsYIgPllYVWMS/taAUtngn4jXi+QYAFf3HCedwdPTlZr85L
 hTx0ockxtD/aFcvCGs13FiFNpyf3kCN5n6XoNGzhr+Nlam56YuF2vs1Z5dcsxVzbaEc4Vw
 53BcLtQEbfXX/iVtIAmD/bndQXjzmdxSu4/mxhYTlMTLO4I8GjcmsXK6WWP1gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=atQoD8J6
Subject: Re: [Buildroot] [PATCH v5] package/gtkiostream: new package
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
Cc: romain.naour@smile.fr, Matt Flax <flatmax@flatmax.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 22:09:34 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Matt Flax <flatmax@flatmax.com>
> 
> This package provides many useful software engineering and signal
> processing libraries.
> The package offer also a GUI written in GTK which requires several
> missing packages and therefore is left disabled.
> 
> Signed-off-by: Matt Flax <flatmax@flatmax.com>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> v4:
> * Bumped to 1.8.0
> * Added myself to DEVELOPERS
> * Added dependency on octave when enable instead of use
>   --disable-octave configure option
> * Fixes from check-package
> v5:
> * Fixed wrong syntax (Romain)
> * Added optional dependency on sox (Matt)

I wanted to apply, but a quick test build with:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_GTKIOSTREAM=y
# BR2_TARGET_ROOTFS_TAR is not set

ends up with:

/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/12.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: cannot find -lfftw3_threads: No such file or directory

So, I will hold off for now :)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
