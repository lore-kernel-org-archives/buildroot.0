Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A24C77B7C
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 20:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 723F384864;
	Thu, 11 May 2023 20:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 723F384864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aiNcXLaE_er6; Thu, 11 May 2023 20:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A5D284848;
	Thu, 11 May 2023 20:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A5D284848
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF61B1BF283
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96D7F42A90
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96D7F42A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TjB5UCP64VBh for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 20:10:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D577D42A76
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D577D42A76
 for <buildroot@buildroot.org>; Thu, 11 May 2023 20:10:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b925:bb32:bfe1:7e0e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B1AE82003DE;
 Thu, 11 May 2023 22:10:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 May 2023 22:10:42 +0200
Date: Thu, 11 May 2023 22:10:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230511201042.GJ252090@scaer>
References: <20230511182216.3666486-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230511182216.3666486-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683835846;
 bh=/CW/QHWvi2Yp7zncKEhgFgw6FJmgSUB/RWVGYYvsrtg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ye80LYkNO0v3iIA6AYgZ9FE77nDuZPvHEEC7U0VSx4QoEL2IO/oDl4Vqh6jfliKuq
 KF5JWjHwOwbs094DS+XC1BPKguZUHIarIkE/1n+Ew0PG96jKj8qzTsI5DVe3eHe9C2
 1iu9oODMKWmAKWbB9Tjiq1RR0l1UOOIFwxcCsuYa/TaurgfXvgEACEcfHJOIwJEI59
 5rG42dwnqtHbTLYKUdSG/GLMFra61NYC16ojiJqCLYaMbQKOurqoFiYXmse+h2Q44B
 LvaQbdJIy8gxDicE9ZY++iWdxEIhzCyS1CaxyvemlmyLOEqQKX3kmB8NhAag80keod
 Vae/19+EFtrqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ye80LYkN
Subject: Re: [Buildroot] [PATCH] package/python3: bump version to 3.11.3
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-05-11 20:22 +0200, Peter Korsgaard spake thusly:
> Bugfix release, fixing a number of issues. For details, see the changelog:
> 
> https://docs.python.org/release/3.11.3/whatsnew/changelog.html#python-3-11-3
> 
> Notice: This also includes security fixes, but these are for Windows-only
> issues.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python3/python3.hash | 2 +-
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index f235347efb..b04ee7fa2c 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  29e4b8f5f1658542a8c13e2dd277358c9c48f2b2f7318652ef1675e402b9d2af  Python-3.11.2.tar.xz
> +sha256  8a5db99c961a7ecf27c75956189c9602c968751f11dbeae2b900dbff1c085b5e  Python-3.11.3.tar.xz
>  sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 56fe95cd07..ece5cad93e 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.11
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
> -- 
> 2.30.2
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
