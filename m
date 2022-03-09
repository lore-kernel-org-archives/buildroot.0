Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A20C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 20:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51F2B60FAC;
	Wed,  9 Mar 2022 20:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZ_xmPxjE2J9; Wed,  9 Mar 2022 20:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B8B60FA6;
	Wed,  9 Mar 2022 20:49:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C1DF1BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49B8340541
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QCOzbeD09mkS for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 20:49:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51E8B40142
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 20:49:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:959:4871:d6cd:4ee3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2208913F84C;
 Wed,  9 Mar 2022 21:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646858948;
 bh=CgpxpjC8PfrXKJLtTgiBAsAMhi+XPkfhVujvGTXgLcE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aFJ9h7S9ECIACxMRTPfRyJfp+a7kWgfPr5+mXni4yN/puSo1mtK6/56aGy2JVA7Dv
 JEWvj+NKOXuHzuPI+zrANRUMNl4g8N3JKK85cn8Qhvvr1Rbb2GhREEwxz80+1ZB1VF
 IIvKC9uGwdJ4+DlGaCIe7yMb8+Zox3qRKTwju92Ss5dgMjot4A72+dvb8gMcbPMkx+
 jx/nDPc0PyiuatvjIUFQEWcfQIrZpYvml1HNQ8NFk9SAPg7tikGh3CtRuYWF+PDtHB
 6Kh/hZvklbUFS3TS18uC5UMKl4j2gJaGV9Gxq0kROWdt/VLrS2q9IhenlEq4jzN8Qc
 i/nYc1+lKEZLw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Mar 2022 21:49:05 +0100
Date: Wed, 9 Mar 2022 21:49:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220309204905.GD23050@scaer>
References: <20220309173710.527496-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309173710.527496-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: fix CPE ID
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

On 2022-03-09 18:37 +0100, Fabrice Fontaine spake thusly:
> samba:ppp, added by commit 63332c33aa0771532807fd2684d4eee4eb952435, has
> been deprecated in February 2020:
> 
> <cpe-item name="cpe:/a:samba:ppp:2.4.7" deprecated="true" deprecation_date="2020-02-24T15:55:39.787Z">
>     <cpe-23:cpe23-item name="cpe:2.3:a:samba:ppp:2.4.7:*:*:*:*:*:*:*">
> 
> cpe:2.3:a:point-to-point_protocol_project:point-to-point_protocol is the
> correct CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apoint-to-point_protocol_project%3Apoint-to-point_protocol
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pppd/pppd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
> index 19b6f3ccce..d9d6244f10 100644
> --- a/package/pppd/pppd.mk
> +++ b/package/pppd/pppd.mk
> @@ -10,8 +10,8 @@ PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
>  PPPD_LICENSE_FILES = \
>  	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
>  	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
> -PPPD_CPE_ID_VENDOR = samba
> -PPPD_CPE_ID_PRODUCT = ppp
> +PPPD_CPE_ID_VENDOR = point-to-point_protocol_project
> +PPPD_CPE_ID_PRODUCT = point-to-point_protocol
>  PPPD_SELINUX_MODULES = ppp
>  
>  PPPD_MAKE_OPTS = HAVE_INET6=y
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
