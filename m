Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A78C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:59:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C060C61872
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C060C61872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EF9840186;
	Sun,  3 Oct 2021 19:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ab_f7L1urdwu; Sun,  3 Oct 2021 19:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70FAD401BC;
	Sun,  3 Oct 2021 19:59:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7A21BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B3CE40805
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNIlMcCC4yh4 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:57:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AB6A407BE
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:57:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 86D7C13F7E7;
 Sun,  3 Oct 2021 21:57:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633291069;
 bh=UqPbtlaXs68Z9FszqHV4zrqCM+DntNCoyU+Lko0tPmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GxRtnAX0Ki+lsbRJSUMwTmlIq2uw0JcFl8uBdtdj091XMES4cAA9rg3exrPKSjOUW
 i8sjcmsXLPQ+vILEGwSY7gR90n4gPfcfpFWyHimbULubMV/1Ysis0e7FX1Mgxwcb5+
 VGHj/yZlG4m7m7L8rLH0Yv2Hn9fPat+H3qHe9uN1dae6Y/kcAaPDTQlmRqTHnYxJru
 mPmvXxzgRIv3heSGSpfrwqJ/LjOoXh5Ft55tjcsYL1CVQHOz9XkgWPieg7M7X/016W
 ovQWJkiJZm70PRFEZdkXpprzoWcCH8QwvFT+HTgVEczYDvYhT6UCMJyBkvujVjy8EX
 h1Plx+rtvFeLQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 21:57:43 +0200
Date: Sun, 3 Oct 2021 21:57:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20211003195743.GP1504958@scaer>
References: <20210928110212.596939-1-asafka7@gmail.com>
 <20210928110212.596939-3-asafka7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928110212.596939-3-asafka7@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-priority: bump to
 version 2.0.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Asaf, All,

On 2021-09-28 14:02 +0300, Asaf Kahlon spake thusly:
> The package doesn't support python2 anymore.

As a consequence, I've added a note about th reverse dependencies,
crossbar and twisted, that already need python3.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-priority/Config.in            | 1 +
>  package/python-priority/python-priority.hash | 8 ++++----
>  package/python-priority/python-priority.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-priority/Config.in b/package/python-priority/Config.in
> index b73b7e2ad4..8ac2d13824 100644
> --- a/package/python-priority/Config.in
> +++ b/package/python-priority/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_PRIORITY
>  	bool "python-priority"
> +	depends on BR2_PACKAGE_PYTHON3
>  	help
>  	  A pure-Python implementation of the HTTP/2 priority tree.
>  
> diff --git a/package/python-priority/python-priority.hash b/package/python-priority/python-priority.hash
> index c947375700..88fc9adac1 100644
> --- a/package/python-priority/python-priority.hash
> +++ b/package/python-priority/python-priority.hash
> @@ -1,5 +1,5 @@
> -# md5 from https://pypi.python.org/pypi/priority/json
> -md5	4f1ff52f7fa448e9d9cb46337ae86d1e  priority-1.3.0.tar.gz
> -# Locally computed
> -sha256	6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe  priority-1.3.0.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/priority/json
> +md5  149531bf0e754782cf218bfc8cc994ae  priority-2.0.0.tar.gz
> +sha256  c965d54f1b8d0d0b19479db3924c7c36cf672dbf2aec92d43fbdaf4492ba18c0  priority-2.0.0.tar.gz
> +# Locally computed sha256 checksums
>  sha256  f3e9c29e3db36dc305a4be68a8a225f93949852ce2d19b5b0a3c099eee6509c5  LICENSE
> diff --git a/package/python-priority/python-priority.mk b/package/python-priority/python-priority.mk
> index 8b6dbc1e4f..6e141c3e37 100644
> --- a/package/python-priority/python-priority.mk
> +++ b/package/python-priority/python-priority.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PRIORITY_VERSION = 1.3.0
> +PYTHON_PRIORITY_VERSION = 2.0.0
>  PYTHON_PRIORITY_SOURCE = priority-$(PYTHON_PRIORITY_VERSION).tar.gz
> -PYTHON_PRIORITY_SITE = https://pypi.python.org/packages/ba/96/7d0b024087062418dfe02a68cd6b195399266ac002fb517aad94cc93e076
> +PYTHON_PRIORITY_SITE = https://files.pythonhosted.org/packages/f5/3c/eb7c35f4dcede96fca1842dac5f4f5d15511aa4b52f3a961219e68ae9204
>  PYTHON_PRIORITY_SETUP_TYPE = setuptools
>  PYTHON_PRIORITY_LICENSE = MIT
>  PYTHON_PRIORITY_LICENSE_FILES = LICENSE
> -- 
> 2.33.0
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
