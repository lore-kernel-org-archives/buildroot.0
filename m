Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2E0C41535
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 21:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C251D40104;
	Sat, 16 Dec 2023 21:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C251D40104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qnGF8o1aghes; Sat, 16 Dec 2023 21:59:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E5D740139;
	Sat, 16 Dec 2023 21:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E5D740139
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 258541BF28F
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 21:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0686401C2
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 21:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0686401C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MMnoQKzUF69y for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 21:59:43 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35A2C40104
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 21:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35A2C40104
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EA0C6B0054E;
 Sat, 16 Dec 2023 22:59:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Dec 2023 22:59:35 +0100
Date: Sat, 16 Dec 2023 22:59:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZX4dxwczHBn-WgqK@landeda>
References: <20231214091504.101102-1-james.hilliard1@gmail.com>
 <20231214091504.101102-3-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214091504.101102-3-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702763980;
 bh=H13bOg4XuxdxpDddyKLnKj77G+evnVNS1mptLRQTiGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r2GgCddAy6odg+8lEE6alrjsTbFKi0CUngoOtdOOdDo2EIQusZS2qhKQYwWLbvqg9
 y8oo0+KjQ0zeOfoav8MmvYDC5xz6BR2m3vtksTdpzSCShAIaDwRAuq/S03BVfJ40KZ
 F95g/98X/4N+CRCDYqAQyiXZzXjYCBydHLx2XtQkJNGFIa8mwAN7P0Xn6CSmdzZMtW
 8MXP845l/BO+UNqHxBWCUGkk8INyzstliyiBPO9351RRFj4Xu/MbAAIsV9oWdB8Qtl
 S8ortDcmVkl7W3IiMhBJGM+n+ZCScIvKbcZpMzAB2JhMDcHYVxXYjyyem1l7OIK/o4
 C4DOldnIrGjqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=r2GgCddA
Subject: Re: [Buildroot] [PATCH 3/4] package/python-pypika-tortoise: new
 package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-12-14 02:15 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
> new file mode 100644
> index 0000000000..84aa19cfbb
> --- /dev/null
> +++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pypika-tortoise
> +#
> +################################################################################
> +
> +PYTHON_PYPIKA_TORTOISE_VERSION = 0.1.6
> +PYTHON_PYPIKA_TORTOISE_SOURCE = pypika-tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
> +PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/86/55/1bfd4150f664d2e07b36c8f442178cc1f717bb9ae6cae20f21e851c208c6
> +PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
> +PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
> +PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
> +PYTHON_PYPIKA_TORTOISE_DEPENDENCIES = host-python-poetry-core

Shouldn't we start handling all the various backends as setup types,
instead?

For example, we already handle flit and maturin as setup types, so why
don't we do the same for poetry?

Regards,
Yann E. MORIN.

> +$(eval $(python-package))
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
