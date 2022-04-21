Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BA5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55F516FE0F;
	Thu, 21 Apr 2022 19:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRqtcsFlf4vB; Thu, 21 Apr 2022 19:32:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AE9C6F5FB;
	Thu, 21 Apr 2022 19:32:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 160961BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 037BC40998
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-NWt-o1svmk for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:32:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF4654032E
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:32:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7d82:8745:111f:47d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A8D845FFB6;
 Thu, 21 Apr 2022 21:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650569547;
 bh=kKULsdxUdKdGOeOJPEmoCOUp1twgK8YQVEO1+Mx+IxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PPCF0uYp90FmXq4n36/PKDNoQMt4lSQTgjMebszeLDljrU1Q9c2Y6T5aI9PbnRWYB
 kzAcVeSrkKt/JHXmUoLnM5/keMmoc+FEsSxCW1WUYGX9SVSReUgnzJC52ScZ4I0bIu
 HPnJzxEDDPYPVl+TXfaKcklZus2KEGgosKzcKMr3LX6s42HmhVO2NdAu8ven9amt5q
 tRvTz4ztZLfQ8VQr9+zGybq0nIpJMOTTIC22RkbUzBnxfNBdi4hgii6Bmm8XyqPCqU
 IOWQ6T0fpEq+lI2q+dhuaPBLFQWPpuNHFZsA7reA/qd0Wog9RRIPFHUzmq0TadMfLs
 w0vASRsne6y2A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 21 Apr 2022 21:32:22 +0200
Date: Thu, 21 Apr 2022 21:32:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220421193222.GP2730@scaer>
References: <20220419161130.3431492-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419161130.3431492-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: untar internal bind
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Jan Havran <havran.jan@email.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-04-19 18:11 +0200, Fabrice Fontaine spake thusly:
> Untar internal bind so libtool patches will be applied on bind's
> libtool. This will fix:
>  - installation of some libraries such as libisccfg. Indeed, if libtool
>    is not patched those libraries will be "relinked" and so not
>    installed.
>  - build failures with riscv and or1k:
> 
>   Invalid configuration `riscv64-buildroot-linux-musl': machine `riscv64-buildroot' not recognized
> 
>   Invalid configuration `or1k-buildroot-linux-uclibc': machine `or1k-buildroot' not recognized

dhcp, the package that keeps on giving...

Jan, Eugen, what keeps you from switching away from dhcp?

> Fixes:
>  - http://autobuild.buildroot.org/results/d25b76e628ffe5293c6bc1fd467a6b8966cb1bc2
>  - http://autobuild.buildroot.org/results/ba3258d8df00a7626784189125f0202fb161c40e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dhcp/dhcp.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index e6f4c419f4..f815c6c802 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -14,6 +14,13 @@ DHCP_CPE_ID_VENDOR = isc
>  # internal bind does not support parallel builds.
>  DHCP_MAKE = $(MAKE1)
>  
> +# untar internal bind so libtool patches will be applied on bind's libtool
> +define DHCP_UNTAR_INTERNAL_BIND
> +	$(TAR) xf $(@D)/bind/bind.tar.gz -C $(@D)/bind/
> +endef
> +
> +DHCP_POST_EXTRACT_HOOKS = DHCP_UNTAR_INTERNAL_BIND
> +
>  # use libtool-enabled configure.ac
>  define DHCP_LIBTOOL_AUTORECONF
>  	cp $(@D)/configure.ac+lt $(@D)/configure.ac
> -- 
> 2.35.1
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
