Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EE1C2BA18
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 17:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ACD0414BD;
	Fri, 14 Jun 2024 17:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dncfSv98_KU1; Fri, 14 Jun 2024 17:33:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FA99416D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FA99416D9;
	Fri, 14 Jun 2024 17:33:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0A681BF32D
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 17:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D86F360727
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 17:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4PmdWN-EF70 for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 17:33:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 740CF606E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 740CF606E3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 740CF606E3
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 17:33:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AF48613F899
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 19:32:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Jun 2024 19:32:59 +0200
Date: Fri, 14 Jun 2024 19:32:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <Zmx-y2XW4ygziuh0@landeda>
References: <cover.1718382114.git.yann.morin.1998@free.fr>
 <cea1e19d0c970055e04dbdbcfd7f1c74d2f4d694.1718382114.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cea1e19d0c970055e04dbdbcfd7f1c74d2f4d694.1718382114.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718386380;
 bh=NfKxlna8JwNL4bt/iwYqcWFRo/TUJz0oCcgbk2tZpT4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=o/0xMHdDFNxPiHRD2lQGoylHnnvsBxnQlAT1/KCnpST5uqvfW5SsPdMwdxZE14O+1
 cJSXrkeilwp/+5cROR1Dj5MGSUmfaf5KBE2UaBIrYWgNWjOYtGbuvMxVpUZ8bMkdpK
 r2D19vhhQ6npJ0T6wxktMxzAsdL3+TZ0/0lqOkdCxOpIodnsMp6wCiDW2yjyylsNJK
 B7T+aU8Vs82CW/aM2vQHnNaa9940RzUiFmiOd9g5FYG1oIMos21wo768eQlYPDE18m
 uoGzBnWY3xXGQwRitaP18A2kg6f6ZsYVUqLlP/FfiAZHh9VlEOvSGKmBLQAZhkR4tj
 rluzBJ6FbC5/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o/0xMHdD
Subject: Re: [Buildroot] [PATCH 5/6] package/python-pydantic-core: bump for
 fixes with python 3.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-06-14 18:21 +0200, Yann E. MORIN spake thusly:
> The package is not yet available on PyPI, so go fetch it at the source.

Well, at least it was no twhen I needed to write the patch.

And even though it now is on PyPI, I am still of the opinion that, when
the official upstream repo is usable as-is, it is better to use the
sources from there than from the package on PyPI, for which we have no
way to know how it has been generated. We should only rely on fetching
from PyPI thos packages for which the upstream sources are not enough
(e.g. needs heavy tooling that we lack).

Regards,
Yann E. MORIN.

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/python-pydantic-core/python-pydantic-core.hash | 2 +-
>  package/python-pydantic-core/python-pydantic-core.mk   | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
> index b5d975cb3b..d11b3bfbb4 100644
> --- a/package/python-pydantic-core/python-pydantic-core.hash
> +++ b/package/python-pydantic-core/python-pydantic-core.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after vendoring
> -sha256  23f5e10872d9c3d49ebc1fcbd317612eb63d65a7afd88dbef8d23cb63d830cb4  python-pydantic-core-2.14.6-cargo2.tar.gz
> +sha256  3359b437ca74c8f7e1b8ec477b1ff1e39f0fff08abb0eb171953f9bc3e8773c6  python-pydantic-core-v2.19.0-git4-cargo2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
> diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
> index 38128ebe46..79d06deab2 100644
> --- a/package/python-pydantic-core/python-pydantic-core.mk
> +++ b/package/python-pydantic-core/python-pydantic-core.mk
> @@ -4,10 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYDANTIC_CORE_VERSION = 2.14.6
> -PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
> -PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/b2/7d/8304d8471cfe4288f95a3065ebda56f9790d087edc356ad5bd83c89e2d79
> -PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
> +PYTHON_PYDANTIC_CORE_VERSION = v2.19.0
> +PYTHON_PYDANTIC_CORE_SITE = https://github.com/pydantic/pydantic-core
> +PYTHON_PYDANTIC_CORE_SITE_METHOD = git
>  PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
>  PYTHON_PYDANTIC_CORE_LICENSE = MIT
>  PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
> -- 
> 2.45.1
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
