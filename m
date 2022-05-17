Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69318C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 05:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01ACF41961;
	Tue, 17 May 2022 05:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IVAQ2Cg8J-Sg; Tue, 17 May 2022 05:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C48C4192C;
	Tue, 17 May 2022 05:48:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD3EC1BF990
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 05:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC2238134A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 05:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eT4Kwu3DSG1Y for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 05:48:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE12681347
 for <buildroot@buildroot.org>; Tue, 17 May 2022 05:48:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5536:e9db:e000:2fa9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D5118B0053E;
 Tue, 17 May 2022 07:47:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652766479;
 bh=W/+BNLN8h4vqMIRErbaWIaNqz/VxoXNop4TmCqAqRS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i49IJTjQzwskR5g1P6KpZEDWfiWu9dFuUSbWMz1u0S413UO/MuyB8O0QjQZf+A9/f
 34zuxm0lQkKsRpAwMEJS/dD+OszQQk47S9I3YWE/kTKNbjolROtah/yCqmFYhfx1KP
 A05UkR4czdQtd0GuGvcZm7OU0CaNWnCpO+JsUXvdrGX/xSShLqUMyoSN0wHbDQz/Y1
 2vUrEGoD+vmXblR3kCTN7UobiUFuq03CnlziW6/XgiiciMb5TFfcDGmuU7y9WBYdLI
 kWrVz/IGjg3joFEJliDxsgt4BuOdWGeUxeJ3PW+P50KFzGgPbsK77auPmlyG4+kXFc
 aib6acDVcnCrQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 May 2022 07:47:54 +0200
Date: Tue, 17 May 2022 07:47:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220517054754.GO1597494@scaer>
References: <20220517020452.334921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517020452.334921-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: bump to version
 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-05-16 20:04 -0600, James Hilliard spake thusly:
> Fixes:
> Generating locale C.UTF-8
> [error] LC_MONETARY: value for field `mon_decimal_point' must not be an empty string
> [error] no output file produced because errors were issued
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/glibc/glibc.hash       | 2 +-
>  package/glibc/glibc.mk         | 2 +-
>  package/localedef/localedef.mk | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index f28c15c2a3..e0bbf341eb 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  0ca43b2a6cd74609519554303a16e350abdac0e66943c5d98d91228233c826a0  glibc-2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586.tar.gz
> +sha256  fc3c1d25640fd4cd09fbf7e17eafcc7943731e901cc0a3686503ae8adfb11d31  glibc-2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 5772c3355b..f3a08fbf24 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586
> +GLIBC_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
>  # sometimes the connection times out. So use an unofficial github mirror.
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index fb5edde0c2..061b7c7fc2 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION and SITE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586
> +LOCALEDEF_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
>  LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
>  HOST_LOCALEDEF_DL_SUBDIR = glibc
> -- 
> 2.25.1
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
