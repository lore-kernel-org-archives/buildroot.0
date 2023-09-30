Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26091E748A1
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2B341BE9;
	Sat, 30 Sep 2023 19:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F2B341BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nn6D1yAZ31xV; Sat, 30 Sep 2023 19:27:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7165841DE6;
	Sat, 30 Sep 2023 19:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7165841DE6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BB201BF48D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F19D24021C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F19D24021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5v3CxCMh9RGv for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:27:10 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C7BB4013B
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C7BB4013B
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32487efc319so2741976f8f.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696102028; x=1696706828;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l9T2kRUAuHBX8R9N9q9xUYkZEG9srkrsJ33Kv1zBMn8=;
 b=guxFKLNnGORbggcQfuWOSTajD6j5W4/KibUY3D0InmkyGNe+ZWSMKFyTv1Te5uUDMm
 COyfNfg5bg8qbffcX/wPku727zPQAsLm8cxZYYfO5J4Zf69ftT2n8ro552vol9yAYZ46
 hEcTdlsQWvbK4eat0qmVIcNktEt8ZNUApAqpmhMgALFCm1yQ49bo+uQ6bdgqPMPgxgG1
 eYjlQgEfucH9J1oTM+zXArRKCiKlRPsa0JgG8rCNHlbPZ/gmRYcThwmSEnk3MU8JEPgS
 zu1tZKouhjsYoXoYUdndHjU4N4XKl9xoYU5R9nJa22o7q1xZsMBOIJl8MIdmWa9R/XU6
 iAIw==
X-Gm-Message-State: AOJu0Yw/602KJF2yZn63eE2OVqknOYBmwyAeoMDVdkyveroKhmK+KHJ0
 47AVlU97yBjJgTFpBvAgjbDKQg==
X-Google-Smtp-Source: AGHT+IFup8DYvfoPv+qh6mq48Z8Um5Fo/ri+aQKAJBEGbOm2WZfKiVkMdhmm51lGwRD9Ht8Zj9XYIg==
X-Received: by 2002:a5d:4a46:0:b0:31d:d48f:12a3 with SMTP id
 v6-20020a5d4a46000000b0031dd48f12a3mr6593045wrs.43.1696102028225; 
 Sat, 30 Sep 2023 12:27:08 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a5d4a8b000000b0031fc4c31d77sm24383821wrq.88.2023.09.30.12.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 12:27:07 -0700 (PDT)
Message-ID: <cde0e66b-5323-27a2-4a76-72c45eecddfe@mind.be>
Date: Sat, 30 Sep 2023 21:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220811063502.1823571-1-james.hilliard1@gmail.com>
In-Reply-To: <20220811063502.1823571-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696102028; x=1696706828; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l9T2kRUAuHBX8R9N9q9xUYkZEG9srkrsJ33Kv1zBMn8=;
 b=MNLFetiweIHvNyzC0jwd9rucOEthZbtE/9F2osETMQ2Hm92jqgdXYNsEHSCdi9m/NB
 v1RIbM47RZz3PVqN7zNpuc/eZ78LXyFRM3pFWLHK8p4ap1Z0wgGWVYDR5cZ5yXm+padL
 DdxzX/8xgz+mfZDfzECZex9TC9uquGFT0/0K6PjfgNdgGMV1bOhySTH2x7z4b176SWSH
 +1isMrpeu1AMVgv2rpatsnBDdrxT5lFDaIRrl/JL6/uDfv7BXIdtZcrswy2v6m46Fs7o
 ml5K+V195Dh6Hq8g3ZpHv7R2wKjLrstrvG8goc7+j93ZNVPqio97XSYlMNjaTP9PRJDk
 wbsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MNLFetiw
Subject: Re: [Buildroot] [PATCH 1/2] package/libucontext: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/08/2022 08:35, James Hilliard wrote:
> This package provides a ucontext.h C API on musl libc.
> 
> Architecture support table based on:
> https://github.com/kaniini/libucontext/tree/libucontext-1.2#supported-features

  Both applied to master, thanks.

  Regards,
  Arnout
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   DEVELOPERS                           |  1 +
>   package/Config.in                    |  1 +
>   package/libucontext/Config.in        | 33 ++++++++++++++++++++++++++++
>   package/libucontext/libucontext.hash |  4 ++++
>   package/libucontext/libucontext.mk   | 17 ++++++++++++++
>   5 files changed, 56 insertions(+)
>   create mode 100644 package/libucontext/Config.in
>   create mode 100644 package/libucontext/libucontext.hash
>   create mode 100644 package/libucontext/libucontext.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d2bd0d809a..b843acca9e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1334,6 +1334,7 @@ F:	package/exfatprogs/
>   F:	package/gensio/
>   F:	package/lua-std-debug/
>   F:	package/lua-std-normalize/
> +F:	package/libucontext/
>   F:	package/lilv/
>   F:	package/lv2/
>   F:	package/pipewire/
> diff --git a/package/Config.in b/package/Config.in
> index d1c098c48f..3fe0dcc3c8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2050,6 +2050,7 @@ menu "Other"
>   	source "package/libtpl/Config.in"
>   	source "package/libubox/Config.in"
>   	source "package/libuci/Config.in"
> +	source "package/libucontext/Config.in"
>   	source "package/libunwind/Config.in"
>   	source "package/liburcu/Config.in"
>   	source "package/liburing/Config.in"
> diff --git a/package/libucontext/Config.in b/package/libucontext/Config.in
> new file mode 100644
> index 0000000000..84a6e89f23
> --- /dev/null
> +++ b/package/libucontext/Config.in
> @@ -0,0 +1,33 @@
> +config BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if BR2_aarch64_be
> +	default y if BR2_arm
> +	default y if BR2_armeb
> +	default y if BR2_m68k
> +	default y if BR2_mips
> +	default y if BR2_mipsel
> +	default y if BR2_mips64
> +	default y if BR2_mips64el
> +	default y if BR2_or1k
> +	default y if BR2_powerpc
> +	default y if BR2_powerpc64
> +	default y if BR2_powerpc64le
> +	default y if BR2_riscv && BR2_RISCV_32
> +	default y if BR2_riscv && BR2_RISCV_64
> +	default y if BR2_s390x
> +	default y if BR2_sh4
> +	default y if BR2_sh4eb
> +	default y if BR2_sh4a
> +	default y if BR2_sh4aeb
> +	default y if BR2_i386
> +	default y if BR2_x86_64
> +	depends on BR2_TOOLCHAIN_USES_MUSL
> +
> +config BR2_PACKAGE_LIBUCONTEXT
> +	bool "libucontext"
> +	depends on BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
> +	help
> +	  Ucontext implementation featuring glibc-compatible ABI.
> +
> +	  https://github.com/kaniini/libucontext
> diff --git a/package/libucontext/libucontext.hash b/package/libucontext/libucontext.hash
> new file mode 100644
> index 0000000000..a8e1e23e36
> --- /dev/null
> +++ b/package/libucontext/libucontext.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  937fba9d0beebd7cf957b79979b19fe3a29bb9c4bfd25e869477d7154bbf8fd3  libucontext-1.2.tar.gz
> +# License files, locally calculated
> +sha256  ecf4be354bbb6ccebdf150d1a8f2b3caeb10cf7c8a580f278a30799372f9e037  LICENSE
> diff --git a/package/libucontext/libucontext.mk b/package/libucontext/libucontext.mk
> new file mode 100644
> index 0000000000..75c4f9b9e4
> --- /dev/null
> +++ b/package/libucontext/libucontext.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# libucontext
> +#
> +################################################################################
> +
> +LIBUCONTEXT_VERSION = 1.2
> +LIBUCONTEXT_SITE = $(call github,kaniini,libucontext,libucontext-$(LIBUCONTEXT_VERSION))
> +LIBUCONTEXT_LICENSE = ISC
> +LIBUCONTEXT_LICENSE_FILES = LICENSE
> +LIBUCONTEXT_INSTALL_STAGING = YES
> +
> +LIBUCONTEXT_CONF_OPTS = \
> +	-Dfreestanding=false \
> +	-Dexport_unprefixed=true
> +
> +$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
