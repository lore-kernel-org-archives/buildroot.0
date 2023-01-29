Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64751C54EED
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7168817A4;
	Sun, 29 Jan 2023 21:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7168817A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkhJP7zt7pca; Sun, 29 Jan 2023 21:58:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EF01817A3;
	Sun, 29 Jan 2023 21:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EF01817A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F08591BF576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAA4C40576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAA4C40576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbKr_JKADH_H for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:58:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCEA840567
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCEA840567
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:58:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D28325FFA1;
 Sun, 29 Jan 2023 22:58:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 22:58:18 +0100
Date: Sun, 29 Jan 2023 22:58:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230129215818.GA2632@scaer>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
 <20230127141058.2180747-5-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127141058.2180747-5-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675029505;
 bh=g8n0oTiJqwyHXrpVs0XELxbzV9yTRlvjIKck/7ExDmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vZpTZsFq1ugSEm0bVgxWIVjtz2WyFZ0QcM73eok/mYMBD3WH/J2kYR4qvis7OmfpD
 fAq6pok4h+f2UW7osG785Lqs+XztXHE4wtldwxgQjOArLV4d90KCn8knYI8Q+zkghN
 2BWmZJPvtBWu8tmjFVAuNe/4Dy31taU4Y7gAJ2z9bgx5KwRbDjR1M7Uh5G0mA5kNhz
 JwRBmGsmwBG8lc9y0h2DfOLUrX1jb7TLcn2vQaWepsxvg6tBjn1yZtTsbBNyK2VFIv
 hN4Kcpc29COEPYm+Ma//1jEMJGWFLM/ozxiLgCD5+IVruVUYYE+aL7LS9I1RXiMR7w
 4BI1WWhrIkO8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vZpTZsFq
Subject: Re: [Buildroot] [PATCH v4 05/13] package/neon-2-sse: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-01-27 07:10 -0700, James Hilliard spake thusly:
> This package is required by tensorflow-lite.
> 
> Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  DEVELOPERS                         |  1 +
>  package/Config.in                  |  1 +
>  package/neon-2-sse/Config.in       |  9 +++++++++
>  package/neon-2-sse/neon-2-sse.hash |  4 ++++
>  package/neon-2-sse/neon-2-sse.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/neon-2-sse/Config.in
>  create mode 100644 package/neon-2-sse/neon-2-sse.hash
>  create mode 100644 package/neon-2-sse/neon-2-sse.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f48ea66660..a711f9f1ee 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2704,6 +2704,7 @@ F:	package/ti-gfx/
>  N:	Stefan Hager <stefan.hager@ginzinger.com>
>  F:	package/cpuinfo/
>  F:	package/gemmlowp/
> +F:	package/neon-2-sse/

Since Stefan was not the author, only a tester, I moved that to James
entry.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  F:	package/ruy/
>  
>  N:	Stefan Ott <stefan@ott.net>
> diff --git a/package/Config.in b/package/Config.in
> index 8f78080963..6377ddd2e5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2101,6 +2101,7 @@ endif
>  	source "package/msgpack/Config.in"
>  	source "package/musl-compat-headers/Config.in"
>  	source "package/musl-fts/Config.in"
> +	source "package/neon-2-sse/Config.in"
>  	source "package/openblas/Config.in"
>  	source "package/orc/Config.in"
>  	source "package/p11-kit/Config.in"
> diff --git a/package/neon-2-sse/Config.in b/package/neon-2-sse/Config.in
> new file mode 100644
> index 0000000000..25613c5ec4
> --- /dev/null
> +++ b/package/neon-2-sse/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_NEON_2_SSE
> +	bool "neon-2-sse"
> +	help
> +	  The platform independent header allowing to compile any
> +	  C/C++ code containing ARM NEON intrinsic functions for
> +	  x86 target systems using SIMD up to SSE4 intrinsic
> +	  functions.
> +
> +	  https://github.com/intel/ARM_NEON_2_x86_SSE
> diff --git a/package/neon-2-sse/neon-2-sse.hash b/package/neon-2-sse/neon-2-sse.hash
> new file mode 100644
> index 0000000000..ded20d58f5
> --- /dev/null
> +++ b/package/neon-2-sse/neon-2-sse.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  019fbc7ec25860070a1d90e12686fc160cfb33e22aa063c80f52b363f1361e9d  neon-2-sse-a15b489e1222b2087007546b4912e21293ea86ff.tar.gz
> +# License files, locally calculated
> +sha256  7022f51b439a5915e933ecc270c83e24ca0cb2cceeb08b0132dcd4dbb03ed2dc  LICENSE
> diff --git a/package/neon-2-sse/neon-2-sse.mk b/package/neon-2-sse/neon-2-sse.mk
> new file mode 100644
> index 0000000000..0e9d066abd
> --- /dev/null
> +++ b/package/neon-2-sse/neon-2-sse.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# neon-2-sse
> +#
> +################################################################################
> +
> +NEON_2_SSE_VERSION = a15b489e1222b2087007546b4912e21293ea86ff
> +NEON_2_SSE_SITE = $(call github,intel,ARM_NEON_2_x86_SSE,$(NEON_2_SSE_VERSION))
> +NEON_2_SSE_LICENSE = BSD-2-Clause
> +NEON_2_SSE_LICENSE_FILES = LICENSE
> +NEON_2_SSE_INSTALL_STAGING = YES
> +NEON_2_SSE_INSTALL_TARGET = NO
> +
> +$(eval $(cmake-package))
> -- 
> 2.34.1
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
