Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77D5C77B7D
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08DD483CC9;
	Sun, 14 May 2023 12:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08DD483CC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yQL5_0JhYlJO; Sun, 14 May 2023 12:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56C0283CAE;
	Sun, 14 May 2023 12:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56C0283CAE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82C331BF48B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 571DE83CAE
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 571DE83CAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8soqbIXUz1hG for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:47:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 585BA83CAB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 585BA83CAB
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:47:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 65E7BB0051E;
 Sun, 14 May 2023 14:47:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 14:47:07 +0200
Date: Sun, 14 May 2023 14:47:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230514124707.GZ2582048@scaer>
References: <20230320111054.6660-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320111054.6660-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684068431;
 bh=KxpEOppFawgVkMbHuWfrtRx8VbdSSp9KNEmcVZFgbSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LC2RbVDWbZjZ8mUg6iejWGoxksCX/kdxpNvgHWIhe/GDivBWpwdrvQQE5NuJk7hUj
 R3cswsjGcfuuB264FGb+HTGFC5lgvJKlBSHCFZHgGW3Conhj6qjLh0ttJvac/8BaVl
 VRl2X3Z9emFY5ylHYGeXxZGYanHbmzegXR2ySZMARnRgsHFxryTQDuDVDnPekzt6WV
 B/E9bOAJTG+yyXPuyhVIMgx1iYJV6Xu+E+3FlWxOXwwUq+kXduThIBiwbzuoY6bL2e
 ZyPAI1AIcvaOuZugI4bKyKb3/7QRo2Ix5DgawrZDR5EsZSEaGl5WdyTKgqIYJhOF79
 R87TsfiAyDJDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LC2RbVDW
Subject: Re: [Buildroot] [PATCH v3] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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
Cc: Peter Seiderer <ps.report@gmx.net>, Indrek Kruusa <indrek.kruusa@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-03-20 12:10 +0100, Giulio Benetti spake thusly:
> Let's also switch to a _SITE that can be accessed from a web browser and
> results to be the official one for mmc-utils.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
[--SNIP--]
> diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
> index 1256f63487..22d34c3d40 100644
> --- a/package/mmc-utils/mmc-utils.hash
> +++ b/package/mmc-utils/mmc-utils.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  f6ed1cb2f02d49df4244f8872b47b22780dd634fa19d857298ce1b793752776f  mmc-utils-dfc3b6ecda84d21418fb4408b39c5c71db4c6458-br1.tar.gz
> -sha256  f57e3c6169116aa9ff06eec95734ca000e4d0196467bb221e80e50530c768081  mmc.h
> +sha256  e5a8dacf26a178010202c8fa7cb28b01f50fe967da98cdbdf320b2f110920106  mmc-utils-d4c2910981ff99b983734426dfa99632fb81ac6b-br1.tar.gz
> +sha256  f0b53b9d58ee24e8bd9bb69bf4b31f8d1d031cf4f5d5078842198bbc6a779ca5  mmc.h

Whenever we update mmc-utils, there is a very high probability that
mmc.h changes, and so we need to update its hash, even if the licensing
termns do not change. This is a bit cumbersome, because we'd like to
only detect an actual change.

So, I've switched to using README, which has been introduced a while
ago, that identifies the license name (GPL-2.0-only), so is good-enough
for us.

Applied to master with the above change, thanks.

Regards,
Yann E. MORIN.

> diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
> index 435e6ae7f1..44abf00dbc 100644
> --- a/package/mmc-utils/mmc-utils.mk
> +++ b/package/mmc-utils/mmc-utils.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -MMC_UTILS_VERSION = dfc3b6ecda84d21418fb4408b39c5c71db4c6458
> -MMC_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
> +MMC_UTILS_VERSION = d4c2910981ff99b983734426dfa99632fb81ac6b
> +MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
>  MMC_UTILS_SITE_METHOD = git
>  MMC_UTILS_LICENSE = GPL-2.0
>  MMC_UTILS_LICENSE_FILES = mmc.h
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
