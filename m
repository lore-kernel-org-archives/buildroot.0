Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29899C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C49CB60B49;
	Mon, 21 Apr 2025 21:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_iJ41xa6pFX; Mon, 21 Apr 2025 21:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D498D60B13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D498D60B13;
	Mon, 21 Apr 2025 21:49:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E41AD68
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D43A981450
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8H6OYW0tMKLA for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:49:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A67C580DA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A67C580DA2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A67C580DA2
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:49:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E5F6433F1;
 Mon, 21 Apr 2025 21:49:01 +0000 (UTC)
Date: Mon, 21 Apr 2025 23:49:00 +0200
To: Guillaume Chaye <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org
Message-ID: <20250421234900.59e02be8@windsurf>
In-Reply-To: <20250214124520.250825-1-guillaume.chaye@zeetim.com>
References: <20250214124520.250825-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeduleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedvjedvgfffveetieffudegieevleeigfffteefhefhtefhueelfeekjefgfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepghhuihhllhgruhhmvgdrtghhrgihvgesiigvvghtihhmrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhot
 hdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745272142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JlSp8UNJ0v8hZEoxvilpfu+ZnqjZvidDKmqd/I61BvI=;
 b=DEsMtbexLOwe+P6/JbmR7FyznaE//UjknjmloNn33wfxnTKifT+QAwKEHdE+h75edaUTCr
 5zNZFVodAqe86i7YCHbUinMk/M0PVojIpefilEfmQKvs1ftu+3fsZ6//abDY9sYGOLo8Tq
 afsEcteSn+JIBzbJ1O7YF8zlAm3XlzpSJ+4mxeyym836vO0IqkE2Vl5gZ5eFoBhdgpF8+i
 QCwYzc/OoOf1ttt5xx7XJhzQ7iuV7SwXOHjbkwr/ZVGuAk5IIzDKhC01zJ3OYFRPkRq2Ol
 VRGyGyqke5Rem7MAqWaSLZCRJnw4GwCx39W64TWL04BD/rzwdk7ACOT83Z3fRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DEsMtbex
Subject: Re: [Buildroot] [PATCHv3 1/1] package/heimdal: Upgrade existing
 package and add target package.
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

Hello Guillaume,

On Fri, 14 Feb 2025 07:45:20 -0500
Guillaume Chaye <guillaume.chaye@zeetim.com> wrote:

> Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>

Your patch is doing *tons* of things, and the commit log is empty. This
just cannot work, as it means reviewers/maintainers cannot understand
why you're doing all those changes. Why are you bringing all those
additional patches?


> diff --git a/package/Config.in b/package/Config.in
> index dac1fc568d..616fff5f69 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2026,6 +2026,7 @@ menu "Networking"
>  	source "package/gupnp/Config.in"
>  	source "package/gupnp-av/Config.in"
>  	source "package/gupnp-dlna/Config.in"
> +	source "package/heimdal/Config.in"

The addition of heimdal as a target package should be (1) justified by
some explanation and (2) put into a separate patch.

>  	source "package/ibrcommon/Config.in"
>  	source "package/ibrdtn/Config.in"
>  	source "package/libcgi/Config.in"
> diff --git a/package/heimdal/0001-Import-AX_PROG_CC_FOR_BUILD-macro.patch b/package/heimdal/0001-Import-AX_PROG_CC_FOR_BUILD-macro.patch
> new file mode 100644
> index 0000000000..b39dc1cfd6
> --- /dev/null
> +++ b/package/heimdal/0001-Import-AX_PROG_CC_FOR_BUILD-macro.patch
> @@ -0,0 +1,176 @@
> +From 4d0d834f96cfab796fdb4653b3646feb0d306c95 Mon Sep 17 00:00:00 2001
> +From: Nicolas Williams <nico@twosigma.com>
> +Date: Sat, 24 Jun 2023 00:12:20 -0500
> +Subject: [PATCH] cf: Import AX_PROG_CC_FOR_BUILD macro
> +
> +Some versions of autoconf-archive have a broken AX_PROG_CC_FOR_BUILD.
> +
> +Signed-off-by: Nicolas Williams <nico@twosigma.com>
> +Upstream: https://github.com/heimdal/heimdal/pull/1174/commits/4d0d834f96cfab796fdb4653b3646feb0d306c95

Your Signed-off-by is missing. Why is this patch needed?


> diff --git a/package/heimdal/0002-Use-AX_PROG_CC_FOR_BUILD.patch b/package/heimdal/0002-Use-AX_PROG_CC_FOR_BUILD.patch
> new file mode 100644
> index 0000000000..27ec78587f
> --- /dev/null
> +++ b/package/heimdal/0002-Use-AX_PROG_CC_FOR_BUILD.patch
> @@ -0,0 +1,23 @@
> +From f6769797507d73d05e6a2ac2f54ff9f8f49b377c Mon Sep 17 00:00:00 2001
> +From: Nicolas Williams <nico@twosigma.com>
> +Date: Sat, 24 Jun 2023 00:15:31 -0500
> +Subject: [PATCH] cf: Use AX_PROG_CC_FOR_BUILD
> +
> +Signed-off-by: Nicolas Williams <nico@twosigma.com>
> +Upstream: https://github.com/heimdal/heimdal/pull/1174/commits/f6769797507d73d05e6a2ac2f54ff9f8f49b377c

Same comments.


> diff --git a/package/heimdal/0003-Replace-make-roken-with-roken-h-process.patch b/package/heimdal/0003-Replace-make-roken-with-roken-h-process.patch
> new file mode 100644
> index 0000000000..90acca6683
> --- /dev/null
> +++ b/package/heimdal/0003-Replace-make-roken-with-roken-h-process.patch
> @@ -0,0 +1,57 @@
> +From 28df1d8a8b5ce2a35214faad3254649a0a470bfe Mon Sep 17 00:00:00 2001
> +From: Nicolas Williams <nico@twosigma.com>
> +Date: Sat, 24 Jun 2023 22:25:00 -0500
> +Subject: [PATCH] roken: Replace make-roken with cf/roken-h-process.pl
> +
> +Signed-off-by: Nicolas Williams <nico@twosigma.com>
> +Upstream: https://github.com/heimdal/heimdal/pull/1174/commits/28df1d8a8b5ce2a35214faad3254649a0a470bfe

Ditto.


> diff --git a/package/heimdal/0004-cf-remove-comm_err-header-check.patch b/package/heimdal/0004-cf-remove-comm_err-header-check.patch
> new file mode 100644
> index 0000000000..97cef5f792
> --- /dev/null
> +++ b/package/heimdal/0004-cf-remove-comm_err-header-check.patch
> @@ -0,0 +1,48 @@
> +From acf1a8105010ecbc21a92d046028b37535c5085e Mon Sep 17 00:00:00 2001
> +From: Guillaume Chaye <guillaume.chaye@zeetim.com>
> +Date: Fri, 24 Jan 2025 16:10:14 +0100
> +Subject: [PATCH] cf: remove comm_err header check to cross-compile heimdal
> +
> +Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
> +Upstream: N/A

Upstream not available? There is a Github repository to which you can
submit PRs, so there is definitely an available upstream.


> diff --git a/package/heimdal/Config.in b/package/heimdal/Config.in
> new file mode 100644
> index 0000000000..5c71168436
> --- /dev/null
> +++ b/package/heimdal/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_HEIMDAL
> +	bool "my-heimdal"

Should be:

	bool "heimdal"

> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_LIBXCRYPT

Should be:

	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC

> diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
> index f6c52f63aa..686a351c7d 100644
> --- a/package/heimdal/heimdal.mk
> +++ b/package/heimdal/heimdal.mk
> @@ -4,15 +4,20 @@
>  #
>  ################################################################################
>  
> -HEIMDAL_VERSION = f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17
> +HEIMDAL_VERSION = fd2d434

Please keep a full hash, like it was already done.

>  HEIMDAL_SITE = $(call github,heimdal,heimdal,$(HEIMDAL_VERSION))
> -HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf host-libxcrypt host-flex host-bison
> -HOST_HEIMDAL_AUTORECONF = YES
> +HEIMDAL_DEPENDENCIES=  ncurses libxcrypt host-heimdal

Space before = sign.

> +HOST_HEIMDAL_DEPENDENCIES = host-ncurses host-pkgconf host-libxcrypt host-flex host-bison

Why is host-e2fsprogs dropped?

> +HEIMDAL_AUTORECONF= YES

Space before =.

>  HEIMDAL_INSTALL_STAGING = YES

Weird that we have that in current Buildroot... as heimdal is a
host-only package.

> +HEIMDAL_CONF_ENV = MAKEINFO=true
> +HOST_HEIMDAL_CONF_ENV = $(HEIMDAL_CONF_ENV) ac_cv_prog_COMPILE_ET=no
> +
>  HOST_HEIMDAL_CONF_OPTS = \
> -	--disable-shared \
> -	--enable-static \

So the e2fsprogs issues are gone?

> +define HOST_HEIMDAL_APPLY_ADDITIONAL_PATCHES
> +	$(APPLY_PATCHES) $(@D) $(HOST_HEIMDAL_PKGDIR)/host \*.patch
>  endef

We clearly do not want to apply a different set of patches when
building the host package vs. the target package.

Could you fix all those issues, and send a new iteration, WITH a
non-empty commit log.

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
