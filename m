Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D23C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 18:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E185981775;
	Mon, 27 Nov 2023 18:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E185981775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZGUqdqRHCCC; Mon, 27 Nov 2023 18:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1243F817A1;
	Mon, 27 Nov 2023 18:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1243F817A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C27F1BF348
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 809EA40612
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 809EA40612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLHvM0MGy11g for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 18:21:42 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FEE1405FD
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 18:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FEE1405FD
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 12AD7B004FF;
 Mon, 27 Nov 2023 19:21:38 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 19:21:37 +0100
Date: Mon, 27 Nov 2023 19:21:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20231127182137.GX3177259@scaer>
References: <20231127133806.848789-3-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127133806.848789-3-bagasdotme@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701109300;
 bh=Ytvr++zCCkRIUIXE7fnWFpyl5zAK89pXAB38kvW8uiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rwC7dPIOhs3jemWwb7+Eb3lnASoaoSvTNix4Z6BEzFsoquhTWghPc+zZo7dj1eqLU
 KuheDLnzoXPjHOdD/NOTFFP2cPHEkCLF1HmHdch7Ofq0P4M2vhUwzjH/zAQJV2Qb+V
 BQso6lILnuF/xL9gb21CSZeShNU0NjK/SWKeHSMLdCGwr0YCklPpalXF0hjvillNeS
 ehPGO+W0i8NrY90krc3zcUOHDC7B+S0wBUf6biP7DmiK/+ymDKtJMnY40GjC/kezJQ
 jGO4U1lU4kVffAqIqxT00ZazzZTFYKhMl63Bt0ZWdKP53AWu/pGRgWJpZqvK1FFlTj
 vJi6y185ehJ0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rwC7dPIO
Subject: Re: [Buildroot] [PATCH v2] package/git: bump to version 2.43.0
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
Cc: Buildroot Development <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

agas, All,

On 2023-11-27 20:38 +0700, Bagas Sanjaya spake thusly:
> Bump the package version to 2.43.0. For the full changelog, see the
> release announcement at [1].
> 
> Link: https://lore.kernel.org/git/xmqqzfz8l5or.fsf@gitster.g/ [1]
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes since v1 [1]:
> 
>   * Fix up patch subject prefix (add missing colon separator)
> 
>  [1]: https://lore.kernel.org/buildroot/20231127133043.847846-2-bagasdotme@gmail.com/
> 
>  package/git/git.hash | 2 +-
>  package/git/git.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/git/git.hash b/package/git/git.hash
> index f3f5915c8d..9cf044cc07 100644
> --- a/package/git/git.hash
> +++ b/package/git/git.hash
> @@ -1,5 +1,5 @@
>  # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
> -sha256  8e46fa96bf35a65625d85fde50391e39bc0620d1bb39afb70b96c4a237a1a4f7  git-2.42.1.tar.xz
> +sha256  5446603e73d911781d259e565750dcd277a42836c8e392cac91cf137aa9b76ec  git-2.43.0.tar.xz
>  # Locally calculated
>  sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
>  sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
> diff --git a/package/git/git.mk b/package/git/git.mk
> index cb49986c43..1502968186 100644
> --- a/package/git/git.mk
> +++ b/package/git/git.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GIT_VERSION = 2.42.1
> +GIT_VERSION = 2.43.0
>  GIT_SOURCE = git-$(GIT_VERSION).tar.xz
>  GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
>  GIT_LICENSE = GPL-2.0, LGPL-2.1+
> 
> base-commit: 4d549c071dcc7ede701ee91cb39bc4a9a2be7baf
> -- 
> An old man doll... just what I always wanted! - Clara
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
