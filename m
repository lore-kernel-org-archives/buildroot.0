Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A93FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 15:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29D334089A;
	Mon,  4 Jul 2022 15:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D334089A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfQnearX4btT; Mon,  4 Jul 2022 15:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D21E240887;
	Mon,  4 Jul 2022 15:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D21E240887
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14C0E1BF314
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E28DF40887
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E28DF40887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvJnpFxRnir1 for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 15:45:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DF1640861
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DF1640861
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 15:45:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4999:e547:afac:f97])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0E0925FFA3;
 Mon,  4 Jul 2022 17:45:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Jul 2022 17:45:36 +0200
Date: Mon, 4 Jul 2022 17:45:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20220704154536.GD2521@scaer>
References: <20220704094613.5636-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220704094613.5636-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1656949547;
 bh=PLtw3R7eAhOVoojMT8zqw6kBbR45fXpE2ZAXcg3aGn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tgbccBWmP0AQ4dxPUgaU+Q0nEU7EWjWLwUR4E9Bk0EuHEsRnIBN2lWTLGWH70cTRx
 aIuBAtOQA0UFpFnR5JjZOJhCtCRNqBYijnfmM75uoN/Pzl7Jgox4Q9awEVUoQno+pZ
 SZPvZ1r6HZ9tyzgXH3hLCOaHJ5sYs24KFaHdJSe381hc9dSo+4upnbP3zzRPAUIwCq
 e2vznOqetU1Or3fETbLOGkOrGZg92XoFSBLtchy3Gf4Mfqb5VmY8km+rdKDaSWSObs
 ZePRqIsLHTwRz3FWR2sBLGvp0+JmTp2mnTWsEkD3IMiqw+kdNMaq5Pp7Xx2ef8RXWR
 J6IfnBNuJVrbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tgbccBWm
Subject: Re: [Buildroot] [PATCH v2] package/python-automat: add missing
 build-time dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yegor, All,

+James

On 2022-07-04 11:46 +0200, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> python-automat needs host-python-typing-extensions.

Isn't that similar to the patch about python-argon2-cffi-bindings?

Regards,
Yann E. MORIN.

> Fixes: http://autobuild.buildroot.net/results/a4a52da24032222860ad6abe89bf66839cc2e812/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
> 	v1 -> v2: add Fixes tag
> 
>  package/python-automat/python-automat.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
> index b94fd2e1c4..03d6759718 100644
> --- a/package/python-automat/python-automat.mk
> +++ b/package/python-automat/python-automat.mk
> @@ -10,6 +10,6 @@ PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/80/c5/82c63bad570f
>  PYTHON_AUTOMAT_SETUP_TYPE = setuptools
>  PYTHON_AUTOMAT_LICENSE = MIT
>  PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
> -PYTHON_AUTOMAT_DEPENDENCIES = host-python-m2r host-python-setuptools-scm
> +PYTHON_AUTOMAT_DEPENDENCIES = host-python-m2r host-python-setuptools-scm host-python-typing-extensions
>  
>  $(eval $(python-package))
> -- 
> 2.17.0
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
