Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F73C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4112783CF7;
	Sat, 27 Jan 2024 20:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4112783CF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zomA1J_6LVUu; Sat, 27 Jan 2024 20:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C02D83CAB;
	Sat, 27 Jan 2024 20:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C02D83CAB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D7B91BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4538E417AB
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4538E417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msu4F0ruKQ7E for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:15:38 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 499F0417A8
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 499F0417A8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9696113F86E;
 Sat, 27 Jan 2024 21:15:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 21:15:34 +0100
Date: Sat, 27 Jan 2024 21:15:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZbVkZpQp7NuPiOsX@landeda>
References: <20240126222324.1790975-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240126222324.1790975-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706386536;
 bh=H1+NTQKu8Yae+hfkIujgA95juvhJ07LQ/lR6lwFe+mU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGtCCKgjE/8YZ0cSTFakEcW7o3unvSpFGvPQtSLVK6/Zwp3r/fPPHOCRvhZw5+ZO2
 bLOoQ6fTehb5THzjxX06eAoYwsACIKtxyXgKHiVKenbsrGM7E/EQSGK4IaGbBmUbR9
 a7ko/xnDm3Js5sSREvKWqXOlNc0E0Rbvrgk8RtedRCu+B51BAzUdB0rMd1D5eTHtyB
 IQaiKdvYj2Wi0YMZPseTmNMzQVIE1VqnYdxMQ1T4m8zCoRmV8l5zWg8xC1wFDPAGWC
 0OMRaAbM5sH6yRqQ4CSAVEmWZXt6ci5AoN4t6IhnKx8xIformBZx4FX/L6fUiyL3ob
 /KPf7EntHdtfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WGtCCKgj
Subject: Re: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.28.7
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-26 23:23 +0100, Fabrice Fontaine spake thusly:
> - Fix CVE-2024-23170 and CVE-2024-23775
> - Mbed TLS is now released under a dual Apache-2.0 OR GPL-2.0-or-later
>   license. Users may choose which license they take the code under:
>   https://github.com/Mbed-TLS/mbedtls/commit/f429557c5900d3b90bd10a21b228f719e80f81a2
> 
> https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-1/
> https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-2/
> https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.6
> https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mbedtls/mbedtls.hash | 6 +++---
>  package/mbedtls/mbedtls.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index d0cd0b2105..3ec151a859 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.4:
> -sha256  849e86b626e42ded6bf67197b64aa771daa54e2a7e2868dc67e1e4711959e5e3  mbedtls-2.28.5.tar.gz
> +# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.7:
> +sha256  1df6073f0cf6a4e1953890bf5e0de2a8c7e6be50d6d6c69fa9fefcb1d14e981a  mbedtls-2.28.7.tar.gz
>  # Locally calculated
> -sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> +sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index 1b941e04f4..cdb4aef4f4 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MBEDTLS_VERSION = 2.28.5
> +MBEDTLS_VERSION = 2.28.7
>  MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
>  MBEDTLS_CONF_OPTS = \
>  	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
> @@ -12,7 +12,7 @@ MBEDTLS_CONF_OPTS = \
>  	-DENABLE_TESTING=OFF \
>  	-DMBEDTLS_FATAL_WARNINGS=OFF
>  MBEDTLS_INSTALL_STAGING = YES
> -MBEDTLS_LICENSE = Apache-2.0
> +MBEDTLS_LICENSE = Apache-2.0 or GPL-2.0+
>  MBEDTLS_LICENSE_FILES = LICENSE
>  MBEDTLS_CPE_ID_VENDOR = arm
>  MBEDTLS_CPE_ID_PRODUCT = mbed_tls
> -- 
> 2.43.0
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
