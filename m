Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116F4C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8525740463;
	Sun, 20 Nov 2022 09:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8525740463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25lrIHDMBvpJ; Sun, 20 Nov 2022 09:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9927540143;
	Sun, 20 Nov 2022 09:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9927540143
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B88A61BF488
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9364F40143
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9364F40143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eqoa7kylwtk5 for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:02:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9598D40125
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9598D40125
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 09:02:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0a9:eda8:8a8b:60c8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9C9B4B0051B;
 Sun, 20 Nov 2022 10:02:21 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 10:02:21 +0100
Date: Sun, 20 Nov 2022 10:02:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221120090221.GN2123054@scaer>
References: <20221119101904.230827-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221119101904.230827-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668934945;
 bh=/mdoCkk4J6tzRCoxwMOPNiSg7gknBFySxGzWIbR0vMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aus76Lol2eXYmDkqyWAT5T1dA3DykWhAR1LQ3jqjLK3rci3KsOsuC0+W15weE+58w
 KpMmtM4MweeVMK8L6PGkR5/PfyuetBCgCjQOVQmMuDh1uHU0eKt4CcB8JBTWedirNL
 cooV0XF0JQxYcLdIkmCNPiR8VIz+y0h8FWA35uw+KJG2Ru8u6USIMPDC47BsFFHnGR
 +tgfpHD597d+7ObqhqrTceM2nPb7PXdwbClsIQtIxjwZosA2duM9xnHKmWgkA9l9xs
 g3DLGRA5WlYgPUx5rOU8SKh8z5IkXSnIrj2I8Gf1OEZs7P6OI2iDc8xqUnVyFLlKFc
 KFosO6KKDDH0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aus76Lol
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to version
 16.18.1
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-11-19 11:19 +0100, Peter Korsgaard spake thusly:
> Fixes the following security issue:
> 
> DNS rebinding in --inspect via invalid octal IP address (Medium) (CVE-2022-43548)
> 
> The Node.js rebinding protector for --inspect still allows invalid IP
> address, specifically, the octal format.  An example of an octal IP address
> is 1.09.0.0, the 09 octet is invalid because 9 is not a number in the base 8
> number system.  Browsers such as Firefox (tested on latest version m105)
> will still attempt to resolve this invalid octal address via DNS.  When
> combined with an active --inspect session, such as when using VSCode, an
> attacker can perform DNS rebinding and execute arbitrary code
> 
> Update license hash for an update of base64 (MIT license) and a change in
> copyright year:
> 
> https://github.com/nodejs/node/commit/8ea9a71b15a953cd0936f7e6aae84c62873a77b5
> https://github.com/nodejs/node/commit/9f14dc1a8f43a9f3755c673009378b798cbdd73b
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/nodejs.hash | 6 +++---
>  package/nodejs/nodejs.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 83e4c271ce..4408782248 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,5 +1,5 @@
> -# From https://nodejs.org/dist/v16.17.1/SHASUMS256.txt
> -sha256  6721feb4152d56d2c6b358ce397abd5a7f1daf09ee2e25c5021b9b4d3f86a330  node-v16.17.1.tar.xz
> +# From https://nodejs.org/dist/v16.18.1/SHASUMS256.txt
> +sha256  1f8051a88f86f42064f4415fe7a980e59b0a502ecc8def583f6303bc4d445238  node-v16.18.1.tar.xz
>  
>  # Hash for license file
> -sha256  69090e865afa7c62715b97f0712632d2923bd7a5faba91f94e4e75a2f9219d5e  LICENSE
> +sha256  0bec08634ba79b5404f6b7f92ea850f3c2a06e27e6f83f2267e4f5e55ae33334  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 29a10b900f..367d5d2058 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NODEJS_VERSION = 16.17.1
> +NODEJS_VERSION = 16.18.1
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>  NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = \
> -- 
> 2.30.2
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
