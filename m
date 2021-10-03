Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC78C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:26:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5958960232
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5958960232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32862426F8;
	Sun,  3 Oct 2021 08:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGCKFRHTIs-s; Sun,  3 Oct 2021 08:26:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0EBC426CD;
	Sun,  3 Oct 2021 08:26:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB5551BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAE1F40544
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVfvIV0OcIG6 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60E7D4019B
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:acc5:ef3b:8cb0:272a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BB512B00548;
 Sun,  3 Oct 2021 10:23:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633249423;
 bh=ZnkUM/hdFr8OfpjGAUIm+t9KdUjoXhNcZStaP0OOlDo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VbGMavR1RqY7cbqfHSx3oj1mSoBelY61sOT5zItaN+owvCMVDp4Y2r68XojTU8WD8
 xyr2xBOb3YXbZ9XmQzCJ+a0X9dAhDLewfdMPUh4gOiGaRwvSVbVjpafjUXntl94WPo
 YZuBhGj+PqvGjvIe6q8DvTtAtkDyLRvxXAnw7Zzj5tz0v5K9Cjh3Y+ISTl34cWVTFD
 ElD1UZqLK1az+MLmDK8NFYfmpJb2G6j1lJmEQFsr/n3lPjhAdMWbXTpjKrCpOCIMHo
 kQCBzkiQyQM9bD8IQztbe7ahxPZwdvlCdVl0/4Aw1Z/VzVnKM8hGAmjM2RGaJEiz38
 09wc/ijVs4gYA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 10:23:36 +0200
Date: Sun, 3 Oct 2021 10:23:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20211003082336.GG1504958@scaer>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymysql: bump to version
 1.0.2
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

On 2021-09-30 10:00 +0300, Asaf Kahlon spake thusly:
> * The package doesn't support python2 anymore.
> * Indent with two spaces in the hash file.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Whole series of 15 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pymysql/Config.in           | 1 +
>  package/python-pymysql/python-pymysql.hash | 6 +++---
>  package/python-pymysql/python-pymysql.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pymysql/Config.in b/package/python-pymysql/Config.in
> index 75b447cbd1..69ba485e77 100644
> --- a/package/python-pymysql/Config.in
> +++ b/package/python-pymysql/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_PYMYSQL
>  	bool "python-pymysql"
> +	depends on BR2_PACKAGE_PYTHON3
>  	help
>  	  PyMySQL is a pure-Python MySQL client library. It follows
>  	  the DB-API 2.0.
> diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
> index 36323ca73a..dd81bdab7e 100644
> --- a/package/python-pymysql/python-pymysql.hash
> +++ b/package/python-pymysql/python-pymysql.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pymysql/json
> -md5	e5d9183cc0a775ac29f9e0365cca6556  PyMySQL-0.9.3.tar.gz
> -sha256	d8c059dcd81dedb85a9f034d5e22dcb4442c0b201908bede99e306d65ea7c8e7  PyMySQL-0.9.3.tar.gz
> +md5  3fe6ff2eefb58af5c54d335c6e0216de  PyMySQL-1.0.2.tar.gz
> +sha256  816927a350f38d56072aeca5dfb10221fe1dc653745853d30a216637f5d7ad36  PyMySQL-1.0.2.tar.gz
>  # Locally computed sha256 checksums
> -sha256	314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
> +sha256  314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
> diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
> index edb08ee054..3703572f35 100644
> --- a/package/python-pymysql/python-pymysql.mk
> +++ b/package/python-pymysql/python-pymysql.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYMYSQL_VERSION = 0.9.3
> +PYTHON_PYMYSQL_VERSION = 1.0.2
>  PYTHON_PYMYSQL_SOURCE = PyMySQL-$(PYTHON_PYMYSQL_VERSION).tar.gz
> -PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/da/15/23ba6592920e21cb40eb0fe0ea002d2b6177beb1ca8a4c1add5a8f32754d
> +PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/60/ea/33b8430115d9b617b713959b21dfd5db1df77425e38efea08d121e83b712
>  PYTHON_PYMYSQL_LICENSE = MIT
>  PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
>  PYTHON_PYMYSQL_SETUP_TYPE = setuptools
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
