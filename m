Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E29C6379F
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 22:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5EED4031F;
	Mon, 13 Feb 2023 22:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5EED4031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJqH68-TuJr4; Mon, 13 Feb 2023 22:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3E87403A7;
	Mon, 13 Feb 2023 22:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3E87403A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF2371BF325
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 22:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B62B2610BA
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 22:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B62B2610BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPcmJ5ADQMy8 for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 22:22:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1297960C07
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1297960C07
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 22:22:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6158C240003;
 Mon, 13 Feb 2023 22:22:36 +0000 (UTC)
Date: Mon, 13 Feb 2023 23:22:35 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230213232235.63bbc016@windsurf>
In-Reply-To: <20221124220552.2836398-2-ju.o@free.fr>
References: <20221124220552.2836398-1-ju.o@free.fr>
 <20221124220552.2836398-2-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676326956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3OSmtt3M5ZGCaERYu2NEzd9bOskEiuNBgj1yUPAyguE=;
 b=PV2q5GMymGcNlBl+3DQ5inUzCoqmJKHhj8Go5SUtg1ZfRtIbCjkBAYU5lW3a0joxPv9gvc
 zmmL1kYINI56deOGFWzUtivlGLbUFqN/K5OKym3UI4HnQvouYyWZ12aePrWiHv02VDbjEe
 EU1H39kBnMd7js/gVBp0Jz9E0XqRyCjdzkD/4TguUKLMm6i2iRjN7dnSDyMEp6qrwImrpt
 5aIyyxJc/N0UJmXgMzLpvvvcFeTtB/Gtz61iX2Kq5+N5uIH25OHVVyDucU1TNTO3siyLFm
 U0tSmXHCZXW86YZeQKSYdo6WbETMw8THBMx7zxEhGYU3nnrKRxk0r04WYFeTXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PV2q5GMy
Subject: Re: [Buildroot] [PATCH next v2 2/2] package/libjxl: new package
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

Hello Julien,

On Thu, 24 Nov 2022 23:05:52 +0100
Julien Olivain <ju.o@free.fr> wrote:

> libjxl is the reference implementation of JPEG XL (encoder and decoder).
> 
> https://github.com/libjxl/libjxl
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks, I've applied with some small changes, see below.

> diff --git a/package/libjxl/Config.in b/package/libjxl/Config.in
> new file mode 100644
> index 0000000000..6a15bde107
> --- /dev/null
> +++ b/package/libjxl/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_LIBJXL
> +	bool "libjxl"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # highway
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC # highway
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP # highway
> +	# libjxl fail to link statically due to libatomic issue
> +	depends on !BR2_STATIC_LIBS
> +	# GCC bug on sh4: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81426
> +	depends on !BR2_sh4

Changed to use a new BR2_TOOLCHAIN_HAS_GCC_BUG_81426 blind option.

> +	select BR2_PACKAGE_BROTLI
> +	select BR2_PACKAGE_HIGHWAY
> +	select BR2_PACKAGE_LCMS2
> +	help
> +	  libjxl is the reference implementation of JPEG XL (encoder
> +	  and decoder).
> +
> +	  https://github.com/libjxl/libjxl
> +
> +comment "libjxl needs a toolchain with C++, threads, gcc >= 7"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS

This was not complete: you have 6 "depends on" above, so 6 depends on
should be handled here one way or another:

comment "libjxl needs a toolchain with C++, threads, gcc >= 7, dynamic library"
        depends on BR2_TOOLCHAIN_HAS_ATOMIC
        depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_81426
        depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
                !BR2_INSTALL_LIBSTDCPP || \
                !BR2_TOOLCHAIN_HAS_THREADS || \
                BR2_STATIC_LIBS

Applied with that change. Thanks a lot for the runtime tests, very
useful as usual!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
