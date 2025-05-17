Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04251C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 13:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1EF480EE6;
	Sat, 17 May 2025 13:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTU59fkgomAq; Sat, 17 May 2025 13:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27EED810DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27EED810DE;
	Sat, 17 May 2025 13:37:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 803F2223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 661E960A55
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0Ozc7SSiXBF for <buildroot@buildroot.org>;
 Sat, 17 May 2025 13:37:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B2D3607B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B2D3607B0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B2D3607B0
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:37:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C3BF619F5BA;
 Sat, 17 May 2025 15:36:57 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 15:36:57 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 15:36:57 +0200
From: Julien Olivain <ju.o@free.fr>
To: Amer Alshanawany <amer.alshanawany@openpixelsystems.org>
Cc: buildroot@buildroot.org, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250430130142.47069-1-amer.alshanawany@openpixelsystems.org>
References: <20250430130142.47069-1-amer.alshanawany@openpixelsystems.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <027b444037fe2a09d429274da2f934fa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747489020;
 bh=LBze7fs8Gf0fZ+Flx1nmxmH2ta3iM3qdFQmgh/eE0a0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RHK5tREAdfPMUCZoJZYtM2EQf5gdSQMnRv7KjNKU3KOVm+WROn9hb1SdEkU36S/pZ
 8Wisho2deZ7Nu5kJ7l5is5dlr6Go1Tu9cS4rgzM+aOZRlCzgMbIOt2S8yJp4map0N1
 mbrT47DcIFcI2QpECuQoCKcGWgEB2crtQhK2zVuyiM0B8D5RJChQwhLFhH5lPmW7Iw
 fJzuAAXFNmRfu8ZXTStorxM4qJY48vWIoTKeSw1o36/yrPTo/n/h+6qBGzhSlid+tD
 2AoAX6mMwdmkTi/+D8uSi8wWZuzPFxDigNd3LR5K/+d0o/13ZRX+PIJW2Ap/7z9uv/
 5FKS/pzHWljRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RHK5tREA
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: add target support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Amer,

Thanks for the patch. It introduces new build failures, for some
toolchain/configuration. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1822839699

See below.

On 30/04/2025 15:01, Amer Alshanawany wrote:
> Signed-off-by: Amer Alshanawany <amer.alshanawany@openpixelsystems.org>
> ---
>  package/Config.in     |  1 +
>  package/uuu/Config.in | 19 +++++++++++++++++++
>  package/uuu/uuu.mk    |  2 ++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/uuu/Config.in
> 
> diff --git a/package/Config.in b/package/Config.in
> index 167965d64b..1730898247 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2809,6 +2809,7 @@ comment "Utilities"
>  	source "package/tini/Config.in"
>  	source "package/tmux/Config.in"
>  	source "package/ttyd/Config.in"
> +	source "package/uuu/Config.in"
>  	source "package/which/Config.in"
>  	source "package/wlr-randr/Config.in"
>  	source "package/wtfutil/Config.in"
> diff --git a/package/uuu/Config.in b/package/uuu/Config.in
> new file mode 100644
> index 0000000000..bccb96bb13
> --- /dev/null
> +++ b/package/uuu/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_UUU
> +	bool "uuu"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR # libuuu

Here the comment should preferably be:

depends on BR2_USE_WCHAR # libuuu uses wchar_t

Also, there is possibly other dependencies missing here.

> +	select BR2_PACKAGE_BZIP2
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBUSB
> +	select BR2_PACKAGE_TINYXML2
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_ZSTD
> +	help
> +	  UUU (Universal Update Utility) is Freescale/NXP I.MX Chip
> +	  image deploy tool. UUU is an evolution of MFGTools
> +	  (aka MFGTools v3).
> +
> +	  https://github.com/nxp-imx/mfgtools
> +
> +comment "uuu needs a toolchain w/ C++, wchar"
> +	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
> index 4683cbeec1..9c27c4c1d6 100644
> --- a/package/uuu/uuu.mk
> +++ b/package/uuu/uuu.mk
> @@ -9,6 +9,7 @@ UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
>  UUU_SITE = 
> https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
>  UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
>  UUU_LICENSE_FILES = LICENSE
> +UUU_DEPENDENCIES = bzip2 libusb openssl tinyxml2 zlib zstd
>  HOST_UUU_DEPENDENCIES = \
>  	host-bzip2 \
>  	host-libusb \
> @@ -17,4 +18,5 @@ HOST_UUU_DEPENDENCIES = \
>  	host-zlib \
>  	host-zstd
> 
> +$(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> --
> 2.49.0

Could you have a look to fix those, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
