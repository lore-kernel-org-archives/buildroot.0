Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BB0C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 14:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7067440FE2;
	Tue, 21 Feb 2023 14:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7067440FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGvcu_-PsHdQ; Tue, 21 Feb 2023 14:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91B2340D0F;
	Tue, 21 Feb 2023 14:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91B2340D0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18F681BF2F0
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F208B418AB
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F208B418AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FFI1JsKBQYBc for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 14:48:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54DA441876
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54DA441876
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 14:48:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B4264C000A;
 Tue, 21 Feb 2023 14:48:28 +0000 (UTC)
Date: Tue, 21 Feb 2023 15:48:27 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230221154827.7e737960@windsurf>
In-Reply-To: <20230221142144.1503123-1-fontaine.fabrice@gmail.com>
References: <20230221142144.1503123-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676990909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZ7AwNuaSTPkMpTjSBoLwW0r3lmPax/j8Wo4NU11PL0=;
 b=QUGU8UELO3qWn6K9srgnpDe1WVwuq1mf91AvM5HCFS9wsKw3B2HqQVcq8nCm2cEOjNKtk8
 /7y319NOZpnu71bkvjLxh4DJDQku94vIE7CaR3NU+vTJYLbLW1kn/uRHYHwzfniSEspY9d
 cLU9R2x+JiKn0ACOxR+CChVQpf43nNUkqebmBk+JAheqO47atWsZbFkph0UoG4U/RECMXH
 dURrzL38yAgfh+5aSw7qowW/TKjKfjUUCxrGWVMVKXtse5hzUQ1zf4PGH/9lUq9d6/zA9m
 3Y5kYrOw8OvX+x2XgGPANC1VyVoeFmfLPzqNfiYbT7RmdJTLzDpQXaY08lG3MA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QUGU8UEL
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: disable with -Ofast
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Tue, 21 Feb 2023 15:21:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> systemd can't be built with -Ofast since version 252 and
> https://github.com/systemd/systemd/commit/60f97fee2d2f948c8e8963ea8ff767008cb93cae
> resulting in the following build failure since bump to version 252.4 in
> commit a2c823d1f548d5a0120d27d6c000603192360f7b:
> 
> ../output-1/build/systemd-252.4/meson.build:397:8: ERROR: Problem encountered: -Ofast, -ffast-math, or -ffinite-math-only is specified in c_args.
> 
> While at it, revert changes made by commit 9cd084b54e2223e49c37962b0cbefae7bea26ef5
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8f41c4984b645851724e554c3162b83bc312bee7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/systemd/Config.in  | 1 +
>  package/systemd/systemd.mk | 5 -----
>  system/Config.in           | 4 ++++
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 9f4d933779..5bbdbb405f 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -25,6 +25,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
> +	depends on !BR2_OPTIMIZE_FAST

I really dislike this.

> -SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
> -ifeq ($(BR2_OPTIMIZE_FAST),y)
> -SYSTEMD_CFLAGS += -O3
> -endif

And this should work. It's really systemd that is stupid to look for
-Ofast in c_flags without seeing that -O3 later overrides it.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
