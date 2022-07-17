Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24179C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 14:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F2EE840C1;
	Sun, 17 Jul 2022 14:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F2EE840C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qbfSEBINNtu; Sun, 17 Jul 2022 14:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACFE483ED3;
	Sun, 17 Jul 2022 14:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACFE483ED3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 244DB1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 14:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CAD840A5C
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 14:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CAD840A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grTZ0P8RwDju for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 14:00:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B301400DD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B301400DD
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 14:00:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 727D278051E;
 Sun, 17 Jul 2022 16:00:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 16:00:05 +0200
Date: Sun, 17 Jul 2022 16:00:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717140005.GR2249625@scaer>
References: <20220712162923.1583408-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220712162923.1583408-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658066407;
 bh=gUMNFJKcsPIkLNP02VhNNsMo35EQrtK1oURFDpViAFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J/uEbWPk8b5Q3rc6dFA96u23QCHNtso+pT+bh8P7/PhpY5fkldw+Tmx5T+Skr+SNZ
 y7THmikRoB4hEa1QHGhJ66DbTtJ+NnkWV75ue+BxSDfl6IT7WobQxJmFBWuNYcG/WA
 DulsR+vP04sA5nVxy6PezG5ZmErPDhbbQEh+DS1nP3o4pUaNZfSAxBLbWiKHopZviB
 JVrGNpgqOLi2jZOxwlJ3DTOKpXFcuiFrXsRXcBCEwiJtb/IHvYDz1I1JkWfdabOAiO
 lkpoD+/IjtRCDn58qEa5ZNfoBFML0R/dmRWPrk+X9b6InF5pL855w3zsteo61kbja/
 XTcHtH1p+PKfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J/uEbWPk
Subject: Re: [Buildroot] [PATCH 1/1] package/tcpreplay: select musl-fts if
 needed
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

On 2022-07-12 18:29 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since commit
> 4138151e447e69771e2579ea5a3daa89c56d41a8:
> 
> Makefile:576: *** musl-fts is in the dependency chain of tcpreplay that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/629aabd00cebcad980bf707a70642a67ad4472ca
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tcpreplay/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
> index 5e36452cf4..9e5509114e 100644
> --- a/package/tcpreplay/Config.in
> +++ b/package/tcpreplay/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_TCPREPLAY
>  	bool "tcpreplay"
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_LIBPCAP
> +	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Tcpreplay is a tool for replaying network traffic from files
>  	  saved with tcpdump or other tools which write pcap(3) files.
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
