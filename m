Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9B9C19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 21:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 130D840271;
	Wed,  3 Aug 2022 21:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 130D840271
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4cK1RrC8Zz0; Wed,  3 Aug 2022 21:28:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C01940226;
	Wed,  3 Aug 2022 21:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C01940226
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D83DB1BF325
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1CD740226
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1CD740226
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qsKxm4OWjuF for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 21:28:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAF7240202
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAF7240202
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 21:28:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E301520003;
 Wed,  3 Aug 2022 21:28:47 +0000 (UTC)
Date: Wed, 3 Aug 2022 23:28:46 +0200
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220803232846.30e7e22f@windsurf>
In-Reply-To: <20220729000904.1295295-3-joel@jms.id.au>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-3-joel@jms.id.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659562130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CLVZ8hESQE9nU1yWaJYbMef79uR3MoRHG3VqjLYmVGM=;
 b=npVHpCY34JnijOx2KAgYX5zwriVTKPdyht7NvbN8DcCDbTHWzJ0QyfKOXmucyka7uIOKLZ
 rYCSe7LIGh1J4gIWrCHRt6P9tAUT5hbEjiUTohxdjyg6IKZ1rhH9FjrdzRrOGWaeNCtu73
 woJDLSZzhgSuVqhobuvfbZGiB8NODZO1oY3DrbwK7pr8/ZDCF++RL/a1W0BzhS3FFaGXM7
 GoYn/G2Y1Urrb2+2IILAMYnLdkA4vEGf6GtdbSnsrofqIXBtOeDDXvhgdMAl5HGoXIOS6A
 3zd6AFBIojrnN03ILfOMs7dakrx+AwOyleNqmooOaRt6gegqU3BPEuxWydqcDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=npVHpCY3
Subject: Re: [Buildroot] [PATCH 2/9] arch/powerpc: Clarify generic CPUs
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 09:38:57 +0930
Joel Stanley <joel@jms.id.au> wrote:

> In the case where a specific CPU is not selected, set an appropriate
> gcc target for the architecture.
> 
> For clarity this introduces a BR2_generic_powerpc64 as a generic 64 bit
> CPU as this makes the it clearer when browsing menuconfig.
> 
> We can't have a generic ppc64le GCC, as attempting to configure glibc
> for powerpc64le fails:
> 
>  configure: error: ***  POWER8 or newer is required on powerpc64le.
>  __builtin_signbit is broken.  GCC 7.4 or newer is required to resolve
>  (PR83862). The compiler must support -mabi=ieeelongdouble and
>  -mlong-double-128 simultaneously.
> 
> Hence set Power8 as the default CPU for powerpc64le.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/Config.in.powerpc | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index ef0e85fec680..8d392bfde814 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -9,12 +9,17 @@ config BR2_POWERPC_CPU_HAS_SPE
>  
>  choice
>  	prompt "Target Architecture Variant"
> -	default BR2_generic_powerpc
> +	default BR2_generic_powerpc if !BR2_ARCH_IS_64
> +	default BR2_generic_powerpc64 if BR2_ARCH_IS_64
> +	default BR2_powerpc_power8 if BR2_powerpc64le

This default will never be used, because BR2_ARCH_IS_64 is true when
BR2_powerpc64le is true. So on powerpc64le, "default
BR2_generic_powerpc64 if BR2_ARCH_IS_64" will match.

So a better solution is:

+	default BR2_generic_powerpc if BR2_powerpc
+	default BR2_generic_powerpc64 if BR2_powerpc64
+	default BR2_powerpc_power8 if BR2_powerpc64le

>  	help
>  	  Specific CPU variant to use
>  config BR2_generic_powerpc
> -	bool "generic"
> -	# No C library supports this variant on ppc64le
> +	bool "generic (32 bit)"
> +	depends on !BR2_ARCH_IS_64

I think the (32 bit) is useless, because this one will only show up on
32-bit powerpc.

> +config BR2_generic_powerpc64
> +	bool "generic (64 bit)"
> +	depends on BR2_ARCH_IS_64
>  	depends on !BR2_powerpc64le

Ditto here.

However, a help text for both of these options would be useful, as
these "generic" options are always a bit magic as to what CPUs they
support exactly. The help text should also say that they map to
-mcpu=powerpc and -mcpu=powerpc64 respectively.

As Yann requested, the commit log needs to be changed, as "In the case
where a specific CPU is not selected, set an appropriate gcc target for
the architecture." is incorrect, as a specific CPU is always selected.

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
