Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D157DC0218C
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 09:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2712960785;
	Mon, 27 Jan 2025 09:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWyEXmlFJPZm; Mon, 27 Jan 2025 09:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 816946068A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 816946068A;
	Mon, 27 Jan 2025 09:57:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2212AF7
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 09:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B8E480E60
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 09:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5E9o9WaQw76 for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 09:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F6D680E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F6D680E18
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F6D680E18
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 09:57:50 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:d987:3aa4:49a8:becb])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id CB8C4780505;
 Mon, 27 Jan 2025 10:57:46 +0100 (CET)
Date: Mon, 27 Jan 2025 10:57:46 +0100
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Message-ID: <alponle6ggezcm72blz2za4l6ymxtiufqc66zlygi7lobegppg@x4s42wm3clux>
References: <87h682ed2c.fsf@tarshish> <20241120080703.63802-1-vjardin@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241120080703.63802-1-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737971868;
 bh=yGtTNKzBqUegeWRr/rLEQKnta8e7dUb40NhpNEEMEhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mDujMahkXhUnrpQkIm2Kp59KySicMFFYU35pNsFz0CWTwFsZHVSq/Pxl/1IvEHxF5
 byaeVqNm2DOA5TJaDmyhKk/ZF1VTlQQkuVvGVtd+Lq7FMnRXX4hreAttEt+jrDsuJH
 kiyd8OMcAyPOkH2kGwZ4n4Tj8PUNbntni3+kBzx39nVAD8ndOGGNDGAFFeU22HrPAV
 cUhRBXZF3ztadf41j9rcpVN5ImJXsUMfi8/U0LK0TdngZYWdQR4eaRMvjvpH71JUlH
 fPqaCa7TGtUvF8ZyfIwFgyDJ37066JK7cOBqNW896uATqChi8m2DWYGntQ0hccTFo0
 tkJExhvjiJSWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mDujMahk
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss-ato: new package
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



On Wed, Nov 20, 2024 at 09:07:03AM +0100, Vincent Jardin wrote:
> The libnss_ato module is a set of C library extensions which allows to
> map every nss request for unknown user to a single predefined user.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Hi,

I believe that new package  was "ok" for Baruch last november. Could it be
considered for a merge ?

Thanks,
  Vincent

> ---
>  DEVELOPERS                         |  1 +
>  package/Config.in                  |  1 +
>  package/libnss-ato/Config.in       | 11 +++++++++++
>  package/libnss-ato/libnss-ato.hash |  4 ++++
>  package/libnss-ato/libnss-ato.mk   | 26 ++++++++++++++++++++++++++
>  5 files changed, 43 insertions(+)
>  create mode 100644 package/libnss-ato/Config.in
>  create mode 100644 package/libnss-ato/libnss-ato.hash
>  create mode 100644 package/libnss-ato/libnss-ato.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3945803d53..6dee1c10ec 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3285,6 +3285,7 @@ F:	board/nvidia/bf3/
>  F:	configs/nvidia_bf3_defconfig
>  F:	package/bfscripts/
>  F:	package/dpdk/
> +F:	package/libnss-ato/
>  
>  N:	Vincent Prince <vincent.prince.fr@gmail.com>
>  F:	package/nss-myhostname/
> diff --git a/package/Config.in b/package/Config.in
> index 1eb5e1e020..30dc2c1712 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1610,6 +1610,7 @@ menu "Crypto"
>  	source "package/libmd/Config.in"
>  	source "package/libmhash/Config.in"
>  	source "package/libnss/Config.in"
> +	source "package/libnss-ato/Config.in"
>  	source "package/libolm/Config.in"
>  	source "package/libp11/Config.in"
>  	source "package/libscrypt/Config.in"
> diff --git a/package/libnss-ato/Config.in b/package/libnss-ato/Config.in
> new file mode 100644
> index 0000000000..6c6fc23857
> --- /dev/null
> +++ b/package/libnss-ato/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBNSS_ATO
> +	bool "libnss-ato"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  Library to map every nss request for unknown user to a
> +	  single predefined user.
> +
> +	  https://github.com/donapieppo/libnss-ato
> +
> +comment "libnss-ato needs a glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> diff --git a/package/libnss-ato/libnss-ato.hash b/package/libnss-ato/libnss-ato.hash
> new file mode 100644
> index 0000000000..5e828f1be6
> --- /dev/null
> +++ b/package/libnss-ato/libnss-ato.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256  3de3161d298c48e55d7416ad89130e13dd72263b93563f3fb79c899fa8450ce2  copyright
> +sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  lgpl-3.0.txt
> +sha256  87e17468eec71254e7848cb7c9dae5603ab376a719b05e2f5e69038ffed8beef  libnss-ato-4a29c8410cdac590a210dab2dec41d5f4b40d282.tar.gz
> diff --git a/package/libnss-ato/libnss-ato.mk b/package/libnss-ato/libnss-ato.mk
> new file mode 100644
> index 0000000000..46b8a7963b
> --- /dev/null
> +++ b/package/libnss-ato/libnss-ato.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# libnss-ato
> +#
> +################################################################################
> +
> +LIBNSS_ATO_VERSION = 4a29c8410cdac590a210dab2dec41d5f4b40d282
> +LIBNSS_ATO_SITE = $(call github,donapieppo,libnss-ato,$(LIBNSS_ATO_VERSION))
> +LIBNSS_ATO_LICENSE = LGPL-3.0+
> +LIBNSS_ATO_LICENSE_FILES = copyright lgpl-3.0.txt
> +
> +# Skip the default build system (avoid patching Makefile for 1 .c)
> +define LIBNSS_ATO_BUILD_CMDS
> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> +		-fPIC -Wall -shared -o $(@D)/libnss_ato.so.2 \
> +		-Wl,-soname,libnss_ato.so.2 \
> +		$(@D)/libnss_ato.c
> +endef
> +
> +define LIBNSS_ATO_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so.2
> +	ln -sf libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so
> +	$(INSTALL) -D -m 0644 $(@D)/libnss-ato.conf $(TARGET_DIR)/etc/libnss-ato.conf
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.34.1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
