Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A7BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 21:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B16D40356;
	Tue, 17 May 2022 21:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPKUWac3zxcL; Tue, 17 May 2022 21:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DB144028F;
	Tue, 17 May 2022 21:22:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87EF21BF28E
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 849F960B37
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSfczsvjkw8H for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:22:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CF1860AE7
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:22:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C8C12C833E
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:12:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8E66F1BF206;
 Tue, 17 May 2022 21:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652821949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQiEOeWq75RH7lvb/IjaAceTE86qSEjXSUvyJBrnRiA=;
 b=n5+kqsaA8WLvPQO0myEtHS6lEfVCgsRFn6l1WyepRhtihuQkHqZ/mPjZR/V/AFryI1uywl
 qkucgaShfUiIrhHfiniKW3RSBa6GHZNk57wbw7h/dU/ZmF1BLAp05ON0k/5HdiYYsUP9VO
 K6nT6+jFlP5f4LWaIFaH44EaXUAwD3DH/wHUMDSBtVG8lxg6q51ZhipkCfy0OueyfMKvTs
 WF8UjpWygwcFzLVWEaPDV+lvR64mlenU3BV5c0jfKjR16knPnv6pY12H8AVX0DjtsxIoMf
 8rndNUXePlSCdicOS9hUyZol0eSbwG7LSbJKjdVeBL5Yuf4pLw7Oh4kWYWfjbg==
Date: Tue, 17 May 2022 23:12:28 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220517231228.21043bb1@windsurf>
In-Reply-To: <20220514221623.3147598-1-james.hilliard1@gmail.com>
References: <20220514221623.3147598-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/grpc: propagate reverse
 dependencies
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 14 May 2022 16:16:23 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index dc6ecd2b72..e471872896 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -683,16 +683,15 @@ config BR2_PACKAGE_COLLECTD_GRPC
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
>  	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # grpc -> libabseil-cpp
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc -> libabseil-cpp
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
>  	select BR2_PACKAGE_GRPC
>  	help
>  	  Send/receive values using the gRPC protocol.
>  
> -comment "grpc needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
> +comment "grpc needs a toolchain w/ C++, gcc >= 5, host gcc >= 4.9"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
> -		|| !BR2_HOST_GCC_AT_LEAST_4_9

It's good that you dropped BR2_HOST_GCC_AT_LEAST_4_9 because it was
indeed no longer a dependency of BR2_PACKAGE_COLLECTD_GRPC since commit
8251d8c2559b25f11684776fc343059cf100657d, but you had forgotten to
update the Config.in comment (and to also indicate this change in the
commit log, which strictly speaking isn't related to the reverse
dependencies).

> diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
> index e0b5a3d134..157bc8ef6d 100644
> --- a/package/falcosecurity-libs/Config.in
> +++ b/package/falcosecurity-libs/Config.in
> @@ -1,11 +1,13 @@
>  config BR2_PACKAGE_FALCOSECURITY_LIBS
>  	bool

Good to update this, but you had forgotten to update the reverse
dependency of BR2_PACKAGE_FALCOSECURITY_LIBS, namely package/sysdig.

I fixed both issues when applying to master.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
