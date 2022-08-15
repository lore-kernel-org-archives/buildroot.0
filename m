Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00B2C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66AD482425;
	Mon, 15 Aug 2022 09:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66AD482425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HCwq8syW89ma; Mon, 15 Aug 2022 09:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E5778246F;
	Mon, 15 Aug 2022 09:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E5778246F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD9261BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1994408D0
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1994408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MK0qOFBv_vLe for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:42:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6586440120
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6586440120
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:42:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 58A596012C;
 Mon, 15 Aug 2022 11:41:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 11:41:56 +0200
Date: Mon, 15 Aug 2022 11:41:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815094156.GR2854108@scaer>
References: <20220814182734.2878423-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814182734.2878423-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660556519;
 bh=jsy4XIHK6EaAv/+bRhYePHC92ASwFLEhMzdu+4aMfOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q0fPnKS3ppN9pyrYn+tLYrdg8NCNNKW5Slms5ivobvMOW769SEFRQDzCvJvveISfy
 9ySvbeKKttuoDmtoZSiSvlgXBu8+gY9k52UDB7XWNJ2XPmcwZBvor+9RCFU7zo4nVr
 OX3UIOEPCe+V77M2JHQdLRC+zrG2c4e+TwB3PFSON2S+CHNQGXi5dSUpWAq5rlmPwH
 L++ZP7ShZSiPjjNoYTGRCiD0NerdG6TRSnmS0geS+KTQiL+0RJF7WDpc56S6VJ9tgH
 Lgmb6jrM7ydbcqsDJp1SJZi+rzfjbFBz8mKBi4TPANBVTkeuhiyUmfvzgdXJmIiZjC
 R+t+0ELjCroKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q0fPnKS3
Subject: Re: [Buildroot] [PATCH v3,
 1/2] Revert "package/libvirtd: fix recursive dependency in Kconfig"
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-14 20:27 +0200, Fabrice Fontaine spake thusly:
> This reverts commit f81242ae4fb64ab85af5d38e70246222276552ae to avoid
> the following build failure:
> 
> Makefile:575: *** libbsd is in the dependency chain of netcat-openbsd that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/aada1d92df6cab0d01e27431b7b7483e3d165e79
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Always mandate C++ instead of glibc
>  
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Fix patch (rebase on top of current master)
> 
>  package/libvirt/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> index 5a6b067a0d..afd2372d0e 100644
> --- a/package/libvirt/Config.in
> +++ b/package/libvirt/Config.in
> @@ -38,13 +38,15 @@ if BR2_PACKAGE_LIBVIRT
>  config BR2_PACKAGE_LIBVIRT_DAEMON
>  	bool "libvirtd"
>  	default y
> +	depends on BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_NETCAT_OPENBSD # nmap
>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	select BR2_PACKAGE_DNSMASQ
>  	select BR2_PACKAGE_EBTABLES
>  	select BR2_PACKAGE_IPTABLES
>  	select BR2_PACKAGE_IPROUTE2
>  	# These are required because there is no way to unequivocally select a modern netcat
> -	select BR2_PACKAGE_NETCAT_OPENBSD if !BR2_PACKAGE_NMAP_NCAT
> +	select BR2_PACKAGE_NMAP      if !BR2_PACKAGE_NETCAT_OPENBSD
> +	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT_OPENBSD
>  	select BR2_PACKAGE_RADVD
>  	help
>  	  Build the libvirt daemon (libvirtd) otherwise build only the
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
