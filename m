Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A110BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 22:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 616B040529;
	Sat, 22 Jan 2022 22:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1alsMgjXB1mf; Sat, 22 Jan 2022 22:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78DB440871;
	Sat, 22 Jan 2022 22:36:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B83B21BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A010A40871
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgNvEe7Jq7iT for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 22:36:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 704CB40529
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 22:36:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DAE3EB00535;
 Sat, 22 Jan 2022 23:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642890970;
 bh=ju2g7zY+/Rx+0S1/vy32tLtdQ8rhTtnYpnECl5u8FfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iPkOr6rcDN60rC/apitDPQSNGMu2pdl5QrpVaNWloUNmzRpH3QV0LAuxyBFBsteyx
 G8LGgck2AfLENBMCC0LwNTpmjmPGTjXbGQdU6CjYm4Klw+EvywV1MFeP6Cov28kxyx
 1v8PEYCjLxu2XQ3aN932e5KLyFnHJV1PAJuMy6DLG230ISeAqscMv6tvIjmIzRCylo
 FyMFNrlS7lUFLiWwjVTmdeuNy/ngzqIG0QV/GPuaibdHrnh5dhkUTC/YqhSP9iF/pe
 II6+CnFkZQAcZlvh4cBRI/Rvt+OnzAEXO1tIqr6OexsQ92oDDDYue6HI3UOBrwHX/n
 LDgIuHvrKkoQw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 22 Jan 2022 23:36:07 +0100
Date: Sat, 22 Jan 2022 23:36:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220122223607.GK3621364@scaer>
References: <20220122221151.298957-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122221151.298957-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/ksmbd-tools: bump to version
 3.4.4
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

On 2022-01-22 23:11 +0100, Fabrice Fontaine spake thusly:
> This bump will fix build failure with libkrb5 raised since the addition
> of the package in commit 6be9913a7eeead7cdac804afc127791ba4b0e69e:
> 
> management/spnego.c:25:10: fatal error: spnego_mech.h: No such file or directory
>    25 | #include "spnego_mech.h"
>       |          ^~~~~~~~~~~~~~~
> 
> https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.4
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b4c3dba395327ab6ae28337efb962c99b2d5b922
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ksmbd-tools/ksmbd-tools.hash | 2 +-
>  package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
> index ad507bfdb2..d146f36a0e 100644
> --- a/package/ksmbd-tools/ksmbd-tools.hash
> +++ b/package/ksmbd-tools/ksmbd-tools.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  bd7218ebfeaa0d6a73c0a4beb9ea506228cd5695c1f8d3f9a9064e2346d52f0a  ksmbd-tools-3.4.3.tar.gz
> +sha256  f42aec21515e34305bc07e1ce2c4926c87ea7bc8a675ca6d0a453f6b6be34e2b  ksmbd-tools-3.4.4.tar.gz
>  sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
> diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
> index b3ffc3e768..b08845b581 100644
> --- a/package/ksmbd-tools/ksmbd-tools.mk
> +++ b/package/ksmbd-tools/ksmbd-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KSMBD_TOOLS_VERSION = 3.4.3
> +KSMBD_TOOLS_VERSION = 3.4.4
>  KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
>  KSMBD_TOOLS_LICENSE = GPL-2.0+
>  KSMBD_TOOLS_LICENSE_FILES = COPYING
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
