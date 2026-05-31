Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03661CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D5661BF9;
	Sun, 31 May 2026 06:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tu-JSzSBMrxi; Sun, 31 May 2026 06:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5660561ADD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780209112;
	bh=YhLeD8ZKMtGbV3KMw3JOkwcO6MT2+BcK1/2+ilRGpaI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f//OzPWJ6R2ipe1Z3+k4O4s5eCbzeVqnK81D7DbsGtndRlB2QjlGUV1JMVLFq8rX5
	 A3b5iCHtA70ClkrA1g/nkNXfgfopz7/deo4mj5C2anY7TvbE98nLbllSiLOXITg5AC
	 S+VN7XRXMz28ndUi3QlyEgf83dln7aStZ4c4lb4FiX/3QxNrtPVATJp3SsvZlhusQe
	 HlunxJu3fqqvxgU/KkmakdFfExCBISTattPFv9eMYZiwB5kiC/sxBREcghjJ9I5Y55
	 rwpx+9cZLQTcCIJi4KewYYE5VVCQ2Y6V6MiJYvwgso59P0KhqrusCmzcTb5Q2C9DP7
	 kyJn2/st+QbDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5660561ADD;
	Sun, 31 May 2026 06:31:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A80B1389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99B3261ADD
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1Rh6bB3u5e6 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 238326161C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 238326161C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 238326161C
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:31:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BB0BE4E42DAF;
 Sun, 31 May 2026 06:31:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7B726604EC;
 Sun, 31 May 2026 06:31:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 921AF10888CC7; 
 Sun, 31 May 2026 08:31:45 +0200 (CEST)
Date: Sun, 31 May 2026 08:31:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabio Estevam <festevam@gmail.com>
Message-ID: <ahvVqPi5qI7zbOTZ@windsurf>
References: <20260531061840.6748-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260531061840.6748-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780209105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=UfTQLxK3aSGcQ6Lh/P59DMPJHWGfw8Nb7gmhUlfZtAo=;
 b=2TwryhhRzQtjLwTiR7idQXaI6HSWqi1Rs78tUhmeGKQTTQ9KazxYbzgexa0tgve18SchY2
 2SwQ8NdZyQcHHWHd1fN8bd8vTle4dOYHayzR4k0mvyMcTbHbO13CUagbvPvdCnvrxDkZYp
 a2V9fUEK+i6bVmUQCxEsj/rL/UBa0VPj0iVbOzLpYWIiOxzaYJANpPCFwfaTskouUlwJBe
 z+Q6/QVgtqLD9n2vd+KhRv0DiSdcGI07s7k3Rj80ryjnhzNNDE9RhQoWA/lRfFJebZhsDh
 twqmQ2jDn1LH7kFQhRkLWkeF/OF+IEQRpeLIVCmUOdfrPkp9tcrFnCDJ0iuPlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=2TwryhhR
Subject: Re: [Buildroot] [PATCH v2 1/1] package/crucible: needs NPTL
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

Hello,

On Sun, May 31, 2026 at 08:18:40AM +0200, Bernd Kuhls wrote:
> gcc_stack_unix.c: In function 'x_cgo_getstackbound':
> gcc_stack_unix.c:28:9: error: implicit declaration of function 'pthread_getattr_np';
>  did you mean 'pthread_attr_init'? [-Wimplicit-function-declaration]
>    28 |         pthread_getattr_np(pthread_self(), &attr);  // GNU extension
> 
> Fixes:
> https://autobuild.buildroot.net/results/e07/e07198d7864331027d21cd2109054d86e7ac1c3d/
> 
> The build error also occured in Oct 2024 so a backport to buildroot
> LTS branches should be considered:
> https://autobuild.buildroot.net/results/ebb/ebbd051010c27f97fafc0b203b22c8b0af7e5ccd/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied to master, after fixing one small thing.

> diff --git a/package/crucible/Config.in b/package/crucible/Config.in
> index 1e1b29c3df..e18e393a05 100644
> --- a/package/crucible/Config.in
> +++ b/package/crucible/Config.in
> @@ -1,9 +1,13 @@
>  config BR2_PACKAGE_CRUCIBLE
>  	bool "crucible"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS

You forgot to replicate this dependency...

> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_getattr_np()
>  	select BR2_PACKAGE_HOST_GO
>  	help
>  	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
>  	  i.MX family.
>  
>  	  https://github.com/usbarmory/crucible
> +
> +comment "crucible needs a toolchain w/ NPTL"

...here.

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL

Fixed while applying.

Thanks again!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
