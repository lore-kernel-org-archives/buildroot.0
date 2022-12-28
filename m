Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDFAC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ACE2400B9;
	Wed, 28 Dec 2022 19:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ACE2400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5ba7cfIOd33; Wed, 28 Dec 2022 19:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C366402C0;
	Wed, 28 Dec 2022 19:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C366402C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2CB1BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76ED081583
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76ED081583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxDFqIygxcjT for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:51:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20E3581584
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20E3581584
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:51:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:58a9:4a7:c920:8cca])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1DFCB2003D0;
 Wed, 28 Dec 2022 20:51:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 28 Dec 2022 20:51:10 +0100
Date: Wed, 28 Dec 2022 20:51:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20221228195110.GE2498764@scaer>
References: <20221217153729.545952-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221217153729.545952-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672257073;
 bh=dY77VKG1YfMB63sMEQptEnz9Meukg3NzLGI1DSnXxJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ECwX+iFbYJMkTsm+TD5xpnGWFxYPgAcRf/vSPv9+x/xDPHPp9M2jdu4PlUhZb6kyd
 VyvSwy19X+H2hBcic0/MR19mtWGHDx1RKC+0Xer4N0d+SQOtw2Zytms6h+Ztrc4+iL
 +nRNyPp5GXNHYCG5hDZKIM94r9iJToMOlY33NIYMBOph8X9vndRI2dddYej+gwrvql
 7CMcKJuZyEwA87AyipzSFGZz3PIz7tj2Hfp3nARnvHHgg5FrNQH8RnRXxi36b3iwDT
 5vPU7bscE5alcrfJ7zVEy67cNlYme/VHWIyrkldnKyGAuUMfqhbWB3xyNwWgBpGrcL
 UC1s/npTD6zog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ECwX+iFb
Subject: Re: [Buildroot] [PATCH 1/4] package/slirp: add host variant for
 host-qemu
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

Romain, All,

On 2022-12-17 16:37 +0100, Romain Naour spake thusly:
> Qemu 7.2 removed the slirp submodule from their sources [1]
> so we have to provide slirp library as host package for
> host-qemu.
> 
> [1] https://wiki.qemu.org/ChangeLog/7.2#GIT_submodules
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/slirp/slirp.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
> index 10d367587d..2ad71f13d9 100644
> --- a/package/slirp/slirp.mk
> +++ b/package/slirp/slirp.mk
> @@ -14,4 +14,7 @@ SLIRP_CPE_ID_PRODUCT = libslirp
>  SLIRP_INSTALL_STAGING = YES
>  SLIRP_DEPENDENCIES = libglib2
>  
> +HOST_SLIRP_DEPENDENCIES = host-libglib2
> +
>  $(eval $(meson-package))
> +$(eval $(host-meson-package))
> -- 
> 2.38.1
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
