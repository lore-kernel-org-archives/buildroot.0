Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3D7C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 16:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50F0A403C6;
	Sun,  6 Aug 2023 16:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50F0A403C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTvmcAy5qMWx; Sun,  6 Aug 2023 16:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72B84405D1;
	Sun,  6 Aug 2023 16:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72B84405D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 995611BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 16:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1F6E41526
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 16:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1F6E41526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-839et8wMVJ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 16:04:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33C85401B1
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 16:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33C85401B1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D1A840009;
 Sun,  6 Aug 2023 16:04:00 +0000 (UTC)
Date: Sun, 6 Aug 2023 18:03:59 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230806180359.1382e1dd@windsurf>
In-Reply-To: <20230516193307.1543455-1-bernd.kuhls@t-online.de>
References: <20230516193307.1543455-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691337840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iWARhxA8eSReJSLVoSA5jpKgSHAGdWJMYoX4b8PsjUU=;
 b=AwcXzKEOgggvgX/9cOGwqauWI0MCizfBHzsy3eCK8EkXUXWK+QDn07voeNQrzHR4wXYlDg
 dyFzROx/dCLRZN1nr1+VDVo7m8Yu0RdfTwTAyRhuE98wWpAWUUiN6An2cnE5K9x9OdBhCZ
 XsJdR7jUxwSa6LH+p8CZ5kpQkvo13idKAOBM4rE2XeLPggm1nKOxn4BGmHuvz6fuXob8ag
 iHzS1iVySvIttZntQbEbFJsVwj/EIm3o6EC+BRtg+KJjv3dfItYOgcqsi/zFrCSzgcWrcK
 xadhJY9Ctvv6WC9FI9Xs/LCW88+qIbz/31HBKhAxT6/D2Rsa/6tIeM6PEbCgDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AwcXzKEO
Subject: Re: [Buildroot] [PATCH 1/1] package/php: depend on libucontext for
 musl builds
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

On Tue, 16 May 2023 21:33:07 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> diff --git a/package/php/Config.in b/package/php/Config.in
> index 69b4268c1d..18779ba1f9 100644
> --- a/package/php/Config.in
> +++ b/package/php/Config.in
> @@ -8,7 +8,9 @@ config BR2_PACKAGE_PHP_ARCH_SUPPORTS
>  	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>  	default y if BR2_RISCV_64
>  	default y if BR2_s390x
> -	default y if BR2_TOOLCHAIN_HAS_UCONTEXT
> +	default y if \
> +		BR2_TOOLCHAIN_HAS_UCONTEXT || \
> +		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS

Thanks for looking into this.

I think this isn't the right solution, but it's not your fault: the
semantic of BR2_TOOLCHAIN_HAS_UCONTEXT today is fuzzy and vague, and
it's actually quite wrong how it's working.

If you look at your commit, you're basically saying that "some
toolchains define BR2_TOOLCHAIN_HAS_UCONTEXT, but in fact they don't
really provide ucontext support so we need to use an extra libucontext
library". Don't you see how weird that sounds?

libucontext should only be needed for toolchains that don't support
ucontext... and musl right now is declared as
BR2_TOOLCHAIN_HAS_UCONTEXT=y.

But that's wrong as you point out: musl only provides the ucontext_t
definition, but not the functions to manipulate it. So for example, the
existing capnproto package does this:

	depends on BR2_TOOLCHAIN_HAS_UCONTEXT

but because musl doesn't really support ucontext, it also does:

# musl doesn't support getcontext/setcontext
ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
CAPNPROTO_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DKJ_USE_FIBERS=0"
endif

For a similar reason, libopenssl has to do this:

ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ASYNC
endif
ifeq ($(BR2_TOOLCHAIN_HAS_UCONTEXT),)
LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ASYNC
endif

Because libopenssl really uses ucontext, so
BR2_TOOLCHAIN_HAS_UCONTEXT=y isn't enough, it also needs to exclude the
musl case.

Apparently, the only packages for which BR2_TOOLCHAIN_HAS_UCONTEXT kind
of makes sense are libsigsegv libabseil-cpp, as it indeed only needs
ucontext_t, but not the getcontext/makecontext functions.

Still, I would argue that we should change BR2_TOOLCHAIN_HAS_UCONTEXT
to mean that the toolchain defines ucontext_t *and* implements
getcontext/makecontext/setcontext. This implies (1) adding a comment
above the option to explain its semantic and (2) drop the select
BR2_TOOLCHAIN_HAS_UCONTEXT from musl.

Then we can clean up libopenssl and capnproto. php would no longer
fail, because BR2_TOOLCHAIN_HAS_UCONTEXT would no longer be true for
musl.

And finally, we can re-enable php on musl by making use of libucontext.

Do you think you could work on this? It would be nice.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
