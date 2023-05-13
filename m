Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72ACC77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5702D428A7;
	Sat, 13 May 2023 20:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5702D428A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9_Kxf-7F9y8; Sat, 13 May 2023 20:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3206E42888;
	Sat, 13 May 2023 20:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3206E42888
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6821BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15ECD83F2F
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15ECD83F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kF4IrSTMwaUH for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:27:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2483083F2A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2483083F2A
 for <buildroot@uclibc.org>; Sat, 13 May 2023 20:27:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5D77DB00539;
 Sat, 13 May 2023 22:27:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 22:27:53 +0200
Date: Sat, 13 May 2023 22:27:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Luke D. Jones" <luke@ljones.dev>
Message-ID: <20230513202753.GJ2582048@scaer>
References: <20230315084624.1665061-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315084624.1665061-1-luke@ljones.dev>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684009675;
 bh=UJeke5N6JZ5o7+XI4sQujUXK4AyrDaX3N5Q1/OYzLsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AaAmwZOpfhRSBNxVrBKiPjeYuccLz22lr1ISAHFGJDqGwSKxutNLYRrpC46CnuHYp
 dq4APs9R4mCP88s4NaP65lR4E4C417/3TTCbKXZXTqJno+E51yPgov0u3N0InqFpAl
 k3knjkdyqCUH91jopUT3wcr71rwiEjp2+IIwQZep5Lsp1lwugxTS5Nbjrwx2kx8uds
 JXxelW7S+tSX3vDoUEuB4CDuoXll3GTzzHQXh3d4B4ZqMcTe4sWs/Jz1/x3cKDkedv
 dFKo7/n2c3fg+SrCsJCQU+JqBxneDbzFI2M9Vm+P3dghnG95opStmACFBLl8UiBVVL
 jPBXMrdFbXj3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AaAmwZOp
Subject: Re: [Buildroot] [PATCH 1/5] package/sdl2: bump version to 2.26.4
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luke, All,

Sorry for the long delay... :-(

On 2023-03-15 09:46 +0100, Luke D. Jones spake thusly:
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
[--SNIP--]
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index 12bfe0eb1592..8504b345feb0 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SDL2_VERSION = 2.26.3
> +SDL2_VERSION = 2.26.4

In the meantime, we've bumped to 2.26.5...

Regards,
Yann E. MORIN.

>  SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
>  SDL2_SITE = http://www.libsdl.org/release
>  SDL2_LICENSE = Zlib
> -- 
> 2.39.2
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
