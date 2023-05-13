Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04D0C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EA2242E7E;
	Sat, 13 May 2023 08:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EA2242E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JenP3sjmz1AN; Sat, 13 May 2023 08:21:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99AD342D1B;
	Sat, 13 May 2023 08:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99AD342D1B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43E531BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A17760F7C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A17760F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqZnTvcwgGpJ for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:21:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4559B60F65
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4559B60F65
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:21:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 07EC219F752;
 Sat, 13 May 2023 10:21:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 10:21:07 +0200
Date: Sat, 13 May 2023 10:21:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: unixmania@gmail.com
Message-ID: <20230513082107.GE2582048@scaer>
References: <20230322231453.551305-1-unixmania@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322231453.551305-1-unixmania@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683966071;
 bh=dqCGrqiaE87XIi9PqK3MLg2Q3ehHE/Z2H3QydpCJPqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SjjGJwc/gUJlHJA7bXvrRx7RCi0RGl68VpO6yAhqdWUpdACKWTKK/jfRsQnFJfATl
 UOpl1R2IdWMB7ecNiCTLyFu+menHqS6EFF0UZhjD4wFR7TquYKIUpjo8Mb2pzq/a7C
 RygAXVPDV/C1LqX1ZUiGWUvOL0JOd7SQU+CLX9anaCVVdINhgSolKWcTncanOMdU2m
 Fxw5UyFxZCSmY6xgkq+kXUc+cePJ10QZS5drY8D20uJOrrXotrFjkpnB4uxE0eOEnt
 LndEALwkwGm4iF25+wuAg169QfYIQkJx6NA7hEex6enWmv9vA/ML1Jq3YLz258lKyn
 b9d06y9Ttnb9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SjjGJwc/
Subject: Re: [Buildroot] [PATCH] package/qemu: do not build the guest agent
 for the host
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Carlos, All,

On 2023-03-22 20:14 -0300, unixmania@gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> It does not make sense to build it for the host.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qemu/qemu.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 4194670bb0..cdc1785375 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -486,6 +486,7 @@ define HOST_QEMU_CONFIGURE_CMDS
>  		--disable-vnc-sasl \
>  		--enable-slirp \
>  		--enable-tools \
> +		--disable-guest-agent \
>  		$(HOST_QEMU_OPTS)
>  endef
>  
> -- 
> 2.31.1
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
