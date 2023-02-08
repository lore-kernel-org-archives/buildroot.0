Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A43FC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 10:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0650181F8B;
	Wed,  8 Feb 2023 10:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0650181F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZ6a4pbt6ivT; Wed,  8 Feb 2023 10:54:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FCFC8141F;
	Wed,  8 Feb 2023 10:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FCFC8141F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8711BF38B
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC77F410D5
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC77F410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id beMAPWUgpXeg for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 10:53:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B8C140259
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B8C140259
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 10:53:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B05A6240005;
 Wed,  8 Feb 2023 10:53:55 +0000 (UTC)
Date: Wed, 8 Feb 2023 11:53:54 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208115354.7437af06@windsurf>
In-Reply-To: <20230208100704.68093-1-angelo@amarulasolutions.com>
References: <20230208100704.68093-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675853636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPS0hOSPbVoUyOqx3xE/walweEcwQm01YKD88nPYsJI=;
 b=GRsXKEdslZyW1bUgVhUjk0HswPbgcPpukqRgvzQilriz1tX0TPLSoJWe6V1mh4D6MiFZEx
 wqeGbgQIB/qRcZILAJzPu7PTE5Gj8INa+IIwO8Am3AzVy1a2y+E0dU4t2Zdx6dg44z7ShS
 EwovElLQWfZUvLsGsJ1G0jRNt2CblAD/BtZfzNWLygyndsHP78ouldWaKR1SbqVPdC070c
 /pp9OiSd1YvxAI8IZn3yKJXUA0fcp//VEsQ+UXikKZYzXN51ZEEdvvmQFkTEITZ4+Mp50t
 CMDEAIyV/EGU8vbrQkCsY4DYHnuhHqc74szY5FFmX6oxfpNsUyO9oWsanObiaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GRsXKEds
Subject: Re: [Buildroot] [PATCH v6] package/gtkiostream: new package
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
Cc: Matt Flax <flatmax@flatmax.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Feb 2023 11:07:04 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
> new file mode 100644
> index 0000000000..58c22ecbcb
> --- /dev/null
> +++ b/package/gtkiostream/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_GTKIOSTREAM
> +	bool "gtkiostream"
> +	depends on BR2_INSTALL_LIBSTDCPP # eigen
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_EIGEN
> +	select BR2_PACKAGE_FFTW
> +	select BR2_PACKAGE_FFTW_DOUBLE
> +	select BR2_PACKAGE_FFTW_SINGLE
> +	help
> +	  This package provides many useful software engineering and
> +	  signal processing includes and linkable library.
> +
> +	  https://github.com/flatmax/gtkiostream
> +
> +comment "gtkiostream needs a toolchain w/ C++"

and threads.


> +GTKIOSTREAM_VERSION = v1.8.0

Should be 1.8.0

> +GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,$(GTKIOSTREAM_VERSION))

And should be:

GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,v$(GTKIOSTREAM_VERSION))

These issues can be fixed when applying, just noting them here as I
noticed them.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
