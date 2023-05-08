Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EF5C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7B04089E;
	Mon,  8 May 2023 20:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE7B04089E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Bd5HDVpz4_w; Mon,  8 May 2023 20:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F28408BB;
	Mon,  8 May 2023 20:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F28408BB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9001BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 739734089E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 739734089E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72_0Kn9SRpMI for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:23:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A8E6408C0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A8E6408C0
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:23:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89f6:f9b6:d1a9:3e6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2AC4D780368;
 Mon,  8 May 2023 22:23:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 22:23:26 +0200
Date: Mon, 8 May 2023 22:23:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Message-ID: <20230508202326.GO252090@scaer>
References: <20230428033137.620562-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428033137.620562-1-xiangyu.chen@eng.windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683577410;
 bh=vicDONHqP4qrTrBCoyYxlfJ9g0egSpg6KzdVEqvGKwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EwEC+0dh/30QwKxVC5GAXUJRUjltbK4vv6rkdmYsHJ+FLOnIYvrxgbEpI26el1yrf
 nM83BYvmINx6dobn6uHNBvblkJAvr11yXaFpU8lr/t6WoQhuzMVoLmzCpV4VVr+oIR
 9kEZ4yAwD2wwFwDz9lhuRuitfkCgdMJWZO8Baz1/0SGXuuRE9znv0BheneHSkuq9GW
 qKdvYE24uP7IbIOwDMQ4+vCuLcjthedbS4OI6JzZXIxUasA7m/v/ouC0Jsd2xLAfOJ
 AZU/pWSKkO4UjyuHHbte1ctNElLGjjuIaUYcDstQ1HEhuTXHZANyJYQBs7vVmVrxkR
 /lfP1txRx/7sw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EwEC+0dh
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to version 10.0.1
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
Cc: John Stile <johns@msli.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Xiangyu Chen, All,

On 2023-04-28 11:31 +0800, Xiangyu Chen spake thusly:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Using github as package site as announced here:
> https://roy.marples.name/downloads/dhcpcd/
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  package/dhcpcd/dhcpcd.hash | 4 ++--
>  package/dhcpcd/dhcpcd.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
> index 532fbd467e..879c3db1af 100644
> --- a/package/dhcpcd/dhcpcd.hash
> +++ b/package/dhcpcd/dhcpcd.hash
> @@ -1,4 +1,4 @@
> -# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-9.4.1.tar.xz.distinfo
> -sha256  819357634efed1ea5cf44ec01b24d3d3f8852fec8b4249925dcc5667c54e376c  dhcpcd-9.4.1.tar.xz
> +# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.1
> +sha256  6e9f6a5c47fcd8a763cfa26f1ca6eedf1e534992224a01d6c1ab8abb154af972  dhcpcd-10.0.1.tar.xz
>  # Locally calculated
>  sha256  4f21ce186859516dcab9b3197f3e9533a9bd1b87932015c87f539af4a48cd592  LICENSE

    $ make dhcpcd-legal-info
    >>> dhcpcd 10.0.1 Collecting legal info
    ERROR: LICENSE has wrong sha256 hash:
    ERROR: expected: 4f21ce186859516dcab9b3197f3e9533a9bd1b87932015c87f539af4a48cd592
    ERROR: got     : a7d6da3a202cdd38eaab0bcea4d25f60d002980f3785b3e896d9bf387f093ac8
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack
    make[1]: *** [package/dhcpcd/dhcpcd.mk:77: dhcpcd-legal-info] Error 1

This is because the copyright years have been updated in the license
file.

I've fixed that when applying, and extended the commit log accordingly.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
> index 922d289b26..82efe10ef9 100644
> --- a/package/dhcpcd/dhcpcd.mk
> +++ b/package/dhcpcd/dhcpcd.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -DHCPCD_VERSION = 9.4.1
> +DHCPCD_VERSION = 10.0.1
>  DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
> -DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
> +DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
>  DHCPCD_DEPENDENCIES = host-pkgconf
>  DHCPCD_LICENSE = BSD-2-Clause
>  DHCPCD_LICENSE_FILES = LICENSE
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
