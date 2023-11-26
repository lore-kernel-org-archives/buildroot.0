Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D145DC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 17:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FA6F60BBB;
	Sun, 26 Nov 2023 17:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FA6F60BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PerC1XQ1pEus; Sun, 26 Nov 2023 17:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C45D960BCD;
	Sun, 26 Nov 2023 17:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C45D960BCD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C54731BF28A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB60181302
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB60181302
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nzmu0-jnoLN9 for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 17:12:52 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3E7A812FE
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 17:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3E7A812FE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8889078034E;
 Sun, 26 Nov 2023 18:12:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 18:12:46 +0100
Date: Sun, 26 Nov 2023 18:12:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231126171246.GA3177259@scaer>
References: <20231125081052.881728-1-james.hilliard1@gmail.com>
 <20231125081052.881728-3-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231125081052.881728-3-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701018770;
 bh=dae1BLf82fAzDX0SU8mu4g3TaSlXWZA/FvSLes02Umo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b/hFFL3JzJW/LXmoFOyuLU2MJrNk8qdb3xlV2oGudXIsJwkRWj6H2mgPGm2fjdWq1
 nVk6FIh91CTpnF8OezQS/yp+D+D6czXAIEwIefvVY57ONMCoiYMiaprFSpck62AH4O
 6ah0LCcVzAM+uGaN8yQDfXb5NdnGKypIym42WZ2crep2IBj7EygdAPtu8Cayz9yv+f
 ohQzbiRB3N2xFKvyyaTPR0PiVTA5WKTtYx1pj4WEJ4xfnSCE/YV07kkWdYSG7ze+xH
 dCW9qBxJe3q/S9bE8xc93uALLePImoNLB1VitYKtip/MYklAN2j8jSH6jiwJHo4xsc
 1vzzhyH+0oeMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b/hFFL3J
Subject: Re: [Buildroot] [PATCH 3/3] package/python-pydantic: bump to
 version 2.5.2
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

James, All,

On 2023-11-25 01:10 -0700, James Hilliard spake thusly:
> Add new python-annotated-types runtime dependency.
> 
> Add new python-pydantic-core runtime dependency.
> 
> Migrate build backend from setuptools to hatchling.
> 
> License hash changed due to adding contributors:
> https://github.com/pydantic/pydantic/commit/7bc9c6525a81680c0dd9df3558ed5f33345a77c2
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pydantic/Config.in            | 5 ++++-
>  package/python-pydantic/python-pydantic.hash | 6 +++---
>  package/python-pydantic/python-pydantic.mk   | 9 ++++++---
>  3 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
> index 41ec43adf4..e9cd2e6780 100644
> --- a/package/python-pydantic/Config.in
> +++ b/package/python-pydantic/Config.in
> @@ -1,8 +1,11 @@
>  config BR2_PACKAGE_PYTHON_PYDANTIC
>  	bool "python-pydantic"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic-core
> +	select BR2_PACKAGE_PYTHON_ANNOTATED_TYPES # runtime
> +	select BR2_PACKAGE_PYTHON_PYDANTIC_CORE # runtime
>  	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
>  	help
>  	  Data validation and settings management using python 3.6
>  	  type hinting.
>  
> -	  https://github.com/samuelcolvin/pydantic
> +	  https://github.com/pydantic/pydantic
> diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
> index 88b17f4575..0848debc1c 100644
> --- a/package/python-pydantic/python-pydantic.hash
> +++ b/package/python-pydantic/python-pydantic.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pydantic/json
> -md5  f0e286c32f40ec45aba9603742739cd6  pydantic-1.10.8.tar.gz
> -sha256  1410275520dfa70effadf4c21811d755e7ef9bb1f1d077a21958153a92c8d9ca  pydantic-1.10.8.tar.gz
> +md5  348281a5a27eb5253c7a83927aae64e1  pydantic-2.5.2.tar.gz
> +sha256  ff177ba64c6faf73d7afa2e8cad38fd456c0dbe01c9954e71038001cd15a6edd  pydantic-2.5.2.tar.gz
>  # Locally computed sha256 checksums
> -sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE
> +sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
> diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
> index b800426d22..b5bb7ff853 100644
> --- a/package/python-pydantic/python-pydantic.mk
> +++ b/package/python-pydantic/python-pydantic.mk
> @@ -4,11 +4,14 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYDANTIC_VERSION = 1.10.8
> +PYTHON_PYDANTIC_VERSION = 2.5.2
>  PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
> -PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/23/65/2aa13873e9e0084ecaec00fbe6c6096b65e1ab99ba66bdbf7e4e7c4cc915
> -PYTHON_PYDANTIC_SETUP_TYPE = setuptools
> +PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b7/41/3c8108f79fb7da2d2b17f35744232af4ffcd9e764ebe1e3fd4b26669b325
> +PYTHON_PYDANTIC_SETUP_TYPE = pep517
>  PYTHON_PYDANTIC_LICENSE = MIT
>  PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
> +PYTHON_PYDANTIC_DEPENDENCIES = \
> +	host-python-hatchling \
> +	host-python-hatch-fancy-pypi-readme
>  
>  $(eval $(python-package))
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
