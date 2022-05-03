Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F9CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 19:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 701B781770;
	Tue,  3 May 2022 19:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4_6PWQX59zE; Tue,  3 May 2022 19:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71B1E815AB;
	Tue,  3 May 2022 19:30:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F0951BF33A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DA0160E27
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wy31kRoeG6aQ for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 19:30:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4C8160D80
 for <buildroot@buildroot.org>; Tue,  3 May 2022 19:30:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e1bf:f1f7:9c5a:c735])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 617E519F576;
 Tue,  3 May 2022 21:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651606203;
 bh=8jLJmEG3CE3hIIxbb510L5+CtrewRR+B1HtTE0BvGUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lYzMO5OUQxZ0ZCw6uOqM7JAKYDsp5s4tphxda/sEgQMZWj04If/7os1PmPJgmJ4tM
 Pfr2lAlt8MJIPeByys+nYXXvW21szywLwMnMldbDaaLfCY1N+gb/172sH0z28hAjiD
 +0koLzpJyz8ryaAX+T7BrRSLh4oKlMQ//Je1P47etAmhY3mHz2mt8s2QC9mwhFXkF+
 4BaJ+cjzZr8iFQiyTmR7Jx/zgEJfvb4OCCB09+4iweJYK36UfGDtKHK9hrvECHTrbJ
 rP08c5L0SCnmlKHJpLikGtLSMgVYcMvhvjDhkAKcQ8PSnKrfThmMk9VPFGqRYlp75U
 mz4xkKLpmEESw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 May 2022 21:29:59 +0200
Date: Tue, 3 May 2022 21:29:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20220503192959.GD2575@scaer>
References: <20220503074426.9207-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503074426.9207-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/python-pydevmem: new package
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

Yegor, All,

On 2022-05-03 09:44 +0200, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Python DevMem is designed primarily for use with accessing
> /dev/mem on OMAP platforms. It should work on other platforms
> and work to mmap() files rather then just /dev/mem, but these
> use cases aren't well tested.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                            |  1 +
>  package/python-pydevmem/Config.in            |  9 +++++++++
>  package/python-pydevmem/python-pydevmem.hash |  3 +++
>  package/python-pydevmem/python-pydevmem.mk   | 13 +++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-pydevmem/Config.in
>  create mode 100644 package/python-pydevmem/python-pydevmem.hash
>  create mode 100644 package/python-pydevmem/python-pydevmem.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 4687dd4426..66682b9b2d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1151,6 +1151,7 @@ menu "External python modules"
>  	source "package/python-pycups/Config.in"
>  	source "package/python-pydal/Config.in"
>  	source "package/python-pydantic/Config.in"
> +	source "package/python-pydevmem/Config.in"
>  	source "package/python-pydyf/Config.in"
>  	source "package/python-pyelftools/Config.in"
>  	source "package/python-pyftpdlib/Config.in"
> diff --git a/package/python-pydevmem/Config.in b/package/python-pydevmem/Config.in
> new file mode 100644
> index 0000000000..a0e2da9f0b
> --- /dev/null
> +++ b/package/python-pydevmem/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_PYDEVMEM
> +	bool "python-pydevmem"
> +	help
> +	  Python DevMem is designed primarily for use with accessing
> +	  /dev/mem on OMAP platforms. It should work on other platforms
> +	  and work to mmap() files rather then just /dev/mem, but these
> +	  use cases aren't well tested.
> +
> +	  https://github.com/kylemanna/pydevmem
> diff --git a/package/python-pydevmem/python-pydevmem.hash b/package/python-pydevmem/python-pydevmem.hash
> new file mode 100644
> index 0000000000..e9ee18b872
> --- /dev/null
> +++ b/package/python-pydevmem/python-pydevmem.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  1a72db41effeb83e01fc9a422abfe345a92220b0382403a5040b2811e4ee6496  python-pydevmem-600b5d1ef8997c394db3512b735d75d5abc4ad41.tar.gz
> +sha256  cb013ffd1fd415a348f9a32231ceb133770623b69484a24ad49b6da4904cac2e  LICENSE
> diff --git a/package/python-pydevmem/python-pydevmem.mk b/package/python-pydevmem/python-pydevmem.mk
> new file mode 100644
> index 0000000000..385b123290
> --- /dev/null
> +++ b/package/python-pydevmem/python-pydevmem.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-pydevmem
> +#
> +################################################################################
> +
> +PYTHON_PYDEVMEM_VERSION = 600b5d1ef8997c394db3512b735d75d5abc4ad41
> +PYTHON_PYDEVMEM_SITE = $(call github,kylemanna,pydevmem,$(PYTHON_PYDEVMEM_VERSION))
> +PYTHON_PYDEVMEM_SETUP_TYPE = setuptools
> +PYTHON_PYDEVMEM_LICENSE = MIT
> +PYTHON_PYDEVMEM_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
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
