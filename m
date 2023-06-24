Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F6AEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 20:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54F0140B22;
	Sat, 24 Jun 2023 20:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54F0140B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id poQhy-3ARfr1; Sat, 24 Jun 2023 20:53:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74E2640B67;
	Sat, 24 Jun 2023 20:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74E2640B67
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DD0F1BF3D8
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4709781EC0
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4709781EC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbGAMUGB1R88 for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 20:53:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C7B81EB6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42C7B81EB6
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 20:53:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4DD67B0056B;
 Sat, 24 Jun 2023 22:53:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 22:53:19 +0200
Date: Sat, 24 Jun 2023 22:53:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230624205319.GD24952@scaer>
References: <20230622165522.16397-1-ps.report@gmx.net>
 <20230622165522.16397-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622165522.16397-2-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687640002;
 bh=Ereo06PBRpv94j0AJgWWeWUn0zBh4WsSpTbpIoWWwXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G3LeorQluiLgzZ15Fm5T4ikRybPtkBnHahEhIekfoGTk69nSfBk4Z+q1ofWdZ1bo4
 b5eAgLhaNdvzRX5xuM+TJiNdAqenF3lnTsE61MziHwdYtdOYVNXxxZD0u5wbda5upy
 YgINzVbkHlH5BG4kEF8RI5Ns4rKoFHaWHMlTuzfrSy1cRRY2zLkUha3B7m44Vb6x3R
 Kf5yMexKz1j4vyCB3GSQKiTXJ5ECh2B0GAZoNricf2DHzRwYtgzLilGMDfkRSHL1zS
 8Ch2aXHru4CVttpprt1DeJtJy/FnmU4CiBmhyZ8lgGL1z6jrfJuuhYh5VUtoxc4YEV
 x1zJjqu6F0k5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G3LeorQl
Subject: Re: [Buildroot] [PATCH v1 2/2] package/ubus: bump version to f787c97
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-06-22 18:55 +0200, Peter Seiderer spake thusly:
> Changelog:
> 
>   - 66baa44b8dee libubus: introduce new status messages
>   - b3cd5ab4c010 cli: use UBUS_STATUS_PARSE_ERROR
>   - 584f56a23314 cli: improve error logging for call command
>   - 2f793a4eb063 lua: add optional path filter to objects() method
>   - 2bebf93cd334 ubusd: handle invoke on event object without data
>   - 9913aa61de73 ubusd: add lookup command queuing support
>   - f787c97b3489 libubus: add missing uloop_fd_delete call in ubus_shutdown
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ubus/ubus.hash | 2 +-
>  package/ubus/ubus.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
> index 2b7181e5d2..faa2e2626e 100644
> --- a/package/ubus/ubus.hash
> +++ b/package/ubus/ubus.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  275d184006f2f60c9b0172d8fd0ccc8952f182960c0d3d0945be640873c1bef6  ubus-a72457b61df045d3c499a6211362b751710590d7-br1.tar.gz
> +sha256  e3022aa3cf6c38a4d3c0d798d9a9c7069ada063a0a5fe6894b466b71b17ce9cc  ubus-f787c97b34894a38b15599886cacbca01271684f-br1.tar.gz
>  sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
> diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
> index fa856fb36a..1f9891411a 100644
> --- a/package/ubus/ubus.mk
> +++ b/package/ubus/ubus.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UBUS_VERSION = a72457b61df045d3c499a6211362b751710590d7
> +UBUS_VERSION = f787c97b34894a38b15599886cacbca01271684f
>  UBUS_SITE = https://git.openwrt.org/project/ubus.git
>  UBUS_SITE_METHOD = git
>  
> -- 
> 2.41.0
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
