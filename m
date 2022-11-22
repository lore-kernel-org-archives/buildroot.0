Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7EDC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A993B4191B;
	Tue, 22 Nov 2022 22:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A993B4191B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQEkjTPvLeMU; Tue, 22 Nov 2022 22:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71F4641924;
	Tue, 22 Nov 2022 22:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71F4641924
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 188E51BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 011D440528
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 011D440528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqvKcTDQv6rJ for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:38:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 851CE409F8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 851CE409F8
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:38:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77726240005;
 Tue, 22 Nov 2022 22:38:39 +0000 (UTC)
Date: Tue, 22 Nov 2022 23:38:38 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221122233838.45a5a96b@windsurf>
In-Reply-To: <20221031195205.429257-2-bernd.kuhls@t-online.de>
References: <20221031195205.429257-1-bernd.kuhls@t-online.de>
 <20221031195205.429257-2-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669156719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZRemleEIpg7/eDCTAI+5F7SFnpYmySCDvw+kv4PLB8=;
 b=QgZ/Zj1sTw4kDM6rcIjrXfVq5GDIjyERe6safXypZ8I92lqEuUiPFXXzLT/9HYBQRFGqJx
 KoOBwjoIpsRxmgAUb/bYZbfrSGw2bxdYLqt8tKU3kSqcmXvT2F+LARbMaGB1Du9M5UW3GE
 jCsvjAgui1obpzoRclUMPJPP9ejrrnvmi4AAHxnkgh35FQK3ffNSBdbhBJT3+VWsSztNsQ
 SxAWURcSIxSX7lcgqDEpdul4I1iYor/8m3Yj86B9t5A6Cj8STYQbZPwL+7nz4DTK+W0AvJ
 omBfQswPo6XUKCXrknwq0PejPJLjhakCJeMQ61oXGMZrgUXIY1aj89+UWej1jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QgZ/Zj1s
Subject: Re: [Buildroot] [PATCH v2 2/3] package/monero: new package
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
Cc: Stefan Ott <stefan@ott.net>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

Thanks for the contribution. See below some comments.

On Mon, 31 Oct 2022 20:52:04 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: disabled support for BR2_aarch64_be, not supported upstream:
>     https://github.com/tevador/RandomX/pull/257

What this pull requests says is "The current implementation of JIT
won't work on big endian processors.". So the problem seems to not be
with just AArch64 BE, but all big endian architectures, no? If so,
should this be depends on BR2_ENDIAN != "BIG" ? (With a comment above it).

Curious: what is the use case of a cryptocurrency stuff in Buildroot?


> diff --git a/package/monero/0001-disable-stack-protector.patch b/package/monero/0001-disable-stack-protector.patch
> new file mode 100644
> index 0000000000..0407b4e32d
> --- /dev/null
> +++ b/package/monero/0001-disable-stack-protector.patch
> @@ -0,0 +1,22 @@
> +Disable unconditional stack-protector support
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

They're using Git upstream, so please use Git-formatted patches.

Has this been submitted upstream, for example by making SSP optional?

> diff --git a/package/monero/0002-system-miniupnpc.patch b/package/monero/0002-system-miniupnpc.patch
> new file mode 100644
> index 0000000000..e12d9302bd
> --- /dev/null
> +++ b/package/monero/0002-system-miniupnpc.patch
> @@ -0,0 +1,112 @@
> +Add support for miniupnpc system library
> +
> +Downloaded from
> +https://git.alpinelinux.org/aports/plain/community/monero/system-miniupnpc.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

It also needs to be Git formatted.

Has this been submitted upstream?


> diff --git a/package/monero/Config.in b/package/monero/Config.in
> new file mode 100644
> index 0000000000..59036286cd
> --- /dev/null
> +++ b/package/monero/Config.in
> @@ -0,0 +1,35 @@
> +config BR2_PACKAGE_MONERO
> +	bool "monero"
> +	depends on !BR2_aarch64_be && !BR2_i386

Why is i386 excluded?


> +MONERO_VERSION = 0.18.1.2
> +MONERO_SOURCE = monero-source-v$(MONERO_VERSION).tar.bz2
> +MONERO_SITE = https://downloads.getmonero.org/cli
> +MONERO_LICENSE = MIT
> +MONERO_LICENSE_FILES = LICENSE
> +MONERO_CONF_OPTS = \
> +	-DBUILD_DOCUMENTATION=OFF \
> +	-DCMAKE_CXX_FLAGS="$(MONERO_CXXFLAGS)" \
> +	-DCMAKE_BUILD_TYPE=None \

Is that normal?

> +	-DMANUAL_SUBMODULES=ON \
> +	-DSTACK_TRACE=OFF \
> +	-DUSE_CCACHE=OFF \
> +	-DUSE_DEVICE_TREZOR=OFF
> +MONERO_DEPENDENCIES = \
> +	boost \
> +	czmq \
> +	libminiupnpc \
> +	libsodium \
> +	openssl \
> +	unbound
> +
> +ifeq ($(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64el)$(BR2_sparc64),y)

So you don't support AArch64 BE, but it's handled here ? :-)

> +MONERO_CONF_OPTS += -DNO_AES=ON
> +endif

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
