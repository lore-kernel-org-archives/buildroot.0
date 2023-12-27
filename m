Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9A6C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 21:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06F1883A6B;
	Wed, 27 Dec 2023 21:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06F1883A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHuFNgqZegeM; Wed, 27 Dec 2023 21:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3261F83A47;
	Wed, 27 Dec 2023 21:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3261F83A47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95E541BF966
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C83183A50
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C83183A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-uc1dh8W-b2 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 21:42:22 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AFB483A42
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 21:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AFB483A42
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2D825B0055E;
 Wed, 27 Dec 2023 22:42:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 22:42:16 +0100
Date: Wed, 27 Dec 2023 22:42:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZYyaOHodxrYzmv9-@landeda>
References: <20231226134249.2780393-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226134249.2780393-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703713340;
 bh=IEKCj0Wm+iirw4L3apoLpQ763pnI5KSqbROvTjXKczM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kGmZ79MYSS0NfmumkGM+SnXPAwAnZmSiT/QKBwBabTAqCwSyUZw3xqpQBgmrLkInY
 UnXTNWeoZjavpaIotezlCHXc3/orgRSh+Kr8ZI+mQDchFmm90L1+Znn8w5kVqig6vJ
 6vAp5LrrWPXCXClzJmASwgl723sKg+tsAsC/xGJ264elJRRD/y9EY+kITU48VkkkEo
 kO4XKroL+rFb00JiLZ6fA3nD445lVeKxaMH1voB3F8b43xgMyKCQLVBQOkMsWkPbvK
 gUn7ISFIT6Soo3nPq9pSmy44hAlaUyapJEqql7NbsNon7SvyzcYMKHTjxMDrlkSVRp
 hrOfdZDt28vsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kGmZ79MY
Subject: Re: [Buildroot] [PATCH] package/libsoup: fix build with libxml2 2.12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-12-26 14:42 +0100, Thomas Petazzoni via buildroot spake thusly:
> This commit adds a libsoup patch that fixes the build with libxml2
> 2.12, only due to a missing header inclusion. The patch cannot be
> submitted upstream as libsoup2 is unmaintained, and libsoup3 no longer
> has the problematic XMLRPC code.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/4c3152720d64b204101e1611442e535b14adc41c/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...rpc-soup-xmlrpc-old-add-missing-libx.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/libsoup/0002-libsoup-soup-xmlrpc-soup-xmlrpc-old-add-missing-libx.patch
> 
> diff --git a/package/libsoup/0002-libsoup-soup-xmlrpc-soup-xmlrpc-old-add-missing-libx.patch b/package/libsoup/0002-libsoup-soup-xmlrpc-soup-xmlrpc-old-add-missing-libx.patch
> new file mode 100644
> index 0000000000..cceff2d2ba
> --- /dev/null
> +++ b/package/libsoup/0002-libsoup-soup-xmlrpc-soup-xmlrpc-old-add-missing-libx.patch
> @@ -0,0 +1,47 @@
> +From 8a21b58b45edbf11d9041f884bb9c42e6440104c Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Tue, 26 Dec 2023 14:38:58 +0100
> +Subject: [PATCH] libsoup/{soup-xmlrpc,soup-xmlrpc-old}: add missing
> + <libxml/parser.h> include
> +
> +Since libxml2 2.12.1, including <libxml/parser.h> is needed to get the
> +prototype of xmlParseMemory(), causing a build breakage of libsoup
> +with a recent version of libxml2.
> +
> +Upstream: Not Applicable
> +[libsoup2 is not maintained upstream, and libsoup3 no longer contains
> +the XMLRPC code. We are keepin libsoup2 in Buildroot for compatibility
> +with packages that haven't moved to libsoup3 yet.]
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + libsoup/soup-xmlrpc-old.c | 1 +
> + libsoup/soup-xmlrpc.c     | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/libsoup/soup-xmlrpc-old.c b/libsoup/soup-xmlrpc-old.c
> +index c57086b6..dd51de53 100644
> +--- a/libsoup/soup-xmlrpc-old.c
> ++++ b/libsoup/soup-xmlrpc-old.c
> +@@ -12,6 +12,7 @@
> + #include <string.h>
> + 
> + #include <libxml/tree.h>
> ++#include <libxml/parser.h>
> + 
> + #include "soup-xmlrpc-old.h"
> + #include "soup.h"
> +diff --git a/libsoup/soup-xmlrpc.c b/libsoup/soup-xmlrpc.c
> +index 42dcda9c..b0132d26 100644
> +--- a/libsoup/soup-xmlrpc.c
> ++++ b/libsoup/soup-xmlrpc.c
> +@@ -18,6 +18,7 @@
> + #include <string.h>
> + #include <errno.h>
> + #include <libxml/tree.h>
> ++#include <libxml/parser.h>
> + #include "soup-xmlrpc.h"
> + #include "soup.h"
> + 
> +-- 
> +2.43.0
> +
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
