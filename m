Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED218C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:58:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B664161872
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B664161872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92D7C84966;
	Sun,  3 Oct 2021 19:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w6WDiognHWPp; Sun,  3 Oct 2021 19:58:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3F2D84971;
	Sun,  3 Oct 2021 19:58:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48FDC1BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3887A60791
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KNXSzawHSI5L for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:56:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2489D60745
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:56:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CDF4513F7F0;
 Sun,  3 Oct 2021 21:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633291000;
 bh=9k2K9iMXSBuXrvxBrUBNKtA59msI/15hptda2T4EWbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nPfLZXuVh7UXLCuQsoI4aLUq0g4hJu016kN7rK+Fe0qouvIi405kjbwIqoGl+pz4/
 saP3N4iEeJJb3KmHP5oVy23eq1INQiF3Bj+o/t2jzopjDNPuwwD9Swu8I61mrVefc/
 u5wJ/07OFdgz6EWXJdiDu7/bEmDrJ4LqGhhbu1dkN579Bxbk4VIgj7iDCZmyAYi4uZ
 A0SHuBRD0sTqU6Fg1EwQlIndKfvRhlsjSEpll0B2qY5LhzuzgAu1MgqNmouild7BtQ
 tmCpgTG+2HArilrWbOniZflWJ27vvnOMBc8o4xv3cyLVT8aT1wzAyy22T8/bjGWRYG
 b0fQN/93DMkwQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 21:56:33 +0200
Date: Sun, 3 Oct 2021 21:56:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20211003195633.GO1504958@scaer>
References: <20210928085436.583218-1-asafka7@gmail.com>
 <20210928085436.583218-3-asafka7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928085436.583218-3-asafka7@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pathvalidate: bump to
 version 2.5.0
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

On 2021-09-28 11:54 +0300, Asaf Kahlon spake thusly:
> * The package doesn't support python2 anymore.

As a consequence, I've also update the comments in the revers
dependencies.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> * Indent with two spaces in the hash file.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pathvalidate/Config.in                | 1 +
>  package/python-pathvalidate/python-pathvalidate.hash | 6 +++---
>  package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pathvalidate/Config.in b/package/python-pathvalidate/Config.in
> index 8606696e1b..564c3a0913 100644
> --- a/package/python-pathvalidate/Config.in
> +++ b/package/python-pathvalidate/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_PATHVALIDATE
>  	bool "python-pathvalidate"
> +	depends on BR2_PACKAGE_PYHON3
>  	help
>  	  pathvalidate is a python library to validate/sanitize a string
>  	  such as filename/variable-name.
> diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
> index db1190fc77..adf1a75dca 100644
> --- a/package/python-pathvalidate/python-pathvalidate.hash
> +++ b/package/python-pathvalidate/python-pathvalidate.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pathvalidate/json
> -md5	b0a8242d124a9e760ca2d084a4f8fa75  pathvalidate-0.29.0.tar.gz
> -sha256	bf250828f40d94881df764950cffca14bb3fa83783d9f239125a6b5e23a5646e  pathvalidate-0.29.0.tar.gz
> +md5  afc0343cd8c4ad732431a8b860d73330  pathvalidate-2.5.0.tar.gz
> +sha256  119ba36be7e9a405d704c7b7aea4b871c757c53c9adc0ed64f40be1ed8da2781  pathvalidate-2.5.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256	a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
> +sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
> diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
> index ee707e4e25..bb434f3662 100644
> --- a/package/python-pathvalidate/python-pathvalidate.mk
> +++ b/package/python-pathvalidate/python-pathvalidate.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PATHVALIDATE_VERSION = 0.29.0
> +PYTHON_PATHVALIDATE_VERSION = 2.5.0
>  PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
> -PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/fc/3f/7a96e26d36b7e99abc9c236ff6db2de2d98e59fed45f9932eb0d17d48473
> +PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/2e/89/7853a1ea323e848ab1e90c8930733bc19e35a935deb80d78b572c36ea33f
>  PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
>  PYTHON_PATHVALIDATE_LICENSE = MIT
>  PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
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
