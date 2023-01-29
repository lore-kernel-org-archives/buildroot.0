Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19A0C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C0DA410D6;
	Sun, 29 Jan 2023 16:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C0DA410D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P7z-f1yJI8YI; Sun, 29 Jan 2023 16:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E972A410E9;
	Sun, 29 Jan 2023 16:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E972A410E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDC621BF3DB
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A454F813D8
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A454F813D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQxVLU3Mg4G9 for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:01:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3FA2813D6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3FA2813D6
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:01:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 67C8C5FFBE;
 Sun, 29 Jan 2023 17:01:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 17:01:39 +0100
Date: Sun, 29 Jan 2023 17:01:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230129160139.GI2632@scaer>
References: <20230129094530.884944-1-thomas.devoogdt@barco.com>
 <20230129094530.884944-3-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129094530.884944-3-thomas.devoogdt@barco.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675008103;
 bh=3qYFFlfO+Uha7O1sXdX9ocf5kCSttQYb6TqlmWPKW4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eae8Sx/wXXAtfIi/kyQOhtED/f9P6w25JC82dxFbX2J2YO8F1+Xtp5UJrhYw1Xcct
 KhQ77KOSmW4DL4PWlmVzsQ7cRuL+gHhpruKk7EBszdLyyFru7tHcbBLYB+SV24fMuA
 gOK5wgD1YV0g4Qlb+0NKvXeLrESxPAdf8jbVwl8lHXRB9SRBaC9zJx9wuwjzpy4Pbq
 St8u0thoLfHmB1RdI8BSp9fKkWKHchdW8olp8YQ0CON2L7LJopqWEE3ZMjtezFJvBx
 G9cBxdiSjr3LBYSX6YH+HdOPO8oS2VOosQyDp+DtTh/ugGH3UheW6PtstNE3qSUJuw
 n0KC2cblebweg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Eae8Sx/w
Subject: Re: [Buildroot] [PATCH v2 3/3] package/fluent-bit: needs arch
 support for wasm
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

\Thomas, All,

On 2023-01-29 10:45 +0100, Thomas Devoogdt spake thusly:
> From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> 
> See:
> https://github.com/fluent/fluent-bit/tree/master/lib/wasm-micro-runtime-WAMR-1.1.1#supported-architectures-and-platforms
> 
> MIPS & RISCV32 are mentioned in the supported list,
> but that seems to be wrong, so excluded those.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> ---
> v1 --> v2:
>  - added package/ prefix to the git message
> 
>  package/fluent-bit/Config.in     | 11 +++++++++++
>  package/fluent-bit/fluent-bit.mk |  6 ++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
> index bd89c05faa..0ed69e09ce 100644
> --- a/package/fluent-bit/Config.in
> +++ b/package/fluent-bit/Config.in
> @@ -11,3 +11,14 @@ config BR2_PACKAGE_FLUENT_BIT
>  
>  comment "fluent-bit needs a glibc toolchain w/ C++"
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
> +
> +if BR2_PACKAGE_FLUENT_BIT
> +
> +config BR2_PACKAGE_FLUENT_BIT_WASM
> +	bool "Build with WASM runtime support"
> +	default y
> +	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
> +	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be || \
> +		(BR2_riscv && BR2_RISCV_64) || BR2_xtensa || BR2_arc

Long lists are not nice. You can achieve a better look with;

    config BR2_PACKAGE_FLUENT_BIT_WASM
        bool "WASM runtime support"
        depends in BR2_INSTALL_LIBSTDCPP
        default y if BR2_arc
        default y if BR2_arm || BR2_armeb
        default y if BR2_aarch64 || BR2_aarch64_be
        default y if BR2_i386 || BR2_x86_64
        default y if BR2_RISCV_64
        default y if BR2_xtensa

Note that the C++ dependency from my review on patch 1/3 should fit
here.

Also, BR2_RISCV_64 can only be set if BR2_riscv is already set, so
"BR2_riscv && BR2_RISCV_64 == BR2_RISCV_64".

Regards,
Yann E. MORIN.

> +endif
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> index c84042a0fa..6e9a33e02e 100644
> --- a/package/fluent-bit/fluent-bit.mk
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -17,6 +17,12 @@ FLUENT_BIT_CONF_OPTS += \
>  	-DFLB_CHUNK_TRACE=No \
>  	-DFLB_BACKTRACE=No
>  
> +ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
> +FLUENT_BIT_CONF_OPTS += -DFLB_WASM=Yes
> +else
> +FLUENT_BIT_CONF_OPTS += -DFLB_WASM=No
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LUAJIT),y)
>  FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=Yes
>  FLUENT_BIT_DEPENDENCIES += luajit
> -- 
> 2.39.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
