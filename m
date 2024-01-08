Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CA0C47073
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 21:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ABC28249E;
	Mon,  8 Jan 2024 21:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ABC28249E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4nkXz7E9JCd; Mon,  8 Jan 2024 21:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCC3A822FC;
	Mon,  8 Jan 2024 21:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCC3A822FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBF981BF3AA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 21:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1AD041AEC
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 21:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1AD041AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlUsxoZHjL7D for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 21:26:01 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD286418B5
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 21:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD286418B5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9F46C5FFB1;
 Mon,  8 Jan 2024 22:25:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Jan 2024 22:25:54 +0100
Date: Mon, 8 Jan 2024 22:25:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZxoYgJWf0eWcu4s@landeda>
References: <20240108204543.320869-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240108204543.320869-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704749158;
 bh=kgH/8P/bi8wWgk6WbdKiSlPiTuog9SfrcyHx1cqYbsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YcL+9shj7uzSULzZ/pr/4e2pQSc3EiBnbxqBkdsTOGb8xTwWtjJ2Dg6JY6PF4ItbZ
 w96w9eBEr7fxcc6sXPbQWxGmUZwj1QKkSbgjBK7Hw/ENmHZleWciu2cBkPe1IoebKM
 oUskSUytWj5wEVeMsQcoAgzH2XEs4FbtIrnC2P/wd/Y52JFwxaEYaFkvZqO1zo6rWs
 AxVM8UuFbowqBk0uglxQp7KL83o/uim/gyo5RKwHaTjoScxWcke7Im+Yddpkt6Iy5C
 f5fnQRcMjJu9598XpR/Gg8GJNX5ROOEevRgOqxse1CQ3NbPL+//y7jEdZXGCTewuyA
 DaAPDmwxCbmjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YcL+9shj
Subject: Re: [Buildroot] [PATCH 1/1] package/libtraceevent: fix license
 hashes
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-08 21:45 +0100, Fabrice Fontaine spake thusly:
> Commit 1474f1b34b178defca1d16d18a2446fadda9a12b forgot to prepend hashes
> of license files by LICENSES/
> 
> Fixes:
>  - No autobuilder failures (yet)

Let's ensure that will not happen, then.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libtraceevent/libtraceevent.hash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
> index b2ffbc9c0a..14dcf54c67 100644
> --- a/package/libtraceevent/libtraceevent.hash
> +++ b/package/libtraceevent/libtraceevent.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
>  sha256  1801f416b317e2ae0430ce964cf22b9ecb9fb5cd9c6c2d1073b29953c3309bca  libtraceevent-1.8.1.tar.gz
> -sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
> -sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
> +sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
> +sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
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
