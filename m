Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A193BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 21:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41C808140E;
	Sat,  1 Jan 2022 21:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZAw0TUm7OE1; Sat,  1 Jan 2022 21:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9254381400;
	Sat,  1 Jan 2022 21:56:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76C9C1BF376
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 660FC40240
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAuRFGmQWyFx for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 21:56:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9033C40235
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 21:56:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4fc:e29e:bbe2:a373])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 529972003CE;
 Sat,  1 Jan 2022 22:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641074162;
 bh=tH0OniWtsWpDEdnlF15fWXV9k/zLGYWkrKjwxoC6l8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j3NCUtx6Y6AtNQp4oOWQokJjvfmDuQZ78/Qv2cZMflnahs5v3pYcltIMeWUkQl6k0
 hpfqBKhNg0h17WXrzNKJREcwIAJzXSJVeUbVTfZvNdt5glODwS0I774U0Fsok/RGpV
 AWR6doqX1ckZQRWbbahxjA22inYZsfz55QBNnJ4SwnjNmgFtj1wLLPzwCzJ4kuBR8Y
 vFioq4Zqe377eHLRkkZ/cmIu4ZQWKN25VygZwP/bEZk0Umv3IINUHKxfkDIrRqjUQ9
 V+jxmiqrw7VT9+lQGB1oIbY+VFEe+D6aUlTOfOkd2BcUdQWTq1oMiojcTgc4t5P7KG
 Z3Z/R0x3bs8cg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 22:55:56 +0100
Date: Sat, 1 Jan 2022 22:55:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220101215555.GD69135@scaer>
References: <20211218232238.667138-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218232238.667138-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenaptx: use official
 tarball
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
Cc: Yunhao Tian <t123yh.xyz@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-19 00:22 +0100, Fabrice Fontaine spake thusly:
> Use official tarball and while at it use 2 spaces and reorder files in
> libopenaptx.hash

As explained in my review,i and despite my previous suggestion for this
change, this would clash with the archive that is now on s.b.o, or with
those people already have localy.

So, I've marked this as rejected.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libopenaptx/libopenaptx.hash | 4 ++--
>  package/libopenaptx/libopenaptx.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenaptx/libopenaptx.hash b/package/libopenaptx/libopenaptx.hash
> index 76b4e66c9b..acaec5d642 100644
> --- a/package/libopenaptx/libopenaptx.hash
> +++ b/package/libopenaptx/libopenaptx.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated:
> -sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
> -sha256 a19b3b642def6f86441b73dd4efda6e6f13d49e7e2d6e5e91cc7eb464ebb505a libopenaptx-0.2.1.tar.gz
> +sha256  f13eac1ebfe31a563943cd47819eece1109960e10a1e85c111975bcfd37d5361  libopenaptx-0.2.1.tar.gz
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/libopenaptx/libopenaptx.mk b/package/libopenaptx/libopenaptx.mk
> index c2f5fa2390..12c33f6225 100644
> --- a/package/libopenaptx/libopenaptx.mk
> +++ b/package/libopenaptx/libopenaptx.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBOPENAPTX_VERSION = 0.2.1
> -LIBOPENAPTX_SITE = $(call github,pali,libopenaptx,$(LIBOPENAPTX_VERSION))
> +LIBOPENAPTX_SITE = https://github.com/pali/libopenaptx/releases/download/$(LIBOPENAPTX_VERSION)
>  LIBOPENAPTX_LICENSE = GPL-3.0+
>  LIBOPENAPTX_LICENSE_FILES = COPYING
>  LIBOPENAPTX_INSTALL_STAGING = YES
> -- 
> 2.33.0
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
