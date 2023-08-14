Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A70C001DB
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 11:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB5E261022;
	Mon, 14 Aug 2023 11:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB5E261022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1N30ZtgY6AUD; Mon, 14 Aug 2023 11:59:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBE4060FE4;
	Mon, 14 Aug 2023 11:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBE4060FE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DC2C1BF21A
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 11:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75CB7405BF
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 11:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75CB7405BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSr_2T97Xw06 for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 11:59:23 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1C5840523
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 11:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1C5840523
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7642:bfa0:cf62:9177])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E9215B0072A;
 Mon, 14 Aug 2023 13:59:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 14 Aug 2023 13:59:17 +0200
Date: Mon, 14 Aug 2023 13:59:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ismael Luceno <ismael@iodev.co.uk>
Message-ID: <20230814115917.GD421096@scaer>
References: <20230814113637.28134-1-ismael@iodev.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814113637.28134-1-ismael@iodev.co.uk>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692014360;
 bh=5dF8C/2Sw6+DN9QMCx7C+1z0Gy1y6eVFZLGr8pFZFC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nd0rbKcdpeMofPqa5We4xeA2o6980/xIchWuJroj4qF2rEpc2jw3OB3X8CwiUyk/E
 C5U+MI5RlvDXkvqbrwTZlfX538ZJpZkhxR+9W0mo7F2/ayv1+gn5ovNl488+HFw5ot
 35lJyTtiSIyxbX3dxHCZ5A1A5cEF+0BUXtpB2GXlHuclH9hy2nLB65UP4p98WFgyeY
 7xk2H4qKw94KqB1BiktNZOr40PpWCCUt+itoGs4ST48BFpnKOtGCG/7IUSQdh+U7h4
 cpU2ZOSjUTLj7i4itsdcxOATvY3XFTl/1/1K3p3W1Y26mLZNiP6H7UAMpK7D2Z0JCN
 2+IDR4DgGvdAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nd0rbKcd
Subject: Re: [Buildroot] [PATCH] package/pounce: New package
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

Ismael, All,

On 2023-08-14 13:36 +0200, Ismael Luceno spake thusly:
> Simple IRC bouncer.
> 
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

You did not take into account a single one of the comments I made in
my previous review:
    https://lore.kernel.org/buildroot/20230712193831.GI188780@scaer/

Please read that review and act upon the comments before you submit
again.

If you have some concerns or questions about some of what I said, please
address those by replying to my review mail.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/pounce/Config.in   | 18 ++++++++++++++++++
>  package/pounce/pounce.hash |  3 +++
>  package/pounce/pounce.mk   | 14 ++++++++++++++
>  5 files changed, 37 insertions(+)
>  create mode 100644 package/pounce/Config.in
>  create mode 100644 package/pounce/pounce.hash
>  create mode 100644 package/pounce/pounce.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 6ffa3ee693a8..4dad3d474ad0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1338,6 +1338,7 @@ F:	package/exempi/
>  N:	Ismael Luceno <ismael@iodev.co.uk>
>  F:	package/axel/
>  F:	package/mawk/
> +F:	package/pounce/
>  
>  N:	Jagan Teki <jagan@amarulasolutions.com>
>  F:	board/amarula/
> diff --git a/package/Config.in b/package/Config.in
> index 54cddc39140d..783683dd5201 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2458,6 +2458,7 @@ endif
>  	source "package/phytool/Config.in"
>  	source "package/pimd/Config.in"
>  	source "package/pixiewps/Config.in"
> +	source "package/pounce/Config.in"
>  	source "package/pound/Config.in"
>  	source "package/pppd/Config.in"
>  	source "package/pptp-linux/Config.in"
> diff --git a/package/pounce/Config.in b/package/pounce/Config.in
> new file mode 100644
> index 000000000000..83bb66643652
> --- /dev/null
> +++ b/package/pounce/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_POUNCE
> +	bool "pounce"
> +	select BR2_PACKAGE_LIBRESSL
> +	help
> +	  pounce is a multi-client, TLS-only IRC bouncer. It maintains a
> +	  persistent connection to an IRC server, acting as a proxy and
> +	  buffer for a number of clients. When a client connects, any
> +	  messages received since it last disconnected will be relayed to
> +	  it. Unlike some other bouncers, pounce uses a single buffer for
> +	  all IRC messages, which acts as a queue from which each client
> +	  reads messages independently.
> +
> +	  pounce speaks regular modern IRC to both servers and clients, using
> +	  the server-time extension to indicate when messages originally
> +	  occurred. Clients identify themselves to pounce by their IRC
> +	  usernames.
> +
> +	  https://git.causal.agency/pounce/
> diff --git a/package/pounce/pounce.hash b/package/pounce/pounce.hash
> new file mode 100644
> index 000000000000..a827bd389f40
> --- /dev/null
> +++ b/package/pounce/pounce.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  97f245556b1cc940553fca18f4d7d82692e6c11a30f612415e5e391e5d96604e  pounce-3.1.tar.gz
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
> diff --git a/package/pounce/pounce.mk b/package/pounce/pounce.mk
> new file mode 100644
> index 000000000000..b0a28efd91bd
> --- /dev/null
> +++ b/package/pounce/pounce.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# pounce
> +#
> +################################################################################
> +
> +POUNCE_VERSION = 3.1
> +POUNCE_SITE = https://git.causal.agency/pounce/snapshot
> +POUNCE_SOURCE = pounce-$(POUNCE_VERSION).tar.gz
> +POUNCE_LICENSE = GPL-3.0+
> +POUNCE_LICENSE_FILES = LICENSE
> +POUNCE_DEPENDENCIES = libressl
> +
> +$(eval $(autotools-package))
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
