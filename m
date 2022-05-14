Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D16C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 20:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A753404BB;
	Sat, 14 May 2022 20:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0bgyU2VNkCU; Sat, 14 May 2022 20:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47BCD402FE;
	Sat, 14 May 2022 20:40:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 186691BF681
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 20:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04A4182E14
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 20:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPODTD6EytRT for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 20:40:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9AFF82948
 for <buildroot@buildroot.org>; Sat, 14 May 2022 20:40:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1949:2e37:e3d5:26d2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4A0025FF20;
 Sat, 14 May 2022 22:40:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652560823;
 bh=3++8jH0uJeiUqOaEmc3HYH/dvNv4fGSOkKHyViR1oCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HRelSjYT0sEoafgOz+ELn6WqLMTOMhdpt2ll0y+bilQvL60P+IaxZZRrmKSXcqpr1
 LuUCo7KeEQUZoTeIxaKKZxpSW+bjdBaqnP34W7foz4XII6+a0/SzoBn0UlEAwmjCun
 leuYUgK8DiirZ07cAjDUpxaycCnYQ3GxHmTj/7l9qLTYNnDAVRaWDx6iumJ0U3EVvr
 x/fvLOEIGwf65XGIr1Rv1avT+eh1wKMpTs/vMi2vD+hW8Shtl21SWyMvESXueFXTz5
 VuLEeVL4S2zk+52PYemFa0V+AtLYwSzyMnmNFi3in8icNZs6rTY7zLABozynhgvDr8
 Bee0Hi2puw/Og==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 May 2022 22:40:18 +0200
Date: Sat, 14 May 2022 22:40:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220514204018.GC1597494@scaer>
References: <20220514160426.7683-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220514160426.7683-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: fix legal info
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

Fabrice, All,

On 2022-05-14 18:04 +0200, Fabrice Fontaine spake thusly:
> Commit 07408779cc068041a2da6838fe077d1a679f1736 forgot to update hash of
> LICENSE file (multiple components under MIT added:
> https://github.com/nodejs/node/commit/71659fd4baa90006937e78d789ec0aef95672eb1
> https://github.com/nodejs/node/commit/f17ce913c94d26c87a471179d99d8bc4134f7bb5)
> 
> ERROR: LICENSE has wrong sha256 hash:
> ERROR: expected: b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5
> ERROR: got     : 6211cc77f9ceaf365db12faf050775b3a1e6da7a1eff3577ba006c4918103c33
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bd1e3238f294152d54ee8f5579431606309dbff3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/nodejs.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 998229341e..716becccc9 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -2,4 +2,4 @@
>  sha256  a0f812efc43f78321eca08957960a48f5e6bf97004d5058c8dd3b03c646ea4f7  node-v16.15.0.tar.xz
>  
>  # Hash for license file
> -sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
> +sha256  6211cc77f9ceaf365db12faf050775b3a1e6da7a1eff3577ba006c4918103c33  LICENSE
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
