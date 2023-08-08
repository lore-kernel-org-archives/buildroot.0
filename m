Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D80C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 17:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83D4B408D9;
	Tue,  8 Aug 2023 17:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83D4B408D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Guhp1L2v4te2; Tue,  8 Aug 2023 17:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C15B04060C;
	Tue,  8 Aug 2023 17:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C15B04060C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6B71BF59C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7752E61190
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7752E61190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r2mhV2lwsEfp for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 17:27:25 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 265D86118B
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 17:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 265D86118B
Received: by mail.gandi.net (Postfix) with ESMTPSA id C87DA40005;
 Tue,  8 Aug 2023 17:27:21 +0000 (UTC)
Date: Tue, 8 Aug 2023 19:27:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230808192720.7c12ed92@windsurf>
In-Reply-To: <20230808064107.29318-1-bernd@kuhls.net>
References: <20230808064107.29318-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691515642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzDHiRyYhx4580jVVVgicbQLI5YBh/5nDXw94FWzMnA=;
 b=P4pLP8s0CpX+dylEhP/uplRlZSF8BK8nMwIFBSgjphp4QFLK1iUAO3B5SOiW+clXW8hFlh
 ZDWNUiyp7joFOIO8x/xHxTMsdpEU/C/u/b4kl31Q3DfKyPfQyCn1AvFqa98YEt1HHVbL/i
 hH+lYXgijBHJ+IZdKQikAUEr3ClZmmMVQ0OoUiO202s7dbijv6QVZtU9wbKt5LNLhc1OKM
 QVQt2TyPg6SHABimZeA/jFN/0zu2vvU6KfzZxPZlKHD6A/VsBq1eyV7bnhAumq3CU68gYl
 fdJ5up0fVUzGoYgTW/G1bSDSf5+jqA8JBZQlucikFq4pE/EQyEB/g2fzdpWcNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P4pLP8s0
Subject: Re: [Buildroot] [PATCH/next v4 1/2] package/onevpl: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Aug 2023 08:41:06 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I've applied to next, but I have a few comments nevertheless, see below.

> diff --git a/package/onevpl/0001-Don-t-force-fstack-protector.patch b/package/onevpl/0001-Don-t-force-fstack-protector.patch
> new file mode 100644
> index 0000000000..14948e28cc
> --- /dev/null
> +++ b/package/onevpl/0001-Don-t-force-fstack-protector.patch
> @@ -0,0 +1,32 @@
> +From 682a9eabc71c2e33ebbbba2e75d0ba7caa08c7c8 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Mon, 8 May 2023 20:03:22 +0200
> +Subject: [PATCH] Don't force -fstack-protector
> +
> +This allows the environment to decide whether SSP should be used or
> +not, for example to support toolchains that don't have SSP support.
> +
> +Upstream: Not applicable

I'd like to challenge the fact that it's not applicable upstream. You
could add a CMake option that allows to enable/disable
-fstack-protector-strong, enabled by default so that it preserves
upstream behavior while allowing us to do what we think needs to be
done.

> diff --git a/package/onevpl/Config.in b/package/onevpl/Config.in
> new file mode 100644
> index 0000000000..65a34185e3
> --- /dev/null
> +++ b/package/onevpl/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_ARCH_IS_64
> +	default y if BR2_arm

Could you clarify where this architecture dependency comes from? Would
be good to add a comment about it (through a follow-up patch).

> +config BR2_PACKAGE_ONEVPL
> +	bool "onevpl"
> +	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA

I added a short comment above this select because it was not obvious
why it was needed, as we don't depend on libdrm. Turns out that for the
VA stuff in OneVPL to work, it needs libdrm to have been built with the
intel driver in.

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
