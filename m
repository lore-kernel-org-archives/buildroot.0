Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84652C001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 17:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E6EA60EE4;
	Mon,  7 Aug 2023 17:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E6EA60EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qR4xECIJRrJD; Mon,  7 Aug 2023 17:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB5760585;
	Mon,  7 Aug 2023 17:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB5760585
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43AE11BF969
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 17:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 266FB81A6F
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 17:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 266FB81A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id us4fjEW9oK6n for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 17:37:08 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25C688121F
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 17:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25C688121F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d6ff:7cb6:900b:4575])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 148B5B00710;
 Mon,  7 Aug 2023 19:37:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 07 Aug 2023 19:37:00 +0200
Date: Mon, 7 Aug 2023 19:37:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230807173700.GY421096@scaer>
References: <20230807134219.1598626-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807134219.1598626-1-thomas.devoogdt@barco.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691429825;
 bh=6qXa2kT7h+4+HqrXNaZ5k+jWPs7yGphfTcq6IjeDRX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fquRyIgznYoTE7zWse3DOArKuXpYaGLBTEm0xWIk5LMKZUWti4+cM7DZIjm1xjzQg
 QAwbU450Z9z9JoDwz0CqcZXRxZ4+gixPfHe8bCWKzL/nViVrmLwobLEJwQl/7lvmM8
 IExNrZ4NIn/UGIsvXRmMsA/Gt5/JTxrb4wjbqIMhcsYvVP5Gwc+4cGaMLWmLSxg/kl
 PIGRBMKGx/XS8EH1/y/h9qLayeJFnyUATFYXcU3ROdTnzCkn7vkYcz2ETujqtN1Cxt
 TQfB8ONazpoN10jxQJ80epgoIB5fMevoYCcwXkfoFxK8vfuKwHkkqtr/pVtpjG0Yar
 TU6ZRvia5NESg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fquRyIgz
Subject: Re: [Buildroot] [PATCH v1,
 next] pkg-cmake: fix typo for the make backend
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-08-07 15:42 +0200, Thomas Devoogdt spake thusly:
> A small typo in commit 4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606
> causes the wrong path to be selected.
> 
> Cmake breaks on the first compiler check because it isn't
> able to call the make program with the -jxx added.
> 
> $(firstword $$(MAKE)) --> -DCMAKE_MAKE_PROGRAM="/usr/bin/make -j13"
> $(firstword $(MAKE)) --> -DCMAKE_MAKE_PROGRAM="/usr/bin/make"
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/pkg-cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index e085fb2b5d..3483b50d46 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -65,7 +65,7 @@ endif
>  ifeq ($$($(3)_CMAKE_BACKEND),make)
>  $(2)_GENERATOR = "Unix Makefiles"
>  # $$(MAKE) can be 'make -jN', we just want 'make'  (possibly with a full path)
> -$(2)_GENERATOR_PROGRAM = $(firstword $$(MAKE))
> +$(2)_GENERATOR_PROGRAM = $(firstword $(MAKE))

Actually, it is the $(firstword that must be double-dolared, because we
want the expansion to happen when the macro is evaluated (i.e. at the
time a package uses $(eval $(cmake-package)) ), not at the time it is
parsed (i.e. when make reads the Makefile).

That's because values, esp. paths, may differ. For example, if you
enable BR2_PER_PACKAGE_DIRECTORIES, and you have a package that needs
the Buildroot-built make, then a single dollar will evaluate to (e.g.)

    blabla/buildroot/output/host/bin/make

But that does not exist until the end of the build, and we want the
package to use its per-package directory, e.g.

    blabla/buildroot/output/per-package/MY_PACKAGE/host/bin/make

I've already fixed that localy, plus another similar issue on line 77,
where we want to use $$(HOST_DIR)/bin/ninja

I'll soon push the fix (I noticed yesterday while doing this big test
build, but forgot to push before hitting my bed...)

Regards,
Yann E. MORIN.

>  # Generator specific code (make) should be avoided,
>  # but for now, copy them to the new variables.
>  $(2)_BUILD_ENV ?= $$($(2)_MAKE_ENV)
> -- 
> 2.41.0
> 

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
