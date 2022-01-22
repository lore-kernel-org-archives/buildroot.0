Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EAEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 22:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8621E404CF;
	Sat, 22 Jan 2022 22:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhadoNq5IWfz; Sat, 22 Jan 2022 22:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A45EF40425;
	Sat, 22 Jan 2022 22:34:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 430B81BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38C4840391
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLvsWLABvflh for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 22:34:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78C0A401A4
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 22:34:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0E884B0037C;
 Sat, 22 Jan 2022 23:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642890841;
 bh=1BlTDXgL7LgaBqg1UO65KNchd2E4GgJh5WGoLZdh5XI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B2rphE9/Eu+p3deNNloLVaRCuO7RDPaLxaahSr7dLnfuk0F446/Me/6/K3y7l83Vc
 Br/+TC88nzMfBC3SP0OONQBo00yzUTCirpSHYD3VBLp5DS47HsIX4lLTG8GiwlOE/b
 qoDRDyXqUnt6sa4LtSPLGK8NTvIZx/nQDQu0f3qhcLx34hNmPs//Sd89a6sPc+dNJK
 265WxX4xpLZ0MXiBVhjCSvx03zea8T3pObIDrie7AMyhjC8yzpeOv6MOSJYOynS4Au
 D00p5U4IAwl4p84hi4ofY0TRes0n71vORy4P1rYWYtnRfBFKHZj7bgUpjKDwcttNpT
 Ew9VT+aQZc6qg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 22 Jan 2022 23:33:57 +0100
Date: Sat, 22 Jan 2022 23:33:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220122223357.GI3621364@scaer>
References: <20220122222313.303416-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122222313.303416-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: security bump to
 version 1.4.64
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-22 23:23 +0100, Fabrice Fontaine spake thusly:
> Fix CVE-2022-22707: In lighttpd 1.4.46 through 1.4.63, the
> mod_extforward_Forwarded function of the mod_extforward plugin has a
> stack-based buffer overflow (4 bytes representing -1), as demonstrated
> by remote denial of service (daemon crash) in a non-default
> configuration. The non-default configuration requires handling of the
> Forwarded header in a somewhat unusual manner. Also, a 32-bit system is
> much more likely to be affected than a 64-bit system.
> 
> gdbm, geoip and memcached options have been dropped with
> https://github.com/lighttpd/lighttpd1.4/commit/86c2d3093686c4f945086c90af9b8a7900925b6b
> 
> https://www.lighttpd.net/2022/1/19/1.4.64/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lighttpd/lighttpd.hash | 4 ++--
>  package/lighttpd/lighttpd.mk   | 5 +----
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
> index 7601745fd7..ce026b9b4a 100644
> --- a/package/lighttpd/lighttpd.hash
> +++ b/package/lighttpd/lighttpd.hash
> @@ -1,4 +1,4 @@
> -# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.63.sha256sum
> -sha256  2aef7f0102ebf54a1241a1c3ea8976892f8684bfb21697c9fffb8de0e2d6eab9  lighttpd-1.4.63.tar.xz
> +# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.64.sha512sum
> +sha512  8e2ad0830ff80fcebf0c33600caafb5ab4e9ff6b5073c12572f88a44fdfe85f777fa8b22b2fc2964fecbeb556997ad660867dcee80efb224d63329c8b18ea936  lighttpd-1.4.64.tar.xz
>  # Locally calculated
>  sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index 5d53767263..f0974dd5b2 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIGHTTPD_VERSION_MAJOR = 1.4
> -LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).63
> +LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).64
>  LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
>  LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
>  LIGHTTPD_LICENSE = BSD-3-Clause
> @@ -16,8 +16,6 @@ LIGHTTPD_CONF_OPTS = \
>  	-Dwith_brotli=false \
>  	-Dwith_dbi=false \
>  	-Dwith_fam=false \
> -	-Dwith_gdbm=false \
> -	-Dwith_geoip=false \
>  	-Dwith_gnutls=false \
>  	-Dwith_krb5=false \
>  	-Dwith_ldap=false \
> @@ -25,7 +23,6 @@ LIGHTTPD_CONF_OPTS = \
>  	-Dwith_libunwind=false \
>  	-Dwith_maxminddb=false \
>  	-Dwith_mbedtls=false \
> -	-Dwith_memcached=false \
>  	-Dwith_mysql=false \
>  	-Dwith_nettle=false \
>  	-Dwith_nss=false \
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
