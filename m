Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDD6C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B03960EE4;
	Tue, 26 Jul 2022 17:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B03960EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqcyjFbXgP4w; Tue, 26 Jul 2022 17:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78E6B600C7;
	Tue, 26 Jul 2022 17:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78E6B600C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9DAD1BF957
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 751B784751
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 751B784751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OV-bs5enXE07 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:37:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F7C9845B9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F7C9845B9
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:37:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82E851C0007;
 Tue, 26 Jul 2022 17:37:36 +0000 (UTC)
Date: Tue, 26 Jul 2022 19:37:35 +0200
To: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Message-ID: <20220726193735.735588e4@windsurf>
In-Reply-To: <20220726165041.17584-2-x-shi@ti.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-2-x-shi@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658857057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=teSo3cGgGxGlzpz6tnUrDsw6gyiha87j1eovjlk55KU=;
 b=VgUZHz68db3ifDKUsEHDKTgYVQi9RYFZ5JEbYXPgDIvfhWBZOJrrtBhynBYwfAq2FGtdsf
 ZF+kRe6myiUbQahmTd+rOQQoMYhGvYBbtryozdHv2zS8T/PDav0Di+0ydqAXYax9CEiZzS
 IsX8M1bmGKgdP6d7J+IFx0Csz7uC5BelVARDMj6psAfzJr4rdZSvC+tBqvFsFajGEfJUGa
 1zRsB07HFGVfmt50Y6ReLQxI+HJ99EXFyD0hPJZNpePNZqBh7fEiWQHp0LJUohyP15zshX
 USF6eBM87XnrFuq4qSOhA+21EpbfugMTv4Hxboz/2Pm/7vgTKxMz589X1XiPDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VgUZHz68
Subject: Re: [Buildroot] [PATCH 1/4] package/arm-gnu-toolchain: add version
 selection
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
Cc: Xuanhao Shi <x-shi@ti.com>, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 26 Jul 2022 11:50:38 -0500
Xuanhao Shi via buildroot <buildroot@buildroot.org> wrote:

> Adds a way to select a custom toolchain link and
> source instead of always using verion 11.2 due

version -> version

> to bugs in the newest version.

Could you give some details on the "bugs" ?

> diff --git a/package/arm-gnu-toolchain/Config.in.host b/package/arm-gnu-toolchain/Config.in.host
> new file mode 100644
> index 0000000000..25d0af1d04
> --- /dev/null
> +++ b/package/arm-gnu-toolchain/Config.in.host
> @@ -0,0 +1,38 @@
> +config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN
> +	bool "host arm-gnu-toolchain"
> +	help
> +	  Separate ARM32 cross-compilation toolchain 
> +	  for some AArch64 platforms.
> +
> +menu "host arm-gnu-toolchain version"
> +	depends on BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN

The menu is not needed.

Use:

if BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN

...

endif

to enclose the options of this package.

> +choice
> +	bool "host arm-gnu-toolchain version"

Just "version"

> +config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_DEFAULT
> +	bool "Version 11.2-2022.02"
> +	help
> +	  Use version 11.2.
> +
> +config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM
> +	bool "Custom archived sources"
> +	help
> +	  Specify custom archive for the toolchain.

Seeing what you end up needing in your defconfig, I think I would
prefer explicit options for 11.x and 10.x, rather than all this
"custom" mess.

So just:

config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_VERSION_11_X
	...
config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_VERSION_10_X
	...

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
