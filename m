Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD14CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 13:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 881D7818C2;
	Sat, 16 Sep 2023 13:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881D7818C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d12o64UX5Q-1; Sat, 16 Sep 2023 13:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B7B781A2B;
	Sat, 16 Sep 2023 13:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B7B781A2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 340C81BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06D2741DB9
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D2741DB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wxbdNvnm5bS3 for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 13:10:19 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3303F41E5B
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 13:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3303F41E5B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6F7112003BE;
 Sat, 16 Sep 2023 15:10:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 15:10:13 +0200
Date: Sat, 16 Sep 2023 15:10:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20230916131013.GB415981@scaer>
References: <20230916052401.1666157-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916052401.1666157-1-m.niestroj@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694869817;
 bh=6Ki0hCQ82KACSnSUCrsVdE6h0tpFw122Sr2KqC6gh44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k7fmjR8tOtQceYFFGwzTEeLNd0HJnBu37iNLUydZWccYJHL+kHV5s3qznjQR1DL+V
 vYyxvvAX59AAr9WcUqPcfwZGeHci+Ftq7ok324Y4t/s/AvwsGhjJk++K8UUaBMHmUk
 F1CsfAci7noQi87SJP6LH4xTO5WrEwWIDfTkTC/Px7socstHNOalhcvcbDx92CkdVd
 FZd8egmxPqXxVhtIhP7lUEazy5hVTXmXQ76JIhZgQvC99aNb+vN8C008gzD3RgIRCP
 b1rM7VRdQ1YwgS5zziwGWPmFkUuh1crgwt2bKhDtIcAHpPQNwzkGJDeE+1WsScrNf/
 aENzTykMlwFfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k7fmjR8t
Subject: Re: [Buildroot] [PATCH] package/python-pytest-asyncio: bump to
 version 0.21.1
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

Marcin, All,

On 2023-09-16 07:24 +0200, Marcin Niestroj spake thusly:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
>  package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
> index 6198a46608..f6cc1d2413 100644
> --- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
> +++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
> -md5  805da62a533c75a9bccadee485f98c27  pytest-asyncio-0.21.0.tar.gz
> -sha256  2b38a496aef56f56b0e87557ec313e11e1ab9276fc3863f6a7be0f1d0e415e1b  pytest-asyncio-0.21.0.tar.gz
> +md5  1d10f607444a375c1425a2a90960006e  pytest-asyncio-0.21.1.tar.gz
> +sha256  40a7eae6dded22c7b604986855ea48400ab15b069ae38116e8c01238e9eeb64d  pytest-asyncio-0.21.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
> diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
> index 6bf7e33577..5c5efd819c 100644
> --- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
> +++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYTEST_ASYNCIO_VERSION = 0.21.0
> +PYTHON_PYTEST_ASYNCIO_VERSION = 0.21.1
>  PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
> -PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/85/c7/9db0c6215f12f26b590c24acc96d048e03989315f198454540dff95109cd
> +PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/5a/85/d39ef5f69d5597a206f213ce387bcdfa47922423875829f7a98a87d33281
>  PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
>  PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
>  PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
> -- 
> 2.42.0
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
