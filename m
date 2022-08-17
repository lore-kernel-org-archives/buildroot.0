Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FAAC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 18:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A414541935;
	Wed, 17 Aug 2022 18:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A414541935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ml7h5D9I2k3N; Wed, 17 Aug 2022 18:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FDF041928;
	Wed, 17 Aug 2022 18:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FDF041928
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6D281BF36F
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 18:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8119B60A7D
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 18:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8119B60A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMXtiDb1OvDL for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 18:46:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDB0360737
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDB0360737
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 18:46:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1014:5f7:51e1:dc98])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 82C282003C3;
 Wed, 17 Aug 2022 20:46:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 17 Aug 2022 20:46:21 +0200
Date: Wed, 17 Aug 2022 20:46:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220817184621.GR2854108@scaer>
References: <20220815202955.2216503-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815202955.2216503-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660761989;
 bh=hanoIi8uWiVPsMgZRD4DoWUhhL2tZaFo9rLIA5n//Ng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PAJ09dOIU0fnb4iHGG/fnNgPnTsf0amH8zhHMR4/KX4dSYEyDTArWNiMKC0fdVUH4
 FsrgV4zDqXUebPHcuzR8GkVMVU+fPPrug5xlTMV+hsa1mhKscW4ODnxCyC1XvR3xBi
 xkA18Ur/tKza1XW0qwoNXIGliy1UJhLGGummdheJjSOh5NsluidIfIZyG4yU6HmIvO
 RSVm8DOgLyfMa1d6TCAGVGypnb24yeIlKIO8FZb69dJYLnvOd/EZfsh+wClMoRc7Y+
 ZMMQ+ZcEsvqG5Lk0EzBMiQ6i/Khl+j+jzEtlc0k+/UUv5xt+9yHDhD1Q30jYF1fvWi
 wQMoYDCLiCKOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PAJ09dOI
Subject: Re: [Buildroot] [PATCH next] toolchain/toolchain-buildroot: default
 to glibc as the C library
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
Cc: Buildroot List <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-15 22:29 +0200, Thomas Petazzoni spake thusly:
> This is perhaps the most controversial change for Buildroot that can
> be written in a two-liner.
> 
> Historically, we have used uClibc as our default C library, as
> Buildroot was created initially as a test-bed for uClibc, and also
> because uClibc made a lot of sense for embedded Linux systems, due to
> its smaller size and fine-grained configurability.
> 
> Since then, the landscape of embedded Linux systems has changed. Even
> though Buildroot happily supports really low-end devices, the vast
> majority of Buildroot users are quite certainly running the resulting
> system on a reasonably powerful platform, with significant amount of
> RAM and storage. In this context, the benefits of uClibc are no longer
> that much relevant, and glibc causes less "troubles". Therefore, this
> patch proposes to use glibc as our default C library when using the
> internal toolchain backend instead of uClibc.
> 
> Of course, we will keep the support for uClibc, which remains an
> important C library choice, for space-constrained systems, or simply
> for architectures that are not supported by glibc.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-buildroot/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 836af3b22a..9956dc4383 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -22,8 +22,7 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
>  
>  choice
>  	prompt "C library"
> -	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> -	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64
> +	default BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  
>  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  	bool "uClibc-ng"
> -- 
> 2.37.2
> 

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
