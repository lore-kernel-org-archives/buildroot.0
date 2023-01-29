Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C52C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 15:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A3BA81363;
	Sun, 29 Jan 2023 15:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A3BA81363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WWxfM6AjkvxZ; Sun, 29 Jan 2023 15:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3642081359;
	Sun, 29 Jan 2023 15:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3642081359
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE5EC1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 15:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 898F440573
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 15:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 898F440573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpg4tGZHSgAq for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 15:32:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A23540108
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A23540108
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 15:32:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A8BEE5FFA9;
 Sun, 29 Jan 2023 16:32:32 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 16:32:32 +0100
Date: Sun, 29 Jan 2023 16:32:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexander Egorenkov <egorenar-dev@posteo.net>
Message-ID: <20230129153232.GF2632@scaer>
References: <20230129121902.31214-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129121902.31214-1-egorenar-dev@posteo.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675006354;
 bh=9ZeN64ktpVLuxWh69Sgr4o5lq8zxuGJE+wr7Hkm13jc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LwjvcoUI86cIVnV1nIhdwik9780JAcZbpZWxZA3Km31TsmzQPFARMAjrBPZstyfbp
 dFt/cPtCAzIEwxNrpdcHYQ2o0MCnTdaEIzk86j2obtvbyymcvE0455T3awSmuEZqeS
 kGi/Rp/9uTAylXRzs9dh+xgh+QtKfwQeT50jLln7Yi+mrZow3wWxhHeEuM46OVZvOK
 p67TU5u29pwdQxpijhZYBMGR7cOiupihw6ucnBF4j8NVYpa0MhjLsNgDBvOaEfY/5e
 RDWxMacLOkP6DQ1LFD9BOJq8x8bIhyXYcnFxI7kAzsXhQhrhZvwshUATjvG3wBCUZs
 l7wd3xtvOvXyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LwjvcoUI
Subject: Re: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to
 version 0.9.4
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

Alexander, All,

On 2023-01-29 12:19 +0000, Alexander Egorenkov spake thusly:
> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/multipath-tools/multipath-tools.hash | 2 +-
>  package/multipath-tools/multipath-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
> index 6f893d37ce2e..3f01408c7684 100644
> --- a/package/multipath-tools/multipath-tools.hash
> +++ b/package/multipath-tools/multipath-tools.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  7d5af5d86e43b757e253d1ba244aa8a9c09bfbb1677a72accb799b1bfcc0a9ac  multipath-tools-0.9.3.tar.gz
> +sha256  6ed3cf6e786da20a451d9747cbd4c5817815388b8fc8022d1074b3018479031d  multipath-tools-0.9.4.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
> diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
> index d6abf68ca0de..90394fae9fde 100644
> --- a/package/multipath-tools/multipath-tools.mk
> +++ b/package/multipath-tools/multipath-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MULTIPATH_TOOLS_VERSION = 0.9.3
> +MULTIPATH_TOOLS_VERSION = 0.9.4
>  MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
>  
>  MULTIPATH_TOOLS_LICENSE = \
> -- 
> 2.39.1
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
