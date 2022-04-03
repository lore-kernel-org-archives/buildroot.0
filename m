Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32939C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 20:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2D4D401AF;
	Sun,  3 Apr 2022 20:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMQgwgJkR5HM; Sun,  3 Apr 2022 20:25:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB7C8405D4;
	Sun,  3 Apr 2022 20:25:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4F791BF31F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B254B415F1
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-9_DQzHU1sX for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 20:25:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BF39415CD
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 20:25:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:314c:79b0:cf44:9021])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 68BE813F84C;
 Sun,  3 Apr 2022 22:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649017517;
 bh=VlrxxDUB9N8fg9wQPVGiKmFzyEM5Onrs2f7npQsSLS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QbJle6hAUUUwqgrg0i9HOp91QIvs3H8ZEc4SpiKfudskDi0OPOe2K1QAYgt4QopsM
 ng4XzVXe0tgIvcNyjRlQoHs5qm0XiZDE0i7yeRNh0uJwBa7Idm+a2rP8S64SegmfXP
 3xL4ETLlhSyJxGzC6nc+K9qrd1agpkzHVq08k56XlrHf5aISwv3R4qRa1HZqkrltZn
 mTNtndKPsRFiSgBF3BHFYCJAtSpg2/zoVlUpor1GdHBSFoAmhSobQ3az+ukFsfUIHQ
 5y31Vu6SY1ewIY41B8mPEn/j4/Ipbzu5fPQbEv+mjwCvTyIzuU61NZDhSpQdp/tEH3
 RJHSUJaJdxLcw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 22:25:15 +0200
Date: Sun, 3 Apr 2022 22:25:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220403202515.GC2354230@scaer>
References: <20220403183503.736373-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403183503.736373-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/minizip: bump to version 3.0.5
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

On 2022-04-03 20:35 +0200, Fabrice Fontaine spake thusly:
> This bump will fix the following build failure with zlib-ng thanks to
> https://github.com/zlib-ng/minizip-ng/commit/9184ba1216589077803b3e4e85f2b226f861ab2d:
> 
> /home/autobuild/autobuild/instance-10/output-1/build/minizip-3.0.4/mz_crypt.c:19:14: fatal error: zlib-ng.h: No such file or directory
>    19 | #    include "zlib-ng.h"
>       |              ^~~~~~~~~~~
> 
> https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.5
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/530fee780557941356dcd6aabb8cc9eb048574f3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/minizip/minizip.hash | 2 +-
>  package/minizip/minizip.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
> index 3e87e64dae..e73637670c 100644
> --- a/package/minizip/minizip.hash
> +++ b/package/minizip/minizip.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  2ab219f651901a337a7d3c268128711b80330a99ea36bdc528c76b591a624c3c  minizip-3.0.4.tar.gz
> +sha256  1a248c378fdf4ef6c517024bb65577603d5146cffaebe81900bec9c0a5035d4d  minizip-3.0.5.tar.gz
>  sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
> diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
> index 07f67c1354..b9259f0c54 100644
> --- a/package/minizip/minizip.mk
> +++ b/package/minizip/minizip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MINIZIP_VERSION = 3.0.4
> +MINIZIP_VERSION = 3.0.5
>  MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
>  MINIZIP_DEPENDENCIES = host-pkgconf
>  MINIZIP_INSTALL_STAGING = YES
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
