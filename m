Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FB7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:59:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3872C6187D
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3872C6187D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10D6B406B6;
	Sun,  3 Oct 2021 19:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpbwmfe2vcgu; Sun,  3 Oct 2021 19:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F4A4069B;
	Sun,  3 Oct 2021 19:59:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E2DA1BF20D
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B17A80ADE
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swYvGg-IgA7q for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:59:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AD6C84833
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:59:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A61F413F81D;
 Sun,  3 Oct 2021 21:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633291149;
 bh=KTUh3u/zhkxDpES21j5ppDx15LRWeJ+6I4Y7/7dOgYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TNoMr3IXi94ueFrP4bA/XpCZ+hFl3govqmq8SeEcEvdTfgzN1ShIWT8IfR8aAlrv/
 Ku+WcTMdOkQbM84yINhtJOgJL7MDtV/Hb8PVuzronk7MGMFycve713h0cIxSuR9SQw
 /InWeuXD5diPEB2s8Y2TTqEFO2ewFrCRxCJi6xP4/wYzqfzT6AKtX699AZI6NkrO2u
 Ef79mzYam5JhJAJ3LYvlx8XyEeqxAXPhArUw4T4mOj5h+vH4IQkCn4F1RAI+AA1A9k
 DFmADCMVIdu2DII63kzfauv5QGs1UuQ6EinV13mDhTHzjA0qXHFA8nrJc3O3ITu0l2
 24FYHE+WqhokA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 21:59:03 +0200
Date: Sun, 3 Oct 2021 21:59:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20211003195903.GQ1504958@scaer>
References: <20210928110212.596939-1-asafka7@gmail.com>
 <20210928110212.596939-4-asafka7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928110212.596939-4-asafka7@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.20
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

Asaf, All

On 2021-09-28 14:02 +0300, Asaf Kahlon spake thusly:
> * The package doesn't support python2 anymore.

You forgot to add the proper "depends on BR2_PACKAGE_PYTHON3", so I've
done that.

I've also added a note about the reverse dependency, ipython, which
already depends on python3.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> * Update URL in Config.in.
> * Indent with two spaces in the hash file.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-prompt-toolkit/Config.in                  | 5 ++---
>  package/python-prompt-toolkit/python-prompt-toolkit.hash | 6 +++---
>  package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-prompt-toolkit/Config.in b/package/python-prompt-toolkit/Config.in
> index 1066e166d9..ad4f8162de 100644
> --- a/package/python-prompt-toolkit/Config.in
> +++ b/package/python-prompt-toolkit/Config.in
> @@ -2,10 +2,9 @@ config BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
>  	bool "python-prompt-toolkit"
>  	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
> -	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
> -	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
> +	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
>  	help
>  	  Library for building powerful interactive command lines in
>  	  Python.
>  
> -	  https://github.com/jonathanslenders/python-prompt-toolkit
> +	  https://github.com/prompt-toolkit/python-prompt-toolkit
> diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
> index 2d0c7ec95e..5a24634a56 100644
> --- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
> +++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
> -md5	5016c523e603cd7119644fbc0f00ce53  prompt_toolkit-2.0.10.tar.gz
> -sha256	f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db  prompt_toolkit-2.0.10.tar.gz
> +md5  ba9e63c3e7e5a4f4ce4e4770a4daba96  prompt_toolkit-3.0.20.tar.gz
> +sha256  eb71d5a6b72ce6db177af4a7d4d7085b99756bf656d98ffcc4fecd36850eea6c  prompt_toolkit-3.0.20.tar.gz
>  # Locally computed sha256 checksums
> -sha256	303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
> +sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
> diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
> index 183c7d258b..b575783f96 100644
> --- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
> +++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PROMPT_TOOLKIT_VERSION = 2.0.10
> +PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.20
>  PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
> -PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/0c/37/7ad3bf3c6dbe96facf9927ddf066fdafa0f86766237cff32c3c7355d3b7c
> +PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/b4/56/9ab5868f34ab2657fba7e2192f41316252ab04edbbeb2a8583759960a1a7
>  PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
>  PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
>  PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
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
