Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47620C5ACB3
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 14:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0779404A1;
	Sat, 18 Nov 2023 14:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0779404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-tPa-AU4NLY; Sat, 18 Nov 2023 14:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7E1B40482;
	Sat, 18 Nov 2023 14:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7E1B40482
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A75061BF593
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80BE040519
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80BE040519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jrLfiWRE3ze7 for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 14:38:26 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8134F40471
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8134F40471
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BA1CD780333;
 Sat, 18 Nov 2023 15:38:21 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 15:38:21 +0100
Date: Sat, 18 Nov 2023 15:38:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20231118143821.GB996011@scaer>
References: <20231113205350.922873-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231113205350.922873-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700318303;
 bh=SIx5epoqfRXB+Js9/Pp2wn1gnuo8Ss3r2iE7w/orAQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sjYMbCFo/kdMju17T75Pij0kiztjMbz5TlwEwZ9/1S8cwF95cJuGcc9uXcLqBhq+M
 gROn6VEv6VuxoTbYmkFDE6OC48uMgD1LtJmu8tf+As6VGioK8SQMvLqftcxHZStBJo
 +nkRj1WrXGz2sF/4Gu6W8PkkYszOOXUBtFRQTYW/jiabIqzLvJZ/6Wfy6f0YE5ZjxA
 sS0kfQxJTPOGg3GPB9mDwMGJjEpwtrW6MqyKNDfGG58tTmlcZ1QYS4wLhUtnyc7/iu
 I/hxR57q2T7W9NbbY1YBtETkB7KxAUrTdW2D9V0vw6oSNC42vRCPyARiUSYEQk4TfA
 +v+dBzDvW0p7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sjYMbCFo
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: bump package to version
 8.4.0
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

Julien, All,

On 2023-11-13 21:53 +0100, Julien Olivain spake thusly:
> See release note:
> https://octave.org/news/release/2023/11/05/octave-8.4.0-released.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch tested on branch master at commit 3b65462, with commands:
> 
>     utils/docker-run make check-package
>     ...
>     0 warnings generated
> 
>     utils/test-pkg -p octave
>     ...
>     6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
>     support/testing/run-tests \
>         -d dl \
>         -o output_folder \
>         tests.package.test_octave
>     ...
>     OK
> ---
>  package/octave/octave.hash | 4 ++--
>  package/octave/octave.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/octave/octave.hash b/package/octave/octave.hash
> index a655f82849..20ee4ddb64 100644
> --- a/package/octave/octave.hash
> +++ b/package/octave/octave.hash
> @@ -1,5 +1,5 @@
>  # Locally computed after checking signature
> -# https://ftp.gnu.org/gnu/octave/octave-8.3.0.tar.lz.sig
> +# https://ftp.gnu.org/gnu/octave/octave-8.4.0.tar.lz.sig
>  # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
> -sha256  4dbd5da711b20ce640d75471895172b60e0bb9f45b75a0daa5ddf3050488d639  octave-8.3.0.tar.lz
> +sha256  d5a7e89928528dce8cab7eead700be8a8319a98ec5334cc2ce83d29ac60264c1  octave-8.4.0.tar.lz
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/octave/octave.mk b/package/octave/octave.mk
> index 86f5564c02..cae0de7620 100644
> --- a/package/octave/octave.mk
> +++ b/package/octave/octave.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OCTAVE_VERSION = 8.3.0
> +OCTAVE_VERSION = 8.4.0
>  OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
>  OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
>  OCTAVE_LICENSE = GPL-3.0+
> -- 
> 2.41.0
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
