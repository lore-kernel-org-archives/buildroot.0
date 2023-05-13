Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6737C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 19:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BA61614EE;
	Sat, 13 May 2023 19:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BA61614EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BP53RWLTUUEy; Sat, 13 May 2023 19:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7802B614A2;
	Sat, 13 May 2023 19:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7802B614A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2876A1BF5B4
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 019DB614A2
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 019DB614A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2KWQQlHyRPi for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 19:28:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E760A61480
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E760A61480
 for <buildroot@buildroot.org>; Sat, 13 May 2023 19:28:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 18CB819F54D;
 Sat, 13 May 2023 21:28:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 21:28:09 +0200
Date: Sat, 13 May 2023 21:28:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Serafini <nicolas.serafini@ik.me>
Message-ID: <20230513192809.GA2582048@scaer>
References: <20230424065944.40770-1-nicolas.serafini@ik.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424065944.40770-1-nicolas.serafini@ik.me>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684006092;
 bh=IvFbptZjbzzyo5hwpY6BZ+BIf2lIOX2llmc++ENd+vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lWoM2TICG9VaqoJxpKgNro0oYXJ+NRrHu1ZK6cNiHAcaZaqDWgFLyptCIcj2nLpHW
 9UiFpFDcjYCld4irtC154iTZnzZesDcUKBFJNE1VTJeMsiUxoBiXyBqW7CcbKmhE7l
 9TPwEcc2eyzHziU6BCBoPReiDsy2dBUOfvg/jXcoKTHJdUr/yYNiDNO8JtCBgElb4L
 m1yChGMwlPnLyZUPTEE9NWiImO0oCcsN2Ne2vrnTL1atmqETe3sS13dilTG3ZvV+QN
 IIOzrTQ7MaSnNOsuV25XuqOfo4n0hdQswL2O+eJJXQDiU74bt1Ci3OnsKS+efRjUGv
 h9gSaU0hyoCNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lWoM2TIC
Subject: Re: [Buildroot] [PATCH] package/ofono: bump version to 2.1
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

Nicolas, All,

On 2023-04-24 08:59 +0200, Nicolas Serafini via buildroot spake thusly:
> Drop local patch 0002 as the TEMP_FAILURE_RETRY macro was replaced by
> L_TFR from ell library.
> https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=765c6655f26304c45adfdb92081448d797ce3092
> 
> Release notes:
> https://git.kernel.org/pub/scm/network/ofono/ofono.git/tree/ChangeLog?h=2.1
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@ik.me>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ofono/0002-fix-musl-compile.patch | 37 -----------------------
>  package/ofono/ofono.hash                  |  2 +-
>  package/ofono/ofono.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 39 deletions(-)
>  delete mode 100644 package/ofono/0002-fix-musl-compile.patch
> 
> diff --git a/package/ofono/0002-fix-musl-compile.patch b/package/ofono/0002-fix-musl-compile.patch
> deleted file mode 100644
> index 369fb71791..0000000000
> --- a/package/ofono/0002-fix-musl-compile.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 4a1d114fa3a5d6bef1f71222787c1f6c3a952284 Mon Sep 17 00:00:00 2001
> -From: Nicolas Serafini <nicolas.serafini@sensefly.com>
> -Date: Thu, 24 Jan 2019 10:11:42 +0100
> -Subject: [PATCH] mbim: add optional copy of TEMP_FAILURE_RETRY macro (fix musl
> - compile)
> -
> -TEMP_FAILURE_RETRY is not available on musl.
> -
> -Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
> ----
> - drivers/mbimmodem/mbim.c | 10 ++++++++++
> - 1 file changed, 10 insertions(+)
> -
> -diff --git a/drivers/mbimmodem/mbim.c b/drivers/mbimmodem/mbim.c
> -index 54b18acf..4b040528 100644
> ---- a/drivers/mbimmodem/mbim.c
> -+++ b/drivers/mbimmodem/mbim.c
> -@@ -37,6 +37,16 @@
> - #include "mbim-message.h"
> - #include "mbim-private.h"
> - 
> -+/* taken from glibc unistd.h for musl support */
> -+#ifndef TEMP_FAILURE_RETRY
> -+#define TEMP_FAILURE_RETRY(expression)             \
> -+  (__extension__                                   \
> -+    ({ long int __result;                          \
> -+       do __result = (long int) (expression);      \
> -+       while (__result == -1L && errno == EINTR);  \
> -+       __result; }))
> -+#endif
> -+
> - #define MAX_CONTROL_TRANSFER 4096
> - #define HEADER_SIZE (sizeof(struct mbim_message_header) + \
> - 					sizeof(struct mbim_fragment_header))
> --- 
> -2.20.1
> -
> diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
> index 7edef0eb80..f1760d6f13 100644
> --- a/package/ofono/ofono.hash
> +++ b/package/ofono/ofono.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
> -sha256  c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7  ofono-1.34.tar.xz
> +sha256  92913dcce9a15cac2174daca249457716a0ec036878d22035e83af0e19e79c52  ofono-2.1.tar.xz
>  # Locally computed
>  sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
> diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
> index b7a2a923f9..5f91e4985d 100644
> --- a/package/ofono/ofono.mk
> +++ b/package/ofono/ofono.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OFONO_VERSION = 1.34
> +OFONO_VERSION = 2.1
>  OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
>  OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
>  OFONO_LICENSE = GPL-2.0
> -- 
> 2.40.0
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
