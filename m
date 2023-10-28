Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE825C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94EA44223B;
	Sat, 28 Oct 2023 19:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94EA44223B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pN2tdXV0Eomf; Sat, 28 Oct 2023 19:32:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD42420E5;
	Sat, 28 Oct 2023 19:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD42420E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ECB51BF3C6
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2382D405E3
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2382D405E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jwl8sU189JNo for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:32:23 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C433F404C4
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C433F404C4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 190EE2003A4;
 Sat, 28 Oct 2023 21:32:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Oct 2023 21:32:18 +0200
Date: Sat, 28 Oct 2023 21:32:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231028193218.GF2582@scaer>
References: <20231027122551.1856719-1-peter@korsgaard.com>
 <20231027122551.1856719-2-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027122551.1856719-2-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698521541;
 bh=34IA+lOhcpqgeOHiSMhrSaX3/mffNvnxxpZaWfZh9cg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gtii9nAitNtIBSge6scH9qunB2j44nLJhDwBqPVif8/bjv0/7S62zHcJIc4FtJpEn
 7nKVVTAkPFGVfTelC0J1DGsAkBmcOIrYGAvfEHLwvVzGuUk6+NXm8d3HXZR7nc5GxU
 WygsuAL9/CbAkYbXkV4FGeUGYTl+DBkBu/kqn+t3MFsQpJVgxhkKoPcXMLqNhqaq3c
 1OgvXwfrelFRxVUg7Fk6fxSZFXkOqCvF3+F97VyThnL9jcDcBdRgnaPRSYHtS7s5H0
 Tp2Q9eU7plGzr/v23x4Wuom6JAU1qXNw/RobJryFGMMtrDxRVL8ysgKczPBSV6nZMv
 LzLxO+KA7jPBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gtii9nAi
Subject: Re: [Buildroot] [PATCH 2/2] package/aufs-util: use HTTPS for
 git.code.sf.net
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

Peter, All,

On 2023-10-27 14:25 +0200, Peter Korsgaard spake thusly:
> git.code.sf.net is available over HTTPS, so use that for security and
> consistency with the other packages.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/aufs-util/aufs-util.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
> index d954f02958..32f3bca151 100644
> --- a/package/aufs-util/aufs-util.mk
> +++ b/package/aufs-util/aufs-util.mk
> @@ -6,7 +6,7 @@
>  
>  # linux-headers
>  AUFS_UTIL_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_UTIL_VERSION))
> -AUFS_UTIL_SITE = http://git.code.sf.net/p/aufs/aufs-util
> +AUFS_UTIL_SITE = https://git.code.sf.net/p/aufs/aufs-util
>  AUFS_UTIL_SITE_METHOD = git
>  AUFS_UTIL_LICENSE = GPL-2.0
>  AUFS_UTIL_LICENSE_FILES = COPYING
> -- 
> 2.30.2
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
