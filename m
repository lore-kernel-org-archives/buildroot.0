Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C92D116F3
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 14:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1617280BF3;
	Sun, 30 Nov 2025 14:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0M4LD-sVyFgt; Sun, 30 Nov 2025 14:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3819D80B75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3819D80B75;
	Sun, 30 Nov 2025 14:49:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31183351
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 14:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 231004097A
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 14:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GVUG-D3Q4El for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 14:49:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07D6F4096D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D6F4096D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07D6F4096D
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 14:49:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8334978034E;
 Sun, 30 Nov 2025 15:49:35 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Nov 2025 15:49:35 +0100
MIME-Version: 1.0
Date: Sun, 30 Nov 2025 15:49:35 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20251021120342.483933-6-maxime@leroys.fr>
References: <20251021120342.483933-1-maxime@leroys.fr>
 <20251021120342.483933-6-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <2c2a8463ebf4ea26102692057d9c05ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764514177;
 bh=0YM3YQ+6BvdLAoPn54gFygixQDj9vWLDqr6U7y2DxfE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pL9wRhNSSKNw3wx/qu5DoZ73HNq5RyFSyD4lhzao0+SWiVGSfnjuI/0LQX7U5eyNx
 7KPwlJGIzjQ/VKGe+rWj6sw7QnNSiUhDLuukcsfUjwoQO90VguVk7Lyv3LOsZGTzUW
 AMKeyfpaAL7R1N/kl57KFVgQti/hB7nESMdcnZeJJ39Hz3+cGwemNfyD3Z2sSRnhTe
 c1SwjkZbc6GIAUuurIDcxclneNGaHjsjL4Qfr1n5ZjdAPYIA1rUykPqgGgCtAxSAsb
 BqVMkX0itt/jV36Gy4ZdACE2WAJ66YsswmICgi831vBvcD5Rm4stu2McVr0JnTo+O8
 6GNBe9SmCzGig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pL9wRhNS
Subject: Re: [Buildroot] [PATCH 5/5] package/dpdk: make apps selectable
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
> Add BR2_PACKAGE_DPDK_APPS_LIST to control which DPDK applications are
> built:
>   - empty : use DPDK defaults
>   - none  : disable all apps (-Ddisable_apps='*')
>   - list  : pass to -Denable_apps= (comma-separated)
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> ---
>  package/dpdk/Config.in | 14 ++++++++++++++
>  package/dpdk/dpdk.mk   |  9 +++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> index e311611548..feea71a4c3 100644
> --- a/package/dpdk/Config.in
> +++ b/package/dpdk/Config.in
> @@ -78,6 +78,20 @@ config BR2_PACKAGE_DPDK_LIBS_LIST
>  	    find lib -mindepth 2 -maxdepth 2 -type f -name meson.build \
>  	      -printf '%h\n' | xargs -n1 basename | sort -u
> 
> +config BR2_PACKAGE_DPDK_APPS_LIST
> +	string "Comma-separated applications (e.g. pdump,dumpcap)"

Could you make the prompt a bit shorter by moving the example
in the help section. For example:
	string "List of enabled applications"

> +	help
> +	  Controls which DPDK applications are built.
> +
> +	  Values:
> +	    (empty): use DPDK defaults
> +	    none   : build no apps
> +	    list   : e.g. "pdump,dumpcap"
> +
> +	  To list all applications found in the DPDK source tree:
> +	    find app -mindepth 2 -maxdepth 2 -type f -name meson.build \
> +	      -printf '%h\n' | xargs -n1 basename | sort -u

Could you add a comment in the help section about the
dependencies?

> +
>  endif
> 
>  comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers 
> >= 4.19"
> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> index e54668ca2d..8bef616cb3 100644
> --- a/package/dpdk/dpdk.mk
> +++ b/package/dpdk/dpdk.mk
> @@ -65,6 +65,15 @@ ifneq ($(DPDK_LIBS),)
>    endif
>  endif
> 
> +DPDK_APPS := $(call qstrip,$(BR2_PACKAGE_DPDK_APPS_LIST))
> +ifneq ($(DPDK_APPS),)
> +  ifeq ($(DPDK_APPS),none)
> +    DPDK_CONF_OPTS += -Ddisable_apps='*'
> +  else
> +    DPDK_CONF_OPTS += -Denable_apps='$(DPDK_APPS)'
> +  endif
> +endif
> +
>  ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
>  DPDK_CONF_OPTS += -Dtests=true
>  else
> --
> 2.43.0

Could you send an updated patch to address those issues, please?

Best regards,

Julien.

[1] 
https://lore.kernel.org/buildroot/019c90d7929f98d2f7da75410b941388@free.fr/T/#u
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
