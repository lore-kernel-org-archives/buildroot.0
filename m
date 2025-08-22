Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B247CA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 21:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6055883BEA;
	Fri, 22 Aug 2025 21:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkaMXtie-8UU; Fri, 22 Aug 2025 21:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8834D83BEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8834D83BEB;
	Fri, 22 Aug 2025 21:25:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B797AD8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CAB883BEA
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqEjKf7JjqNr for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 21:25:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0ED183BE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0ED183BE9
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0ED183BE9
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:25:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9D459C8EC66
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:25:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6514E604AD;
 Fri, 22 Aug 2025 21:25:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F1FE31C22D0C9; 
 Fri, 22 Aug 2025 23:25:28 +0200 (CEST)
Date: Fri, 22 Aug 2025 23:25:27 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250822232527.0e49b2aa@windsurf>
In-Reply-To: <20250820163921.1968030-5-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
 <20250820163921.1968030-5-angelo.compagnucci@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755897929; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fN6HwfO+QEkP8jS5x46lWdU4HgA9ElaBne1X+GKQweY=;
 b=M1tKjSQMounQ8+Mag+WeRBCPgcDShJ0BjOL0ZT26d1jsTGTjVl1n/cfOH0lA0oHC1J1SdX
 IKbs8be1MCyYnepq+D5onp6zoCcp+nAJCFJ9OGq7LODNiGn8fd1wQpvGGtuRUNvD2ICym0
 t9BUJdw5b4hOgdKHKmcPqO7V9fThIyrVaapRPcDZXWURt4Tkac5Ox90nVp35HyMBPHr7Xk
 lxF0XWqrhu6zKKRwTe8+CDHZK9+pPMIjSfpBC7k5gKk/ANHQXGzDAqsulBcHIy1qnMSUMY
 cLNZ0Uokm0eY8S5nglGrNkykeX9vr2GxTGPgUw+cBUobVEKEmr2UQGy2o6wbNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=M1tKjSQM
Subject: Re: [Buildroot] [PATCH 4/4 v2] package/cups-filters: bump to
 version 2.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Angelo,

On Wed, 20 Aug 2025 18:39:21 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
> index ded99a4774..89f4b4d08d 100644
> --- a/package/cups-filters/Config.in
> +++ b/package/cups-filters/Config.in
> @@ -2,19 +2,15 @@ config BR2_PACKAGE_CUPS_FILTERS
>  	bool "cups-filters"
>  	# needs fork()
>  	depends on BR2_USE_MMU
> -	depends on BR2_INSTALL_LIBSTDCPP # qpdf
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_WCHAR

Make sure to indicate from which package those dependencies are
inherited.

>  	depends on !BR2_STATIC_LIBS
> -	depends on BR2_USE_WCHAR # libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>  	depends on BR2_PACKAGE_CUPS
> +	depends on BR2_PACKAGE_LIBCUPSFILTERS
> +	depends on BR2_PACKAGE_LIBPPD
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qpdf

You're no longer selecting qpdf, so the comment here is no longer
accurate.


>  CUPS_FILTERS_CONF_OPTS = \

[...]

> +	CFLAGS="$(TARGET_CFLAGS) -std=gnu17"

By convention, this should go in CUPS_FILTERS_CONF_ENV

>  
>  define CUPS_FILTERS_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/cups-filters/S82cups-browsed \

Shouldn't this be dropped, now that libcupsfilters does it?

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
