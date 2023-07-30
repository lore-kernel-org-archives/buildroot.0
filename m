Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C009EEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF5261023;
	Sun, 30 Jul 2023 21:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BF5261023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFQV5Ejqm1e9; Sun, 30 Jul 2023 21:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 626D36101F;
	Sun, 30 Jul 2023 21:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 626D36101F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44FE11BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AE6161021
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AE6161021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dl2r8NNr-9iN for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:26:03 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C34206101F
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C34206101F
Received: by mail.gandi.net (Postfix) with ESMTPSA id E402D240004;
 Sun, 30 Jul 2023 21:26:00 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:25:59 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230730232559.463da1d5@windsurf>
In-Reply-To: <20230222204134.38884-1-ju.o@free.fr>
References: <20230222204134.38884-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690752361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuT41i3Yt2oGQ0vbv5sIhTTwmT1aI+EXxEaIFHcHAyw=;
 b=ZMT232ZpESmJ3OvhFTAH8nPDZyTlSoXHy195RPgF5MgjHXzBI+gaifruQefxHPq1F2lpFj
 n572x1vFK4EUtLoWxJcf4d9GQbyOmPFIQlqTyf58JwypX9nxmFevQC+gEQbzHMqzAKdf8Y
 gxlOYx4l9sOTtuTbpSKaJ7mo18WLH2qrJNhAB2ho2NjC4JaDSfDR0Ec6GA1K3Vi50ymuv5
 mSC/HzHWUWqzziHBdYpllh8L6lIQax3A4153G9FWjaFflDBliD5gPW53UCAVsmlR+O7oZ0
 AIItIrjfBhAbFLA5U/oEbBTCsDSB776ysxwUlJuZ0OurmRtsLZBmzmUfoxdaPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZMT232Zp
Subject: Re: [Buildroot] [PATCH next 1/2] package/opencsd: new package
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

Hello Julien,

On Wed, 22 Feb 2023 21:41:33 +0100
Julien Olivain <ju.o@free.fr> wrote:

> This library provides an API suitable for the decode of
> ARM(r) CoreSight(tm) trace streams.
> 
> OpenCSD is for example an optional dependency in the Linux
> "perf" tool, starting from kernel version 5.1.
> 
> https://github.com/Linaro/OpenCSD
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied with very, very small tweaks.

> +config BR2_PACKAGE_OPENCSD
> +	bool "OpenCSD"

	bool "opencsd"

(for consistency, we want all package prompts to be lower-case)

> +	depends on BR2_PACKAGE_OPENCSD_ARCH_SUPPORTS
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	help
> +	  This library provides an API suitable for the decode of
> +	  ARM(r) CoreSight(tm) trace streams.
> +
> +	  OpenCSD is for example an optional dependency in the Linux
> +	  "perf" tool, starting from kernel version 5.1.
> +
> +	  https://github.com/Linaro/OpenCSD
> +
> +comment "OpenCSD needs a toolchain w/ C++11, gcc >= 4.8, dynamic libraries"

            ^^^^^^ opencsd
                                                                    ^^^^^^^^^ library

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
