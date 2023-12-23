Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF81C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5468D41807;
	Sat, 23 Dec 2023 17:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5468D41807
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLrME3I3rlcG; Sat, 23 Dec 2023 17:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CC9441723;
	Sat, 23 Dec 2023 17:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CC9441723
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70A171BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C7A541723
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C7A541723
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYNwVNSSRsSN for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:43:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CFAD41714
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CFAD41714
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D2C51BF204;
 Sat, 23 Dec 2023 17:43:09 +0000 (UTC)
Date: Sat, 23 Dec 2023 18:43:09 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231223184309.63501a74@windsurf>
In-Reply-To: <20231218224747.545311-1-giulio.benetti@benettiengineering.com>
References: <20231218224747.545311-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703353390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhiPSubZ0LDIzPTvbOY3lRLr5uwJe8Q87C7uNA7qOsA=;
 b=QdhIxV/hTgpgfGVcqCSJw4JmxQ1/JGkuCT9U1AbCe7rAXbrebV7laWhtH55/2WivBa6Mjt
 0i1qMsem1SjyiA/Fmsx/iMYxjouozGzJszeSCtsmGd5lOWlMrIREvUF9GXcJOkFn+aDA3x
 NRNiVQ0c36PYNkB3W0ZcBW0oSkf7j3UmEqCQTKvr7CFBTAtH5+3FQ1e72x8pXMWLbdC/KF
 Bu5cQGlRfY26DK59O/H3m2NTXDfW9TRoacReZmxlOEPHlvoBCKcIL/58Ztb8ijSVLYydh9
 x3VOS8F4NqQPqUD/EGpFnQz56xm0FuSQ2BZ/QG1mRYAOyZJaSnf0RHxDHZ34eA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QdhIxV/h
Subject: Re: [Buildroot] [PATCH v2] package/swupdate: bump version to 2023.12
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

Hello,

On Mon, 18 Dec 2023 23:47:47 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> * make json-c mandatory according to [0]
> * make libubootenv mandatory according to [1]
> * drop local patch that has been upstreamed [2]
> * libconfig is not mandatory anymore if no lua parser is enabled
> * adjust Config.in comment according to json-c and libubootenv
> 
> [0]: https://github.com/sbabic/swupdate/commit/82e75322443e021d119a026a3476c410f4705d67
> [1]: https://github.com/sbabic/swupdate/commit/75838874e2575f822ed85d89532f47e9adf781b6
> [2]: https://github.com/sbabic/swupdate/commit/1999685830d6e9b57014666b9e53e46de17a471c
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks for the extensive commit log. I applied with one fix, see below.


> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> index 7d9fc90e10..171805bea9 100644
> --- a/package/swupdate/Config.in
> +++ b/package/swupdate/Config.in
> @@ -3,9 +3,9 @@ config BR2_PACKAGE_SWUPDATE
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> -	# swupdate requires a parser and uses libconfig as default
> -	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && \
> -		!BR2_PACKAGE_HAS_LUAINTERPRETER
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c

You forgot to replicate this dependency in the Config.in comment of
swupdate, i.e:

 comment "swupdate needs a toolchain w/ dynamic library, threads"
        depends on BR2_USE_MMU
+       depends on BR2_TOOLCHAIN_HAS_SYNC_4
        depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS

I fixed that when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
