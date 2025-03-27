Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E986DC36008
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 00:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97BC2846EB;
	Thu, 27 Mar 2025 00:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjNKrV27UmF2; Thu, 27 Mar 2025 00:29:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0C88846D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0C88846D7;
	Thu, 27 Mar 2025 00:29:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D65512A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 00:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EBBC40104
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 00:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsHehJKEPR5D for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 00:29:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C2BC840204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2BC840204
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2BC840204
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 00:29:22 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:70e4:c237:6624:9e80])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 99CC713F861;
 Thu, 27 Mar 2025 01:29:17 +0100 (CET)
Date: Thu, 27 Mar 2025 01:29:17 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Robin Jarry <robin@jarry.cc>, 
 Julien Olivain <ju.o@free.fr>
Message-ID: <5iqpywzph4k5eumvj5yxf5tfyyku4pwn6asq5bnkg4ha6i2lbt@n7lvwp3yhgxp>
References: <20250326111651.23707-1-maxime@leroys.fr>
 <20250326132655.35729-1-maxime@leroys.fr>
 <20250326132655.35729-3-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326132655.35729-3-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743035360;
 bh=/Yud8RxMjZZ3g8vj3YZMrkg1sZNBltUMQng6JoMpxpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WIQnUTAfNgkB/b+AMUeyHzyzWrxcEPQeBPiPQa9XYZzuakhzdcFnSIpVf/u2yzUp4
 jigCsL5aeCqK667KLZZRIRb/MTsEcvLZ7rWFpUGaaeAedr/bcX46bubot6RKkcu/V6
 WuX97kdAfv9/DETfspNq7BjHgNa3qDFNYooguTJuX5OUMCk/cNWp4FPphihfiulHvi
 FnPX23RODtMI8ycDG0i4MM/6TB9tEGCgqdQWTDVgOw2wYPPVlio6EwPLXANMJ/OHX6
 ejITdpI4EvGIF87DW/0WBLtmL4FgGJCNjYLkkbhZq7P2KUL5fBCc4ScPY8MKZ001MU
 eMwkqvLvKLYLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WIQnUTAf
Subject: Re: [Buildroot] [PATCH v2 2/2] package/grout: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks Maxime,

On Wed, Mar 26, 2025 at 02:26:55PM +0100, Maxime Leroy wrote:
> Grout is a Graph router based on DPDK.
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>

It LGTMs. I am not 100% confortable with Config.in, so I'd be pleased to
read the comments for a Buildroot maintainer.

Best regards,
  Vincent

> ---
>  DEVELOPERS               |  3 +++
>  package/Config.in        |  1 +
>  package/grout/Config.in  | 13 +++++++++++++
>  package/grout/grout.hash |  3 +++
>  package/grout/grout.mk   | 24 ++++++++++++++++++++++++
>  5 files changed, 44 insertions(+)
>  create mode 100644 package/grout/Config.in
>  create mode 100644 package/grout/grout.hash
>  create mode 100644 package/grout/grout.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 44f7684c97..c9871f5d32 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2383,6 +2383,9 @@ F:	package/libtraceevent/
>  F:	package/libtracefs
>  F:	package/linux-tools/linux-tool-rtla.mk.in
>  
> +N:	Maxime Leroy <maxime@leroys.fr>
> +F:	package/grout
> +
>  N:	Michael Durrant <mdurrant@arcturusnetworks.com>
>  F:	board/arcturus/
>  F:	configs/arcturus_ucp1020_defconfig
> diff --git a/package/Config.in b/package/Config.in
> index d8751fc19f..854cbc6cca 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2493,6 +2493,7 @@ endif
>  	source "package/gesftpserver/Config.in"
>  	source "package/gloox/Config.in"
>  	source "package/glorytun/Config.in"
> +	source "package/grout/Config.in"
>  	source "package/gupnp-tools/Config.in"
>  	source "package/gutenprint/Config.in"
>  	source "package/hans/Config.in"
> diff --git a/package/grout/Config.in b/package/grout/Config.in
> new file mode 100644
> index 0000000000..a39c3283eb
> --- /dev/null
> +++ b/pakjjkckage/grout/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_GROUT
> +	bool "grout"
> +	depends on BR2_ENABLE_LOCALE
> +	select BR2_PACKAGE_DPDK
> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_NUMACTL
> +	select BR2_PACKAGE_LIBECOLI
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
> +	help
> +	  Graph router based on DPDK
> +
> +	  NOTE: grout needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
> diff --git a/package/grout/grout.hash b/package/grout/grout.hash
> new file mode 100644
> index 0000000000..cff686ff19
> --- /dev/null
> +++ b/package/grout/grout.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  10f8e20b4aa1a8fe928c87b249e23267eef356f39b04994a0b88b52931fcaa4b  v0.8.4.tar.gz
> +sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  LICENSE
> diff --git a/package/grout/grout.mk b/package/grout/grout.mk
> new file mode 100644
> index 0000000000..0d6fb8dce9
> --- /dev/null
> +++ b/package/grout/grout.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# grout
> +#
> +################################################################################
> +
> +GROUT_VERSION = 0.8.4
> +GROUT_SITE = https://github.com/DPDK/grout/archive/refs/tags
> +GROUT_SOURCE = v$(GROUT_VERSION).tar.gz
> +GROUT_LICENSE = BSD-3-Clause
> +GROUT_LICENSE_FILES = LICENSE
> +
> +# Avoid using buildroot commit hash
> +GROUT_CONF_ENV += GROUT_VERSION=$(GROUT_VERSION)
> +
> +GROUT_DEPENDENCIES = \
> +	host-pkgconf \
> +	dpdk \
> +	libevent \
> +	numactl \
> +	libecoli \
> +	util-linux
> +
> +$(eval $(meson-package))
> -- 
> 2.43.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
