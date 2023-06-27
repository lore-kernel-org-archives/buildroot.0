Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA134EB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 05:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7576E416B4;
	Tue, 27 Jun 2023 05:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7576E416B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bx1qfIZGlZhi; Tue, 27 Jun 2023 05:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA58F416AF;
	Tue, 27 Jun 2023 05:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA58F416AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D15C1BF313
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 05:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 341A14021C
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 05:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 341A14021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RX0wwcPD0yHI for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 05:55:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24F6840164
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24F6840164
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 05:55:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:88cf:b268:1dd:7043])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 27CA32003CC;
 Tue, 27 Jun 2023 07:55:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 27 Jun 2023 07:55:01 +0200
Date: Tue, 27 Jun 2023 07:55:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230627055501.GI646621@scaer>
References: <20230626202901.346078-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626202901.346078-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687845305;
 bh=4oDzHJbPK5lpsxX1ZjS9xGWsB09xhURnZ7XiyTJNXkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vDKp1yXvfLV+0zEIzBFkJxoQIeLTCgPOtYWVlAmVrL1xRpaM1vSxglZWm8HiSAyHp
 3/UHpVfu2W0cAPjk6TFxQLNDa4OZ9Qm+6/8zwqzL+Eo2DSSQE5bWKgRizQmB09dlz2
 /M3P+yEs8dNtk9nJ2+ngRy0wfjtnFYbP4m8yR8FM6nQoOqxYRH79x/jDFjx0HamrHv
 7tYpb36z5vNF23qikRWepvAt7NP8DHVooAcQNR9gB7jjSHgFJTBY/McFfAqDnqLOrE
 S3deONqS7yjtWaYTaPoymBPBFhl8PofniYzCwwPh8/QoaJ2AgXHduTeBVTW5xpsL1J
 ubAJp9amY6+lA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vDKp1yXv
Subject: Re: [Buildroot] [PATCH] package/python-setuptools: add missing
 dependency on host-python-wheel
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-06-26 22:29 +0200, Romain Naour spake thusly:
> While migrating to pep517 build backend the host-python-wheel
> dependency has been added to host-python-setuptools but
> not to python-setuptools.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4537951715
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-setuptools/python-setuptools.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index d957930455..39ead10f55 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -12,6 +12,7 @@ PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>  PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
>  PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
>  PYTHON_SETUPTOOLS_SETUP_TYPE = pep517
> +PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
>  HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel

Should this not be done in the python package infra instead?

I.e. if host-python-wheel is required by the pep517 build backend, then
all packages that are pep517 will need wheel, so it should be done by
the infra rather than by each individual package...

Of course, by the virtue of being a dependency of python-setuptools, it
becomes a dependency of all python-packages that already depends on
{host-,}python-setuptools, so it technically works, even with PPD.
Nonetheless, it is semantically incorrect.

Or did I miss something?

Regards,
Yann E. MORIN.

>  $(eval $(python-package))
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
