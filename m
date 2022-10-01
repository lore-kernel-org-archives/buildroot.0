Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063D0C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 18:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FB3883183;
	Sat,  1 Oct 2022 18:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FB3883183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5Qe5iaY2ITJ; Sat,  1 Oct 2022 18:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB8D82FC9;
	Sat,  1 Oct 2022 18:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB8D82FC9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE64D1BF2E4
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 18:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6FC4400D0
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 18:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6FC4400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWRHXXr491kd for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 18:51:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF7D34023F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF7D34023F
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 18:51:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9BA64780346;
 Sat,  1 Oct 2022 20:51:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 20:51:47 +0200
Date: Sat, 1 Oct 2022 20:51:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Robert Marko <robimarko@gmail.com>
Message-ID: <20221001185147.GP30794@scaer>
References: <20220928192324.1279960-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220928192324.1279960-1-robimarko@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664650310;
 bh=JI4ciS5m+PoFYRXCd+Y1qfVHx6zWsLBG4q7ScUEWx9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aYYUYBuYJiv9Rckkrj+2g+tS8ySIXsrirp2dRlTgOPp+2CRCFFDUztWlDUq3CKBtr
 iuDVh88LHRqqywqloXajgmA2xF5osxgzoFmZXfu7ouefrwwfppvOXMZ9ll+HLx0NOq
 FMdSbiL1Ie1DFRyqkMR2R8G82HD260yF5DkVaEt2kNMCe+ucvt/zUizh8BymQrD3bl
 3w/aiGMz6J3Fh1D6YUAd159rTgsfifuP4YascJKT8E09BXxYy2e8gR56gNss/BcwQb
 yFppGCWA6TcH5+ImwadYtSmMofBdp4gi4d6Hg2HwVEgBxIfrLUv+6Dc+24thCyBcoc
 F2Mkj7cZ3N+CQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aYYUYBuY
Subject: Re: [Buildroot] [PATCH] package/mdio-tools: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Robert, All,

On 2022-09-28 21:23 +0200, Robert Marko spake thusly:
> mdio-tools are kernel module and accompanying tools for low-level
> debugging of devices attached on MDIO bus like PHY-s, switches etc.
> 
> Userspace tools provide C22 or C45 reads and writes, benchmarking
> and even dedicated Marvell Link Street tools via the included
> kernel module.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
> new file mode 100644
> index 0000000000..e4ea6f8224
> --- /dev/null
> +++ b/package/mdio-tools/mdio-tools.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# mdio-tools
> +#
> +################################################################################
> +
> +MDIO_TOOLS_VERSION = 1.2.0
> +MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
> +MDIO_TOOLS_LICENSE = GPL-2.0-only

We do not strictly follow the SPDX nomenclature (because we somewhat
predate it), so for consistency, this should be just 'GPL-2.0'.

> +MDIO_TOOLS_LICENSE_FILES = COPYING
> +MDIO_TOOLS_DEPENDENCIES = libmnl

mdio-tools uses pkg-config to look for libmnl, so you also need to add
host-pkgconf to the _DEPENDENCES.

> +MDIO_TOOLS_MODULE_SUBDIRS = kernel

I did not have a thorough look, but doesn't mdio-tools need some kernel
options to always be enabled? IF so, you can do so with:

    define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
        $(call KCONFIG_ENABLE_OPT,CONFIG_MDIO)
    endef

(given the package name, it should at least require that, I'd guess, but
adapt as needed.)

If there had been only the license and host-pkgconf issues, I'd have
fixed those when applying. But the kernel options are a bit more
involved, and requie someone who actually knows and uses mdio-tools, to
come up with the required options. Can you look into that, please?

Regards,
Yann E. MORIN.

> +$(eval $(kernel-module))
> +$(eval $(autotools-package))
> -- 
> 2.37.3
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
