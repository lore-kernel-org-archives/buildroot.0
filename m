Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30F7C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 18:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96E6D83DC7;
	Sat, 27 Jan 2024 18:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96E6D83DC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmPBW8HxETIx; Sat, 27 Jan 2024 18:06:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D521983DC3;
	Sat, 27 Jan 2024 18:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D521983DC3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9E281BF388
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE54D4174E
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE54D4174E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQI9AyfiaEYy for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 18:06:35 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E568414C6
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 18:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E568414C6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6D7B713F8B8;
 Sat, 27 Jan 2024 19:06:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 19:06:29 +0100
Date: Sat, 27 Jan 2024 19:06:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZbVGJRZ-miXjQGCG@landeda>
References: <20240127172952.1799597-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240127172952.1799597-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706378792;
 bh=nuDfiGMvGxf7OZnN6kWOiSxSVx5G/cHGw4A6TEVL41s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KZOp/TeJkvZGUlFrEDgUbZ9vm5y9nvvn75cXcRiAFRz+kD+kaIrdWDrfj0QIMVY5I
 f+JTL7MAvjY3B7H+fdCFeDjPgZTrVtz7wAjsH+UHUi1qbah/B0HuajQZF2Pz9rqFIP
 p3ffi24KRivZXuO5D8S20Vra4xzwVfQJANkOiYrVitD4H75PrQaQQQc+jZ3XnaOmPx
 tHWa1kR/JQ/ZH3tbiP85C/7EubzmlL6uL3WgbS9onrLW0V40iJXxJUQlESMqP0iPjh
 mDmN1KLOga4Bl9i5ssgOUJ/szzDLY0R0rboY3FJOmNWG3tZ7fzzRtT2xnzFZa0n8Xs
 UL+jld+5VyiLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KZOp/TeJ
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/uuu: fix build failure
 with host gcc 13.x"
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-27 18:29 +0100, Fabrice Fontaine spake thusly:
> This reverts commit 04dfeff6242516a1061973fc7af2cc9c5e3dd4e2 as it
> raises the following build failure because patch has been merged since
> version 1.5.104:

Ah, good catch. I applied that old patch without checking first if the
version was updated since then. My bad...

> Applying 0001-Fix-missing-references.patch using patch:
> patching file libuuu/libcomm.h
> Reversed (or previously applied) patch detected!  Skipping patch.
> 1 out of 1 hunk ignored -- saving rejects to file libuuu/libcomm.h.rej
> patching file uuu/buildincmd.h
> Reversed (or previously applied) patch detected!  Skipping patch.
> 1 out of 1 hunk ignored -- saving rejects to file uuu/buildincmd.h.rej
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bf7b2206261e3385c567ae4359b0379b03161e3a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/uuu/0001-Fix-missing-references.patch | 40 -------------------
>  1 file changed, 40 deletions(-)
>  delete mode 100644 package/uuu/0001-Fix-missing-references.patch
> 
> diff --git a/package/uuu/0001-Fix-missing-references.patch b/package/uuu/0001-Fix-missing-references.patch
> deleted file mode 100644
> index 140c9755c7..0000000000
> --- a/package/uuu/0001-Fix-missing-references.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 24fd043225903247f71ac10666d820277c0b10b1 Mon Sep 17 00:00:00 2001
> -From: nixgnauhcuy <nixgnauhcuy@gmail.com>
> -Date: Tue, 9 May 2023 14:32:33 +0800
> -Subject: [PATCH] Fix missing references
> -
> -Upstream: https://github.com/nxp-imx/mfgtools/commit/24fd043225903247f71ac10666d820277c0b10b1
> -
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ----
> - libuuu/libcomm.h | 1 +
> - uuu/buildincmd.h | 1 +
> - 2 files changed, 2 insertions(+)
> -
> -diff --git a/libuuu/libcomm.h b/libuuu/libcomm.h
> -index 0afdfa3..38d622d 100644
> ---- a/libuuu/libcomm.h
> -+++ b/libuuu/libcomm.h
> -@@ -28,6 +28,7 @@
> - * POSSIBILITY OF SUCH DAMAGE.
> - *
> - */
> -+#include <stdint.h>
> - #include <string>
> - #include <stdarg.h>
> - #include <locale>
> -diff --git a/uuu/buildincmd.h b/uuu/buildincmd.h
> -index 9415117..46286cc 100644
> ---- a/uuu/buildincmd.h
> -+++ b/uuu/buildincmd.h
> -@@ -31,6 +31,7 @@
> - 
> - #pragma once
> - 
> -+#include <stdint.h>
> - #include <map>
> - #include <string>
> - #include <vector>
> --- 
> -2.34.1
> -
> -- 
> 2.43.0
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
