Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A4ACFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 14:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C32F281B6D;
	Sun, 30 Nov 2025 14:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMNbFrLOy8UX; Sun, 30 Nov 2025 14:41:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA28981BB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA28981BB2;
	Sun, 30 Nov 2025 14:41:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36501351
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 14:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27A0D60737
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 14:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPoYTwjhhIRH for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 14:41:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCB3F606EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCB3F606EE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCB3F606EE
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 14:41:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9D0A8780505;
 Sun, 30 Nov 2025 15:41:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Nov 2025 15:41:47 +0100
MIME-Version: 1.0
Date: Sun, 30 Nov 2025 15:41:47 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20251021120342.483933-5-maxime@leroys.fr>
References: <20251021120342.483933-1-maxime@leroys.fr>
 <20251021120342.483933-5-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <bb3fe35a7bb2ef59404c26bc63b4a178@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764513709;
 bh=9cj/JDRXuLTrxEMPR08qf5h6hPEHp7ZmvZEt+UIxlE0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tpyYdY0EiESLm7/7Z7hEfSJrk6qdOzeuQrcGOCZPaHlpA2gTAzAJ2/t1yb4YfV7eK
 s4ASDfRTSaNPM7Hew58jx4a+ljFTeoaz4Ar9IAM+Iu2LRW/6Wh9RlwKz8C/gIZys97
 gof1kM6LdWLMXWcT5BP8CildWNCUA7cHRlRLy9m3cGCZ70GMaGlnADDrUOgruxp2Oo
 tNJRXyKBzPvCtVYGWAWuVfytBJiaqKHAHzBPXurfTV4WeJz067LrzeaLhERW5gLnMP
 E+mRmrPIlTr7a3AAxcOsW6/+mtsLUe5eBoctLVGSNvgVQX9URq5vZS8PG1DEXctdjr
 x2dYCIF5ZVHTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tpyYdY0E
Subject: Re: [Buildroot] [PATCH 4/5] package/dpdk: make libraries selectable
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

I have mostly the same comments as for the dpdk driver
list patch [1].

On 21/10/2025 14:03, Maxime Leroy wrote:
> Add BR2_PACKAGE_DPDK_LIBS_LIST to control which DPDK libraries are
> built:
>   - empty : use DPDK defaults
>   - none  : disable all libs (-Ddisable_libs='*')
>   - list  : pass to -Denable_libs= (comma-separated)
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> ---
>  package/dpdk/Config.in | 14 ++++++++++++++
>  package/dpdk/dpdk.mk   |  9 +++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> index 5de1c63937..e311611548 100644
> --- a/package/dpdk/Config.in
> +++ b/package/dpdk/Config.in
> @@ -64,6 +64,20 @@ config BR2_PACKAGE_DPDK_DRIVERS_LIST
>  	    find drivers -mindepth 2 -maxdepth 2 -type d \
>  	    ! -printf '%P\n' | sort
> 
> +config BR2_PACKAGE_DPDK_LIBS_LIST
> +	string "Comma-separated libraries (e.g. graph,hash,fib)"

Could you make the prompt a bit shorter by moving the example
in the help section. For example:
	string "List of enabled libraries"

> +	help
> +	  Controls which DPDK libraries are built.
> +
> +	  Values:
> +	    (empty): use DPDK defaults
> +	    none   : build no libraries
> +	    list   : e.g. "graph,hash,fib"

Could you provide a simple working example, please?

Testing the provided example with the commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_DPDK=y
BR2_PACKAGE_DPDK_LIBS_LIST="graph,hash,fib"
EOF
make olddefconfig
make dpdk

Fails with error:

ERROR: Problem encountered: Cannot build explicitly requested lib "fib".
	Please add missing dependency "rib" to "enable_libs" option

> +
> +	  To list all libraries found in the DPDK source tree:
> +	    find lib -mindepth 2 -maxdepth 2 -type f -name meson.build \
> +	      -printf '%h\n' | xargs -n1 basename | sort -u

Could you add a comment in the help section about the
dependencies?

> +
>  endif
> 
>  comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers 
> >= 4.19"
> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> index 9333a67c31..e54668ca2d 100644
> --- a/package/dpdk/dpdk.mk
> +++ b/package/dpdk/dpdk.mk
> @@ -56,6 +56,15 @@ ifneq ($(DPDK_DRIVERS),)
>    endif
>  endif
> 
> +DPDK_LIBS := $(call qstrip,$(BR2_PACKAGE_DPDK_LIBS_LIST))
> +ifneq ($(DPDK_LIBS),)
> +  ifeq ($(DPDK_LIBS),none)
> +    DPDK_CONF_OPTS += -Ddisable_libs='*'
> +  else
> +    DPDK_CONF_OPTS += -Denable_libs='$(DPDK_LIBS)'
> +  endif
> +endif
> +
>  ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
>  DPDK_CONF_OPTS += -Dtests=true
>  else
> --
> 2.43.0

Could you send an updated patch to address those issues,
please?

Best regards,

Julien.

[1] 
https://lore.kernel.org/buildroot/019c90d7929f98d2f7da75410b941388@free.fr/T/#u
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
