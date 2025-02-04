Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941B3C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 13:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BD25605D9;
	Tue,  4 Feb 2025 13:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kQH73C1wBr8; Tue,  4 Feb 2025 13:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69DB0606AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69DB0606AE;
	Tue,  4 Feb 2025 13:46:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BB6F12F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E465A605D9
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zODEdBbfUM6a for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 13:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86974606AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86974606AE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86974606AE
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:46:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 57559B0059A;
 Tue,  4 Feb 2025 14:46:37 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:56196])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Feb 2025 14:46:37 +0100
MIME-Version: 1.0
Date: Tue, 04 Feb 2025 14:46:37 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241122230120.96898-2-vjardin@free.fr>
References: <3dfed5b9a6cf85883a65e432ff53c3b5@free.fr>
 <20241122230120.96898-1-vjardin@free.fr>
 <20241122230120.96898-2-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <b829984809262d058d08ca5e7bceb227@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738676798;
 bh=3wxE693C5CcU7kTqW1QoivUBOBmyRY37GJUiHkKxJHw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ACdpvWcxpGp8PjliQ1MiuOtoaJHWwpl+dHDm47nil3NnI15McLozudObrrJMX5Oen
 Ak96hEa/gIJIBScgV2hM7RZ43D4WcARh/8vM7U+tFXBK+7QTVjz3O1L9zAho1Eryew
 re7TfHw/G/SBJZJs8x6d66yR+vRkSCSGhicJeEISyBq5QEy6guo5prZlWSB8gHs+5j
 IGiSpHupzrViXYNgeqCpj8iYrvPAGGKDLkO1M1fuBq1S0q+lXnIzqrIvrBYKBjlHS+
 rdAM2aGppmbLLqYypJneicZdu5jl6Gi6w0ULmvc9r8ICmy2JmYrOrXq4QENJp902nn
 vlIzqqnyBR1SQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ACdpvWcx
Subject: Re: [Buildroot] [PATCH v3 1/2] package/mstflint: add new package
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

Hi Vincent,

Thanks for the patches!

On 23/11/2024 00:01, Vincent Jardin wrote:
> Collection of debug tools for the systems with a Mellanox/NVIDIA 
> device.
> 
> Since  mst tools cannot be cross compiled. This serie of patch
> that has been proposed for reviews to Mellanox enables a proper
> dynamic linkage along with proper paths for cross compilations.
> 
> The pull request is available at:
>   https://github.com/Mellanox/mstflint/pull/1026
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
[...]
> diff --git a/package/mstflint/Config.in b/package/mstflint/Config.in
> new file mode 100644
> index 0000000000..fa1a1dbf1e
> --- /dev/null
> +++ b/package/mstflint/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_MSTFLINT_ENABLE_ADB_GENERIC_TOOLS
> +	bool
> +	default y if BR2_PACKAGE_EXPAT && BR2_PACKAGE_XZ
> +
> +config BR2_PACKAGE_MSTFLINT_ENABLE_FW_MGR
> +	bool
> +	default y if BR2_PACKAGE_XZ && BR2_PACKAGE_LIBCURL

I would recommend to avoid using such hidden Kconfig symbols.

When the list of dependencies is a bit complex and link to a
specific package sub-function, I would recommend to add
user visible sub-package option describing the function and
selecting the list of all needed dependencies for that function.

The .mk will then adjust the _DEPENDCIES and _CONF_OPTS variable
as needed (based on the selected Config.in package sub-options).

Another related issue was that mstflint autoconf script was
incorrectly enabling options when an explicit disable was
requested. I posted patches to fix that issue a while back,
and those patches were merged recently. See:
https://github.com/Mellanox/mstflint/pull/1037

Those patch will help to rework this series and use
the --enable-feature/--disable-feature configure options.

> +config BR2_PACKAGE_MSTFLINT
> +	bool "mstflint"
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_SQLITE
> +	help
> +	  Collection of Mellanox/NVIDIA firmware tools.
> +
> +	  https://github.com/Mellanox/mstflint
> +
> +comment "mstflint needs a toolchain w/ C++, wchar, dynamic library, 
> threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS

Could you send an updated series with package sub-options
and their corresponding description in help string, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
