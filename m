Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D422EC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 507D4408C4;
	Sat,  5 Nov 2022 20:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 507D4408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2y2nT8bR7-l; Sat,  5 Nov 2022 20:47:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FDC9408AE;
	Sat,  5 Nov 2022 20:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FDC9408AE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08F6F1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB26760A4F
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB26760A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOo1eKoagHD5 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:46:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D99D60899
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D99D60899
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:46:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32F6CE000B;
 Sat,  5 Nov 2022 20:46:54 +0000 (UTC)
Date: Sat, 5 Nov 2022 21:46:52 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221105214652.6dde4702@windsurf>
In-Reply-To: <20221105074444.13360-1-bernd.kuhls@t-online.de>
References: <20221105074444.13360-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667681214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NWYpm9cXwf7A3AmAOObnqysB1g/f4m0LG9fLPluMTA4=;
 b=hTxbQOLC/CpY1xIkuUcRZ0M8WG/sZ6hTUT5GqWmEguG9miSGAXKY+D5kEI2AsAcyXicfjl
 Z+FY+nkoDdhPONUob5y9jBaVl9LEm9ZxcWEbr8SiPvNHtLV694+SwhN8xL0Z2d+ypp8XlH
 2Efzi6ODi+oGYHkJkja0EtePZes35A2swC0CkkH38PSi/mRSNhAQRazsv0bwcUrl0tTpq2
 s6nxKiFgFyinI0QTvATHSVNcgz2cLbWHxbvxRkV5brsdt5nbE1jcAu9aa15phx6vOAh3hQ
 oYLVHcrVXpNQp05x5clMsdR/GmYtJpXeA/+lCtsH9Gqy9HO6Aq2z57EAquqF4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hTxbQOLC
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-utils: update dependency
 for topology support
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

Hello Bernd,

On Sat,  5 Nov 2022 08:44:44 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

>  config BR2_PACKAGE_ALSA_UTILS_ALSATPLG
>  	bool "alsatplg"
> -	depends on !BR2_STATIC_LIBS # dlfcn.h
> -
> -comment "alsatplg needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +	depends on BR2_PACKAGE_ALSA_LIB_TOPOLOGY

I'm wondering why you're doing it like this, and not in the normal way:

config BR2_PACKAGE_ALSA_UTILS_ALSATPLG
        bool "alsatplg"
        depends on !BR2_STATIC_LIBS # alsa-lib topology
	select BR2_PACKAGE_ALSA_LIB_TOPOLOGY

comment "alsatplg needs a toolchain w/ dynamic library"
        depends on BR2_STATIC_LIBS

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
