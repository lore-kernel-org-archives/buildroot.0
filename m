Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EB6C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E58960BB0;
	Sun, 13 Nov 2022 14:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E58960BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeCA9EuA_f5I; Sun, 13 Nov 2022 14:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52E11607F6;
	Sun, 13 Nov 2022 14:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52E11607F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 054531BF267
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E16DE404A1
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E16DE404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPUQ19qgP22P for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:59:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BA544048F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BA544048F
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:59:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f76c:17ea:8df1:99cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7DF2413F88E;
 Sun, 13 Nov 2022 15:59:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Nov 2022 15:59:45 +0100
Date: Sun, 13 Nov 2022 15:59:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221113145945.GH2123054@scaer>
References: <20221112212034.5472-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221112212034.5472-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668351588;
 bh=PVzet3QduQRnjCLXk/jTuYLfL2cAGTncrOxnj+7nI3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tdO6DdJU/UNWv/EaD0cuRtsEN62cKz0u1zvf1125oULEPd8twZeUT6wbneqpL0zeH
 ybilBs0NBDOQCwcWcUYQeSf3rHN/AkMSibEU3s28OfbKQM1XHf/rq0QY32ZBB+Itxe
 yMQwSurea8hvZ/aBbvphuITpmInuU8hnAcZUJ2ONhmmZZa+8SclIhXuXp/AGL7NsLj
 2rDBIX8VyWXUqmm1yhm7UKLY0gHeaxD6hzv3RbWq0CtXmea7d1FEluzA8DfR0PFAdO
 mITuXHNteyVYNygp19VFzKfMHkF12f1MhsXEWMWgtXa0m7QyZHw0LRMd9H9Fmd3A6V
 aIjims8pmjOEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tdO6DdJU
Subject: Re: [Buildroot] [PATCH 1/1] package/mdio-tools: needs fork
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
Cc: Robert Marko <robimarko@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-11-12 22:20 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the package
> in commit 8fdf8731e727dc5c2d4080d7a56e1d71dc25e533:
> 
> mdio.c: In function 'mdio_modprobe':
> mdio.c:738:15: error: implicit declaration of function 'fork' [-Werror=implicit-function-declaration]
>   738 |         pid = fork();
>       |               ^~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c53aaeaa34dd4d6d9a57da196687beecaeed9fe2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mdio-tools/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
> index f24c1a6974..237f4454cc 100644
> --- a/package/mdio-tools/Config.in
> +++ b/package/mdio-tools/Config.in
> @@ -1,12 +1,15 @@
>  comment "mdio-tools needs a Linux kernel to be built"
> +	depends on BR2_USE_MMU
>  	depends on !BR2_LINUX_KERNEL
>  
>  comment "mdio-tools needs a toolchain w/ headers >= 5.1"
> +	depends on BR2_USE_MMU
>  	depends on BR2_LINUX_KERNEL
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
>  
>  config BR2_PACKAGE_MDIO_TOOLS
>  	bool "mdio-tools"
> +	depends on BR2_USE_MMU # fork()
>  	depends on BR2_LINUX_KERNEL
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
>  	select BR2_PACKAGE_LIBMNL
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
