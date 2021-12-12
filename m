Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188DEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 16:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B34DC40281;
	Sun, 12 Dec 2021 16:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRD0xLvakjbS; Sun, 12 Dec 2021 16:06:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C40E2401C5;
	Sun, 12 Dec 2021 16:06:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5ECCB1BF331
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 16:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B65F84EF6
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 16:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FR58-LfpN1fE for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 16:06:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 689BD84EF0
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 16:06:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccde:e15f:6f40:89e5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8C8F32003F7;
 Sun, 12 Dec 2021 17:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639325160;
 bh=olsS66xp2At1k95YKU3ffOQ8C6jmQUBZoQpzV3TWaBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vKf2IAAKbzYpj4xD0SbG0aLJ1CIBMWBfRVG88RL/2QLvEfqXbUEei/CBACXYu99Ae
 WK9zUgKFJd8rkcPNDrY7CQzR7lgOnz8gQBulzQgs+F1zDqGuEAA9rOehfcRZNgXwE4
 iVt7W05FMvrI7k3GLnwi0IJkeT10xiwMPYL1DXyouoXjGeBUL195I4EKSlyep62uos
 ujWxqCN912RO3V+/vl/Y2DbrrkkAhMAotUQ3blst6jWJwlkvoDu0C/Ye2fcFsuJ3+u
 wp9jQoLuXtCXGXXkfYSZtN3+KOWb18fMvhcjWTi+E33kC2RIZCQC3HapO0uvrxMili
 0njO8+bmn4REQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Dec 2021 17:05:56 +0100
Date: Sun, 12 Dec 2021 17:05:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211212160556.GA2603@scaer>
References: <20211210142756.16854-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210142756.16854-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/assimp: bump version to 5.1.3
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

On 2021-12-10 15:27 +0100, Peter Seiderer spake thusly:
> For details see [1], [2] and [3].
> 
> [1] https://github.com/assimp/assimp/releases/tag/v5.1.1
> [2] https://github.com/assimp/assimp/releases/tag/v5.1.2
> [3] https://github.com/assimp/assimp/releases/tag/v5.1.3
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/assimp/assimp.hash | 2 +-
>  package/assimp/assimp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
> index c61bf88b29..2f4a308c3d 100644
> --- a/package/assimp/assimp.hash
> +++ b/package/assimp/assimp.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  b96f609bca45cc4747bf8ea4b696816ada484aed2812e60ea4d16aae18360b0b  assimp-5.1.0.tar.gz
> +sha256  50a7bd2c8009945e1833c591d16f4f7c491a3c6190f69d9d007167aadb175c35  assimp-5.1.3.tar.gz
>  sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
> diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
> index 919f7a0a8c..90a617e0c6 100644
> --- a/package/assimp/assimp.mk
> +++ b/package/assimp/assimp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ASSIMP_VERSION = 5.1.0
> +ASSIMP_VERSION = 5.1.3
>  ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
>  ASSIMP_LICENSE = BSD-3-Clause
>  ASSIMP_LICENSE_FILES = LICENSE
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
