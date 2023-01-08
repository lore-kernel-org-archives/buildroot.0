Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B46C54EBC
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 21:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EC68408AD;
	Sun,  8 Jan 2023 21:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EC68408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xp5bYRltX-MJ; Sun,  8 Jan 2023 21:58:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5463C40232;
	Sun,  8 Jan 2023 21:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5463C40232
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA7CB1BF352
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 21:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5A9640159
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 21:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5A9640159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdRi30HBIf7l for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 21:58:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C1E40120
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7C1E40120
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 21:58:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 186715FF9A;
 Sun,  8 Jan 2023 22:58:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Jan 2023 22:58:24 +0100
Date: Sun, 8 Jan 2023 22:58:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230108215824.GI151997@scaer>
References: <20230107010437.2471513-1-james.hilliard1@gmail.com>
 <20230107010437.2471513-3-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230107010437.2471513-3-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673215111;
 bh=kMi+jG0ZoKa3DZD5X2N54EUkA56YmPLD4epaNVH9jYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fcpLa7pkm6Z6l3p04979SY9LDF9GRYvEcHwiwl31DgCjzMJcgmQMmHI10KRiXw1hz
 hAfxeQ6AJBxohqpoYupK5OTP/Hr/HgeqeHJqbSD59IPvIoEB9k3XabtWw2RqEdDzHG
 R9rg0w1GUApajtbtXtOnELOYeBVPvgixLRRdtEOvTR6ZbdSoYh/D/rSBn6VUAgnxuX
 K8owAE2HDiSrQgxL0TuSOoMY8V0kHmQNSwMNAuR8tX0HT7jWyzpxRKGlgo54iUSG8r
 7WZW39VhhxoW2xJp45fUWiEnIjb5TpZETDeXi4M6ov/2sXR/ZbvJpLg9pNSx7teeDW
 h83wsVN2sb92A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fcpLa7pk
Subject: Re: [Buildroot] [PATCH 3/4] package/pkgconf: disable ccache for
 host package
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-01-06 18:04 -0700, James Hilliard spake thusly:
> We need to disable ccache when building host-pkgconf as the upcoming
> ccache update depends on host-pkgconf indirectly due to host-cmake
> depending on host-pkgconf which will be required due to host-ccache
> migrating from autotools to cmake package infrastructure.

I've added a note about having to take care of propagating the no-cache
build doen to the autotools-related packages if pkgconf ever needs
_AUTORECONF=YES

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkgconf/pkgconf.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
> index 5d65f69c10..e9587fae6b 100644
> --- a/package/pkgconf/pkgconf.mk
> +++ b/package/pkgconf/pkgconf.mk
> @@ -11,6 +11,11 @@ PKGCONF_LICENSE = pkgconf license
>  PKGCONF_LICENSE_FILES = COPYING
>  PKGCONF_CPE_ID_VENDOR = pkgconf
>  
> +# We are a ccache dependency, so we can't use ccache
> +HOST_PKGCONF_CONF_ENV = \
> +	CC="$(HOSTCC_NOCCACHE)" \
> +	CXX="$(HOSTCXX_NOCCACHE)"
> +
>  PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/pkg-config
>  
>  define PKGCONF_LINK_PKGCONFIG
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
