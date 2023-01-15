Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC29C46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEBC260F98;
	Sun, 15 Jan 2023 11:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEBC260F98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cHQJDZk6b3Ym; Sun, 15 Jan 2023 11:23:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E828160D91;
	Sun, 15 Jan 2023 11:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E828160D91
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E10731BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC84C60D91
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC84C60D91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DzXKztPQwYmE for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:21:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3C7760A9F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3C7760A9F
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:21:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8AC6B5FFA8;
 Sun, 15 Jan 2023 12:21:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 Jan 2023 12:21:10 +0100
Date: Sun, 15 Jan 2023 12:21:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230115112110.GK199036@scaer>
References: <20230109062656.2966277-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109062656.2966277-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673781674;
 bh=Im7WWAzUowXpiTJCZxZ64KKK2GyV81WytvWXCN9mT/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IDaCq4ejJ88wEN56ksZ7kS44m7QhT6SGIEuqlC0c/hU3aUeY16r83J0rv0dfWyTHJ
 l1e2K0smvd5C8k8pccGuZPaYN4Yv2Gf9xj2LZ0az3oFpSyK27NHg+pErm4fQAADOsi
 +cwP3kPlKvw8uekPNE9jVWMYLU4V5tELq0LvUhN7nT3hDCm75xdyijxi6l/egx7fyF
 TotEzoPpSS6bPaWy8nUKZxc3vn9YsR35RnnG2gC7G1VU3DxvYnDijdvtQTEWtQwRCR
 XzL6AYFFHmyeaQkkXLLMa9C4ppLOd2hA9ZMZNeoYg8Fh+oRgTs9VQMm8PMJh73oLv9
 rqnQ0p6UX3JNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IDaCq4ej
Subject: Re: [Buildroot] [PATCH 1/1] package/python-traitlets: bump to
 version 5.8.0
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-01-08 23:26 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

This is the last I applied from your patch-spree. I'll revert to
replying to individual other patches, now. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/python-traitlets/python-traitlets.hash | 4 ++--
>  package/python-traitlets/python-traitlets.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
> index 0c68e04518..80fa8d4d44 100644
> --- a/package/python-traitlets/python-traitlets.hash
> +++ b/package/python-traitlets/python-traitlets.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/traitlets/json
> -md5  74ad03a0c8dd45d5621b12e0be0ab38f  traitlets-5.7.1.tar.gz
> -sha256  fde8f62c05204ead43c2c1b9389cfc85befa7f54acb5da28529d671175bb4108  traitlets-5.7.1.tar.gz
> +md5  95b21c721316bbc06922df9d97af5158  traitlets-5.8.0.tar.gz
> +sha256  6cc57d6dc28c85d5365961726ffd19b538739347749e13ebe34e03323a0e8f84  traitlets-5.8.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  3dcd47086529bf178cf7d10f35a8c188a1e9710391acecceef700898a4cf099b  COPYING.md
> diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
> index 8cda56817f..7054557a48 100644
> --- a/package/python-traitlets/python-traitlets.mk
> +++ b/package/python-traitlets/python-traitlets.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_TRAITLETS_VERSION = 5.7.1
> +PYTHON_TRAITLETS_VERSION = 5.8.0
>  PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
> -PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/0b/db/9adbbb2bef9a43ecfa4f1cbcec1d662adade10262328a4b7ef65effc6341
> +PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/56/48/0eb99357330a02974d537be8e4096bc58cfac1089e3153570119ccea7a40
>  PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
>  PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
>  PYTHON_TRAITLETS_SETUP_TYPE = pep517
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
