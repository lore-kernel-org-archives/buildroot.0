Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8518AC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C0980FAE;
	Sun, 30 Oct 2022 16:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24C0980FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5szwP4_bDErN; Sun, 30 Oct 2022 16:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D94480BA2;
	Sun, 30 Oct 2022 16:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D94480BA2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 450511BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D0F340142
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D0F340142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGitmFSjfUMS for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:28:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAA27400FD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAA27400FD
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:28:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DA9E013F8AA;
 Sun, 30 Oct 2022 17:28:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:28:23 +0100
Date: Sun, 30 Oct 2022 17:28:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030162823.GO1058960@scaer>
References: <20221029084455.97704-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221029084455.97704-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667147307;
 bh=CwcsAOk5xdOhFSmum35wRal+5N1TD99uMrM+NPyA9Lw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CaUdL7u33GxfVS1hnZu+27GxAZeYR84icKUbnXvm/T6AKFQhOd/Ry0JS4RjTC1Qln
 blcT9MKxepSgMxdeBce6noJDd9bhhsGWrFI6NIt7VA/nlpZUgrXUy5ecUONzandxDt
 nr79bI+Go9LeHhDaZ5T2XGVtqwBQdFRhNH45C9im4pc4+JdgGkhzLNkNpI6f/4KRPc
 wfHOhgEIk49WoqYWxyB0XCbLlfWyg951CnymuxkvciwrvLfEDthUIXvWMId70H4K1j
 z8vhFn3tT+DZH455k6+sDdj7hPS3wWs1y0NPX2fcGsFvvXVzFY4JgplLRRIjNONnc2
 vXyrls2pDgEQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CaUdL7u3
Subject: Re: [Buildroot] [PATCH 1/2] package/numactl: use official license
 files
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-10-29 10:44 +0200, Fabrice Fontaine spake thusly:
> Use official license files available since version 2.0.13 and
> https://github.com/numactl/numactl/commit/b4d36f6a34b045a67ed5c0314ec26f5514f4ee44
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/numactl/numactl.hash | 3 ++-
>  package/numactl/numactl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
> index 802175d360..a261eab9d0 100644
> --- a/package/numactl/numactl.hash
> +++ b/package/numactl/numactl.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated
>  sha256  1ee27abd07ff6ba140aaf9bc6379b37825e54496e01d6f7343330cf1a4487035  numactl-2.0.14.tar.gz
> -sha256  e2b738b1303c088421b09933a78c1326fe43692e2c05a7c510a2eb7e7a8eb575  README.md
> +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
> diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
> index cf9c759693..6ff94091e9 100644
> --- a/package/numactl/numactl.mk
> +++ b/package/numactl/numactl.mk
> @@ -7,7 +7,7 @@
>  NUMACTL_VERSION = 2.0.14
>  NUMACTL_SITE = $(call github,numactl,numactl,v$(NUMACTL_VERSION))
>  NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
> -NUMACTL_LICENSE_FILES = README.md
> +NUMACTL_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
>  NUMACTL_INSTALL_STAGING = YES
>  NUMACTL_AUTORECONF = YES
>  NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
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
